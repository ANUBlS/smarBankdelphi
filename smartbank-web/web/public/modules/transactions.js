/* Transaction manager – port of Delphi Packages/TransactionManager (TTransactionManagerForm, TTransactionEditForm,
   TCommissionForm, TTransactionDestinationForm). Rules run in the API (api/app/transactions.py). */
(function () {
  const { api, t, esc, toast } = window.SB;
  const money = (v) => window.SB.fmtN(v), fmtD = (v) => window.SB.fmtD(v);   // TransactionsDEBITAMOUNT.. DisplayFormat '#,##0.00'; TDateTimeField
  function modal(html, onMount, wide) {
    const d = document.createElement('div'); d.className = 'backdrop stacked';
    d.innerHTML = `<div class="modal ${wide ? 'wide' : ''}" role="dialog">${html}</div>`; document.body.appendChild(d);
    const close = () => d.remove(); onMount && onMount(d.querySelector('.modal'), close); return close;
  }
  const errText = (e) => e.field ? t(e.key, { field: t('transactions.f_' + e.field) }) : t(e.key, e);
  const errHtml = (e) => `<div class="alert error">${esc(errText(e))}${e.ora ? `<span class="ora">${esc(e.ora)}</span>` : ''}</div>`;
  const info = (msg) => new Promise(res => modal(`<div style="white-space:pre-line">${esc(msg)}</div><div class="actions"><button class="btn" id="ok">OK</button></div>`, (m, c) => { const b = m.querySelector('#ok'); b.onclick = () => { c(); res(); }; b.focus(); }));
  const ask = (msg) => new Promise(res => modal(`<div style="white-space:pre-line">${esc(msg)}</div><div class="actions"><button class="btn secondary" id="qn">${esc(t('password.cancel'))}</button><button class="btn" id="qy">${esc(t('common.yes'))}</button></div>`,
    (m, c) => { m.querySelector('#qy').onclick = () => { c(); res(true); }; m.querySelector('#qn').onclick = () => { c(); res(false); }; m.querySelector('#qy').focus(); }));
  const ask4 = (msg) => new Promise(res => modal(`<div>${esc(msg)}</div><div class="actions"><button class="btn secondary" data-r="cancel">${esc(t('password.cancel'))}</button><button class="btn secondary" data-r="no">${esc(t('common.no'))}</button><button class="btn secondary" data-r="all">${esc(t('customers.yes_to_all'))}</button><button class="btn" data-r="yes">${esc(t('common.yes'))}</button></div>`,
    (m, c) => m.querySelectorAll('[data-r]').forEach(b => b.onclick = () => { c(); res(b.dataset.r); })));
  const opt = (list, key, label, val, empty = true) => (empty ? '<option value=""></option>' : '') + (list || []).map(x => `<option value="${esc(x[key])}" ${String(x[key]) === String(val ?? '') ? 'selected' : ''}>${esc(label(x))}</option>`).join('');
  const STATUS = { 1: ['⏳', 'amber', 'customers.st_delayed'], 2: ['✔', 'teal', 'customers.st_committed'], 3: ['✖', 'red', 'customers.st_rejected'] };
  const st = { date: null, title: ' ID ', statusFirst: false, rows: [], total: 0, cur: null, sel: new Set(), init: null, layout: null,
               f: { currencies_off: [], op_types_off: [], debit_branch: null, credit_branch: null, operator: null, delayed: true, committed: true, rejected: true,
                    use_db: false, use_cb: false, use_op: false } };

  // GridTransactions.Columns (TransactionManagerImpl.dfm:364 GridTransactions): field, caption, kind, title field, Delphi width, colour (1 silver, 2 silver+centered)
  const COLS = [['id', 'transactions.c_id', 0, 'ID', 50, 1], ['status', '', 3, '', 19], ['transactiondate', 'transactions.c_date', 2, 'TRANSACTIONDATE', 80], ['debitaccno', 'transactions.c_debit', 0, 'DEBITACCNO', 190],
    ['debitcurrencysname', 'transactions.c_dcur', 0, 'DEBITCURRENCYSNAME', 30, 2], ['creditaccno', 'transactions.c_credit', 0, 'CREDITACCNO', 190], ['creditcurrencysname', 'transactions.c_ccur', 0, 'CREDITCURRENCYSNAME', 30, 2],
    ['debitamount', 'transactions.c_damount', 1, 'DEBITAMOUNT', 110], ['creditamount', 'transactions.c_camount', 1, 'CREDITAMOUNT', 110], ['lamount', 'transactions.c_lamount', 1, 'LAMOUNT', 110], ['usr', 'transactions.c_user', 0, 'USR', 101]];

  async function refresh(el, keepId, titleOverride) {
    const f = st.f;
    const body = { date: st.date, title: titleOverride !== undefined ? titleOverride : st.title, currencies_off: f.currencies_off, op_types_off: f.op_types_off,
      debit_branch: f.use_db ? f.debit_branch : null, credit_branch: f.use_cb ? f.credit_branch : null, operator: f.use_op ? f.operator : null,
      delayed: f.delayed, committed: f.committed, rejected: f.rejected };
    try {
      const r = await api('/api/transactions/list', { method: 'POST', body });
      st.rows = r.rows; st.total = r.total; st.sel.clear();
      // ActionRefreshExecute: finally DataSet.Last (H.R. 25.02.2010) – the cursor always ends on the last row
      st.cur = st.rows.length ? st.rows[st.rows.length - 1].id : null;
      render(el);
    } catch (e) { el.querySelector('#trGrid').innerHTML = errHtml(e); }
  }
  function render(el) {
    el.querySelector('#trGrid').innerHTML = `<div class="tablewrap" style="max-height:56vh"><table class="grid acc-grid"><thead><tr><th style="width:24px"><input type="checkbox" id="tall" title="Ctrl+A"></th>
      ${COLS.map(c => `<th data-title="${c[3]}" class="sortable" style="min-width:${c[4]}px;${c[2] === 1 ? 'text-align:right' : ''}">${esc(c[1] ? t(c[1]) : '')}</th>`).join('')}</tr></thead><tbody>
      ${st.rows.map(r => `<tr data-id="${r.id}" class="${r.id === st.cur ? 'sel' : ''}"><td><input type="checkbox" data-chk="${r.id}" ${st.sel.has(r.id) ? 'checked' : ''}></td>${COLS.map(c => {
        if (c[2] === 3) { const s = STATUS[r.status] || ['', '', '']; return `<td><span class="badge ${s[1]}" title="${esc(s[2] ? t(s[2]) : '')}">${s[0]}</span></td>`; }
        return `<td class="${c[5] ? 'silver' : ''}" style="white-space:nowrap;${c[2] === 1 ? 'text-align:right;font-variant-numeric:tabular-nums' : c[5] === 2 ? 'text-align:center' : ''}">${esc(c[2] === 1 ? money(r[c[0]]) : c[2] === 2 ? fmtD(r[c[0]]) : (r[c[0]] ?? ''))}</td>`; }).join('')}</tr>`).join('')
      || `<tr><td colspan="${COLS.length + 1}" class="muted">${esc(t('customers.no_transactions'))}</td></tr>`}</tbody></table></div>
      <div class="gridfoot"><span class="muted">${esc(t('transactions.shown', { n: st.rows.length, total: st.total }))}</span></div>`;
    // GridTransactionsTitleClick: OrderedTitle := FieldName (icon column: '' and no refresh); empty grid: no refresh
    el.querySelectorAll('#trGrid th[data-title]').forEach(th => th.onclick = () => { st.title = th.dataset.title; if (!th.dataset.title || !st.rows.length) return; refresh(el); });
    el.querySelectorAll('#trGrid tr[data-id]').forEach(tr => {
      tr.onclick = (e) => { if (e.target.dataset.chk) return; select(el, +tr.dataset.id); };
      tr.ondblclick = () => editor(el, 'edit', st.rows.find(x => x.id === +tr.dataset.id));   // OnDblClick = ActionEditExecute
      tr.oncontextmenu = (e) => { select(el, +tr.dataset.id); gridMenu(el, e); };              // PopupMenu
    });
    el.querySelectorAll('#trGrid [data-chk]').forEach(c => c.onchange = () => { c.checked ? st.sel.add(+c.dataset.chk) : st.sel.delete(+c.dataset.chk); });
    el.querySelector('#tall').onchange = (e) => { st.rows.forEach(r => e.target.checked ? st.sel.add(r.id) : st.sel.delete(r.id)); render(el); };   // ActionSelectAll (Ctrl+A)
    detail(el);
    const tr = el.querySelector('#trGrid tr.sel'); if (tr) tr.scrollIntoView({ block: 'nearest' });
  }
  function select(el, id) { st.cur = id; el.querySelectorAll('#trGrid tr.sel').forEach(x => x.classList.remove('sel')); const tr = el.querySelector(`#trGrid tr[data-id="${id}"]`); if (tr) { tr.classList.add('sel'); tr.scrollIntoView({ block: 'nearest' }); } detail(el); }
  // PanelSearch (Kassa: INBALANCECHAR, USRCOMMIT) and PanelDestination ("Əməliyyat təyinatı:" NAME, "İnkar təyinatı:" REJECT_REASON)
  function detail(el) {
    const r = st.rows.find(x => x.id === st.cur) || {};
    el.querySelector('#trDetail').innerHTML = `<div class="field"><label>${esc(t('transactions.cash'))}</label><input readonly class="ro" value="${esc(r.inbalancechar ?? '')}"></div>
      <div class="field"><label>${esc(t('transactions.usrcommit'))}</label><input readonly class="ro" value="${esc(r.usrcommit ?? '')}"></div>
      <div class="field" style="grid-column:1/-1"><label>${esc(t('transactions.lbl_name'))}</label><input readonly class="ro" value="${esc(r.name ?? '')}"></div>
      <div class="field" style="grid-column:1/-1"><label>${esc(t('transactions.lbl_reject'))}</label><input readonly class="ro" value="${esc(r.reject_reason ?? '')}"></div>`;
    const none = !st.rows.length;
    ['edit', 'delete', 'commit', 'reject'].forEach(a => { const b = el.querySelector(`[data-a=${a}]`); if (b) b.disabled = none; });   // ActionDeleteUpdate / ActionCommitUpdate: not IsEmpty
  }
  const selectedIds = () => st.sel.size ? st.rows.filter(r => st.sel.has(r.id)).map(r => r.id) : (st.cur ? [st.cur] : []);

  async function stepCommit(el) {
    // ActionStepCommitExecute (TransactionManagerImpl.pas:1279-1345)
    if (!await ask(t('customers.confirm_commit'))) return;
    const keep = st.cur;
    try {
      const r = await api('/api/transactions/commit', { method: 'POST', body: { date: st.date, ids: selectedIds() } });
      if (r.errors === 1) await info(r.last_error);
      else if (r.errors > 1) await info(t('customers.commit_info', { total: r.total, ok: r.committed, bad: r.errors }));
      if (r.committed) await refresh(el);
      if (keep && st.rows.some(x => x.id === keep)) select(el, keep);   // Locate('ID', ID) after the loop
    } catch (e) { info(errText(e)); }
  }
  async function rejectTr(el) {
    // ActionRejectExecute :1347 – InputQuery('İnkarolunma !!! ', 'Təyinat:')
    const reason = await new Promise(res => modal(`<h3>${esc(t('transactions.reject_title'))}</h3><div class="field"><label>${esc(t('transactions.reject_prompt'))}</label><input id="rr"></div>
      <div class="actions"><button class="btn secondary" id="rc">${esc(t('password.cancel'))}</button><button class="btn" id="ro">OK</button></div>`,
      (m, c) => { const i = m.querySelector('#rr'); i.focus(); m.querySelector('#ro').onclick = () => { c(); res(i.value); }; m.querySelector('#rc').onclick = () => { c(); res(null); };
        i.onkeydown = (e) => { if (e.key === 'Enter') m.querySelector('#ro').click(); }; }));
    if (reason === null) return;
    try {
      const r = await api('/api/transactions/reject', { method: 'POST', body: { date: st.date, ids: selectedIds(), reason } });
      if (r.errors > 0) await info(t('transactions.reject_info', { total: r.total, ok: r.rejected, bad: r.errors }));
      if (r.rejected) refresh(el);
    } catch (e) { info(errText(e)); }
  }
  async function deleteTr(el) {
    // ActionDeleteExecute :962-1024
    const ids = selectedIds(); if (!ids.length) return;
    const multi = ids.length > 1; let wait = true, any = false;
    for (let i = 0; i < ids.length; i++) {
      if (wait) {
        const a = await ask4(t('transactions.confirm_delete', { id: ids[i] }));
        if (a === 'no') continue; if (a === 'cancel') break;
        if (a === 'all') { if (await ask(t('transactions.confirm_delete_n', { n: ids.length - i }))) wait = false; else continue; }
      }
      try {
        const r = await api('/api/transactions/delete', { method: 'POST', body: { date: st.date, id: ids[i], multi } });
        if (r.blocked) { await info(t('transactions.err_trdelete')); continue; }
        any = true;
      } catch (e) { await info(errText(e)); break; }
    }
    if (any) refresh(el);
  }

  function speedSearch(el, field, input) {
    // ActionSpeedSearchExecute :715-746 (on the filtered dataset in memory): prefix, ignore case, forward from current
    const text = input.value.toLowerCase(); if (!text) return;
    const hit = (r) => String(field === 'id' ? r.id : (r[field] ?? '')).toLowerCase().startsWith(text);
    const start = st.rows.findIndex(r => r.id === st.cur);
    const next = st.rows.slice(start + 1).find(hit);
    if (next) return select(el, next.id);
    ask(t('customers.search_end')).then(ok => { if (!ok) return; const f = st.rows.find(hit); f ? select(el, f.id) : info(t('customers.not_found')); });
  }

  // PanelSettings "Seçimlər" (TransactionManagerImpl.dfm, Align = alLeft) -> shared left filter sidebar
  const FDEF = () => ({ currencies_off: [], op_types_off: [], debit_branch: null, credit_branch: null, operator: null, delayed: true, committed: true, rejected: true,
                        use_db: false, use_cb: false, use_op: false });
  function filterPanel(el) {
    const i = st.init, f = st.f, B = st.layout.body;
    const lk = (id, list, val, use, cap) => `<div class="row"><label style="min-width:84px"><input type="checkbox" id="${use}" ${f[use] ? 'checked' : ''}> ${esc(t(cap))}</label>
      <select id="${id}" style="flex:1;min-width:0" ${f[use] ? '' : 'data-off="1"'}>${f[use] ? '' : '<option value=""></option>'}${opt(list, 'id', x => x.name, val, false)}</select></div>`;
    B.innerHTML = `
      <fieldset class="flt-group"><legend>${esc(t('transactions.date'))}</legend><input type="date" id="trDate" value="${st.date}"></fieldset>
      <fieldset class="flt-group"><legend>${esc(t('transactions.flt_currency'))}</legend><div class="clb">${i.valute.map(v => `<label><input type="checkbox" data-cur="${v.valute}" ${f.currencies_off.includes(v.valute) ? '' : 'checked'}> ${esc(v.valu_name)}</label>`).join('')}</div></fieldset>
      <fieldset class="flt-group">${lk('selDb', i.branches, f.debit_branch, 'use_db', 'transactions.flt_dbranch')}${lk('selOp', i.users, f.operator, 'use_op', 'transactions.flt_operator')}${lk('selCb', i.branches, f.credit_branch, 'use_cb', 'transactions.flt_cbranch')}</fieldset>
      <fieldset class="flt-group"><legend>${esc(t('transactions.flt_optypes'))}</legend><div class="clb">${i.operations.map(v => `<label><input type="checkbox" data-op="${v.id}" ${f.op_types_off.includes(v.id) ? '' : 'checked'}> ${esc(v.name)}</label>`).join('')}</div></fieldset>
      <fieldset class="flt-group"><label><input type="checkbox" id="immRefresh" checked> ${esc(t('transactions.imm_refresh'))}</label>
        <label><input type="checkbox" id="statusT" ${st.statusFirst ? 'checked' : ''}> ${esc(t('transactions.status_order'))}</label></fieldset>
      <fieldset class="flt-group"><legend>${esc(t('transactions.flt_status'))}</legend>${[['delayed', 'transactions.st_delayed'], ['committed', 'transactions.st_committed'], ['rejected', 'transactions.st_rejected']].map(([k, l]) => `<label><input type="checkbox" data-st="${k}" ${f[k] ? 'checked' : ''}> ${esc(t(l))}</label>`).join('')}</fieldset>
      <fieldset class="flt-group"><legend>${esc(t('customers.search'))}</legend>
        ${[['id', 'transactions.c_id'], ['debitaccno', 'transactions.c_debit'], ['creditaccno', 'transactions.c_credit'], ['debitamount', 'transactions.c_damount'], ['creditamount', 'transactions.c_camount'], ['lamount', 'transactions.c_lamount']]
          .map(([k, l]) => `<input data-ss="${k}" placeholder="${esc(t(l))}" title="${esc(t(l))} (Enter)">`).join('')}</fieldset>`;
    const P = B, $ = (s) => P.querySelector(s);
    // ActionFilterExecute: TDataSet.Filter on the loaded rows, run on every click (DBLookup2Click / CBDebetFilialClick)
    const apply = () => {
      f.currencies_off = [...P.querySelectorAll('[data-cur]')].filter(x => !x.checked).map(x => +x.dataset.cur);
      f.op_types_off = [...P.querySelectorAll('[data-op]')].filter(x => !x.checked).map(x => +x.dataset.op);
      f.use_db = $('#use_db').checked; f.use_cb = $('#use_cb').checked; f.use_op = $('#use_op').checked;
      f.debit_branch = $('#selDb').value === '' ? null : +$('#selDb').value; f.credit_branch = $('#selCb').value === '' ? null : +$('#selCb').value; f.operator = $('#selOp').value === '' ? null : +$('#selOp').value;
      P.querySelectorAll('[data-st]').forEach(x => f[x.dataset.st] = x.checked);
      refresh(el);
    };
    // CBDebetFilialClick: checked -> KeyValue := first list row; unchecked -> KeyValue := -1 (blank)
    [['#use_db', '#selDb'], ['#use_cb', '#selCb'], ['#use_op', '#selOp']].forEach(([c, s]) => $(c).addEventListener('change', (e) => {
      const sel = $(s); const blank = sel.querySelector('option[value=""]');
      if (e.target.checked) { if (blank) blank.remove(); sel.selectedIndex = 0; } else { if (!blank) sel.insertAdjacentHTML('afterbegin', '<option value=""></option>'); sel.value = ''; } }));
    P.querySelectorAll('[data-cur],[data-op],[data-st],#use_db,#use_cb,#use_op,#selDb,#selCb,#selOp').forEach(x => x.addEventListener('change', apply));
    $('#trDate').onchange = (e) => { st.date = e.target.value; };   // DTPCurrentDateChange: CurrentDate only, no refresh until F5
    // ChBoxStatusTClick: Settings TRANSACTION_STATUST := 1/0 (posted at once)
    $('#statusT').onchange = async (e) => { st.statusFirst = e.target.checked; await api('/api/transactions/status-order', { method: 'PUT', body: { on: st.statusFirst } }); };
    // CLBOperationTypesKeyDown: F6 -> ActionLoadFilters (reload both check lists, all checked)
    P.querySelectorAll('.clb').forEach(c => c.onkeydown = async (e) => { if (e.key === 'F6') { e.preventDefault(); st.init = await api('/api/transactions/init'); f.currencies_off = []; f.op_types_off = []; filterPanel(el); refresh(el); } });
    P.querySelectorAll('[data-ss]').forEach(i => { i.onkeydown = (e) => { if (e.key === 'Enter') { e.preventDefault(); speedSearch(el, i.dataset.ss, i); } }; i.onblur = () => { i.value = ''; }; });   // EditIDExit clears
  }

  // PopupMenu (TransactionManagerImpl.dfm:1108; PopupRefresh :1164)
  function gridMenu(el, e) {
    const none = !st.rows.length, $ = (s) => el.querySelector(s);
    window.SB.contextMenu(e, [
      { label: t('transactions.m_insert'), shortcut: 'Ins', onClick: () => editor(el, 'insert') },
      { label: t('transactions.m_edit'), shortcut: 'Ctrl+E', default: true, disabled: none, onClick: () => $('[data-a=edit]').click() },
      { label: t('transactions.m_delete'), shortcut: 'Del', disabled: none, onClick: () => deleteTr(el) },
      { label: t('transactions.commit_action'), disabled: none, onClick: () => stepCommit(el) },
      { label: t('transactions.reject'), onClick: () => {} },                     // N8: caption only, no Action / OnClick in the DFM
      { label: t('transactions.refresh_m'), shortcut: 'F5', onClick: () => refresh(el) }, '-',
      { label: t('transactions.m_first'), onClick: () => st.rows.length && select(el, st.rows[0].id) },              // NFirstClick Tag=1
      { label: t('transactions.m_last'), onClick: () => st.rows.length && select(el, st.rows[st.rows.length - 1].id) }, '-',
      { label: t('transactions.commission'), onClick: () => commissions(el) },
      { label: t('transactions.select_all'), shortcut: 'Ctrl+A', disabled: none, onClick: () => { st.rows.forEach(r => st.sel.add(r.id)); render(el); } }]);
  }

  async function fullRefresh(el) {   // NFullRefreshClick -> TransactionDataModule.FullRefresh: Close/Open of every dataset
    try { st.init = await api('/api/transactions/init'); LK = null; } catch (e) { return info(errText(e)); }
    $sys(el); filterPanel(el); refresh(el);
  }
  const $sys = (el) => { const s = el.querySelector('#sysDate'); if (s) s.textContent = fmtD(st.init.date); };

  function page(el) {
    el.innerHTML = `<div class="card" style="max-width:none">
      <div style="display:flex;align-items:center;gap:10px;flex-wrap:wrap;margin-bottom:12px"><h2 style="margin:0">${esc(t('transactions.title'))}</h2><div style="flex:1"></div>
        <span class="btn-split"><button class="btn secondary" data-a="refresh" title="F5">⟳ ${esc(t('transactions.refresh_m'))}</button><button class="btn secondary" data-a="refmenu" title="${esc(t('transactions.full_refresh'))}">▾</button></span>
        <button class="btn" data-a="insert" title="Ins">＋ ${esc(t('transactions.insert'))}</button>
        <button class="btn secondary" data-a="edit" title="Ctrl+E">${esc(t('transactions.edit'))}</button>
        <button class="btn secondary" data-a="delete" title="Del">✖ ${esc(t('transactions.delete'))}</button>
        <button class="btn secondary" data-a="commit">✔ ${esc(t('transactions.commit_btn'))}</button>
        <button class="btn secondary" data-a="reject">${esc(t('transactions.reject'))}</button>
        <button class="btn secondary" data-a="commission">${esc(t('transactions.commission'))}</button>
        <button class="btn secondary" data-a="filter" title="Alt+F">${esc(t('accounts.filter_panel'))}</button>
        <div class="sysdate"><small>${esc(t('transactions.sys_date'))}</small><b id="sysDate"></b></div></div>
      <div id="trLayout"></div></div>`;
    const $ = (s) => el.querySelector(s);
    st.layout = window.SB.filterLayout($('#trLayout'), { key: 'transactionmanager', title: t('transactions.settings'),
      applyLabel: t('transactions.refresh_m'), clearLabel: t('accounts.clear'),
      onApply: () => refresh(el),
      onClear: () => { st.f = FDEF(); filterPanel(el); refresh(el); } });
    st.layout.main.innerHTML = '<div id="trGrid"><div class="spinner"></div></div><div id="trDetail" class="grid4" style="margin-top:8px"></div>';
    $sys(el);
    $('[data-a=refresh]').onclick = () => refresh(el);
    $('[data-a=refmenu]').onclick = (e) => { e.stopPropagation(); const r = e.target.getBoundingClientRect();
      window.SB.contextMenu({ preventDefault() {}, clientX: r.left, clientY: r.bottom + 2 }, [{ label: t('transactions.full_refresh'), shortcut: 'Ctrl+F5', onClick: () => fullRefresh(el) }]); };
    $('[data-a=insert]').onclick = () => editor(el, 'insert');
    $('[data-a=edit]').onclick = () => { const r = st.rows.find(x => x.id === st.cur); if (r) editor(el, 'edit', r); };
    $('[data-a=delete]').onclick = () => deleteTr(el);
    $('[data-a=commit]').onclick = () => stepCommit(el);
    $('[data-a=reject]').onclick = () => rejectTr(el);
    $('[data-a=commission]').onclick = () => commissions(el);
    $('[data-a=filter]').onclick = () => st.layout.toggle();       // ActionShowFilterExecute
    el.tabIndex = -1;
    el.onkeydown = (e) => {
      if (document.querySelector('.backdrop')) return;
      if (e.altKey && e.key.toLowerCase() === 'f') { e.preventDefault(); st.layout.toggle(); return; }   // ActionShowFilter ShortCut 32838 = Alt+F
      if (e.ctrlKey && e.key === 'F5') { e.preventDefault(); fullRefresh(el); return; }                   // NFullRefresh ShortCut 16500
      if (e.target.tagName === 'INPUT' && e.target.type !== 'checkbox') return;
      if (e.key === 'F5') { e.preventDefault(); refresh(el); }
      else if (e.key === 'Insert') editor(el, 'insert');
      else if (e.key === 'Delete') deleteTr(el);
      else if (e.ctrlKey && e.key.toLowerCase() === 'e') { e.preventDefault(); $('[data-a=edit]').click(); }
      else if (e.ctrlKey && e.key.toLowerCase() === 'a') { e.preventDefault(); st.rows.forEach(r => st.sel.add(r.id)); render(el); }
    };
    filterPanel(el); refresh(el);
  }

  // ------------------------------------------------------------------ commission list (CommissionImpl)
  async function commissions(el) {
    let rows; try { rows = await api('/api/transactions/commissions'); } catch (e) { return info(errText(e)); }
    // GridCommission columns (CommissionImpl.dfm): NAME, DEBITACCOUNT, $, CREDITACCOUNT, $, ADEBITACCOUNT, $, ACREDITACCOUNT, $
    const C = [['name', 'transactions.cm_name'], ['debitaccount', 'transactions.c_debit'], ['debitcurrency', 'transactions.c_dcur'], ['creditaccount', 'transactions.c_credit'], ['creditcurrency', 'transactions.c_ccur'],
               ['adebitaccount', 'transactions.cm_adebit'], ['adebitcurrency', 'transactions.c_dcur'], ['acreditaccount', 'transactions.cm_acredit'], ['acreditcurrency', 'transactions.c_ccur']];
    let curI = 0;
    modal('', (m, close) => {
      const draw = () => {
        const r = rows[curI] || {};
        m.innerHTML = `<h3>${esc(t('transactions.commission'))}</h3><div class="tablewrap" style="max-height:45vh"><table class="grid acc-grid"><thead><tr>${C.map(c => `<th>${esc(t(c[1]))}</th>`).join('')}</tr></thead><tbody>
          ${rows.map((x, i) => `<tr data-i="${i}" class="${i === curI ? 'sel' : ''}">${C.map(c => `<td style="white-space:nowrap">${esc(x[c[0]] ?? '')}</td>`).join('')}</tr>`).join('')}</tbody></table></div>
          <div class="field" style="margin-top:8px"><label>${esc(t('transactions.cm_assignment'))}</label><input readonly class="ro" value="${esc(r.assignment ?? '')}"></div>
          <div class="field"><label>${esc(t('transactions.cm_cassignment'))}</label><input readonly class="ro" value="${esc(r.commisionassignment ?? '')}"></div>
          <div class="actions"><button class="btn secondary" id="crf">${esc(t('transactions.cm_refresh'))}</button><button class="btn secondary" id="cc">${esc(t('transactions.cm_close'))}</button><button class="btn" id="cadd">${esc(t('transactions.cm_add'))}</button></div>`;
        m.querySelectorAll('tr[data-i]').forEach(tr => { tr.onclick = () => { curI = +tr.dataset.i; draw(); }; tr.ondblclick = () => add(+tr.dataset.i); });
        m.querySelector('#cc').onclick = done;
        m.querySelector('#cadd').onclick = () => add(curI);                                       // Button3Click -> GridCommissionDblClick
        m.querySelector('#crf').onclick = async () => { rows = await api('/api/transactions/commissions'); curI = 0; draw(); };   // ButtonRefreshClick
      };
      const done = () => { close(); refresh(el); };   // FormClose -> ActionRefreshExecute
      const add = (i) => rows[i] && editor(el, 'commission', null, rows[i]);
      m.tabIndex = -1; m.onkeydown = (e) => { if (e.target !== m) return; if (e.key === 'Enter') { e.preventDefault(); add(curI); } if (e.key === 'Escape') done(); };   // FormKeyDown
      draw(); m.focus();
    }, true);
  }

  // ------------------------------------------------------------------ editor (TransactionPropertiesImpl)
  let LK = null;
  async function editor(el, mode, row, com) {
    try { LK = await api('/api/transactions/editor-lookups'); } catch (e) { return info(errText(e)); }
    const cur = (id) => LK.currencies.find(c => c.id === id) || {};
    const v = mode === 'edit' ? { id: row.id, transaction_date: row.transactiondate, operation_no: row.operationno, operation_code: row.operationcode, debit_currency_id: row.debitcurrencyid, credit_currency_id: row.creditcurrencyid,
        debit_rate: row.debitrate, credit_rate: row.creditrate, debit_id: row.debitid, credit_id: row.creditid, debit_amount: row.debitamount, credit_amount: row.creditamount, lamount: row.lamount,
        inbalancechar: row.inbalancechar, outbalancechar: row.outbalancechar, name: row.name, report_id: row.reportid, countr_id: row.countrid, status: row.status }
      : mode === 'commission' ? { transaction_date: LK.system_date, debit_currency_id: com.debitcurrencyid, credit_currency_id: com.creditcurrencyid, debit_rate: cur(com.debitcurrencyid).rate, credit_rate: cur(com.creditcurrencyid).rate,
        debit_id: com.debt, credit_id: com.credit, name: com.assignment, debit_amount: 0, credit_amount: 0, lamount: 0, report_id: 0, countr_id: 1 }
      : { transaction_date: LK.system_date, debit_currency_id: 0, credit_currency_id: 0, debit_rate: cur(0).rate, credit_rate: cur(0).rate, debit_id: null, credit_id: null, debit_amount: 0, credit_amount: 0, lamount: 0, report_id: 0, countr_id: 1 };
    const side = (s) => `<fieldset class="trside"><legend>${esc(t('transactions.' + s))}</legend>
      <div class="grid2"><div class="field"><label>${esc(t('transactions.f_currency'))}</label><div class="row" style="display:flex;gap:4px"><input data-code-for="${s}_currency_id" title="${esc(t('transactions.f_code'))}" style="width:56px;flex:none"><select name="${s}_currency_id" style="flex:1;min-width:0">${opt(LK.currencies, 'id', x => `${x.id} – ${x.name}`, v[s + '_currency_id'])}</select></div></div>
      <div class="field"><label>${esc(t('transactions.f_rate'))}</label><input name="${s}_rate" type="number" step="0.0001" value="${esc(v[s + '_rate'] ?? '')}"></div></div>
      <div class="field"><label>${esc(t('transactions.f_account'))}</label><input name="${s}_search" list="${s}List" placeholder="${esc(t('transactions.acc_search'))}" autocomplete="off"><datalist id="${s}List"></datalist></div>
      <div class="field"><select name="${s}_id"></select></div>
      <div class="rest" id="${s}Rest"></div></fieldset>`;
    modal(`<h3>${esc(t('transactions.editor_' + mode))}${v.id ? ` · #${v.id}` : ''}</h3><form id="tf" autocomplete="off"><div id="terr"></div>
      <div class="grid3"><div class="field"><label>${esc(t('transactions.f_transaction_date'))}</label><input type="date" name="transaction_date" value="${esc(v.transaction_date)}"></div>
        <div class="field"><label>${esc(t('transactions.f_operation_no'))}</label><input name="operation_no" value="${esc(v.operation_no ?? '')}"></div>
        <div class="field"><label>${esc(t('transactions.f_operation_code'))}</label><div style="display:flex;gap:4px"><input data-code-for="operation_code" title="${esc(t('transactions.f_code'))}" style="width:56px;flex:none"><select name="operation_code" style="flex:1;min-width:0">${opt(LK.operation_types, 'id', x => `${x.id} – ${x.name}`, v.operation_code)}</select></div></div></div>
      <div class="grid2">${side('debit')}${side('credit')}</div>
      <fieldset class="trside"><legend>${esc(t('transactions.amounts'))}</legend><div class="grid3">
        <div class="field"><label>${esc(t('transactions.f_debit_amount'))}</label><input name="debit_amount" type="number" step="0.01" value="${esc(v.debit_amount)}"></div>
        <div class="field"><label>${esc(t('transactions.f_credit_amount'))}</label><input name="credit_amount" type="number" step="0.01" value="${esc(v.credit_amount)}"></div>
        <div class="field"><label>${esc(t('transactions.f_lamount'))}</label><input name="lamount" type="number" step="0.01" value="${esc(v.lamount)}"></div></div></fieldset>
      <fieldset class="trside"><legend>${esc(t('transactions.info'))}</legend><div class="grid3">
        <div class="field"><label>${esc(t('transactions.f_outbalancechar'))}</label><div style="display:flex;gap:4px"><input data-code-for="outbalancechar" title="${esc(t('transactions.f_code'))}" style="width:56px;flex:none"><select name="outbalancechar" style="flex:1;min-width:0">${opt(LK.convert_symbols, 'id', x => x.fullpath || x.name, v.outbalancechar)}</select></div></div>
        <div class="field"><label>${esc(t('transactions.f_inbalancechar'))}</label><div style="display:flex;gap:4px"><input data-code-for="inbalancechar" title="${esc(t('transactions.f_code'))}" style="width:56px;flex:none" data-upper="1"><select name="inbalancechar" style="flex:1;min-width:0"></select></div></div>
        <div class="field"><label>${esc(t('transactions.f_report_id'))}</label><div style="display:flex;gap:4px"><input data-code-for="report_id" title="${esc(t('transactions.f_code'))}" style="width:56px;flex:none"><select name="report_id" style="flex:1;min-width:0">${opt(LK.report_descs, 'id', x => `${x.id} – ${x.name}`, v.report_id)}</select></div></div>
        <div class="field"><label>${esc(t('transactions.f_destno'))}</label><input name="destno" style="width:90px"></div>
        <div class="field" style="grid-column:span 2"><label>${esc(t('transactions.f_name'))} <small class="muted">(F3)</small></label><input name="name" list="destList" value="${esc(v.name ?? '')}"><datalist id="destList">${LK.destinations.map(d => `<option value="${esc(d.name)}">`).join('')}</datalist></div>
        <div class="field"><label>${esc(t('transactions.f_countr_id'))}</label><div style="display:flex;gap:4px"><input data-code-for="countr_id" title="${esc(t('transactions.f_code'))}" style="width:56px;flex:none"><select name="countr_id" style="flex:1;min-width:0">${opt(LK.countries, 'id', x => `${x.id} – ${x.name}`, v.countr_id)}</select></div></div></div></fieldset>
      <div class="actions"><button type="button" class="btn secondary" id="tx">${esc(t('transactions.exit'))}</button><button type="button" class="btn secondary" id="tc">${esc(t('transactions.cancel'))}</button><button class="btn" id="ts">${esc(t('transactions.apply'))}</button></div></form>`,
    (m, close) => {
      const fm = m.querySelector('#tf'); let modified = false;
      const save = m.querySelector('#ts');
      // ActionInsertUpdate: Modifed and DebitID and CreditID and LAmount <> 0
      const upd = () => { save.disabled = !(modified && fm.debit_id.value && fm.credit_id.value && Number(fm.lamount.value) !== 0); };
      const fillAccounts = (s, keepId) => {
        const c = fm[s + '_currency_id'].value === '' ? null : +fm[s + '_currency_id'].value;
        const list = LK.accounts.filter(a => a.val_acc === c);   // SetCurrencyFilter: val_acc = currency
        fm[s + '_id'].innerHTML = opt(list, 'id', a => `${a.acc_no} – ${a.name}`, keepId);
        m.querySelector(`#${s}List`).innerHTML = list.map(a => `<option value="${esc(a.acc_no_search)}">${esc(a.name)}</option>`).join('');
        const a = list.find(x => x.id === keepId); fm[s + '_search'].value = a ? a.acc_no : '';
        showRest(s);
      };
      const showRest = async (s) => {
        const id = fm[s + '_id'].value; const box = m.querySelector(`#${s}Rest`);
        if (!id) { box.innerHTML = ''; return; }   // PanelDebitRest.Visible only when an account is chosen
        const r = await api(`/api/transactions/accounts/${id}/rest`);
        box.innerHTML = `<span>${esc(t('transactions.rest'))}: <b>${money(r.ostat)}</b></span><span>${esc(t('transactions.rest_l'))}: <b>${money(r.pok_ostat)}</b></span>`;
      };
      ['debit', 'credit'].forEach(s => {
        fillAccounts(s, v[s + '_id']);
        // DebitCurrencyDataAfterScroll: rate := currency rate, account text cleared, ClearAmmounts (also ReportID/CountrID := 0)
        fm[s + '_currency_id'].onchange = () => { const c = cur(+fm[s + '_currency_id'].value); fm[s + '_rate'].value = c.rate ?? ''; fillAccounts(s, null);
          fm.debit_amount.value = 0; fm.credit_amount.value = 0; fm.lamount.value = 0; fm.report_id.value = '0'; fm.countr_id.value = '0'; modified = true; upd(); };
        fm[s + '_search'].oninput = () => {
          const q = fm[s + '_search'].value; const c = +fm[s + '_currency_id'].value;
          const a = q ? LK.accounts.find(x => x.val_acc === c && (x.acc_no_search || '').toUpperCase().startsWith(q.toUpperCase())) : null;
          fm[s + '_id'].value = a ? a.id : '';   // TSearchEdit on ACC_NO_SEARCH; empty text clears DebitID / InBalanceChar
          if (!q) fm.inbalancechar.value = '';
          modified = true; showRest(s); upd();
        };
        fm[s + '_id'].onchange = () => { const a = LK.accounts.find(x => x.id === +fm[s + '_id'].value); fm[s + '_search'].value = a ? a.acc_no : ''; modified = true; showRest(s); upd(); };
      });
      // SetCashSymbol on enter: kassa_b filtered by Mediocrity
      const loadCash = async (keep) => {
        const r = await api('/api/transactions/cash-filter', { method: 'POST', body: { debit_id: +fm.debit_id.value || null, credit_id: +fm.credit_id.value || null } });
        fm.inbalancechar.innerHTML = opt(LK.cash_symbols.filter(c => c.mediocrity === r.mediocrity), 'symbol', c => `${c.symbol} – ${c.name}`, keep);
      };
      fm.inbalancechar.innerHTML = opt(LK.cash_symbols, 'symbol', c => `${c.symbol} – ${c.name}`, v.inbalancechar);
      fm.inbalancechar.onfocus = () => loadCash(fm.inbalancechar.value);
      // CurrencyEditDebitChange -> SetAmmounts(side) on the server
      let timer;
      [['debit_amount', 'debit'], ['credit_amount', 'credit'], ['lamount', 'lamount']].forEach(([n, s]) => fm[n].addEventListener('input', () => {
        modified = true; upd(); clearTimeout(timer);
        timer = setTimeout(async () => {
          try {
            const r = await api('/api/transactions/amounts', { method: 'POST', body: { side: s, debit: +fm.debit_amount.value || 0, credit: +fm.credit_amount.value || 0, lamount: +fm.lamount.value || 0,
              debit_currency_id: fm.debit_currency_id.value === '' ? null : +fm.debit_currency_id.value, credit_currency_id: fm.credit_currency_id.value === '' ? null : +fm.credit_currency_id.value } });
            if (s !== 'debit') fm.debit_amount.value = r.debit; if (s !== 'credit') fm.credit_amount.value = r.credit; if (s !== 'lamount') fm.lamount.value = r.lamount; upd();
          } catch (e) { m.querySelector('#terr').innerHTML = errHtml(e); }
        }, 250);
      }));
      // TrDestNoEditChange: TRDESTINATION.Locate('ID') -> Name
      fm.destno.oninput = () => { const d = LK.trdest.find(x => String(x.id) === fm.destno.value); if (d) fm.name.value = d.name; modified = true; upd(); };
      fm.addEventListener('input', () => { modified = true; upd(); });
      // code DBEdits share the DataField with the lookup combo: typing the code moves the lookup, choosing in the lookup shows the code
      fm.querySelectorAll('[data-code-for]').forEach(ci => {
        const sel = fm[ci.dataset.codeFor];
        const show = () => { ci.value = sel.value; };
        sel.addEventListener('change', show); show();
        if (ci.dataset.codeFor === 'inbalancechar') { const o = new MutationObserver(show); o.observe(sel, { childList: true }); }
        ci.addEventListener('input', () => {
          if (ci.dataset.upper) ci.value = ci.value.toUpperCase();                    // CashSymbolDBEdit CharCase = ecUpperCase
          const hit = [...sel.options].some(o => o.value === ci.value);
          sel.value = hit ? ci.value : '';
          sel.dispatchEvent(new Event('change'));
        });
      });
      const destPicker = () => modal(`<h3>${esc(t('transactions.dest_title'))}</h3><div class="tablewrap" style="max-height:50vh"><table class="grid acc-grid"><thead><tr><th class="silver" style="width:50px">${esc(t('transactions.c_id'))}</th><th>${esc(t('transactions.dest_title'))}</th></tr></thead>
        <tbody>${LK.trdest.map((d, k) => `<tr data-id="${d.id}" class="${k ? '' : 'sel'}"><td class="silver">${d.id}</td><td>${esc(d.name)}</td></tr>`).join('')}</tbody></table></div>
        <div class="actions"><button class="btn secondary" id="dc">${esc(t('transactions.cancel'))}</button><button class="btn" id="dok">${esc(t('transactions.apply'))}</button></div>`,
        (pm, pc) => {
          const take = (id) => { const d = LK.trdest.find(x => x.id === id); if (!d) return; fm.name.value = d.name; fm.destno.value = d.id; pc(); modified = true; upd(); fm.name.focus(); };   // ModalResult = mrOk
          const cur = () => +(pm.querySelector('tr.sel') || {}).dataset?.id;
          pm.querySelectorAll('tbody tr').forEach(tr => { tr.onclick = () => { pm.querySelectorAll('tr.sel').forEach(x => x.classList.remove('sel')); tr.classList.add('sel'); }; tr.ondblclick = () => take(+tr.dataset.id); });
          pm.querySelector('#dok').onclick = () => take(cur());
          pm.querySelector('#dc').onclick = () => { pc(); fm.name.focus(); };
          pm.tabIndex = -1; pm.focus();
          pm.onkeydown = (e) => { e.stopPropagation(); if (e.key === 'Enter') { e.preventDefault(); take(cur()); } if (e.key === 'Escape') { e.preventDefault(); pc(); fm.name.focus(); } };
        });
      m.addEventListener('keydown', (e) => {
        if (e.key === 'F3') { e.preventDefault(); destPicker(); }                       // FormKeyDown VK_F3
        else if (e.key === 'Escape') { e.preventDefault(); close(); refresh(el); }     // VK_ESCAPE -> Close
        else if (e.key === 'Enter' && e.target.tagName !== 'BUTTON') { e.preventDefault(); const els = [...fm.querySelectorAll('input,select,button')]; const i = els.indexOf(e.target); if (els[i + 1]) els[i + 1].focus(); }   // SelectNext
      });
      const body = () => {
        const n = (x) => x === '' || x === null ? null : +x;
        return { mode, id: v.id ?? null, orig_date: mode === 'edit' ? row.transactiondate : null, commission_id: com ? com.id : null,
          transaction_date: fm.transaction_date.value, operation_no: fm.operation_no.value || null, operation_code: n(fm.operation_code.value),
          debit_currency_id: n(fm.debit_currency_id.value), credit_currency_id: n(fm.credit_currency_id.value), debit_rate: n(fm.debit_rate.value), credit_rate: n(fm.credit_rate.value),
          debit_id: n(fm.debit_id.value), credit_id: n(fm.credit_id.value), debit_amount: +fm.debit_amount.value || 0, credit_amount: +fm.credit_amount.value || 0, lamount: +fm.lamount.value || 0,
          inbalancechar: fm.inbalancechar.value || null, outbalancechar: n(fm.outbalancechar.value), name: fm.name.value || null, report_id: n(fm.report_id.value), countr_id: n(fm.countr_id.value) };
      };
      // ResetTransaction: new insert, amounts cleared, currencies kept
      const reset = () => { mode = mode === 'edit' ? 'insert' : mode; v.id = null; ['debit_amount', 'credit_amount', 'lamount'].forEach(k => fm[k].value = 0); fm.report_id.value = '0'; fm.countr_id.value = '0';
        fm.operation_no.value = ''; modified = false; m.querySelector('h3').textContent = t('transactions.editor_' + mode); upd(); };
      m.querySelector('#tc').onclick = () => { m.querySelector('#terr').innerHTML = ''; reset(); };
      m.querySelector('#tx').onclick = () => { close(); refresh(el); };
      fm.onsubmit = async (e) => {
        e.preventDefault(); if (save.disabled) return; m.querySelector('#terr').innerHTML = '';
        try { const r = await api('/api/transactions/save', { method: 'POST', body: body() }); toast(t('transactions.saved', { id: r.id })); reset(); }
        catch (er) { if (er.key === 'transactions.err_tredit') return info(t(er.key)); m.querySelector('#terr').innerHTML = errHtml(er); }
      };
      upd();
    }, true);
  }

  window.SB.pages['/m/transactionmanager'] = async (el) => {
    el.innerHTML = '<div class="spinner"></div>';
    try { st.init = await api('/api/transactions/init'); } catch (e) { el.innerHTML = `<div class="card">${errHtml(e)}</div>`; return; }
    st.date = st.date || st.init.date; st.statusFirst = st.init.status_first;
    page(el);
  };
})();

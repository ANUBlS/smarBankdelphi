/* Accounts module – port of Delphi Packages/Accounts (AccountMainForm + AccountPropertiesForm + AccTransactionsForm
   + AccStatesForm + AccFlagsForm + StartEndDateInputForm). Business rules live in the API (api/app/accounts.py).
   Layout: the Delphi FilterGB (alLeft) is the shared left filter sidebar (ui/filterlayout.js). */
(function () {
  const { api, t, esc, toast } = window.SB;
  const fmtD = (v) => window.SB.fmtD(v), money = (v) => window.SB.fmtN(v);
  // Delphi defaults: ApplyFilter.Checked = True, ActiveAccounts.Checked = True (AccountMainFormImpl.dfm ActionList1),
  // OrderAccNo.Checked = True, SearchForward.Checked = True; the Use* filters start unchecked.
  const DEFAULTS = () => ({ apply_filter: true, status: 'active', order: 'accno', bal_cn: '', customer_id: '', currency_id: '', filial_id: '', flag: '',
                            use_bal: false, use_cust: false, use_cur: false, use_fil: false, use_flag: false, reset_filter: false });
  const st = { f: DEFAULTS(), rows: [], more: false, sel: null, lk: null, dir: 'fwd', firstSearch: true, layout: null };

  // stacked dialog (the Delphi child forms open on top of each other)
  function dlg(html, onMount, wide) {
    const d = document.createElement('div'); d.className = 'backdrop stacked';
    d.innerHTML = `<div class="modal ${wide ? 'wide' : ''}" role="dialog">${html}</div>`; document.body.appendChild(d);
    const close = () => d.remove(); onMount && onMount(d.querySelector('.modal'), close); return close;
  }
  function csv(name, cols, rows) {
    const line = (a) => a.map(v => `"${String(v ?? '').replace(/"/g, '""')}"`).join(',');
    const blob = new Blob(['\ufeff' + [line(cols.map(c => c[1])), ...rows.map(r => line(cols.map(c => r[c[0]])))].join('\r\n')], { type: 'text/csv' });
    const a = document.createElement('a'); a.href = URL.createObjectURL(blob); a.download = name; a.click();
  }
  const errHtml = (e) => `<div class="alert error">${esc(e.field ? t(e.key, { field: t('accounts.f_' + e.field) }) : t(e.key, e))}${e.ora ? `<span class="ora">${esc(e.ora)}</span>` : ''}</div>`;
  const opt = (list, key, label, val, empty = true) => (empty ? '<option value=""></option>' : '') + (list || []).map(x => `<option value="${esc(x[key])}" ${String(x[key]) === String(val ?? '') ? 'selected' : ''}>${esc(label(x))}</option>`).join('');

  // BuildAccsQuery (AccountMainFormImpl.pas:559-603): the Use* parts only when ApplyFilter is checked; each Use* filter takes the
  // value of the current row of its list dataset (the combo box), so a value is always present (first row by default).
  function query(offset, limit = 50) {
    const f = st.f, p = new URLSearchParams({ status: f.status, order: f.order, apply_filter: f.apply_filter, offset, limit });
    if (f.apply_filter) {
      if (f.use_bal && f.bal_cn !== '') p.set('bal_cn', f.bal_cn);
      if (f.use_cust && f.customer_id !== '') p.set('customer_id', f.customer_id);
      if (f.use_cur && f.currency_id !== '') p.set('currency_id', f.currency_id);
      if (f.use_fil && f.filial_id !== '') p.set('filial_id', f.filial_id);
      if (f.use_flag && f.flag) p.set('flag', f.flag);
    }
    return '/api/accounts?' + p;
  }

  async function load(el, append) {
    try {
      const r = await api(query(append ? st.rows.length : 0));
      st.rows = append ? st.rows.concat(r.rows) : r.rows; st.more = r.more;
      if (!append && !st.rows.some(x => x.accid === st.sel)) st.sel = st.rows[0] ? st.rows[0].accid : null;
      renderGrid(el);
    } catch (e) { el.querySelector('#accGrid').innerHTML = errHtml(e); }
  }
  async function loadAll(el) {   // DOA SearchRecord walks the whole (not yet fetched) result set
    while (st.more) { const r = await api(query(st.rows.length, 500)); st.rows = st.rows.concat(r.rows); st.more = r.more; }
    renderGrid(el);
  }

  // DBGrid1.Columns (AccountMainFormImpl.dfm:18-144): field, caption (Title.Caption or TField.DisplayLabel), kind, Delphi width, silver colour
  const COLS = [['accno', 'accounts.col_accno', 0, 101, 1], ['sacc', 'accounts.col_sacc', 0, 48], ['currencysname', 'accounts.col_currency', 0, 34, 1], ['accname', 'accounts.col_name', 0, 115],
                ['amount', 'accounts.col_amount', 1, 87], ['lamount', 'accounts.col_lamount', 1, 89], ['delayedamount', 'accounts.col_delayed', 1, 86], ['delayedlamount', 'accounts.col_delayedl', 1, 82],
                ['opendate', 'accounts.col_open', 2, 64], ['closedate', 'accounts.col_close', 2, 75]];
  const cell = (c, r) => c[2] === 1 ? money(r[c[0]]) : c[2] === 2 ? fmtD(r[c[0]]) : (r[c[0]] ?? '');

  function renderGrid(el) {
    el.querySelector('#accGrid').innerHTML = `<div class="tablewrap" style="max-height:62vh"><table class="grid acc-grid"><thead><tr>${COLS.map(c => `<th style="min-width:${c[3]}px;${c[2] === 1 ? 'text-align:right' : ''}">${esc(t(c[1]))}</th>`).join('')}</tr></thead><tbody>
      ${st.rows.map(r => `<tr data-id="${r.accid}" class="${r.accid === st.sel ? 'sel' : ''}">${COLS.map(c => `<td class="${c[4] ? 'silver' : ''}" style="white-space:nowrap;${c[2] === 1 ? 'text-align:right;font-variant-numeric:tabular-nums' : ''}">${esc(cell(c, r))}</td>`).join('')}</tr>`).join('')}
      </tbody></table></div>
      <div style="display:flex;justify-content:space-between;align-items:center;margin-top:10px"><span class="muted">${esc(t('accounts.loaded', { n: st.rows.length }))}</span>
      ${st.more ? `<button class="btn secondary small" id="more">${esc(t('accounts.load_more'))}</button>` : ''}</div>`;
    el.querySelectorAll('tr[data-id]').forEach(tr => {
      tr.onclick = () => select(el, +tr.dataset.id);
      tr.ondblclick = () => { st.sel = +tr.dataset.id; editDialog(el, st.sel); };   // DBGrid1DblClick -> Edit
      tr.oncontextmenu = (e) => { select(el, +tr.dataset.id); gridMenu(el, e); };   // PopupMenu = AccGridPopupMenu
    });
    const m = el.querySelector('#more'); if (m) m.onclick = () => load(el, true);
    updateButtons(el);
  }
  function select(el, id) {
    st.sel = id; el.querySelectorAll('#accGrid tr.sel').forEach(x => x.classList.remove('sel'));
    const tr = el.querySelector(`#accGrid tr[data-id="${id}"]`); if (tr) { tr.classList.add('sel'); tr.scrollIntoView({ block: 'nearest' }); }
    updateButtons(el);
  }
  const cur = () => st.rows.find(x => x.accid === st.sel);
  function updateButtons(el) {
    const r = cur();
    el.querySelector('[data-a=edit]').disabled = !r; el.querySelector('[data-a=tr]').disabled = !r; el.querySelector('[data-a=states]').disabled = !r;
    el.querySelector('[data-a=close]').disabled = !r || !!r.closedate;   // CloseUpdate: enabled only if CloseDate IsNull
  }

  // AccGridPopupMenu (AccountMainFormImpl.dfm:610-696)
  function gridMenu(el, e) {
    const f = st.f, r = cur();
    const tog = (k) => () => { f[k] = !f[k]; sidebar(el); };   // ToggleAndRefresh only toggles Checked (no refresh)
    const radio = (v) => () => { f.status = v; sidebar(el); };  // ActiveAccountsExecute: RefreshActions (no refresh)
    window.SB.contextMenu(e, [
      { label: t('accounts.new'), shortcut: 'Ins', onClick: () => editDialog(el, null) },
      { label: t('accounts.edit'), default: true, disabled: !r, onClick: () => editDialog(el, st.sel) },
      { label: t('accounts.close_action'), disabled: !r || !!r.closedate, onClick: () => closeAccount(el) },
      { label: t('accounts.m_filter'), items: [
        { label: t('accounts.filter_panel_action'), checked: !st.layout.isCollapsed(), onClick: () => st.layout.toggle() }, '-',
        { label: t('accounts.apply_filter'), checked: f.apply_filter, onClick: tog('apply_filter') },
        { label: t('accounts.reset_filter'), checked: f.reset_filter, onClick: tog('reset_filter') }, '-',
        { label: t('accounts.m_use_bal'), checked: f.use_bal, onClick: tog('use_bal') },
        { label: t('accounts.m_use_cust'), checked: f.use_cust, onClick: tog('use_cust') },
        { label: t('accounts.m_use_cur'), checked: f.use_cur, onClick: tog('use_cur') }, '-',
        { label: t('accounts.status_all'), checked: f.status === 'all', onClick: radio('all') },
        { label: t('accounts.status_closed'), checked: f.status === 'closed', onClick: radio('closed') },
        { label: t('accounts.status_active'), checked: f.status === 'active', onClick: radio('active') }] },
      { label: t('accounts.transactions'), shortcut: 'Ctrl+F5', disabled: !r, onClick: () => transactionsDialog(st.sel) },
      { label: t('accounts.states'), shortcut: 'Alt+F5', disabled: !r, onClick: () => statesDialog(st.sel) },
      '-']);
  }

  // FindAccountExecute (AccountMainFormImpl.pas:728-760): SearchRecord(FieldName, Text, [srPartialMatch, srForward|srBackward,
  // srFromBeginning (first search after leaving an edit) | srFromCurrent]); not found -> 'Hesab tapılmayıb: %s=%s' (DisplayName).
  const SEARCH = [['accno', 'accounts.col_accno'], ['sacc', 'accounts.dl_sacc'], ['currencysname', 'accounts.col_currency'], ['accname', 'accounts.col_name'],
                  ['amount', 'accounts.col_amount'], ['lamount', 'accounts.col_lamount'], ['opendate', 'accounts.col_open'], ['closedate', 'accounts.col_close']];
  const asString = (k, v) => v === null || v === undefined ? '' : (k === 'opendate' || k === 'closedate') ? fmtD(v) : String(v);   // TField.AsString
  async function find(el, field, text) {
    const hint = el.querySelector('#accFindHint'); hint.textContent = '';
    if (!text) return;
    if (st.more) await loadAll(el);
    const rows = st.rows, n = rows.length, fwd = st.dir === 'fwd';
    const hit = (r) => asString(field, r[field]).startsWith(text);
    let idx = rows.findIndex(r => r.accid === st.sel);
    let found = null;
    if (st.firstSearch) found = fwd ? rows.find(hit) : [...rows].reverse().find(hit);
    else if (fwd) { for (let i = idx + 1; i < n; i++) if (hit(rows[i])) { found = rows[i]; break; } }
    else { for (let i = idx - 1; i >= 0; i--) if (hit(rows[i])) { found = rows[i]; break; } }
    st.firstSearch = false;
    if (found) select(el, found.accid);
    else hint.textContent = t('accounts.not_found', { field: t(SEARCH.find(s => s[0] === field)[1]), value: text });   // ErrorHintBox
  }

  function sidebar(el) {
    const f = st.f, lk = st.lk, B = st.layout.body;
    const bal = (lk.saccs1 || []).find(x => String(x.bal_cn) === String(f.bal_cn));
    B.innerHTML = `
      <fieldset class="flt-group toggle-apply"><label><input type="checkbox" name="apply_filter" ${f.apply_filter ? 'checked' : ''}> <b>${esc(t('accounts.apply_filter'))}</b></label>
        <label><input type="checkbox" name="reset_filter" ${f.reset_filter ? 'checked' : ''}> ${esc(t('accounts.reset_filter'))}</label></fieldset>
      <fieldset class="flt-group"><legend>${esc(t('accounts.grp_status'))}</legend>
        ${['active', 'closed', 'all'].map(s => `<label><input type="radio" name="status" value="${s}" ${f.status === s ? 'checked' : ''}> ${esc(t('accounts.status_' + s))}</label>`).join('')}</fieldset>
      <fieldset class="flt-group"><legend>${esc(t('accounts.grp_balance'))}</legend>
        <label><input type="checkbox" name="use_bal" ${f.use_bal ? 'checked' : ''}> ${esc(t('accounts.by_balance'))}</label>
        <span class="hint">${esc(t('accounts.lbl_balance'))}</span>
        <select name="bal_cn">${opt(lk.saccs1, 'bal_cn', x => x.bal_cn, f.bal_cn, false)}</select><span class="hint" id="balName">${esc(bal ? bal.balname : '')}</span></fieldset>
      <fieldset class="flt-group"><legend>${esc(t('accounts.grp_customer'))}</legend>
        <label><input type="checkbox" name="use_cust" ${f.use_cust ? 'checked' : ''}> ${esc(t('accounts.by_customer'))}</label>
        <div class="row"><span class="hint">${esc(t('accounts.lbl_customer_code'))}</span><input name="cust_code" style="width:70px;flex:none"></div>
        <select name="customer_id">${opt(lk.customers, 'id', x => x.name, f.customer_id, false)}</select></fieldset>
      <fieldset class="flt-group"><legend>${esc(t('accounts.grp_currency'))}</legend>
        <label><input type="checkbox" name="use_cur" ${f.use_cur ? 'checked' : ''}> ${esc(t('accounts.by_currency'))}</label>
        <select name="currency_id">${opt(lk.currencies, 'valute', x => x.valu_name || x.val_name, f.currency_id, false)}</select></fieldset>
      <fieldset class="flt-group"><legend>${esc(t('accounts.grp_filial'))}</legend>
        <label><input type="checkbox" name="use_fil" ${f.use_fil ? 'checked' : ''}> ${esc(t('accounts.by_filial'))}</label>
        <select name="filial_id">${opt(lk.filials, 'id', x => x.name, f.filial_id, false)}</select></fieldset>
      <fieldset class="flt-group"><legend>${esc(t('accounts.grp_flags'))}</legend>
        <label><input type="checkbox" name="use_flag" ${f.use_flag ? 'checked' : ''}> ${esc(t('accounts.by_flag'))}</label>
        <select name="flag">${opt(lk.acc_flags, 'symbol', x => `${x.symbol}     ${x.description}`, f.flag, false)}</select></fieldset>
      <fieldset class="flt-group"><legend>${esc(t('accounts.order'))}</legend>
        ${['accno', 'name', 'currency'].map(o => `<label><input type="radio" name="order" value="${o}" ${f.order === o ? 'checked' : ''}> ${esc(t('accounts.order_' + o))}</label>`).join('')}</fieldset>
      <fieldset class="flt-group"><legend>${esc(t('accounts.grp_search'))}</legend>
        ${SEARCH.map(([k, l]) => `<input data-find="${k}" placeholder="${esc(t(l))}" title="${esc(t(l))}">`).join('')}
        <div class="row"><label><input type="radio" name="dir" value="fwd" ${st.dir === 'fwd' ? 'checked' : ''}> ${esc(t('accounts.search_forward'))}</label>
          <label><input type="radio" name="dir" value="back" ${st.dir === 'back' ? 'checked' : ''}> ${esc(t('accounts.search_backward'))}</label></div>
        <button type="button" class="btn secondary small" id="accFind">${esc(t('accounts.find'))} ⏎</button>
        <span class="hint" id="accFindHint" style="color:var(--danger)"></span></fieldset>`;
    const q = (n) => B.querySelector(`[name=${n}]`);
    // each Use* combo moves its list dataset; no refresh (CurrencyNameCBChange / CustomersDataAfterScroll refresh is commented out)
    B.querySelectorAll('input[type=checkbox],input[type=radio][name=status]').forEach(x => x.onchange = () => { f[x.name] = x.type === 'radio' ? x.value : x.checked; });
    ['bal_cn', 'customer_id', 'currency_id', 'filial_id', 'flag'].forEach(n => q(n).onchange = () => { f[n] = q(n).value; if (n === 'bal_cn') {   // SAccsDataAfterScroll: BALNAME label
      const b = (lk.saccs1 || []).find(x => String(x.bal_cn) === f.bal_cn); B.querySelector('#balName').textContent = b ? b.balname : ''; } });
    // OrderAccNoExecute: changing the order refreshes immediately
    B.querySelectorAll('[name=order]').forEach(r => r.onchange = () => { f.order = r.value; load(el); });
    B.querySelectorAll('[name=dir]').forEach(r => r.onchange = () => { st.dir = r.value; });   // SearchForwardExecute
    // CustomerIDSearchEditChange: Customers.Locate('ID', Text, [loCaseInsensitive, loPartialKey]) -> combo follows
    q('cust_code').oninput = () => { const v = q('cust_code').value; if (!v) return;
      const c = (lk.customers || []).find(x => String(x.id).toLowerCase().startsWith(v.toLowerCase())); if (c) { q('customer_id').value = c.id; f.customer_id = String(c.id); } };
    let focused = null;
    B.querySelectorAll('[data-find]').forEach(i => {
      i.onfocus = () => { focused = i; };
      i.onkeydown = (e) => { if (e.key === 'Enter') { e.preventDefault(); find(el, i.dataset.find, i.value); } };   // FindAccount ShortCut = Enter
      // AccNoSearchEditExit: clears the other (not focused) search edits, hides the hint, next search starts from the beginning
      i.onblur = () => setTimeout(() => { B.querySelectorAll('[data-find]').forEach(o => { if (o !== document.activeElement) o.value = ''; }); st.firstSearch = true; }, 0);
    });
    // FindAccountUpdate: enabled only while a search edit has the focus
    const fb = B.querySelector('#accFind'); fb.onmousedown = (e) => e.preventDefault();
    fb.onclick = () => { const i = document.activeElement && document.activeElement.dataset && document.activeElement.dataset.find ? document.activeElement : focused; if (i && i.value) find(el, i.dataset.find, i.value); };
  }

  function page(el) {
    const f = st.f, lk = st.lk;
    // Delphi starts with first rows of the list datasets as the filter values
    if (f.bal_cn === '' && lk.saccs1[0]) f.bal_cn = String(lk.saccs1[0].bal_cn);
    if (f.customer_id === '' && lk.customers[0]) f.customer_id = String(lk.customers[0].id);
    if (f.currency_id === '' && lk.currencies[0]) f.currency_id = String(lk.currencies[0].valute);
    if (f.filial_id === '' && lk.filials[0]) f.filial_id = String(lk.filials[0].id);
    if (f.flag === '' && lk.acc_flags[0]) f.flag = lk.acc_flags[0].symbol;   // ActiveFormCreate: CBAccSymbols.ItemIndex := 0
    el.innerHTML = `<div class="card" style="max-width:none">
      <div style="display:flex;align-items:center;gap:10px;flex-wrap:wrap;margin-bottom:12px"><h2 style="margin:0">${esc(t('accounts.title'))}</h2><div class="spacer" style="flex:1"></div>
        <button class="btn" data-a="new" title="Ins">＋ ${esc(t('accounts.new'))}</button>
        <button class="btn secondary" data-a="edit">${esc(t('accounts.edit'))}</button>
        <button class="btn secondary" data-a="close">${esc(t('accounts.close'))}</button>
        <button class="btn secondary" data-a="refresh">⟳ ${esc(t('accounts.refresh'))}</button>
        <button class="btn secondary" data-a="filter">${esc(t('accounts.filter_panel'))}</button>
        <button class="btn secondary" data-a="tr" title="Ctrl+F5">${esc(t('accounts.transactions'))}</button>
        <button class="btn secondary" data-a="states" title="Alt+F5">${esc(t('accounts.states'))}</button>
        <button class="btn secondary" data-a="csv">${esc(t('history.export'))}</button></div>
      <div id="accLayout"></div></div>`;
    st.layout = window.SB.filterLayout(el.querySelector('#accLayout'), { key: 'accounts', title: t('accounts.filter_title'),
      applyLabel: t('accounts.refresh'), clearLabel: t('accounts.clear'),
      onApply: () => load(el),                                                  // RefreshExecute: BuildAccsQuery + Open
      onClear: () => { const keepOrder = st.f.order; st.f = DEFAULTS(); st.f.order = keepOrder; page(el); } });
    st.layout.main.innerHTML = '<div id="accGrid"><div class="spinner"></div></div>';
    sidebar(el);
    el.querySelector('[data-a=new]').onclick = () => editDialog(el, null);
    el.querySelector('[data-a=edit]').onclick = () => st.sel && editDialog(el, st.sel);
    el.querySelector('[data-a=close]').onclick = () => closeAccount(el);
    el.querySelector('[data-a=tr]').onclick = () => st.sel && transactionsDialog(st.sel);
    el.querySelector('[data-a=states]').onclick = () => st.sel && statesDialog(st.sel);
    el.querySelector('[data-a=filter]').onclick = () => st.layout.toggle();    // ToggleFilterExecute: FilterGB.Visible
    el.querySelector('[data-a=refresh]').onclick = () => load(el);
    el.querySelector('[data-a=csv]').onclick = () => csv('accounts.csv', COLS.map(c => [c[0], t(c[1])]), st.rows.map(r => Object.fromEntries(COLS.map(c => [c[0], cell(c, r)]))));
    el.tabIndex = -1;
    el.onkeydown = (e) => {
      if (document.querySelector('.backdrop')) return;
      if (e.key === 'Insert') { e.preventDefault(); editDialog(el, null); }                                   // Add ShortCut 45
      else if (e.key === 'F5' && e.ctrlKey && st.sel) { e.preventDefault(); transactionsDialog(st.sel); }     // ViewTransactions 16500
      else if (e.key === 'F5' && e.altKey && st.sel) { e.preventDefault(); statesDialog(st.sel); }            // ViewStates 32884
      else if (e.target.tagName !== 'INPUT' && st.rows.length && (e.key === 'ArrowDown' || e.key === 'ArrowUp')) {
        e.preventDefault(); const i = st.rows.findIndex(r => r.accid === st.sel); const n = st.rows[Math.max(0, Math.min(st.rows.length - 1, i + (e.key === 'ArrowDown' ? 1 : -1)))]; if (n) select(el, n.accid); }
    };
    load(el);
  }

  async function closeAccount(el) {
    const r = cur(); if (!r) return;
    // AccountMainFormImpl.pas:816 balance check first (server re-checks), then confirmation
    if (Number(r.amount) !== 0 || Number(r.lamount) !== 0) return toast(t('accounts.err_close_balance'), 'error');
    if (!confirm(t('accounts.confirm_close', { acc: r.accno }))) return;
    try { await api(`/api/accounts/${r.accid}/close`, { method: 'POST' }); toast(t('accounts.closed_ok')); load(el); }
    catch (e) { dlg(`<h3>${esc(t('accounts.close'))}</h3>${errHtml(e)}<div class="actions"><button class="btn" id="x">${esc(t('common.close'))}</button></div>`, (m, c) => m.querySelector('#x').onclick = c); }
  }

  // AccountPropertiesForm (AccountPropertiesForm_Unit.dfm): every lookup has its code TDBEdit bound to the same field
  // (CurencyIDEdit, SAccEdit, CustomerIDEdit, DBEdit4 FilialID, DBEdit1-3 SAcc2-4); typing the code sets the field, the lookup follows.
  async function editDialog(el, id) {
    const lk = st.lk;
    let a;
    try { a = id ? await api(`/api/accounts/${id}`) : await api('/api/accounts/new-defaults'); } catch (e) { return toast(t(e.key, e), 'error'); }
    const v = id ? { acc_no: a.accno, acc_name: a.accname, customer_id: a.customerid, currency_id: a.currencyid, open_date: a.opendate, sacc: a.sacc, sacc2: a.sacc2, sacc3: a.sacc3, sacc4: a.sacc4,
                     acc_limit: a.acclimit, report_symbol: a.reportsymbol, pair_acc: a.pairacc, pair_accno: a.pair_accno, filial_id: a.filialid, flags: a.acc_flags_checked || [], accflags: a.accflags ?? '' }
                 : { acc_no: '', acc_name: '', customer_id: '', currency_id: '', open_date: a.open_date, sacc: '', sacc2: '', sacc3: '', sacc4: '', acc_limit: '', report_symbol: '', pair_acc: '', pair_accno: '', filial_id: a.filial_id, flags: [], accflags: '' };
    const ro = (lbl, val) => `<div class="field"><label>${esc(t(lbl))}</label><input value="${esc(money(val))}" readonly class="ro" style="background:#e5e7eb;text-align:right"></div>`;
    const pairSel = (name, list, key, label, val, w = 70) => `<div class="row" style="display:flex;gap:6px"><input name="${name}" data-code="${name}" value="${esc(val ?? '')}" style="width:${w}px;flex:none" inputmode="numeric"><select data-cb="${name}" style="flex:1;min-width:0">${opt(list, key, label, val)}</select></div>`;
    let flagsModified = false, flagsStr = v.accflags, flagsChecked = v.flags.slice();
    dlg(`<h3>${esc(t(id ? 'accounts.edit_title' : 'accounts.new_title'))}</h3><form id="af" autocomplete="off"><div id="aerr"></div>
      <div class="grid2"><fieldset class="trside"><legend>${esc(t('accounts.grp_current'))}</legend><div class="grid2">${ro('accounts.lbl_amount', a.amount)}${ro('accounts.lbl_lamount', a.lamount)}</div></fieldset>
        <fieldset class="trside"><legend>${esc(t('accounts.grp_daystart'))}</legend><div class="grid2">${ro('accounts.lbl_amount', a.daystartamount)}${ro('accounts.lbl_lamount', a.daystartlamount)}</div></fieldset></div>
      <fieldset class="trside"><legend>${esc(t('accounts.grp_account'))}</legend><div class="grid2">
        <div class="field"><label>${esc(t('accounts.f_acc_no'))} *</label><input name="acc_no" value="${esc(v.acc_no)}" style="text-transform:uppercase"></div>
        <div class="field"><label>${esc(t('accounts.f_currency_id'))} *</label>${pairSel('currency_id', lk.currencies, 'valute', x => x.valu_name || x.val_name, v.currency_id, 50)}</div>
        <div class="field" style="grid-column:1/-1"><label>${esc(t('accounts.f_sacc'))} *</label>${pairSel('sacc', lk.saccs1, 'bal_cn', x => x.balname, v.sacc)}</div>
        <div class="field" style="grid-column:1/-1"><label>${esc(t('accounts.f_customer_id'))} *</label>${pairSel('customer_id', lk.customers, 'id', x => x.name, v.customer_id)}</div>
        <div class="field"><label>${esc(t('accounts.f_open_date'))}</label><input type="date" name="open_date" value="${esc(v.open_date)}"></div>
        <div class="field"><label>${esc(t('accounts.f_pair_acc'))}</label><input name="pair_q" list="pairList" placeholder="${esc(t('accounts.pair_hint'))}" value="${esc(v.pair_accno || '')}"><datalist id="pairList"></datalist><input type="hidden" name="pair_acc" value="${esc(v.pair_acc ?? '')}"></div>
        <div class="field" style="grid-column:1/-1"><label>${esc(t('accounts.f_acc_name'))} *</label><input name="acc_name" value="${esc(v.acc_name)}"></div>
        <div class="field"><label>${esc(t('accounts.f_limit'))}</label><input name="acc_limit" type="number" step="0.01" value="${esc(v.acc_limit)}"></div>
        <div class="field"><label>${esc(t('accounts.f_report_symbol'))}</label><select name="report_symbol">${opt(lk.report_symbols, 'id', x => x.name, v.report_symbol)}</select></div>
        <div class="field"><label>${esc(t('accounts.f_filial'))}</label>${pairSel('filial_id', lk.filials, 'id', x => x.name, v.filial_id, 57)}</div>
        <div class="field"><label>${esc(t('accounts.f_flags'))}</label><div style="display:flex;gap:8px;align-items:center"><b id="flagsTxt">${esc(flagsStr)}</b><button type="button" class="btn secondary small" id="flagsBtn">${esc(t('accounts.flags_btn'))}</button></div></div>
      </div>
      <details ${v.sacc2 || v.sacc3 || v.sacc4 ? 'open' : ''}><summary>${esc(t('accounts.other_btn'))}</summary><div style="margin-top:10px"><b>${esc(t('accounts.additional_saccs'))}</b>
        <div class="field"><label>${esc(t('accounts.f_sacc2'))}</label>${pairSel('sacc2', lk.saccs2, 'bal_cn', x => x.balname, v.sacc2)}</div>
        <div class="field"><label>${esc(t('accounts.f_sacc3'))}</label>${pairSel('sacc3', lk.saccs3, 'bal_cn', x => x.balname, v.sacc3)}</div>
        <div class="field"><label>${esc(t('accounts.f_sacc4'))}</label>${pairSel('sacc4', lk.saccs4, 'bal_cn', x => x.balname, v.sacc4)}</div></div></details></fieldset>
      <div class="actions"><button type="button" class="btn secondary" id="acancel">${esc(t('accounts.cancel_btn'))}</button><button class="btn" id="asave">${esc(t('accounts.save'))}</button></div></form>`, (m, close) => {
      const fm = m.querySelector('#af');
      let modified = false; fm.addEventListener('input', () => modified = true); fm.addEventListener('change', () => modified = true);
      // FormCloseQuery: 'Dissmiss changes?' when modified
      const tryClose = () => { if (!modified || confirm(t('accounts.dismiss_changes'))) close(); };
      m.querySelector('#acancel').onclick = tryClose;
      m.addEventListener('keydown', (e) => {
        if (e.key === 'Escape') { e.preventDefault(); e.stopPropagation(); tryClose(); }   // FormKeyDown VK_ESCAPE
        // FormKeyPress VK_RETURN -> SelectNext
        if (e.key === 'Enter' && e.target.tagName !== 'BUTTON' && e.target.tagName !== 'TEXTAREA') { e.preventDefault();
          const els = [...fm.querySelectorAll('input:not([type=hidden]):not([readonly]),select,button')]; const i = els.indexOf(e.target); if (els[i + 1]) els[i + 1].focus(); }
      });
      // code edit <-> lookup combo (same DataField)
      fm.querySelectorAll('[data-code]').forEach(inp => { const cb = fm.querySelector(`[data-cb="${inp.dataset.code}"]`);
        inp.addEventListener('input', () => { inp.value = inp.value.replace(/[^0-9-]/g, ''); cb.value = [...cb.options].some(o => o.value === inp.value) ? inp.value : ''; });
        cb.addEventListener('change', () => { inp.value = cb.value; }); });
      // AccNoEditKeyPress: disallowed characters are dropped; CharCase = ecUpperCase
      fm.acc_no.addEventListener('input', () => { fm.acc_no.value = fm.acc_no.value.replace(/[^0-9a-zA-Z/\-:().,'+{} ]/g, '').toUpperCase(); });
      // CustomerNameCBCloseUp: AccName := customer name
      fm.querySelector('[data-cb=customer_id]').addEventListener('change', () => { const c = lk.customers.find(x => String(x.id) === fm.customer_id.value); if (c) fm.acc_name.value = c.name; });
      fm.pair_q.addEventListener('input', async () => {
        if (!fm.pair_q.value) { fm.pair_acc.value = ''; return; }
        const list = await api('/api/accounts/pair-lookup?q=' + encodeURIComponent(fm.pair_q.value)).catch(() => []);
        m.querySelector('#pairList').innerHTML = list.map(x => `<option value="${esc(x.accno)}">`).join('');
        const hit = list.find(x => x.accno === fm.pair_q.value); if (hit) fm.pair_acc.value = hit.accid;
      });
      // Button1Click -> AccFlagsForm (CheckListBox 'Symbol - Description'); AccFlags is replaced only if OK and a box was clicked
      m.querySelector('#flagsBtn').onclick = () => dlg(`<h3>Account Flags</h3><div class="flags" style="display:flex;flex-direction:column;gap:4px;background:#eef1f5;padding:8px;border-radius:8px">
          ${lk.acc_flags.map(fl => `<label><input type="checkbox" value="${esc(fl.symbol + ' - ' + fl.description)}" data-s="${esc(fl.symbol)}" ${flagsChecked.includes(fl.symbol) ? 'checked' : ''}> ${esc(fl.symbol)} - ${esc(fl.description)}</label>`).join('')}</div>
          <div class="actions"><button class="btn" id="fok">OK</button></div>`, (fmm, fclose) => {
        let clicked = false; fmm.querySelectorAll('input').forEach(c => c.onchange = () => clicked = true);   // CLBAccFlagsClickCheck: FModified
        fmm.addEventListener('keydown', (e) => { if (e.key === 'Escape') { e.preventDefault(); e.stopPropagation(); fclose(); } });   // mrCancel
        fmm.tabIndex = -1; (fmm.querySelector('input') || fmm.querySelector('#fok')).focus();
        fmm.querySelector('#fok').onclick = () => {
          if (clicked) { const ch = [...fmm.querySelectorAll('input:checked')]; flagsChecked = ch.map(c => c.dataset.s); flagsStr = ch.map(c => c.value[0]).join(',');
            flagsModified = true; modified = true; m.querySelector('#flagsTxt').textContent = flagsStr; }
          fclose(); };
      });
      fm.onsubmit = async (e) => {
        e.preventDefault();
        const d = new FormData(fm), num = (k) => d.get(k) === '' || d.get(k) === null ? null : Number(d.get(k));
        const body = { acc_no: (d.get('acc_no') || '').toUpperCase(), acc_name: d.get('acc_name'), customer_id: num('customer_id'), currency_id: num('currency_id'), sacc: num('sacc'),
          sacc2: num('sacc2') ?? 0, sacc3: num('sacc3') ?? 0, sacc4: num('sacc4') ?? 0, open_date: d.get('open_date') || null, acc_limit: d.get('acc_limit') || 0,
          report_symbol: num('report_symbol') ?? 0, pair_acc: num('pair_acc') ?? 0, filial_id: num('filial_id') ?? 0,
          acc_flags: flagsModified ? flagsStr : (id ? v.accflags : null) };   // unchanged AccFlags field value when the dialog was not used
        try {
          const r = id ? await api(`/api/accounts/${id}`, { method: 'PUT', body }) : await api('/api/accounts', { method: 'POST', body });
          close(); toast(t('accounts.saved')); if (!id && r.accid) st.sel = r.accid; load(el);   // SafeRefresh: keep position
        } catch (er) { m.querySelector('#aerr').innerHTML = errHtml(er); if (er.field && fm[er.field]) fm[er.field].focus(); }
      };
      fm.acc_no.focus();
    }, true);
  }

  // ViewTransactionsExecute (AccountMainFormImpl.pas:831-857): StartEndDateInputForm first (both dates = Sb_GetSystemDate)
  function datesDialog(def) {
    return new Promise(res => dlg(`<h3>Dates</h3><div class="grid2"><div class="field"><label>Start:</label><input type="date" id="ds" value="${esc(def)}"></div>
      <div class="field"><label>End:</label><input type="date" id="de" value="${esc(def)}"></div></div>
      <div class="actions"><button class="btn secondary" id="dc">Cancel</button><button class="btn" id="dok">Ok</button></div>`, (m, close) => {
      const ok = () => { const s = m.querySelector('#ds').value, e = m.querySelector('#de').value; close(); res({ s, e }); };
      m.querySelector('#dok').onclick = ok; m.querySelector('#dc').onclick = () => { close(); res(null); };
      m.addEventListener('keydown', (e) => { if (e.key === 'Enter') { e.preventDefault(); ok(); } if (e.key === 'Escape') { e.preventDefault(); close(); res(null); } });
      m.querySelector('#dok').focus();
    }));
  }
  async function transactionsDialog(id) {
    const d = await datesDialog(st.lk.operation_date); if (!d) return;
    let closeT = null, tm = null, tab = null;
    const show = async (start, end, keepTab) => {
      let r; try { r = await api(`/api/accounts/${id}/transactions?start=${start}&end=${end}`); } catch (e) { return toast(t(e.key, e), 'error'); }
      tab = keepTab || r.active_tab;
      // AccTransactionsForm grids: # | Tarix | Debit | Kredit | D.Məbləğ | K.Məbləğ | Ekvivalent; Destination in the DBEdit under the grid
      const cols = [['id', 'accounts.t_no'], ['operationdate', 'accounts.t_date', 2], ['debitaccno', 'accounts.t_debit'], ['creditaccno', 'accounts.t_credit'],
                    ['debitamount', 'accounts.t_damount', 1], ['creditamount', 'accounts.t_camount', 1], ['lamount', 'accounts.t_lamount', 1]];
      const rows = tab === 'debit' ? r.debit : r.credit;
      const html = `<h3>${esc(t('accounts.transactions'))} · ${esc(r.accno)}</h3>
        <div class="filters" style="display:flex;gap:12px"><div class="field"><label>${esc(t('history.from'))}</label><input type="date" id="ts" value="${r.start}"></div><div class="field"><label>${esc(t('history.to'))}</label><input type="date" id="te" value="${r.end}"></div></div>
        <div class="tablewrap" style="max-height:42vh"><table class="grid acc-grid"><thead><tr>${cols.map(c => `<th style="${c[2] === 1 ? 'text-align:right' : ''}">${esc(t(c[1]))}</th>`).join('')}</tr></thead>
        <tbody>${rows.map((x, i) => `<tr data-i="${i}" class="${i === 0 ? 'sel' : ''}">${cols.map(c => `<td style="${c[2] === 1 ? 'text-align:right' : ''}">${esc(c[2] === 1 ? money(x[c[0]]) : c[2] === 2 ? fmtD(x[c[0]]) : (x[c[0]] ?? ''))}</td>`).join('')}</tr>`).join('')}</tbody></table></div>
        <div class="field" style="margin-top:8px"><input readonly class="ro" id="tdest" value="${esc(rows[0] ? rows[0].destination ?? '' : '')}"></div>
        <div class="totals"><span>${esc(t('accounts.total_lbl'))}</span><span>${esc(t(tab === 'debit' ? 'accounts.by_debit' : 'accounts.by_credit'))} <b>${money(tab === 'debit' ? r.debit_total : r.credit_total)}</b></span><span>${esc(t('accounts.lbl_lamount'))} <b>${money(tab === 'debit' ? r.debit_ltotal : r.credit_ltotal)}</b></span></div>
        <div class="tabs"><button class="${tab === 'debit' ? 'on' : ''}" data-tab="debit">${esc(t('accounts.tab_debit'))} (${r.debit.length})</button><button class="${tab === 'credit' ? 'on' : ''}" data-tab="credit">${esc(t('accounts.tab_credit'))} (${r.credit.length})</button></div>
        <div class="actions"><span class="muted" style="margin-right:auto">F3 - ${esc(t('accounts.print'))}</span><button class="btn secondary" id="texp">F3 ${esc(t('history.export'))}</button><button class="btn" id="tok">Ok</button></div>`;
      if (!closeT) closeT = dlg('', (mm) => { tm = mm; }, true);
      const m = tm; m.innerHTML = html;
      const ts = m.querySelector('#ts'), te = m.querySelector('#te');
      // StartDateEditChange / EndDateEditChange -> RefreshTransactions
      ts.onchange = te.onchange = () => show(ts.value, te.value, tab);
      m.querySelectorAll('[data-tab]').forEach(b => b.onclick = () => show(ts.value, te.value, b.dataset.tab));
      m.querySelectorAll('tr[data-i]').forEach(tr => tr.onclick = () => { m.querySelectorAll('tr.sel').forEach(x => x.classList.remove('sel')); tr.classList.add('sel'); m.querySelector('#tdest').value = rows[+tr.dataset.i].destination ?? ''; });
      const exp = () => csv(`AccTrans-${r.accno}-${tab}.csv`, cols.map(c => [c[0], t(c[1])]), rows);   // F3 AccTrExport (active page)
      m.querySelector('#tok').onclick = () => { closeT(); closeT = null; };
      m.querySelector('#texp').onclick = exp;
      m.onkeydown = (e) => { if (e.key === 'Escape') { closeT(); closeT = null; } if (e.key === 'F3') { e.preventDefault(); exp(); } };
    };
    show(d.s, d.e);
  }

  // AccStatesForm: two pages over the same archost dataset
  async function statesDialog(id) {
    let rows; try { rows = await api(`/api/accounts/${id}/states`); } catch (e) { return toast(t(e.key, e), 'error'); }
    const PAGES = { amounts: [['archivedate', 'accounts.t_date', 2], ['amount', 'accounts.s_amount', 1], ['lamount', 'accounts.lbl_lamount_c', 1]],
                    turnovers: [['archivedate', 'accounts.t_date', 2], ['debitturnover', 'accounts.s_dt', 1], ['debitlturnover', 'accounts.s_dtl', 1], ['creditturnover', 'accounts.s_ct', 1], ['creditlturnover', 'accounts.s_ctl', 1]] };
    let pg = 'amounts';
    dlg('', (m, close) => {
      const draw = () => {
        const cols = PAGES[pg];
        m.innerHTML = `<h3>${esc(t('accounts.states'))}</h3><div class="tablewrap" style="max-height:55vh"><table class="grid"><thead><tr>${cols.map(c => `<th style="${c[2] === 1 ? 'text-align:right' : ''}">${esc(t(c[1]))}</th>`).join('')}</tr></thead><tbody>
          ${rows.map(x => `<tr>${cols.map(c => `<td style="${c[2] === 1 ? 'text-align:right' : ''}">${esc(c[2] === 1 ? money(x[c[0]]) : fmtD(x[c[0]]))}</td>`).join('')}</tr>`).join('')}</tbody></table></div>
          <div class="tabs"><button data-pg="amounts" class="${pg === 'amounts' ? 'on' : ''}">${esc(t('accounts.pg_amounts'))}</button><button data-pg="turnovers" class="${pg === 'turnovers' ? 'on' : ''}">${esc(t('accounts.pg_turnovers'))}</button></div>
          <div class="actions"><span class="muted" style="margin-right:auto">F3 - ${esc(t('accounts.print'))}</span><button class="btn secondary" id="sexp">F3 ${esc(t('history.export'))}</button><button class="btn" id="sok">${esc(t('accounts.exit'))}</button></div>`;
        m.querySelectorAll('[data-pg]').forEach(b => b.onclick = () => { pg = b.dataset.pg; draw(); });
        m.querySelector('#sok').onclick = close; m.querySelector('#sexp').onclick = exp;
      };
      // F3: AccStateExporter only when the dataset is open and RecordCount > 0 (all fields of AccState)
      const all = [['archivedate', 'accounts.t_date'], ['amount', 'accounts.s_amount'], ['lamount', 'accounts.lbl_lamount_c'], ['debitturnover', 'accounts.s_dt'], ['debitlturnover', 'accounts.s_dtl'], ['creditturnover', 'accounts.s_ct'], ['creditlturnover', 'accounts.s_ctl']];
      const exp = () => rows.length && csv('AccountState.csv', all.map(c => [c[0], t(c[1])]), rows);
      m.onkeydown = (e) => { if (e.key === 'Escape') close(); if (e.key === 'F3') { e.preventDefault(); exp(); } };
      draw();
    }, true);
  }

  window.SB.pages['/m/accounts'] = async (el) => {
    el.innerHTML = '<div class="spinner"></div>';
    try { st.lk = await api('/api/accounts/lookups'); } catch (e) { el.innerHTML = `<div class="card">${errHtml(e)}</div>`; return; }
    page(el);
  };
})();

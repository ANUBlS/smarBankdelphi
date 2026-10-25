/* Customers module – port of Delphi Packages/Customer_Operations (TCO_Main customers_operation_impl, customer card
   UnitCustProps, PEP dialog Pep_changeUnit, new account FormAcc_Unit, P_AccState_Unit, P_AccTransaction_Unit).
   All business rules run in the API (api/app/customers.py); this file is presentation + Delphi dialog flow. */
(function () {
  const { api, t, esc, toast, fmtDate } = window.SB;
  // stacked dialog: Delphi shows message boxes / the PEP form on top of the open customer card (ShowModal)
  function modal(html, onMount) {
    const d = document.createElement('div'); d.className = 'backdrop stacked';
    d.innerHTML = `<div class="modal" role="dialog">${html}</div>`; document.body.appendChild(d);
    const close = () => d.remove(); onMount && onMount(d.querySelector('.modal'), close); return close;
  }
  const money = (v) => v === null || v === undefined || v === '' ? '' : Number(v).toLocaleString(window.I18N.lang, { minimumFractionDigits: 2, maximumFractionDigits: 2 });
  const st = { sort: 'ID', rows: [], more: false, sel: null, accs: [], acc: null, trs: [], trSel: new Set(), trCur: null, trSort: 'ID', lk: null, sysdate: null };
  const errText = (e) => e.field ? t(e.key, { field: t('customers.f_' + e.field) }) : t(e.key, e);
  const errHtml = (e) => `<div class="alert error">${esc(errText(e))}${e.ora ? `<span class="ora">${esc(e.ora)}</span>` : ''}</div>`;
  const opt = (list, key, label, val, empty = true) => (empty ? '<option value=""></option>' : '') + (list || []).map(x => `<option value="${esc(x[key])}" ${String(x[key]) === String(val ?? '') ? 'selected' : ''}>${esc(label(x))}</option>`).join('');
  const ask = (msg, { danger = false, yes = t('common.yes'), no = t('common.no') } = {}) => new Promise(res => modal(
    `<div class="${danger ? 'alert error' : ''}" style="white-space:pre-line;font-size:${danger ? '16px;font-weight:700' : '14px'}">${esc(msg)}</div>
     <div class="actions"><button class="btn secondary" id="qn">${esc(no)}</button><button class="btn ${danger ? 'danger' : ''}" id="qy">${esc(yes)}</button></div>`,
    (m, close) => { m.querySelector('#qy').onclick = () => { close(); res(true); }; m.querySelector('#qn').onclick = () => { close(); res(false); }; m.querySelector('#qy').focus(); }));
  const info = (msg) => new Promise(res => modal(`<div style="white-space:pre-line">${esc(msg)}</div><div class="actions"><button class="btn" id="ok">OK</button></div>`,
    (m, close) => { const b = m.querySelector('#ok'); b.onclick = () => { close(); res(); }; b.focus(); }));
  const STATUS = { 1: ['⏳', 'amber', 'customers.st_delayed'], 2: ['✔', 'teal', 'customers.st_committed'], 3: ['✖', 'red', 'customers.st_rejected'] };

  // ------------------------------------------------------------------ customers grid
  const CCOLS = [['ID', 'id', 'customers.col_id'], ['INN', 'inn', 'customers.col_inn'], ['NAME', 'name', 'customers.col_name'], ['OPEN_DAT', 'open_dat', 'customers.col_open', 2], ['USNAM', 'usnam', 'customers.col_user']];
  async function loadCustomers(el, upto) {
    try {
      const limit = Math.max(100, upto || 0);
      const r = await api(`/api/customers?sort=${st.sort}&offset=0&limit=${limit}`);
      st.rows = r.rows; st.more = r.more;
      if (!st.rows.some(x => x.id === st.sel)) st.sel = st.rows[0] ? st.rows[0].id : null;
      renderCustomers(el); await scrollCustomer(el);
    } catch (e) { el.querySelector('#cGrid').innerHTML = errHtml(e); }
  }
  async function moreCustomers(el) {
    const r = await api(`/api/customers?sort=${st.sort}&offset=${st.rows.length}&limit=100`);
    st.rows = st.rows.concat(r.rows); st.more = r.more; renderCustomers(el);
  }
  function renderCustomers(el) {
    el.querySelector('#cGrid').innerHTML = `<div class="tablewrap" style="max-height:34vh"><table class="grid acc-grid"><thead><tr>${CCOLS.map(c => `<th data-sort="${c[0]}" class="sortable">${esc(t(c[2]))}${st.sort === c[0] ? ' ▲' : ''}</th>`).join('')}</tr></thead><tbody>
      ${st.rows.map((r, i) => `<tr data-id="${r.id}" data-rn="${i + 1}" class="${r.id === st.sel ? 'sel' : ''}">${CCOLS.map(c => `<td>${esc(c[3] === 2 ? fmtDate(r[c[1]]) : r[c[1]])}</td>`).join('')}</tr>`).join('')}</tbody></table></div>
      <div class="gridfoot"><span class="muted">${esc(t('customers.loaded', { n: st.rows.length }))}</span>${st.more ? `<button class="btn secondary small" id="cmore">${esc(t('accounts.load_more'))}</button>` : ''}</div>`;
    // DBGrid TitleClick: Customers.SetVariable('title', Column.FieldName) + refresh
    el.querySelectorAll('#cGrid th[data-sort]').forEach(th => th.onclick = () => { st.sort = th.dataset.sort; loadCustomers(el); });
    el.querySelectorAll('#cGrid tr[data-id]').forEach(tr => {
      tr.onclick = () => selectCustomer(el, +tr.dataset.id);
      tr.ondblclick = () => { selectCustomer(el, +tr.dataset.id); customerCard(el, st.sel); };
    });
    const m = el.querySelector('#cmore'); if (m) m.onclick = () => moreCustomers(el);
  }
  function selRow(el, grid, id) {
    el.querySelectorAll(`${grid} tr.sel`).forEach(x => x.classList.remove('sel'));
    const tr = el.querySelector(`${grid} tr[data-id="${id}"]`); if (tr) { tr.classList.add('sel'); tr.scrollIntoView({ block: 'nearest' }); }
  }
  async function selectCustomer(el, id, accNo) {
    st.sel = id; selRow(el, '#cGrid', id);
    // CustomersAfterScroll: Account(CID=id, p_AccNO=null)
    try { st.accs = id ? await api(`/api/customers/${id}/accounts`) : []; } catch (e) { st.accs = []; toast(errText(e), 'error'); }
    const a = (accNo && st.accs.find(x => x.accno === accNo)) || st.accs[0];
    st.acc = a ? a.id : null; renderAccounts(el); await loadTransactions(el);
  }
  async function scrollCustomer(el) { await selectCustomer(el, st.sel); }
  async function gotoRn(el, rn) {   // row number from server-side locate
    while (st.rows.length < rn && st.more) await moreCustomers(el);
    const r = st.rows[rn - 1]; if (r) await selectCustomer(el, r.id);
  }

  // ------------------------------------------------------------------ accounts + transactions
  const ACOLS = [['accno', 'customers.a_accno'], ['accname', 'customers.a_name'], ['accval', 'customers.a_cur'], ['opendate', 'customers.a_open', 2], ['balance', 'customers.a_balance', 1], ['lbalance', 'customers.a_lbalance', 1], ['typesymb', 'customers.a_symb'], ['tipacc', 'customers.a_flags']];
  function renderAccounts(el) {
    el.querySelector('#aGrid').innerHTML = `<div class="tablewrap" style="max-height:22vh"><table class="grid acc-grid"><thead><tr>${ACOLS.map(c => `<th style="${c[2] === 1 ? 'text-align:right' : ''}">${esc(t(c[1]))}</th>`).join('')}</tr></thead><tbody>
      ${st.accs.map(r => `<tr data-id="${r.id}" class="${r.id === st.acc ? 'sel' : ''}">${ACOLS.map(c => `<td style="${c[2] === 1 ? 'text-align:right;font-variant-numeric:tabular-nums' : ''}">${esc(c[2] === 1 ? money(r[c[0]]) : c[2] === 2 ? fmtDate(r[c[0]]) : r[c[0]])}</td>`).join('')}</tr>`).join('')
      || `<tr><td colspan="${ACOLS.length}" class="muted">${esc(t('customers.no_accounts'))}</td></tr>`}</tbody></table></div>`;
    el.querySelectorAll('#aGrid tr[data-id]').forEach(tr => tr.onclick = () => { st.acc = +tr.dataset.id; selRow(el, '#aGrid', st.acc); loadTransactions(el); });
    el.querySelectorAll('[data-acc]').forEach(b => b.disabled = !st.acc);
  }
  const TCOLS = [['id', 'customers.t_id'], ['status', 'customers.t_status', 3], ['transactiondate', 'customers.t_date', 2], ['debitaccno', 'customers.t_debit'], ['debitcurrencysname', 'customers.t_dcur'], ['creditaccno', 'customers.t_credit'], ['creditcurrencysname', 'customers.t_ccur'], ['debitamount', 'customers.t_damount', 1], ['creditamount', 'customers.t_camount', 1], ['lamount', 'customers.t_lamount', 1], ['name', 'customers.t_name']];
  const TSORT = { id: 'ID', transactiondate: 'TRANSACTIONDATE', debitaccno: 'DEBITACCNO', debitcurrencysname: 'DEBITCURRENCYSNAME', creditaccno: 'CREDITACCNO', creditcurrencysname: 'CREDITCURRENCYSNAME', debitamount: 'DEBITAMOUNT', creditamount: 'CREDITAMOUNT', lamount: 'LAMOUNT', name: 'NAME' };
  async function loadTransactions(el) {
    st.trSel.clear();
    try { st.trs = st.acc ? await api(`/api/customers/accounts/${st.acc}/transactions?sort=${st.trSort}`) : []; } catch (e) { st.trs = []; toast(errText(e), 'error'); }
    st.trCur = st.trs[0] ? st.trs[0].id : null; renderTransactions(el);
  }
  function renderTransactions(el) {
    el.querySelector('#tGrid').innerHTML = `<div class="tablewrap" style="max-height:26vh"><table class="grid acc-grid"><thead><tr><th style="width:24px"><input type="checkbox" id="tall"></th>${TCOLS.map(c => `<th ${TSORT[c[0]] ? `data-sort="${TSORT[c[0]]}" class="sortable"` : ''} style="${c[2] === 1 ? 'text-align:right' : ''}">${esc(t(c[1]))}${st.trSort === TSORT[c[0]] ? ' ▲' : ''}</th>`).join('')}</tr></thead><tbody>
      ${st.trs.map(r => `<tr data-id="${r.id}" class="${r.id === st.trCur ? 'sel' : ''}"><td><input type="checkbox" data-chk="${r.id}" ${st.trSel.has(r.id) ? 'checked' : ''}></td>${TCOLS.map(c => {
        if (c[2] === 3) { const s = STATUS[r.status] || ['', '', '']; return `<td><span class="badge ${s[1]}" title="${esc(s[2] ? t(s[2]) : '')}">${s[0]}</span></td>`; }
        return `<td style="${c[2] === 1 ? 'text-align:right;font-variant-numeric:tabular-nums' : ''}">${esc(c[2] === 1 ? money(r[c[0]]) : c[2] === 2 ? fmtDate(r[c[0]]) : r[c[0]])}</td>`; }).join('')}</tr>`).join('')
      || `<tr><td colspan="${TCOLS.length + 1}" class="muted">${esc(t('customers.no_transactions'))}</td></tr>`}</tbody></table></div>`;
    el.querySelectorAll('#tGrid th[data-sort]').forEach(th => th.onclick = () => { st.trSort = th.dataset.sort; loadTransactions(el); });
    el.querySelectorAll('#tGrid tr[data-id]').forEach(tr => tr.onclick = (e) => { if (e.target.dataset.chk) return; st.trCur = +tr.dataset.id; selRow(el, '#tGrid', st.trCur); });
    el.querySelectorAll('#tGrid [data-chk]').forEach(c => c.onchange = () => { c.checked ? st.trSel.add(+c.dataset.chk) : st.trSel.delete(+c.dataset.chk); });
    el.querySelector('#tall').onchange = (e) => { st.trs.forEach(r => e.target.checked ? st.trSel.add(r.id) : st.trSel.delete(r.id)); renderTransactions(el); };
  }
  const selectedTr = () => st.trSel.size ? st.trs.filter(r => st.trSel.has(r.id)).map(r => r.id) : (st.trCur ? [st.trCur] : []);

  async function stepCommit(el) {
    // ActionStepCommitExecute (customers_operation_impl.pas:1352)
    if (!st.trs.length) return info(t('customers.err_no_transactions'));
    const cur = st.trs.find(r => r.id === st.trCur);
    if (cur && cur.status === 2) return info(t('customers.err_already_committed'));
    if (!await ask(t('customers.confirm_commit'))) return;
    try {
      const r = await api('/api/customers/transactions/commit', { method: 'POST', body: { acc_id: st.acc, ids: selectedTr(), current_id: st.trCur } });
      if (r.errors === 1) await info(r.last_error);   // ErrorCount=1 -> raw message, else cs_CommitInformation
      else if (r.errors > 0) await info(t('customers.commit_info', { total: r.total, ok: r.committed, bad: r.errors }));
    } catch (e) { await info(errText(e)); }
    loadTransactions(el);
  }
  const ask4 = (msg) => new Promise(res => modal(`<div>${esc(msg)}</div><div class="actions">
      <button class="btn secondary" data-r="cancel">${esc(t('password.cancel'))}</button><button class="btn secondary" data-r="no">${esc(t('common.no'))}</button>
      <button class="btn secondary" data-r="all">${esc(t('customers.yes_to_all'))}</button><button class="btn" data-r="yes">${esc(t('common.yes'))}</button></div>`,
    (m, close) => m.querySelectorAll('[data-r]').forEach(b => b.onclick = () => { close(); res(b.dataset.r); })));
  async function deleteTr(el) {
    // N18Click (customers_operation_impl.pas:1611-1684): per row Yes/No/Cancel/YesToAll ('%d sayda ... ?' for the rest);
    // vid_OP.TrDelete=1 -> message & skip; errors swallowed only when more than one row is selected.
    const ids = selectedTr(); if (!ids.length) return;
    const multi = ids.length > 1; let wait = true;
    for (let i = 0; i < ids.length; i++) {
      if (wait) {
        const a = await ask4(t('customers.confirm_delete', { id: ids[i] }));
        if (a === 'no') continue;
        if (a === 'cancel') break;
        if (a === 'all') { if (await ask(t('customers.confirm_delete_n', { n: ids.length - i }))) wait = false; else continue; }
      }
      try {
        const r = await api('/api/customers/transactions/delete', { method: 'POST', body: { acc_id: st.acc, ids: [ids[i]], multi } });
        if (r.blocked.length) await info(t('customers.err_trdelete'));
      } catch (e) { await info(errText(e)); break; }
    }
    loadTransactions(el);
  }

  // ------------------------------------------------------------------ page
  function page(el) {
    el.innerHTML = `<div class="card" style="max-width:none">
      <div style="display:flex;align-items:center;gap:12px;flex-wrap:wrap"><h2 style="margin:0">${esc(t('customers.title'))}</h2><div style="flex:1"></div>
        <button class="btn" data-a="new">＋ ${esc(t('customers.new'))}</button>
        <button class="btn secondary" data-a="edit">${esc(t('customers.edit'))}</button>
        <button class="btn secondary" data-a="close">${esc(t('customers.close'))}</button>
        <button class="btn secondary" data-a="refresh">⟳ ${esc(t('accounts.refresh'))}</button></div>
      <div class="acc-toolbar cs-search">
        <label>${esc(t('customers.search'))}</label>
        <input id="EditID" placeholder="${esc(t('customers.col_id'))}" style="width:90px">
        <input id="EditINN" placeholder="${esc(t('customers.col_inn'))}" style="width:140px">
        <input id="EditName" placeholder="${esc(t('customers.col_name'))}" style="min-width:220px">
        <input id="DateEdit" type="date" title="${esc(t('customers.col_open'))}">
        <span class="sep"></span>
        <input id="SearchAcc" placeholder="${esc(t('customers.search_acc'))}" style="min-width:220px">
        <input id="SearchName" placeholder="${esc(t('customers.search_accname'))}" style="min-width:200px">
      </div>
      <div id="cGrid"><div class="spinner"></div></div>
      <div class="cs-sec"><h3>${esc(t('customers.accounts'))}</h3><div style="flex:1"></div>
        <button class="btn secondary small" data-a="newacc">＋ ${esc(t('customers.new_account'))}</button>
        <button class="btn secondary small" data-acc data-a="states">${esc(t('customers.acc_states'))}</button>
        <button class="btn secondary small" data-acc data-a="docs">${esc(t('customers.acc_docs'))}</button></div>
      <div id="aGrid"></div>
      <div class="cs-sec"><h3>${esc(t('customers.transactions'))}</h3><div style="flex:1"></div>
        <button class="btn secondary small" data-acc data-a="commit">✔ ${esc(t('customers.commit'))}</button>
        <button class="btn secondary small" data-acc data-a="trdel">✖ ${esc(t('customers.delete_tr'))}</button></div>
      <div id="tGrid"></div></div>`;
    const $ = (s) => el.querySelector(s);
    // ActionSpeedSearchExecute: Enter in EditID/EditINN/EditName -> SearchRecord from current, forward
    const speed = async (field, input) => {
      const text = input.value; if (text === '') return;
      const cur = st.rows.findIndex(r => r.id === st.sel) + 1;
      let r = await api(`/api/customers/locate?field=${field}&text=${encodeURIComponent(text)}&after=${cur}&sort=${st.sort}`);
      if (!r.rn) {
        if (!await ask(t('customers.search_end'))) return;
        r = await api(`/api/customers/locate?field=${field}&text=${encodeURIComponent(text)}&after=0&sort=${st.sort}`);
        if (!r.rn) return info(t('customers.not_found'));
      }
      await gotoRn(el, r.rn);
    };
    [['id', '#EditID'], ['inn', '#EditINN'], ['name', '#EditName']].forEach(([f, s]) => $(s).onkeydown = (e) => { if (e.key === 'Enter') { e.preventDefault(); speed(f, $(s)); } });
    $('#DateEdit').onchange = async () => { if (!$('#DateEdit').value) return; const r = await api(`/api/customers/locate-date?d=${$('#DateEdit').value}&sort=${st.sort}`); if (r.rn) gotoRn(el, r.rn); };
    // SearchAccKeyPress / SearchNameKeyUp: typing clears the other box; Enter searches
    $('#SearchAcc').oninput = () => { $('#SearchName').value = ''; };
    $('#SearchName').oninput = () => { $('#SearchAcc').value = ''; };
    $('#SearchAcc').onkeydown = async (e) => {
      if (e.key !== 'Enter') return; e.preventDefault();
      const r = await api(`/api/customers/search-account?acc_no=${encodeURIComponent($('#SearchAcc').value)}`);
      if (!r.customer_id) return info(t('customers.err_no_accounts'));
      await locateCustomerId(el, r.customer_id, r.acc_no);
    };
    $('#SearchName').onkeydown = async (e) => {
      if (e.key !== 'Enter') return; e.preventDefault();
      const r = await api(`/api/customers/search-account-name?name=${encodeURIComponent($('#SearchName').value)}`);
      if (r.customer_id) await locateCustomerId(el, r.customer_id, r.acc_no);
    };
    $('[data-a=new]').onclick = () => customerCard(el, null);
    $('[data-a=edit]').onclick = () => st.sel && customerCard(el, st.sel);
    $('[data-a=close]').onclick = () => closeCustomer(el);
    $('[data-a=refresh]').onclick = () => loadCustomers(el, st.rows.length);
    $('[data-a=newacc]').onclick = () => st.sel && newAccount(el);
    $('[data-a=states]').onclick = () => st.acc && statesDialog();
    $('[data-a=docs]').onclick = () => st.acc && docsDialog();
    $('[data-a=commit]').onclick = () => stepCommit(el);
    $('[data-a=trdel]').onclick = () => deleteTr(el);
    loadCustomers(el);
  }
  async function locateCustomerId(el, id, accNo) {
    let i = st.rows.findIndex(r => r.id === id);
    while (i < 0 && st.more) { await moreCustomers(el); i = st.rows.findIndex(r => r.id === id); }
    if (i >= 0) await selectCustomer(el, id, accNo);
  }

  async function closeCustomer(el) {
    // N20Click (customers_operation_impl.pas:1724)
    if (!st.sel) return;
    if (st.accs.length) return info(t('customers.err_has_accounts'));
    if (!await ask(t('customers.confirm_close'))) return;
    try { await api(`/api/customers/${st.sel}/close`, { method: 'POST' }); toast(t('customers.closed_ok')); loadCustomers(el); }
    catch (e) { info(errText(e)); }
  }

  // ------------------------------------------------------------------ customer card (UnitCustProps)
  async function customerCard(el, id) {
    let lk, c;
    try { lk = st.lk || (st.lk = await api('/api/customers/card-lookups')); c = id ? await api(`/api/customers/${id}`) : null; }
    catch (e) { return info(errText(e)); }
    // New: open_dat := SBOP.get_date; quality := 'Yüksək'. Edit: quality locked when set.
    const v = c || { open_dat: lk.system_date, nerezident: 0, quality_id: lk.default_quality_id };
    const R = lk.required, star = (f) => R[f] ? ' <b class="req">*</b>' : '';
    const fld = (f, html, req) => `<div class="field"><label>${esc(t('customers.f_' + f))}${req === undefined ? star(f) : req}</label>${html}</div>`;
    const inp = (f, extra = '') => fld(f, `<input name="${f}" value="${esc(v[f] ?? '')}" ${extra}>`);
    const date = (f) => fld(f, `<input type="date" name="${f}" value="${esc(v[f] ?? '')}">`);
    const sel = (f, list, key, label, extra = '') => fld(f, `<select name="${f}" ${extra}>${opt(list, key, label, v[f])}</select>`);
    const nm = (x) => x.name; const idn = (x) => `${x.id} – ${x.name}`;
    const root = document.getElementById('modal-root');
    root.innerHTML = `<div class="backdrop"><div class="modal wide" role="dialog"><h3>${esc(t(id ? 'customers.edit_title' : 'customers.new_title'))}${id ? ` · #${id}` : ''}</h3>
      <form id="cf" autocomplete="off"><div id="cerr"></div>
      <div class="tabs">${['main', 'reg', 'addr', 'risk'].map((k, i) => `<button type="button" class="${i ? '' : 'on'}" data-tab="${k}">${esc(t('customers.tab_' + k))}</button>`).join('')}</div>
      <div class="tabpane" data-pane="main"><div class="grid2">
        ${fld('name', `<input name="name" value="${esc(v.name ?? '')}">`)}${fld('short_name', `<input name="short_name" value="${esc(v.short_name ?? '')}">`, ' <b class="req">*</b>')}
        ${date('open_dat')}${fld('nerezident', `<label class="chip"><input type="checkbox" name="nerezident" ${v.nerezident == 1 ? 'checked' : ''}> ${esc(t('customers.nonresident'))}</label>`)}
        ${sel('prinad_kod', lk.relations, 'id', nm)}${sel('group_klie', lk.groups, 'id', nm)}
        ${sel('vid_sob', lk.estate_types, 'id', nm)}${sel('org_sob', lk.org_types, 'id', nm)}
        ${sel('sfera_dey', lk.action_areas, 'id', nm)}${sel('otrasl', lk.branches, 'id', nm)}
        ${sel('quality_id', lk.qualities, 'id', nm, id && v.quality_id != null ? 'disabled' : '')}
      </div></div>
      <div class="tabpane" data-pane="reg" hidden><div class="grid2">
        ${inp('inn')}${inp('incorporation_number')}${sel('nalog_kod', lk.tax_areas, 'id', nm)}${date('dat_nal')}${date('dat_ustav')}
        ${inp('bik')}${inp('kod_okpro')}${sel('incorporation_cntr', lk.incorp_countries, 'id', x => `${x.cntr_code || ''} – ${x.cntr_name}`)}${inp('incorporation_state')}
      </div></div>
      <div class="tabpane" data-pane="addr" hidden><div class="grid2">
        ${sel('address_type', lk.contact_types, 'symbol', x => x.description)}${sel('country_code', lk.countries, 'id', x => `${x.cntr_name} (${x.cntr_code || ''})`)}
        ${fld('city', `<select name="city"></select>`)}${inp('address')}
        ${sel('tph_contact_type', lk.contact_types, 'symbol', x => x.description)}${sel('tph_communication_type', lk.communication_types, 'symbol', x => x.description)}
        ${sel('tph_country_prefix', lk.phone_prefixes, 'phone_code', x => '+' + x.phone_code)}${inp('tph_number')}
        ${inp('tph_extension')}${inp('tph_zip')}${inp('tph_state')}${inp('email')}${inp('url')}
      </div></div>
      <div class="tabpane" data-pane="risk" hidden><div class="grid2">
        ${sel('risk_categ', lk.risk_categories, 'id', idn)}${fld('riskdescid', `<select name="riskdescid"></select>`)}${date('samelydate')}
      </div></div>
      <div class="actions"><button type="button" class="btn secondary" id="ccancel">${esc(t('password.cancel'))}</button><button class="btn" id="csave">${esc(t('accounts.save'))}</button></div></form></div></div>`;
    const m = root.querySelector('.modal'), fm = m.querySelector('#cf');
    m.querySelectorAll('[data-tab]').forEach(b => b.onclick = () => { m.querySelectorAll('[data-tab]').forEach(x => x.classList.toggle('on', x === b)); m.querySelectorAll('[data-pane]').forEach(p => p.hidden = p.dataset.pane !== b.dataset.tab); });
    // DSCityByConctType: cities where COUNTRY_ID = nvl(:CID,0), reopened on country change
    const loadCities = async (keep) => { const l = await api(`/api/customers/cities${fm.country_code.value ? '?country_id=' + fm.country_code.value : ''}`); fm.city.innerHTML = opt(l, 'id', x => x.city_name, keep ? v.city : ''); };
    const loadRisk = async (keep) => { const l = fm.risk_categ.value ? await api(`/api/customers/risk-descs?risk_id=${fm.risk_categ.value}`) : []; fm.riskdescid.innerHTML = opt(l, 'id', x => `${x.name} (${x.date_period})`, keep ? v.riskdescid : ''); };
    fm.country_code.onchange = () => loadCities(false); fm.risk_categ.onchange = () => loadRisk(false);
    loadCities(true); loadRisk(true);
    const close = () => { root.innerHTML = ''; };
    m.querySelector('#ccancel').onclick = close;
    m.onkeydown = (e) => { if (e.key === 'Escape') close(); };
    const body = () => {
      const d = new FormData(fm), o = {};
      ['name', 'short_name', 'inn', 'bik', 'kod_okpro', 'incorporation_number', 'tph_contact_type', 'tph_communication_type', 'tph_number', 'address_type', 'address', 'email', 'url', 'incorporation_state', 'tph_extension', 'tph_zip', 'tph_country_prefix', 'tph_state']
        .forEach(k => { const x = d.get(k); o[k] = x === null || x === '' ? null : x; });
      ['prinad_kod', 'group_klie', 'vid_sob', 'org_sob', 'sfera_dey', 'otrasl', 'nalog_kod', 'city', 'country_code', 'incorporation_cntr', 'risk_categ', 'riskdescid'].forEach(k => { const x = d.get(k); o[k] = x ? +x : null; });
      ['open_dat', 'dat_nal', 'dat_ustav', 'samelydate'].forEach(k => { o[k] = d.get(k) || null; });
      o.quality_id = fm.quality_id.disabled ? v.quality_id : (d.get('quality_id') ? +d.get('quality_id') : null);
      o.nerezident = d.has('nerezident') ? 1 : 0; return o;
    };
    const save = async (extra = {}) => {
      m.querySelector('#cerr').innerHTML = '';
      let r;
      try { r = await api(id ? `/api/customers/${id}` : '/api/customers', { method: id ? 'PUT' : 'POST', body: { ...body(), ...extra } }); }
      catch (e) {
        m.querySelector('#cerr').innerHTML = errHtml(e);
        if (e.field) { const f = fm.elements[e.field]; if (f) { const p = f.closest('[data-pane]'); m.querySelector(`[data-tab="${p.dataset.pane}"]`).click(); f.focus(); } }
        return;
      }
      if (r.status === 'pep_check') return pepDialog(r.name);
      if (r.status === 'blacklist') {
        // ShowRedMessage: 'DIQQƏT! Bu müştəri qara siyahıdadır! ...' Bəli -> 'Davam edilir...', Xeyr -> 'Əməliyyat dayandırıldı.'
        if (await ask(t('customers.blacklist_warn'), { danger: true })) { toast(t('customers.blacklist_continue')); return save({ blacklist_confirmed: true }); }
        return info(t('customers.blacklist_stopped'));
      }
      close(); toast(t('customers.saved')); loadCustomers(el, st.rows.length);
    };
    fm.onsubmit = (e) => { e.preventDefault(); save(); };
  }

  function pepDialog(name) {
    // Pep_changeUnit: label = name; 'Yoxla' (HTTP check commented out in Delphi -> no-op); 'bağla' sets pep_chek := -1
    modal(`<h3>${esc(t('customers.pep_title'))}</h3><div class="field"><label>${esc(t('customers.pep_name'))}</label><input value="${esc(name)}" readonly class="ro"></div>
      <p class="muted">${esc(t('customers.pep_hint'))}</p><textarea readonly class="ro" rows="4" style="width:100%"></textarea>
      <div class="actions"><button class="btn secondary" id="pchk">${esc(t('customers.pep_check'))}</button><button class="btn" id="pclose">${esc(t('customers.pep_close'))}</button></div>`,
    (m, close) => {
      m.querySelector('#pchk').onclick = () => {};
      m.querySelector('#pclose').onclick = async () => { await api('/api/customers/pep/close', { method: 'POST' }); close(); toast(t('customers.pep_closed')); };
    });
  }

  // ------------------------------------------------------------------ new account (FormAcc_Unit)
  async function newAccount(el) {
    let f; try { f = await api(`/api/customers/${st.sel}/new-account`); } catch (e) { return info(errText(e)); }
    const d = f.defaults, L = f.lists;
    modal(`<h3>${esc(t('customers.new_account'))}</h3><form id="naf" autocomplete="off"><div id="naerr"></div><div class="grid2">
      <div class="field"><label>${esc(t('customers.na_currency'))} *</label><select name="currency">${opt(L.currencies.filter(x => x.valute !== -1), 'valute', x => `${x.valute} – ${x.valu_name}`, d.currency)}</select></div>
      <div class="field"><label>${esc(t('customers.na_bal'))} *</label><select name="bal_cn">${opt(L.balances.filter(x => x.bal_cn !== '-1'), 'bal_cn', x => `${x.bal_cn} – ${x.balname}`, d.bal_cn)}</select></div>
      ${f.bal2_visible ? `<div class="field"><label>${esc(t('customers.na_bal2'))} *</label><select name="bal_cn2">${opt(L.balances2.filter(x => x.bal_cn !== '-1'), 'bal_cn', x => `${x.bal_cn} – ${x.balname}`, d.bal_cn2)}</select></div>` : ''}
      <div class="field"><label>${esc(t('customers.na_customer'))} *</label><input name="customer_id" value="${esc(d.customer_id)}"></div>
      <div class="field"><label>${esc(t('customers.na_branch'))} *</label><select name="branch">${opt(L.branches, 'id', x => `${x.id} – ${x.name}`, d.branch)}</select></div>
      <div class="field"><label>${esc(t('customers.na_symbol'))} *</label><select name="report_symbol">${opt(L.report_symbols, 'id', x => `${x.id} – ${x.name}`, d.report_symbol)}</select></div>
      <div class="field"><label>${esc(t('customers.na_date'))}</label><input type="date" name="open_date" value="${esc(d.open_date)}"></div>
      <div class="field"><label>${esc(t('customers.na_limit'))}</label><input name="limit" value="${esc(d.limit)}"></div>
      <div class="field" style="grid-column:1/-1"><label>${esc(t('customers.na_name'))}</label><input name="acc_name" value="${esc(d.acc_name)}"></div>
      <div class="field"><label>${esc(t('customers.na_note'))}</label><input name="note_code"></div>
      <div class="field"><label>${esc(t('customers.na_accno'))} *</label><div style="display:flex;gap:6px"><input name="acc_no" value="" style="flex:1"><button type="button" class="btn secondary small" id="gen">${esc(t('customers.na_generate'))}</button></div></div>
      <div class="field" style="grid-column:1/-1"><label>${esc(t('customers.na_flags'))}</label><div class="flags">${L.flags.map(x => `<label class="chip"><input type="checkbox" name="flag" value="${esc(x.name)}"> ${esc(x.name)}</label>`).join('')}</div></div>
      </div><div class="actions"><button type="button" class="btn secondary" id="nac">${esc(t('password.cancel'))}</button><button class="btn" id="nas">${esc(t('customers.na_open'))}</button></div></form>`,
    (m, close) => {
      m.classList.add('wide');
      const fm = m.querySelector('#naf');
      const body = () => { const x = new FormData(fm), o = {}; ['currency', 'bal_cn', 'bal_cn2', 'customer_id', 'branch', 'report_symbol', 'open_date', 'limit', 'acc_name', 'note_code', 'acc_no'].forEach(k => o[k] = x.get(k)); o.flags = x.getAll('flag'); return o; };
      const fail = (e) => { m.querySelector('#naerr').innerHTML = errHtml(e); };
      m.querySelector('#nac').onclick = close;
      m.querySelector('#gen').onclick = async () => { try { fm.acc_no.value = (await api('/api/customers/new-account/generate', { method: 'POST', body: body() })).acc_no || ''; } catch (e) { fail(e); } };
      fm.onsubmit = async (e) => { e.preventDefault(); try { await api('/api/customers/new-account', { method: 'POST', body: body() }); close(); toast(t('customers.acc_opened')); selectCustomer(el, st.sel); } catch (er) { fail(er); } };
    });
  }

  async function statesDialog() {
    const a = st.accs.find(x => x.id === st.acc);
    let rows; try { rows = await api(`/api/customers/accounts/${st.acc}/states`); } catch (e) { return info(errText(e)); }
    const cols = [['archivedate', 'accounts.s_date', 2], ['amount', 'accounts.col_amount', 1], ['lamount', 'accounts.col_lamount', 1], ['debitturnover', 'accounts.s_dt', 1], ['debitlturnover', 'accounts.s_dtl', 1], ['creditturnover', 'accounts.s_ct', 1], ['creditlturnover', 'accounts.s_ctl', 1]];
    modal(`<h3>${esc(t('customers.acc_states'))} · ${esc(a ? a.accno : '')}</h3><div class="tablewrap" style="max-height:55vh"><table class="grid"><thead><tr>${cols.map(c => `<th style="${c[2] === 1 ? 'text-align:right' : ''}">${esc(t(c[1]))}</th>`).join('')}</tr></thead><tbody>
      ${rows.map(x => `<tr>${cols.map(c => `<td style="${c[2] === 1 ? 'text-align:right' : ''}">${esc(c[2] === 1 ? money(x[c[0]]) : fmtDate(x[c[0]]))}</td>`).join('')}</tr>`).join('')}</tbody></table></div>
      <div class="actions"><button class="btn" id="sok">${esc(t('common.close'))}</button></div>`, (m, close) => { m.classList.add('wide'); m.querySelector('#sok').onclick = close; });
  }

  async function docsDialog(start, end, tab = 'debit') {
    const a = st.accs.find(x => x.id === st.acc); if (!a) return;
    let r; try { r = await api(`/api/customers/accounts/${st.acc}/documents?acc_no=${encodeURIComponent(a.accno)}${start ? `&start=${start}&end=${end || start}` : ''}`); } catch (e) { return info(errText(e)); }
    const rows = tab === 'debit' ? r.debit : r.credit;
    const cols = [['operationdate', 'accounts.t_date', 2], ['debitaccno', 'accounts.t_debit'], ['creditaccno', 'accounts.t_credit'], [tab === 'debit' ? 'debitamount' : 'creditamount', 'accounts.t_amount', 1], ['lamount', 'accounts.t_lamount', 1], ['destination', 'accounts.t_dest']];
    const root = document.getElementById('modal-root');
    root.innerHTML = `<div class="backdrop"><div class="modal wide"><h3>${esc(t('customers.acc_docs'))} · ${esc(r.accno)}</h3>
      <div class="filters"><div class="field"><label>${esc(t('history.from'))}</label><input type="date" id="ds" value="${r.start}"></div><div class="field"><label>${esc(t('history.to'))}</label><input type="date" id="de" value="${r.end}"></div></div>
      <div class="tabs"><button class="${tab === 'debit' ? 'on' : ''}" data-tab="debit">${esc(t('accounts.tab_debit'))} (${r.debit.length})</button><button class="${tab === 'credit' ? 'on' : ''}" data-tab="credit">${esc(t('accounts.tab_credit'))} (${r.credit.length})</button></div>
      <div class="tablewrap" style="max-height:45vh"><table class="grid"><thead><tr>${cols.map(c => `<th style="${c[2] === 1 ? 'text-align:right' : ''}">${esc(t(c[1]))}</th>`).join('')}</tr></thead>
      <tbody>${rows.map(x => `<tr>${cols.map(c => `<td style="${c[2] === 1 ? 'text-align:right' : ''}">${esc(c[2] === 1 ? money(x[c[0]]) : c[2] === 2 ? fmtDate(x[c[0]]) : x[c[0]])}</td>`).join('')}</tr>`).join('')}</tbody></table></div>
      <div class="totals"><span>${esc(t('accounts.total'))}: <b>${money(tab === 'debit' ? r.debit_total : r.credit_total)}</b></span><span>${esc(t('accounts.total_l'))}: <b>${money(tab === 'debit' ? r.debit_ltotal : r.credit_ltotal)}</b></span></div>
      <div class="actions"><button class="btn" id="dok">${esc(t('common.close'))}</button></div></div></div>`;
    const ds = root.querySelector('#ds'), de = root.querySelector('#de');
    ds.onchange = de.onchange = () => docsDialog(ds.value, de.value, tab);
    root.querySelectorAll('[data-tab]').forEach(b => b.onclick = () => docsDialog(ds.value, de.value, b.dataset.tab));
    root.querySelector('#dok').onclick = () => root.innerHTML = '';
  }

  window.SB.pages['/m/customer-operations'] = async (el) => { page(el); };
})();

/* ==============================================================================================
 * Packages/Customers (Customers.ocx, /m/customers), Packages/P_Customers (/m/p-customers),
 * Packages/CustomersInformations (/m/customers-informations)
 * ============================================================================================== */
(function(){
  const {api, el, fmtNum, fmtDate, toast, showErr, esc} = window.SB;

  function renderCustomersOcx(host, isPCustomers){
    const st = {
      init: {filials:[], currencies:[], prinad:[], qrp_klie:[], vid_sob:[], org_prav:[], sferadey:[], otrasli:[], nalog:[], countries:[]},
      rows: [], sel: null,
      accs: [], selAcc: null,
      sort: 'ID', accSort: 'AccNo',
      filial: '', custType: '', currencyId: '',
      qId: '', qInn: '', qName: '', qDate: '',
      qAccNo: '', qAccName: '',
    };

    host.innerHTML = `
      <div class="sb-mod" id="custOcxMod">
        <div class="sb-tb">
          <span class="sb-tb-title">${isPCustomers ? 'Fiziki / Hüquqi Müştərilər (P_Customers)' : 'Bankın müştəriləri (Customers.ocx)'}</span>
          <button class="sb-btn" id="coNew">+ Yeni müştəri (Ins)</button>
          <button class="sb-btn" id="coEdit">Redaktə (F4)</button>
          <button class="sb-btn" id="coInfo">Müştəri haqqında məlumat (CustInfo)</button>
          <button class="sb-btn" id="coClose">Müştərini bağla (Del)</button>
          <button class="sb-btn" id="coSettings">Soraqçalar (Settings)</button>
          <span class="sb-sp"></span>
          <label>Filial: <select id="coFilial" class="sb-sel" style="width:130px"><option value="">Hamısı</option></select></label>
          <label>Tip: <select id="coType" class="sb-sel" style="width:110px">
            <option value="">Hamısı</option>
            <option value="0">0 - hüquqi</option>
            <option value="1">1 - fiziki</option>
            <option value="2">2 - f.s.</option>
          </select></label>
          <label>Sıralama: <select id="coSort" class="sb-sel" style="width:120px">
            <option value="ID">Kodu (ID)</option>
            <option value="INN">VÖEN (INN)</option>
            <option value="NAME">Adı (NAME)</option>
            <option value="OPEN_DAT">Açılma tarixi</option>
            <option value="CUST_TYPE">Müştəri tipi</option>
          </select></label>
          <button class="sb-btn" id="coRefresh">Yenilə</button>
        </div>

        <div class="sb-bar" style="display:flex;gap:8px;align-items:center;flex-wrap:wrap;padding:6px 10px;background:#f5f7fa;border-bottom:1px solid #d8dee9">
          <b>Axtarış (Müştəri):</b>
          <input class="sb-inp" id="coQId" placeholder="Kodu (ID)..." style="width:90px">
          <input class="sb-inp" id="coQInn" placeholder="VÖEN (INN)..." style="width:120px">
          <input class="sb-inp" id="coQName" placeholder="Müştəri adı..." style="width:200px">
          <input class="sb-inp" id="coQDate" type="date" style="width:135px" title="Qeydiyyat tarixi">
          <button class="sb-btn" id="coClearQ">Təmizlə</button>
          <span class="sb-sp"></span>
          <span id="coCount" style="font-weight:600;color:#2b4c7e">0 müştəri</span>
        </div>

        <div class="sb-grid-wrap" style="height:44%;overflow:auto;border-bottom:2px solid #cbd5e1">
          <table class="sb-grid" id="coCustGrid">
            <thead>
              <tr>
                <th style="width:80px">Kodu (ID)</th>
                <th style="width:120px">VÖEN (INN)</th>
                <th>Müştərinin adı (NAME)</th>
                <th style="width:180px">Qısa adı (SHORT_NAME)</th>
                <th style="width:105px">Qeydiyyat tarixi</th>
                <th style="width:80px">Tipi</th>
                <th style="width:75px">Filial</th>
                <th style="width:85px">Qeyri-rez.</th>
              </tr>
            </thead>
            <tbody id="coCustBody"></tbody>
          </table>
        </div>

        <div class="sb-bar" style="display:flex;gap:8px;align-items:center;flex-wrap:wrap;padding:6px 10px;background:#eef2f7;border-bottom:1px solid #d8dee9">
          <b>Müştərinin hesabları (Account UNION ALL Out_Account):</b>
          <label>Valyuta: <select id="coAccCurr" class="sb-sel" style="width:110px"><option value="">Hamısı</option></select></label>
          <label>Sıralama: <select id="coAccSort" class="sb-sel" style="width:125px">
            <option value="AccNo">Hesab №</option>
            <option value="AccName">Hesab adı</option>
            <option value="CurrencyID">Valyuta</option>
            <option value="Balance">Qalıq</option>
            <option value="LBalance">Manat qalığı</option>
            <option value="OpenDate">Açılma tarixi</option>
          </select></label>
          <input class="sb-inp" id="coQAccNo" placeholder="Hesab № axtar..." style="width:160px">
          <input class="sb-inp" id="coQAccName" placeholder="Hesab adı axtar..." style="width:180px">
          <span class="sb-sp"></span>
          <span id="coAccCount" style="font-weight:600;color:#2b4c7e">0 hesab</span>
        </div>

        <div class="sb-grid-wrap" style="height:36%;overflow:auto">
          <table class="sb-grid" id="coAccGrid">
            <thead>
              <tr>
                <th style="width:190px">Hesab № (ACCNO)</th>
                <th>Hesabın adı (ACCNAME)</th>
                <th style="width:80px">Valyuta</th>
                <th style="width:120px" class="num">Qalıq (BALANCE)</th>
                <th style="width:120px" class="num">Milli val. qalığı</th>
                <th style="width:105px">Açılma tarixi</th>
                <th style="width:90px">Balans növü</th>
              </tr>
            </thead>
            <tbody id="coAccBody"></tbody>
          </table>
        </div>
        <div id="coModalHost"></div>
      </div>
    `;

    const $ = sel => host.querySelector(sel);

    async function loadInit(){
      try {
        st.init = await api('/api/customers/ocx/init');
        const fSel = $('#coFilial');
        fSel.innerHTML = `<option value="">Hamısı</option>` + (st.init.filials||[]).map(f => `<option value="${f.id}">${f.id} - ${esc(f.name||'')}</option>`).join('');
        const cSel = $('#coAccCurr');
        cSel.innerHTML = `<option value="">Hamısı</option>` + (st.init.currencies||[]).map(c => `<option value="${c.valute}">${esc(c.val_name)} (${esc(c.valu_name||'')})</option>`).join('');
      } catch(e){ showErr(e); }
    }

    async function loadCustomers(keepId){
      try {
        const p = new URLSearchParams({sort: st.sort});
        if (st.filial) p.set('filial', st.filial);
        if (st.custType !== '') p.set('cust_type', st.custType);
        if (st.qId) p.set('q_id', st.qId);
        if (st.qInn) p.set('q_inn', st.qInn);
        if (st.qName) p.set('q_name', st.qName);
        if (st.qDate) p.set('q_date', st.qDate);
        const res = await api('/api/customers/ocx/list?' + p.toString());
        st.rows = res.rows || [];
        $('#coCount').textContent = `${st.rows.length} müştəri`;
        const targetId = keepId || (st.sel && st.sel.id);
        st.sel = st.rows.find(r => r.id === targetId) || st.rows[0] || null;
        renderCustRows();
        await loadAccounts();
      } catch(e){ showErr(e); }
    }

    function renderCustRows(){
      const tb = $('#coCustBody');
      if (!st.rows.length){
        tb.innerHTML = `<tr><td colspan="8" style="text-align:center;padding:16px;color:#666">Məlumat tapılmadı</td></tr>`;
        return;
      }
      tb.innerHTML = st.rows.map(r => `
        <tr data-id="${r.id}" class="${st.sel && st.sel.id === r.id ? 'sel' : ''}">
          <td>${r.id}</td>
          <td>${esc(r.inn||'')}</td>
          <td><b>${esc(r.name||'')}</b></td>
          <td>${esc(r.short_name||'')}</td>
          <td>${fmtDate(r.open_dat)}</td>
          <td><span class="sb-badge">${esc(r.tip||'huquqi')}</span></td>
          <td>${r.filial||101}</td>
          <td>${r.nerezident ? 'Qeyri-rez.' : 'Rezident'}</td>
        </tr>
      `).join('');
      tb.querySelectorAll('tr[data-id]').forEach(tr => {
        tr.onclick = () => {
          const id = Number(tr.dataset.id);
          st.sel = st.rows.find(x => x.id === id) || null;
          renderCustRows();
          loadAccounts();
        };
        tr.ondblclick = () => openCustPropsModal(st.sel);
      });
    }

    async function loadAccounts(){
      if (!st.sel){
        st.accs = [];
        $('#coAccBody').innerHTML = '';
        $('#coAccCount').textContent = '0 hesab';
        return;
      }
      try {
        const p = new URLSearchParams({sort: st.accSort});
        if (st.currencyId !== '') p.set('currency_id', st.currencyId);
        if (st.qAccNo) p.set('q_accno', st.qAccNo);
        if (st.qAccName) p.set('q_accname', st.qAccName);
        st.accs = await api(`/api/customers/ocx/${st.sel.id}/accounts?` + p.toString());
        $('#coAccCount').textContent = `${st.accs.length} hesab`;
        const tb = $('#coAccBody');
        if (!st.accs.length){
          tb.innerHTML = `<tr><td colspan="7" style="text-align:center;padding:12px;color:#666">Hesab yoxdur</td></tr>`;
          return;
        }
        tb.innerHTML = st.accs.map(a => `
          <tr data-id="${a.id}">
            <td><code>${esc(a.accno||'')}</code></td>
            <td>${esc(a.accname||'')}</td>
            <td>${esc(a.currencysname||'')}</td>
            <td class="num">${fmtNum(a.balance)}</td>
            <td class="num">${fmtNum(a.lbalance)}</td>
            <td>${fmtDate(a.opendate)}</td>
            <td>${a.isoutbalance ? 'Balansdankənar' : 'Balans'}</td>
          </tr>
        `).join('');
      } catch(e){ showErr(e); }
    }

    function openCustPropsModal(cust){
      const isEdit = !!cust;
      const c = cust || {
        open_dat: st.init.system_date || '2026-10-25',
        name: '', short_name: '', nerezident: 0,
        prinad_kod: (st.init.prinad[0]||{}).id || 1,
        group_klie: (st.init.qrp_klie[0]||{}).id || 1,
        vid_sob: (st.init.vid_sob[0]||{}).id || 1,
        org_sob: (st.init.org_prav[0]||{}).id || 1,
        sfera_dey: (st.init.sferadey[0]||{}).id || 1,
        otrasl: (st.init.otrasli[0]||{}).id || 1,
        nalog_kod: (st.init.nalog[0]||{}).id || 1,
        kod_okpro: '', inn: '', dat_nal: st.init.system_date || '2026-10-25',
        dat_ustav: st.init.system_date || '2026-10-25', bik: '', cust_type: 0, filial: 101
      };
      const opts = (arr, val) => (arr||[]).map(x => `<option value="${x.id}" ${Number(x.id)===Number(val)?'selected':''}>${esc(x.name||x.id)}</option>`).join('');
      const mh = $('#coModalHost');
      mh.innerHTML = `
        <div class="sb-modal-bg">
          <div class="sb-modal" style="width:720px;max-width:95vw">
            <div class="sb-modal-hd">
              <span>${isEdit ? `Müştəri redaktəsi — ID ${c.id}` : 'Yeni müştəri (CustomerPropertiesForm)'}</span>
              <button class="sb-btn" id="cpClose">✕</button>
            </div>
            <div class="sb-modal-bd" style="display:grid;grid-template-columns:1fr 1fr;gap:10px;padding:14px">
              <label>Müştəri tipi (CUST_TYPE):
                <select class="sb-sel" id="cpType">
                  <option value="0" ${Number(c.cust_type)===0?'selected':''}>0 - Hüquqi şəxs</option>
                  <option value="1" ${Number(c.cust_type)===1?'selected':''}>1 - Fiziki şəxs</option>
                  <option value="2" ${Number(c.cust_type)===2?'selected':''}>2 - Fərdi sahibkar (f.s.)</option>
                </select>
              </label>
              <label>Qeydiyyat tarixi (OPEN_DAT):
                <input type="date" class="sb-inp" id="cpOpenDat" value="${String(c.open_dat||'').slice(0,10)}">
              </label>
              <label style="grid-column:span 2">Tam adı (NAME) *:
                <input class="sb-inp" id="cpName" value="${esc(c.name||'')}" style="width:100%">
              </label>
              <label>Qısa adı (SHORT_NAME) *:
                <input class="sb-inp" id="cpShort" value="${esc(c.short_name||'')}" style="width:100%">
              </label>
              <label>Filial (FILIAL):
                <select class="sb-sel" id="cpFilial">${opts(st.init.filials, c.filial||101)}</select>
              </label>
              <label>VÖEN (INN):
                <input class="sb-inp" id="cpInn" value="${esc(c.inn||'')}">
              </label>
              <label>OKPO kodu (KOD_OKPRO):
                <input class="sb-inp" id="cpOkpo" value="${esc(c.kod_okpro||'')}">
              </label>
              <label>Mənsubiyyət (PRINAD_KOD):
                <select class="sb-sel" id="cpPrinad">${opts(st.init.prinad, c.prinad_kod)}</select>
              </label>
              <label>Müştəri qrupu (GROUP_KLIE):
                <select class="sb-sel" id="cpGroup">${opts(st.init.qrp_klie, c.group_klie)}</select>
              </label>
              <label>Mülkiyyət növü (VID_SOB):
                <select class="sb-sel" id="cpVidSob">${opts(st.init.vid_sob, c.vid_sob)}</select>
              </label>
              <label>Təşkilati-hüquqi forma (ORG_SOB):
                <select class="sb-sel" id="cpOrgSob">${opts(st.init.org_prav, c.org_sob)}</select>
              </label>
              <label>Fəaliyyət sahəsi (SFERA_DEY):
                <select class="sb-sel" id="cpSfera">${opts(st.init.sferadey, c.sfera_dey)}</select>
              </label>
              <label>Sahə / Sektor (OTRASL):
                <select class="sb-sel" id="cpOtrasl">${opts(st.init.otrasli, c.otrasl)}</select>
              </label>
              <label>Vergi orqanı (NALOG_KOD):
                <select class="sb-sel" id="cpNalog">${opts(st.init.nalog, c.nalog_kod)}</select>
              </label>
              <label>BİK (BIK):
                <input class="sb-inp" id="cpBik" value="${esc(c.bik||'')}">
              </label>
              <label>Vergi qeydiyyatı tarixi (DAT_NAL):
                <input type="date" class="sb-inp" id="cpDatNal" value="${String(c.dat_nal||c.open_dat||'').slice(0,10)}">
              </label>
              <label>Nizamnamə tarixi (DAT_USTAV):
                <input type="date" class="sb-inp" id="cpDatUstav" value="${String(c.dat_ustav||c.open_dat||'').slice(0,10)}">
              </label>
              <label style="display:flex;align-items:center;gap:6px">
                <input type="checkbox" id="cpNerez" ${c.nerezident ? 'checked' : ''}> Qeyri-rezident (NEREZIDENT)
              </label>
            </div>
            <div class="sb-modal-ft">
              <button class="sb-btn primary" id="cpSave">Yadda saxla (Sb_${isEdit?'Edit':'Add'}Customer)</button>
              <button class="sb-btn" id="cpCancel">İmtina</button>
            </div>
          </div>
        </div>
      `;
      $('#cpClose').onclick = $('#cpCancel').onclick = () => { mh.innerHTML = ''; };
      $('#cpSave').onclick = async () => {
        try {
          const payload = {
            cust_type: Number($('#cpType').value),
            open_dat: $('#cpOpenDat').value || null,
            name: $('#cpName').value,
            short_name: $('#cpShort').value,
            filial: Number($('#cpFilial').value || 101),
            inn: $('#cpInn').value || null,
            kod_okpro: $('#cpOkpo').value || null,
            prinad_kod: Number($('#cpPrinad').value || 1),
            group_klie: Number($('#cpGroup').value || 1),
            vid_sob: Number($('#cpVidSob').value || 1),
            org_sob: Number($('#cpOrgSob').value || 1),
            sfera_dey: Number($('#cpSfera').value || 1),
            otrasl: Number($('#cpOtrasl').value || 1),
            nalog_kod: Number($('#cpNalog').value || 1),
            bik: $('#cpBik').value || null,
            dat_nal: $('#cpDatNal').value || null,
            dat_ustav: $('#cpDatUstav').value || null,
            nerezident: $('#cpNerez').checked ? 1 : 0,
          };
          const res = await api(isEdit ? `/api/customers/ocx/customers/${c.id}` : '/api/customers/ocx/customers', {
            method: isEdit ? 'PUT' : 'POST',
            body: JSON.stringify(payload)
          });
          mh.innerHTML = '';
          toast('Müştəri məlumatları yadda saxlanıldı');
          await loadCustomers(res.id);
        } catch(e){ showErr(e); }
      };
    }

    async function openCustInfoModal(cust){
      if (!cust) return toast('Müştəri seçilməyib');
      try {
        const data = await api(`/api/customers/ocx/customers/${cust.id}/info`);
        let cards = data.cards || [];
        let ipMap = data.ip_info || {};
        let curIdx = 0;

        const mh = $('#coModalHost');
        function renderCard(){
          const card = cards[curIdx] || {
            card_no: cards.length ? Math.max(...cards.map(x=>x.card_no))+1 : 0,
            pasp_type: 'Şəxsiyyət vəsiqəsi', pasport: '', kem_vidan: '', pasp_date: '2020-01-01',
            dog_yer: 'Bakı', dog_tar: '1985-01-01', cins: 'Kişi', milliyet: 'Azərbaycanlı',
            grajdan: 'Azərbaycan', work_place: cust.name, doljnost: '', partner: '', father: '',
            adress: '', strana: 'Azərbaycan', tel: '', tel_mob: '', faks: '', e_mail: ''
          };
          const ip = ipMap[String(card.card_no)] || {familystatus:1, education:1, place1:1, work1:1, work2:1, verify:1, familymembers:3, monthlyincome:2000, monthlyexpense:800};
          mh.innerHTML = `
            <div class="sb-modal-bg">
              <div class="sb-modal" style="width:780px;max-width:96vw">
                <div class="sb-modal-hd">
                  <span>Müştəri haqqında məlumat (CustomerInfoForm) — ${esc(cust.name)} [Kart №${card.card_no}]</span>
                  <button class="sb-btn" id="ciClose">✕</button>
                </div>
                <div class="sb-modal-bd" style="padding:12px">
                  <div style="display:flex;gap:8px;align-items:center;margin-bottom:10px">
                    <label>Kart seçimi:
                      <select id="ciCardSel" class="sb-sel">
                        ${cards.map((c,i) => `<option value="${i}" ${i===curIdx?'selected':''}>Kart №${c.card_no} (${esc(c.pasport||'yeni')})</option>`).join('')}
                      </select>
                    </label>
                    <button class="sb-btn" id="ciAddCard">+ Yeni kart əlavə et</button>
                    <button class="sb-btn" id="ciDelCard">Kartı sil (del_custinfo)</button>
                  </div>
                  <div style="display:grid;grid-template-columns:1fr 1fr 1fr;gap:8px">
                    <label>Sənədin növü (PASP_TYPE): <input class="sb-inp" id="ciPaspType" value="${esc(card.pasp_type||'')}"></label>
                    <label>Seriya və № (PASPORT): <input class="sb-inp" id="ciPasport" value="${esc(card.pasport||'')}"></label>
                    <label>Verilmə tarixi (PASP_DATE): <input type="date" class="sb-inp" id="ciPaspDate" value="${String(card.pasp_date||'').slice(0,10)}"></label>
                    <label>Kim tərəfindən verilib (KEM_VIDAN): <input class="sb-inp" id="ciKemVidan" value="${esc(card.kem_vidan||'')}"></label>
                    <label>Doğum yeri (DOG_YER): <input class="sb-inp" id="ciDogYer" value="${esc(card.dog_yer||'')}"></label>
                    <label>Doğum tarixi (DOG_TAR): <input type="date" class="sb-inp" id="ciDogTar" value="${String(card.dog_tar||'').slice(0,10)}"></label>
                    <label>Cinsi (CINS):
                      <select class="sb-sel" id="ciCins">
                        <option value="Kişi" ${card.cins==='Kişi'?'selected':''}>Kişi</option>
                        <option value="Qadın" ${card.cins==='Qadın'?'selected':''}>Qadın</option>
                      </select>
                    </label>
                    <label>Milliyyəti (MILLIYET): <input class="sb-inp" id="ciMilliyet" value="${esc(card.milliyet||'')}"></label>
                    <label>Vətəndaşlığı (GRAJDAN): <input class="sb-inp" id="ciGrajdan" value="${esc(card.grajdan||'')}"></label>
                    <label>İş yeri (WORK_PLACE): <input class="sb-inp" id="ciWork" value="${esc(card.work_place||'')}"></label>
                    <label>Vəzifəsi (DOLJNOST): <input class="sb-inp" id="ciDoljnost" value="${esc(card.doljnost||'')}"></label>
                    <label>Ata adı (FATHER): <input class="sb-inp" id="ciFather" value="${esc(card.father||'')}"></label>
                    <label>Həyat yoldaşı (PARTNER): <input class="sb-inp" id="ciPartner" value="${esc(card.partner||'')}"></label>
                    <label>Ölkə (STRANA): <input class="sb-inp" id="ciStrana" value="${esc(card.strana||'')}"></label>
                    <label>Ünvan (ADRESS): <input class="sb-inp" id="ciAdress" value="${esc(card.adress||'')}"></label>
                    <label>Telefon (TEL): <input class="sb-inp" id="ciTel" value="${esc(card.tel||'')}"></label>
                    <label>Mobil (TEL_MOB): <input class="sb-inp" id="ciTelMob" value="${esc(card.tel_mob||'')}"></label>
                    <label>E-mail (E_MAIL): <input class="sb-inp" id="ciEmail" value="${esc(card.e_mail||'')}"></label>
                  </div>
                  <fieldset style="margin-top:10px;border:1px solid #cbd5e1;padding:8px;border-radius:4px">
                    <legend style="font-weight:600;padding:0 6px">İpoteka əlavə məlumatları (frmIPINFO / CUSTIPINFO)</legend>
                    <div style="display:grid;grid-template-columns:1fr 1fr 1fr;gap:8px">
                      <label>Ailə üzvləri sayı: <input type="number" class="sb-inp" id="ciFamMem" value="${ip.familymembers||1}"></label>
                      <label>Aylıq gəlir (MONTHLYINCOME): <input type="number" step="0.01" class="sb-inp" id="ciIncome" value="${ip.monthlyincome||0}"></label>
                      <label>Aylıq xərc (MONTHLYEXPENSE): <input type="number" step="0.01" class="sb-inp" id="ciExpense" value="${ip.monthlyexpense||0}"></label>
                    </div>
                  </fieldset>
                </div>
                <div class="sb-modal-ft">
                  <button class="sb-btn primary" id="ciSave">Yadda saxla (sb_custInfo.upd_custinfo)</button>
                  <button class="sb-btn" id="ciCancel">Bağla</button>
                </div>
              </div>
            </div>
          `;
          $('#ciClose').onclick = $('#ciCancel').onclick = () => { mh.innerHTML = ''; };
          const selEl = $('#ciCardSel');
          if (selEl) selEl.onchange = () => { curIdx = Number(selEl.value); renderCard(); };
          $('#ciAddCard').onclick = () => {
            const nextNo = cards.length ? Math.max(...cards.map(x=>x.card_no)) + 1 : 0;
            cards.push({card_no: nextNo, pasp_type: 'Şəxsiyyət vəsiqəsi', cins: 'Kişi', strana: 'Azərbaycan'});
            curIdx = cards.length - 1;
            renderCard();
          };
          $('#ciDelCard').onclick = async () => {
            try {
              const res = await api(`/api/customers/ocx/customers/${cust.id}/info/${card.card_no}`, {method:'DELETE'});
              cards = res.cards || [];
              curIdx = 0;
              toast('Kart silindi');
              renderCard();
            } catch(e){ showErr(e); }
          };
          $('#ciSave').onclick = async () => {
            try {
              const res = await api(`/api/customers/ocx/customers/${cust.id}/info`, {
                method: 'POST',
                body: JSON.stringify({
                  card_no: card.card_no,
                  pasp_type: $('#ciPaspType').value, pasport: $('#ciPasport').value,
                  pasp_date: $('#ciPaspDate').value || null, kem_vidan: $('#ciKemVidan').value,
                  dog_yer: $('#ciDogYer').value, dog_tar: $('#ciDogTar').value || null,
                  cins: $('#ciCins').value, milliyet: $('#ciMilliyet').value,
                  grajdan: $('#ciGrajdan').value, work_place: $('#ciWork').value,
                  doljnost: $('#ciDoljnost').value, father: $('#ciFather').value,
                  partner: $('#ciPartner').value, strana: $('#ciStrana').value,
                  adress: $('#ciAdress').value, tel: $('#ciTel').value,
                  tel_mob: $('#ciTelMob').value, faks: '', e_mail: $('#ciEmail').value,
                })
              });
              await api(`/api/customers/ocx/customers/${cust.id}/ipinfo`, {
                method: 'POST',
                body: JSON.stringify({
                  card_no: card.card_no,
                  familystatus: 1, education: 1, place1: 1, work1: 1, work2: 1, verify: 1,
                  familymembers: Number($('#ciFamMem').value || 1),
                  monthlyincome: Number($('#ciIncome').value || 0),
                  monthlyexpense: Number($('#ciExpense').value || 0),
                })
              });
              cards = res.cards || [];
              toast('Müştəri kartı yadda saxlanıldı');
              renderCard();
            } catch(e){ showErr(e); }
          };
        }
        renderCard();
      } catch(e){ showErr(e); }
    }

    function openSettingsModal(){
      const mh = $('#coModalHost');
      mh.innerHTML = `
        <div class="sb-modal-bg">
          <div class="sb-modal" style="width:600px">
            <div class="sb-modal-hd">
              <span>Soraqçalar (frmSettings — ODSSettings / ODSSets)</span>
              <button class="sb-btn" id="csClose">✕</button>
            </div>
            <div class="sb-modal-bd" style="padding:12px">
              <label>Soraqça cədvəli:
                <select id="csTable" class="sb-sel">
                  <option value="prinad">PRINAD (Mənsubiyyət)</option>
                  <option value="qrp_klie">QRP_KLIE (Müştəri qrupları)</option>
                  <option value="vid_sob">VID_SOB (Mülkiyyət növləri)</option>
                  <option value="org_prav">ORG_PRAV (Təşkilati-hüquqi formalar)</option>
                  <option value="sferadey">SFERADEY (Fəaliyyət sahələri)</option>
                  <option value="otrasli">OTRASLI (İqtisadi sektorlar)</option>
                  <option value="nalog">NALOG (Vergi orqanları)</option>
                </select>
              </label>
              <div style="max-height:300px;overflow:auto;margin-top:10px">
                <table class="sb-grid"><thead><tr><th>ID</th><th>Adı (NAME)</th></tr></thead><tbody id="csBody"></tbody></table>
              </div>
            </div>
          </div>
        </div>
      `;
      $('#csClose').onclick = () => { mh.innerHTML = ''; };
      const loadTbl = async () => {
        const rows = await api('/api/customers/ocx/settings/' + $('#csTable').value);
        $('#csBody').innerHTML = rows.map(r => `<tr><td>${r.id}</td><td>${esc(r.name||'')}</td></tr>`).join('');
      };
      $('#csTable').onchange = loadTbl;
      loadTbl();
    }

    $('#coNew').onclick = () => openCustPropsModal(null);
    $('#coEdit').onclick = () => st.sel ? openCustPropsModal(st.sel) : toast('Müştəri seçilməyib');
    $('#coInfo').onclick = () => openCustInfoModal(st.sel);
    $('#coSettings').onclick = () => openSettingsModal();
    $('#coClose').onclick = async () => {
      if (!st.sel) return toast('Müştəri seçilməyib');
      try {
        await api(`/api/customers/ocx/customers/${st.sel.id}/close`, {method:'POST'});
        toast('Müştəri bağlandı');
        await loadCustomers();
      } catch(e){ showErr(e); }
    };
    $('#coRefresh').onclick = () => loadCustomers();
    $('#coFilial').onchange = e => { st.filial = e.target.value; loadCustomers(); };
    $('#coType').onchange = e => { st.custType = e.target.value; loadCustomers(); };
    $('#coSort').onchange = e => { st.sort = e.target.value; loadCustomers(); };
    $('#coQId').oninput = e => { st.qId = e.target.value.trim(); loadCustomers(); };
    $('#coQInn').oninput = e => { st.qInn = e.target.value.trim(); loadCustomers(); };
    $('#coQName').oninput = e => { st.qName = e.target.value.trim(); loadCustomers(); };
    $('#coQDate').onchange = e => { st.qDate = e.target.value; loadCustomers(); };
    $('#coClearQ').onclick = () => {
      st.qId = st.qInn = st.qName = st.qDate = '';
      $('#coQId').value = $('#coQInn').value = $('#coQName').value = $('#coQDate').value = '';
      loadCustomers();
    };
    $('#coAccCurr').onchange = e => { st.currencyId = e.target.value; loadAccounts(); };
    $('#coAccSort').onchange = e => { st.accSort = e.target.value; loadAccounts(); };
    $('#coQAccNo').oninput = e => { st.qAccNo = e.target.value.trim(); loadAccounts(); };
    $('#coQAccName').oninput = e => { st.qAccName = e.target.value.trim(); loadAccounts(); };

    loadInit().then(() => loadCustomers());
  }

  function renderCustomersInfoOcx(host){
    let mode = 'customers';
    host.innerHTML = `
      <div class="sb-mod" id="custInfoOcxMod">
        <div class="sb-tb">
          <span class="sb-tb-title">Müştəri Məlumatları Analizatoru (CustomersInformations.ocx)</span>
          <label><input type="radio" name="ciMode" value="customers" checked> Müştərilər (RBtnCust)</label>
          <label><input type="radio" name="ciMode" value="accounts"> Hesablar (RBtnAcc)</label>
          <label><input type="radio" name="ciMode" value="documents"> Sənədlər (RBtnDocs)</label>
          <span class="sb-sp"></span>
          <button class="sb-btn primary" id="ciRun">Sorğunu icra et (F9)</button>
          <span id="ciTotal" style="font-weight:600">0 sətir</span>
        </div>
        <div class="sb-grid-wrap" style="height:calc(100% - 48px);overflow:auto">
          <table class="sb-grid"><thead id="ciHead"></thead><tbody id="ciBody"></tbody></table>
        </div>
      </div>
    `;
    const run = async () => {
      try {
        const res = await api('/api/customers/info-ocx/analyze?mode=' + mode);
        host.querySelector('#ciTotal').textContent = `${res.total || 0} sətir`;
        const h = host.querySelector('#ciHead');
        const b = host.querySelector('#ciBody');
        const rows = res.rows || [];
        if (mode === 'customers'){
          h.innerHTML = `<tr><th>ID</th><th>VÖEN</th><th>Adı</th><th>Qısa adı</th><th>Tipi</th><th>Açılma tarixi</th><th>Filial</th></tr>`;
          b.innerHTML = rows.map(r => `<tr><td>${r.id}</td><td>${esc(r.inn||'')}</td><td>${esc(r.name||'')}</td><td>${esc(r.short_name||'')}</td><td>${esc(r.tip||'')}</td><td>${fmtDate(r.open_dat)}</td><td>${r.filial||101}</td></tr>`).join('');
        } else if (mode === 'accounts'){
          h.innerHTML = `<tr><th>Hesab №</th><th>Hesab adı</th><th>Müştəri</th><th>Valyuta</th><th class="num">Qalıq</th><th>Açılma tarixi</th></tr>`;
          b.innerHTML = rows.map(r => `<tr><td><code>${esc(r.accno||'')}</code></td><td>${esc(r.accname||'')}</td><td>${esc(r.customer_name||'')}</td><td>${esc(r.currencysname||'')}</td><td class="num">${fmtNum(r.balance)}</td><td>${fmtDate(r.opendate)}</td></tr>`).join('');
        } else {
          h.innerHTML = `<tr><th>ID</th><th>Tarix</th><th>Debet hesabı</th><th>Kredit hesabı</th><th class="num">Məbləğ</th><th>Təyinat</th></tr>`;
          b.innerHTML = rows.map(r => `<tr><td>${r.id}</td><td>${fmtDate(r.transactiondate)}</td><td>${esc(r.debitaccount||'')}</td><td>${esc(r.creditaccount||'')}</td><td class="num">${fmtNum(r.debitamount)}</td><td>${esc(r.name||'')}</td></tr>`).join('');
        }
      } catch(e){ showErr(e); }
    };
    host.querySelectorAll('input[name="ciMode"]').forEach(r => {
      r.onchange = () => { mode = r.value; run(); };
    });
    host.querySelector('#ciRun').onclick = run;
    run();
  }

  window.SB.pages['/m/customers'] = host => renderCustomersOcx(host, false);
  window.SB.pages['/m/p-customers'] = host => renderCustomersOcx(host, true);
  window.SB.pages['/m/customers-informations'] = host => renderCustomersInfoOcx(host);
})();

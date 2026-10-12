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

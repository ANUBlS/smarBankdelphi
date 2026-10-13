/* Off-balance accounts – port of Delphi Packages/Out_account/ocx (TAccountForm + AccountPropertiesForm + FormAccFlags
   + AccountState + FormAccountTransactions + FormInterval). Business rules live in the API (api/app/out_account.py). */
(function () {
  const { api, t, esc, toast, modal } = window.SB;
  const K = (k) => t('out_account.' + k);
  const money = (v) => v === null || v === undefined ? '' : Number(v).toLocaleString(window.I18N.lang, { minimumFractionDigits: 2, maximumFractionDigits: 2 });
  const dmy = (iso) => iso ? iso.slice(8, 10) + '.' + iso.slice(5, 7) + '.' + iso.slice(0, 4) : '';   // TDateTimeField.AsString
  // GBAccountStatus ItemIndex 1 by default (AccountImpl.dfm:482); filter checkboxes off; title 'acc_no'
  const st = { status: 1, use: { filial: false, currency: false, user: false, tipacc: false, bal_cn: false }, val: {}, title: 'ACC_NO',
               rows: [], sel: null, lk: null, showFilter: false, showSearch: false, rests: {} };
  const errHtml = (e) => `<div class="alert error">${esc(t(e.key, e))}${e.ora ? `<span class="ora">${esc(e.ora)}</span>` : ''}</div>`;
  const opt = (list, key, label, val, empty) => (empty ? '<option value=""></option>' : '') + list.map(x => `<option value="${esc(x[key])}" ${String(x[key]) === String(val ?? '') ? 'selected' : ''}>${esc(label(x))}</option>`).join('');
  function csv(name, cols, rows) {
    const line = (a) => a.map(v => `"${String(v ?? '').replace(/"/g, '""')}"`).join(',');
    const blob = new Blob(['\ufeff' + [line(cols.map(c => c[1])), ...rows.map(r => line(cols.map(c => r[c[0]])))].join('\r\n')], { type: 'text/csv' });
    const a = document.createElement('a'); a.href = URL.createObjectURL(blob); a.download = name; a.click();
  }
  // Grid columns AccountImpl.dfm:60-213 (FieldName -> title key, kind)
  const COLS = [['ACC_NO', 'col_acc_no'], ['BAL_CN1', 'col_bal_cn1'], ['VAL_ACC', 'col_val_acc'], ['KLI_ID', 'col_kli_id'], ['NAME', 'col_name'],
                ['OPEN_DAT', 'col_open_dat', 'd'], ['CLOSE_DAT', 'col_close_dat', 'd'], ['SIM_OTCET', 'col_sim_otcet'], ['BAL_CN2', 'col_bal_cn2'],
                ['OLD_ACC_NO', 'col_old_acc_no'], ['EXPERT', 'col_expert']];
  // InitControl AccountImpl.pas:641-654: each lookup on its first row
  const FILTERS = [['tipacc', 'acc_flags', 'symbol', x => x.name, 'flt_tipacc'], ['filial', 'branches', 'id', x => x.name, 'flt_filial'],
                   ['currency', 'currencies', 'valute', x => x.valu_name, 'flt_currency'], ['user', 'users', 'id', x => x.name, 'flt_user'],
                   ['bal_cn', 'bal_acc', 'bal_cn', x => x.bal_cn, 'flt_bal_cn']];
  const initControl = () => FILTERS.forEach(([k, l, key]) => { st.val[k] = st.lk[l][0] ? st.lk[l][0][key] : ''; });

  async function load(el, keepId) {
    const p = new URLSearchParams({ status: st.status, title: st.title });
    FILTERS.forEach(([k]) => { if (st.use[k] && st.val[k] !== '' && st.val[k] !== undefined) p.set(k, st.val[k]); });
    try {
      const r = await api('/api/out-account?' + p);
      st.rows = r.rows; st.more = r.more;
      const want = keepId ?? st.sel;                         // Locate('ID', AccountID)
      st.sel = st.rows.some(x => x.id === want) ? want : (st.rows[0] ? st.rows[0].id : null);
      renderGrid(el); loadRests(el);
    } catch (e) { el.querySelector('#oaGrid').innerHTML = errHtml(e); }
  }
  async function loadRests(el) {
    const box = el.querySelector('#oaRests'); if (!box) return;
    if (!st.sel) { box.innerHTML = ''; return; }
    try { const a = await api('/api/out-account/' + st.sel); st.rests = a.rests; } catch (e) { st.rests = {}; }
    const r = st.rests;   // Panel4 / Panel5: both bound to Tenostat OSTAT / POK_OSTAT
    box.innerHTML = `<span>${esc(K('rest'))}: <b>${money(r.ostat)}</b></span><span>${esc(K('rest_eq'))}: <b>${money(r.pok_ostat)}</b></span>
      <span>${esc(K('plan_rest'))}: <b>${money(r.ostat)}</b></span><span>${esc(K('plan_rest_eq'))}: <b>${money(r.pok_ostat)}</b></span>`;
  }
  function renderGrid(el) {
    const cur = st.lk.currencies.reduce((m, c) => (m[c.valute] = c.valu_name, m), {});
    el.querySelector('#oaGrid').innerHTML = `<div class="tablewrap" style="max-height:56vh"><table class="grid acc-grid"><thead><tr>${COLS.map(c => `<th data-f="${c[0]}" style="cursor:pointer" title="${esc(K('sort_hint'))}">${esc(K(c[1]))}${st.title === c[0] ? ' ▲' : ''}</th>`).join('')}</tr></thead><tbody>
      ${st.rows.map(r => `<tr data-id="${r.id}" class="${r.id === st.sel ? 'sel' : ''} ${r.close_dat ? 'closed' : ''}">${COLS.map(c => { const v = r[c[0].toLowerCase()];
        return `<td title="${c[0] === 'VAL_ACC' ? esc(cur[v] || '') : ''}">${esc(c[2] === 'd' ? dmy(v) : v ?? '')}</td>`; }).join('')}</tr>`).join('')}
      </tbody></table></div><div class="muted" style="margin-top:8px">${esc(K('loaded').replace('{n}', st.rows.length))}${st.more ? ' …' : ''}</div>`;
    el.querySelectorAll('th[data-f]').forEach(th => th.onclick = () => { st.title = th.dataset.f; load(el); });   // GridAccountTitleClick
    el.querySelectorAll('tr[data-id]').forEach(tr => {
      tr.onclick = () => { st.sel = +tr.dataset.id; el.querySelectorAll('tr.sel').forEach(x => x.classList.remove('sel')); tr.classList.add('sel'); updateButtons(el); loadRests(el); };
      tr.ondblclick = () => { st.sel = +tr.dataset.id; editDialog(el, st.sel); };   // OnDblClick = ToolButton3Click
    });
    updateButtons(el);
  }
  function updateButtons(el) { ['edit', 'close', 'tr', 'states'].forEach(a => el.querySelector(`[data-a=${a}]`).disabled = !st.sel); }

  // ActionSpeedSearchExecute AccountImpl.pas:966-998: SearchRecord(field, text, [srIgnoreCase, srPartialMatch, srFromCurrent, srForward])
  const SEARCH = ['ACC_NO', 'BAL_CN1', 'VAL_ACC', 'NAME', 'OPEN_DAT', 'CLOSE_DAT', 'KLI_ID', 'OLD_ACC_NO', 'BAL_CN2', 'SIM_OTCET'];
  function speedSearch(el, field, text) {
    const f = field.toLowerCase(), q = text.toLowerCase();
    const hit = (r) => { let v = r[f]; if (f.endsWith('_dat')) v = dmy(v); return String(v ?? '').toLowerCase().startsWith(q); };
    const i0 = st.rows.findIndex(r => r.id === st.sel);
    let i = st.rows.findIndex((r, i) => i > i0 && hit(r));
    if (i < 0) {
      if (!confirm(K('search_end'))) return;                // 'Axtarış sona çatdı. Əvvəldən başlansın?'
      i = st.rows.findIndex(hit);
      if (i < 0) { toast(K('search_none')); return; }       // 'Yazı tapılmayıb!'
    }
    st.sel = st.rows[i].id; renderGrid(el); loadRests(el);
    const tr = el.querySelector(`tr[data-id="${st.sel}"]`); tr && tr.scrollIntoView({ block: 'nearest' });
  }

  function page(el) {
    const lk = st.lk;
    el.innerHTML = `<div class="card" style="max-width:none">
      <div style="display:flex;align-items:center;gap:10px;flex-wrap:wrap"><h2 style="margin:0">${esc(K('title'))}</h2><div style="flex:1"></div>
        <button class="btn secondary" data-a="refresh" title="F5">⟳ ${esc(K('refresh'))}</button>
        <button class="btn secondary" data-a="full" title="F6">${esc(K('full_refresh'))}</button>
        <button class="btn" data-a="new" title="Ins">＋ ${esc(K('new'))}</button>
        <button class="btn secondary" data-a="edit" title="Ctrl+E">${esc(K('edit'))}</button>
        <button class="btn secondary" data-a="close" title="Ctrl+Del">${esc(K('close'))}</button>
        <button class="btn secondary" data-a="filter" title="Ctrl+F">${esc(K('filter_panel'))}</button>
        <button class="btn secondary" data-a="search" title="Ctrl+S">${esc(K('search_panel'))}</button>
        <button class="btn secondary" data-a="states" title="Alt+F5">${esc(K('states'))}</button>
        <button class="btn secondary" data-a="tr">${esc(K('transactions'))}</button></div>
      <div id="oaFilter" class="acc-filter" style="display:${st.showFilter ? 'grid' : 'none'};margin-top:14px">
        <div class="fl"><b>${esc(K('status'))}</b>${[0, 1, 2].map(i => `<label class="chip"><input type="radio" name="st" value="${i}" ${st.status === i ? 'checked' : ''}> ${esc(K('status_' + i))}</label>`).join('')}</div>
        ${FILTERS.map(([k, l, key, lab, cap]) => `<div class="fl"><label class="chip"><input type="checkbox" data-use="${k}" ${st.use[k] ? 'checked' : ''}> ${esc(K(cap))}</label>
          <select data-val="${k}" ${st.use[k] ? '' : 'disabled'}>${opt(lk[l], key, lab, st.val[k])}</select></div>`).join('')}
        <div class="fl"><button class="btn secondary small" id="oaReset">${esc(K('reset_filter'))}</button></div>
      </div>
      <div id="oaSearch" class="acc-filter" style="display:${st.showSearch ? 'grid' : 'none'};margin-top:14px">
        ${SEARCH.map(f => `<div class="fl"><label class="muted">${esc(K('col_' + f.toLowerCase()))}</label><input data-search="${f}" placeholder="↵"></div>`).join('')}
      </div>
      <div id="oaGrid" style="margin-top:14px"><div class="spinner"></div></div>
      <div id="oaRests" class="totals"></div></div>`;
    const q = (s) => el.querySelector(s);
    el.querySelectorAll('[name=st]').forEach(r => r.onchange = () => { st.status = +r.value; load(el); });   // GBAccountStatusClick
    el.querySelectorAll('[data-use]').forEach(cb => cb.onchange = () => {                                  // CBxxxClick
      const k = cb.dataset.use; st.use[k] = cb.checked; q(`[data-val=${k}]`).disabled = !cb.checked;
      if (!cb.checked) { initControl(); el.querySelectorAll('[data-val]').forEach(s => s.value = st.val[s.dataset.val]); }
      load(el); });
    el.querySelectorAll('[data-val]').forEach(s => s.onchange = () => { st.val[s.dataset.val] = s.value; load(el); });   // DBLookupXxxClick
    q('#oaReset').onclick = () => { initControl(); el.querySelectorAll('[data-val]').forEach(s => s.value = st.val[s.dataset.val]); load(el); };   // SpeedButton2Click
    el.querySelectorAll('[data-search]').forEach(i => {
      i.onkeydown = (e) => { if (e.key === 'Enter') speedSearch(el, i.dataset.search, i.value); };
      i.onblur = () => { i.value = ''; };                    // EditXxxExit: Text := EmptyStr
    });
    q('[data-a=refresh]').onclick = () => load(el);
    q('[data-a=full]').onclick = async () => { st.lk = await api('/api/out-account/lookups'); page(el); };   // Refresh_('')
    q('[data-a=new]').onclick = () => editDialog(el, null);
    q('[data-a=edit]').onclick = () => st.sel && editDialog(el, st.sel);
    q('[data-a=close]').onclick = () => closeAccount(el);
    q('[data-a=filter]').onclick = () => { st.showFilter = !st.showFilter; q('#oaFilter').style.display = st.showFilter ? 'grid' : 'none'; };
    q('[data-a=search]').onclick = () => { st.showSearch = !st.showSearch; q('#oaSearch').style.display = st.showSearch ? 'grid' : 'none'; if (st.showSearch) q('[data-search=ACC_NO]').focus(); };
    q('[data-a=states]').onclick = () => st.sel && statesDialog(st.sel);
    q('[data-a=tr]').onclick = () => st.sel && intervalDialog(st.sel);
    load(el);
  }

  async function closeAccount(el) {
    const r = st.rows.find(x => x.id === st.sel); if (!r) return;
    if (!confirm(K('confirm_close').replace('{acc}', r.acc_no))) return;     // '"%s" №-li hesab bağlansın?'
    try { await api(`/api/out-account/${r.id}/close`, { method: 'POST' }); toast(K('closed_ok')); load(el, r.id); }
    catch (e) { toast(t(e.key, e) + (e.ora ? ' ' + e.ora : ''), 'error'); }
  }

  async function editDialog(el, id) {
    const lk = st.lk;
    let a = { acc_no: '', val_acc: null, bal_cn1: null, kli_id: null, open_dat: lk.tek_dat, pair_acc: null, limit: null, sim_otcet: 0,
              filial: null, name: '', tipacc: null, old_acc_no: '', tempid: null, bal_cn2: null, rests: {} };
    if (id) { try { a = await api('/api/out-account/' + id); } catch (e) { return toast(t(e.key, e), 'error'); } }
    let flags = null;
    const fld = (k, inner) => `<div class="field"><label>${esc(K('f_' + k))}</label>${inner}</div>`;
    const sel = (n, list, key, lab, v) => `<select name="${n}">${opt(list, key, lab, v, true)}</select>`;
    modal(`<h3>${esc(K(id ? 'edit_title' : 'new_title'))}</h3><form id="oaf" autocomplete="off"><div style="display:grid;grid-template-columns:1fr 1fr;gap:0 16px">
      ${fld('acc_no', `<div style="display:flex;gap:6px"><input name="acc_no" value="${esc(a.acc_no || '')}" style="flex:1"><button type="button" class="btn secondary small" id="gen">${esc(K('auto_acc'))}</button></div>`)}
      ${fld('val_acc', sel('val_acc', lk.currencies, 'valute', x => `${x.valute} – ${x.valu_name}`, a.val_acc))}
      ${fld('bal_cn1', sel('bal_cn1', lk.bal_acc, 'bal_cn', x => `${x.bal_cn} – ${x.balname}`, a.bal_cn1))}
      ${fld('bal_cn2', sel('bal_cn2', lk.bal_acc_new, 'bal_cn', x => `${x.bal_cn} – ${x.balname}`, a.bal_cn2))}
      ${fld('kli_id', sel('kli_id', lk.customers, 'id', x => `${x.id} – ${x.name}`, a.kli_id))}
      ${fld('open_dat', `<input type="date" name="open_dat" value="${esc(a.open_dat || '')}">`)}
      ${fld('name', `<input name="name" value="${esc(a.name || '')}">`)}
      ${fld('pair_acc', sel('pair_acc', lk.pair_accounts, 'id', x => x.acc_no, a.pair_acc))}
      ${fld('limit', `<input name="limit" type="number" step="0.01" value="${a.limit ?? ''}">`)}
      ${fld('sim_otcet', sel('sim_otcet', lk.report_symbols, 'id', x => x.name, id ? a.sim_otcet : 0))}
      ${fld('filial', sel('filial', lk.branches, 'id', x => `${x.id} – ${x.name}`, a.filial))}
      ${fld('old_acc_no', `<input name="old_acc_no" value="${esc(a.old_acc_no || '')}">`)}
      ${fld('tempid', sel('tempid', lk.experts, 'id', x => x.name, a.tempid))}
      ${fld('tipacc', `<div style="display:flex;gap:6px;align-items:center"><code id="tip">${esc(a.tipacc || '')}</code><button type="button" class="btn secondary small" id="flg">${esc(K('symbols'))}</button></div>`)}
      </div><div id="flagBox"></div>
      ${id ? `<div class="totals" style="justify-content:flex-start"><span>${esc(K('day_start'))}:</span><span>${esc(K('rest'))}: <b>${money(a.rests.ostat)}</b></span><span>${esc(K('rest_eq'))}: <b>${money(a.rests.pok_ostat)}</b></span></div>` : ''}
      <div id="oerr"></div><div class="actions"><button type="button" class="btn secondary" id="oc">${esc(K('cancel'))}</button><button class="btn">${esc(K('save'))}</button></div></form>`,
    (m, close) => {
      m.classList.add('wide');
      const fm = m.querySelector('#oaf');
      const body = () => { const d = new FormData(fm), n = (k) => d.get(k) === '' || d.get(k) === null ? null : Number(d.get(k));
        return { acc_no: d.get('acc_no'), val_acc: n('val_acc'), bal_cn1: n('bal_cn1'), bal_cn2: n('bal_cn2'), kli_id: n('kli_id'), open_dat: d.get('open_dat') || null,
                 name: d.get('name'), pair_acc: n('pair_acc'), limit: n('limit'), sim_otcet: n('sim_otcet'), filial: n('filial'), old_acc_no: d.get('old_acc_no'),
                 tempid: n('tempid'), tipacc: m.querySelector('#tip').textContent || null }; };
      // Customers_AfterScroll: picking a customer copies its name into the account name
      fm.kli_id.onchange = () => { const c = lk.customers.find(x => String(x.id) === fm.kli_id.value); if (c) fm.name.value = c.name; };
      // DBEdit1KeyPress: only A-Z a-z 0-9 / - (and backspace)
      fm.old_acc_no.addEventListener('beforeinput', (e) => { if (e.data && !/^[A-Za-z0-9/\-]+$/.test(e.data)) e.preventDefault(); });
      m.querySelector('#gen').onclick = async () => {        // SpeedButton1Click -> OUT_SBOP.GenerateAccountNumber
        try { fm.acc_no.value = (await api('/api/out-account/generate-acc-no', { method: 'POST', body: body() })).acc_no; }
        catch (e) { m.querySelector('#oerr').innerHTML = errHtml(e); } };
      m.querySelector('#flg').onclick = async () => {        // Button3Click -> TFormAccFlags
        flags = flags || await api(id ? `/api/out-account/${id}/flags` : '/api/out-account/flags/new');
        const box = m.querySelector('#flagBox');
        box.innerHTML = `<div class="acc-filter" style="display:grid"><div class="fl">${flags.map((f, i) => `<label class="chip"><input type="checkbox" data-fi="${i}" ${f.checked ? 'checked' : ''}> ${esc(f.name)}</label>`).join('')}</div>
          <div class="fl"><button type="button" class="btn small" id="fok">OK</button></div></div>`;
        box.querySelector('#fok').onclick = async () => {
          box.querySelectorAll('[data-fi]').forEach(c => flags[+c.dataset.fi].checked = c.checked);
          const r = await api('/api/out-account/flag-map', { method: 'POST', body: flags.filter(f => f.checked).map(f => f.name) });
          m.querySelector('#tip').textContent = r.tipacc; box.innerHTML = ''; };
      };
      m.querySelector('#oc').onclick = close;
      m.onkeydown = (e) => { if (e.key === 'Escape') close(); };
      fm.onsubmit = async (e) => {
        e.preventDefault();
        try {
          const r = id ? await api('/api/out-account/' + id, { method: 'PUT', body: body() }) : await api('/api/out-account', { method: 'POST', body: body() });
          close(); toast(K('saved')); load(el, id || r.id);    // CloseAll; Open; Locate('ACC_NO', ...)
        } catch (er) { m.querySelector('#oerr').innerHTML = errHtml(er); }
      };
    });
  }

  function intervalDialog(id) {                              // FormInterval: Start = End = Sysdat.tek_dat
    modal(`<h3>${esc(K('interval'))}</h3><div class="filters"><div class="field"><label>${esc(t('history.from'))}</label><input type="date" id="is" value="${st.lk.tek_dat}"></div>
      <div class="field"><label>${esc(t('history.to'))}</label><input type="date" id="ie" value="${st.lk.tek_dat}"></div></div>
      <div class="actions"><button class="btn secondary" id="ic">${esc(K('cancel'))}</button><button class="btn" id="iok">OK</button></div>`, (m, close) => {
      m.querySelector('#is').focus();
      m.querySelector('#ic').onclick = close;
      m.querySelector('#iok').onclick = () => transactionsDialog(id, m.querySelector('#is').value, m.querySelector('#ie').value, 'debit');
    });
  }
  async function transactionsDialog(id, s, e, tab) {
    let r; try { r = await api(`/api/out-account/${id}/transactions?start=${s}&end=${e}`); } catch (er) { return toast(t(er.key, er), 'error'); }
    const deb = tab === 'debit', rows = deb ? r.debit : r.credit;
    const cols = [['id', '#'], ['operationdate', K('t_date'), 'd'], ['debitaccno', K('t_debit')], ['creditaccno', K('t_credit')],
                  ['debitamount', K('t_damount'), 'm'], ['creditamount', K('t_camount'), 'm'], ['lamount', K('t_lamount'), 'm'], ['destination', K('t_dest')]];
    modal(`<h3>${esc(K('tr_caption').replace('{acc}', r.acc_no))}</h3>
      <div class="tabs"><button class="${deb ? 'on' : ''}" data-tab="debit">${esc(K('tab_debit'))} (${r.debit.length})</button><button class="${deb ? '' : 'on'}" data-tab="credit">${esc(K('tab_credit'))} (${r.credit.length})</button></div>
      <div class="tablewrap" style="max-height:45vh"><table class="grid"><thead><tr>${cols.map(c => `<th>${esc(c[1])}</th>`).join('')}</tr></thead>
      <tbody>${rows.map(x => `<tr>${cols.map(c => `<td style="${c[2] === 'm' ? 'text-align:right' : ''}">${esc(c[2] === 'm' ? money(x[c[0]]) : c[2] === 'd' ? dmy(x[c[0]]) : x[c[0]] ?? '')}</td>`).join('')}</tr>`).join('')}</tbody></table></div>
      <div class="totals"><span>${esc(K(deb ? 't_total_d' : 't_total_c'))}: <b>${money(deb ? r.debit_total : r.credit_total)}</b></span><span>${esc(K('t_total_l'))}: <b>${money(deb ? r.debit_ltotal : r.credit_ltotal)}</b></span></div>
      <div class="actions"><button class="btn secondary" id="tx">${esc(K('export'))}</button><button class="btn" id="tok">OK</button></div>`, (m, close) => {
      m.classList.add('wide');
      m.querySelectorAll('[data-tab]').forEach(b => b.onclick = () => transactionsDialog(id, s, e, b.dataset.tab));
      m.querySelector('#tok').onclick = close;
      // AccTrExport fields: OPERATIONDATE DEBITACCNO CREDITACCNO DEBITAMOUNT CREDITAMOUNT LAMOUNT DESTINATION
      m.querySelector('#tx').onclick = () => csv(`out-account-${r.acc_no}-${tab}.csv`, cols.slice(1).map(c => [c[0], c[1]]), rows);
    });
  }
  async function statesDialog(id) {
    let r; try { r = await api(`/api/out-account/${id}/states`); } catch (e) { return toast(t(e.key, e), 'error'); }
    const all = [['archivedate', K('s_date'), 'd'], ['amount', K('s_amount'), 'm'], ['lamount', K('s_lamount'), 'm'], ['debitturnover', K('s_dt'), 'm'],
                 ['debitlturnover', K('s_dtl'), 'm'], ['creditturnover', K('s_ct'), 'm'], ['creditlturnover', K('s_ctl'), 'm']];
    const sheets = { rest: [0, 1, 2], turn: [0, 3, 4, 5, 6], both: [0, 1, 2, 3, 4, 5, 6] };
    const show = (sh) => {
      const cols = sheets[sh].map(i => all[i]);
      modal(`<h3>${esc(K('st_caption').replace('{acc}', r.acc_no))}</h3>
        <div class="tabs">${Object.keys(sheets).map(k => `<button class="${k === sh ? 'on' : ''}" data-sh="${k}">${esc(K('sheet_' + k))}</button>`).join('')}</div>
        <div class="tablewrap" style="max-height:50vh"><table class="grid"><thead><tr>${cols.map(c => `<th>${esc(c[1])}</th>`).join('')}</tr></thead><tbody>
        ${r.rows.map(x => `<tr>${cols.map(c => `<td style="${c[2] === 'm' ? 'text-align:right' : ''}">${esc(c[2] === 'm' ? money(x[c[0]]) : dmy(x[c[0]]))}</td>`).join('')}</tr>`).join('')}</tbody></table></div>
        <div class="actions"><button class="btn secondary" id="sx">${esc(K('export'))}</button><button class="btn" id="sok">${esc(t('common.close'))}</button></div>`, (m, close) => {
        m.classList.add('wide');
        m.querySelectorAll('[data-sh]').forEach(b => b.onclick = () => show(b.dataset.sh));
        m.querySelector('#sok').onclick = close;
        m.querySelector('#sx').onclick = () => r.rows.length && csv(`out-account-states-${r.acc_no}.csv`, all.map(c => [c[0], c[1]]), r.rows);  // only if RecordCount > 0
      });
    };
    show('rest');
  }

  window.SB.pages['/m/out-account'] = async (el) => {
    el.innerHTML = '<div class="spinner"></div>';
    try { st.lk = await api('/api/out-account/lookups'); } catch (e) { el.innerHTML = `<div class="card">${errHtml(e)}</div>`; return; }
    initControl(); page(el);
  };
})();

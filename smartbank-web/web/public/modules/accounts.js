/* Accounts module – port of Delphi Packages/Accounts (AccountMainForm + AccountPropertiesForm + AccTransactionsForm
   + AccStatesForm + AccFlagsForm + StartEndDateInputForm). Business rules live in the API (api/app/accounts.py). */
(function () {
  const { api, t, esc, toast, modal, fmtDate } = window.SB;
  const money = (v) => v === null || v === undefined ? '' : Number(v).toLocaleString(window.I18N.lang, { minimumFractionDigits: 2, maximumFractionDigits: 2 });
  const st = { f: { apply_filter: false, status: 'all', order: 'accno', bal_cn: '', customer_id: '', currency_id: '', filial_id: '', flag: '',
                    use_bal: false, use_cust: false, use_cur: false, use_fil: false, use_flag: false }, rows: [], more: false, sel: null, lk: null, showFilter: false, q: '' };

  function csv(name, cols, rows) {
    const line = (a) => a.map(v => `"${String(v ?? '').replace(/"/g, '""')}"`).join(',');
    const blob = new Blob(['\ufeff' + [line(cols.map(c => c[1])), ...rows.map(r => line(cols.map(c => r[c[0]])))].join('\r\n')], { type: 'text/csv' });
    const a = document.createElement('a'); a.href = URL.createObjectURL(blob); a.download = name; a.click();
  }
  const errHtml = (e) => `<div class="alert error">${esc(e.field ? t(e.key, { field: t('accounts.f_' + e.field) }) : t(e.key, e))}${e.ora ? `<span class="ora">${esc(e.ora)}</span>` : ''}</div>`;
  const opt = (list, key, label, val, empty = true) => (empty ? '<option value=""></option>' : '') + list.map(x => `<option value="${esc(x[key])}" ${String(x[key]) === String(val ?? '') ? 'selected' : ''}>${esc(label(x))}</option>`).join('');

  function query(offset) {
    const f = st.f, p = new URLSearchParams({ status: f.status, order: f.order, apply_filter: f.apply_filter, offset, limit: 50 });
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

  const COLS = [['accno', 'accounts.col_accno'], ['sacc', 'accounts.col_sacc'], ['currencysname', 'accounts.col_currency'], ['accname', 'accounts.col_name'],
                ['amount', 'accounts.col_amount', 1], ['lamount', 'accounts.col_lamount', 1], ['delayedamount', 'accounts.col_delayed', 1], ['delayedlamount', 'accounts.col_delayedl', 1],
                ['opendate', 'accounts.col_open', 2], ['closedate', 'accounts.col_close', 2]];

  function renderGrid(el) {
    const q = st.q.trim().toLowerCase();
    const rows = q ? st.rows.filter(r => ['accno', 'accname', 'currencysname', 'sacc'].some(k => String(r[k] ?? '').toLowerCase().includes(q))) : st.rows;
    el.querySelector('#accGrid').innerHTML = `<div class="tablewrap" style="max-height:60vh"><table class="grid acc-grid"><thead><tr>${COLS.map(c => `<th style="${c[2] === 1 ? 'text-align:right' : ''}">${esc(t(c[1]))}</th>`).join('')}</tr></thead><tbody>
      ${rows.map(r => `<tr data-id="${r.accid}" class="${r.accid === st.sel ? 'sel' : ''} ${r.closedate ? 'closed' : ''}">${COLS.map(c => `<td style="${c[2] === 1 ? 'text-align:right;font-variant-numeric:tabular-nums' : ''}">${esc(c[2] === 1 ? money(r[c[0]]) : c[2] === 2 ? (r[c[0]] ? fmtDate(r[c[0]]) : '') : r[c[0]])}</td>`).join('')}</tr>`).join('')}
      </tbody></table></div>
      <div style="display:flex;justify-content:space-between;align-items:center;margin-top:10px"><span class="muted">${esc(t('accounts.loaded', { n: st.rows.length }))}</span>
      ${st.more ? `<button class="btn secondary small" id="more">${esc(t('accounts.load_more'))}</button>` : ''}</div>`;
    el.querySelectorAll('tr[data-id]').forEach(tr => {
      tr.onclick = () => { st.sel = +tr.dataset.id; el.querySelectorAll('tr.sel').forEach(x => x.classList.remove('sel')); tr.classList.add('sel'); updateButtons(el); };
      tr.ondblclick = () => { st.sel = +tr.dataset.id; editDialog(el, st.sel); };   // DBGrid1DblClick -> Edit
    });
    const m = el.querySelector('#more'); if (m) m.onclick = () => load(el, true);
    updateButtons(el);
  }
  function updateButtons(el) {
    const r = st.rows.find(x => x.accid === st.sel);
    el.querySelector('[data-a=edit]').disabled = !r; el.querySelector('[data-a=tr]').disabled = !r; el.querySelector('[data-a=states]').disabled = !r;
    el.querySelector('[data-a=close]').disabled = !r || !!r.closedate;   // CloseUpdate: enabled only if CloseDate IsNull
  }

  function page(el) {
    const f = st.f, lk = st.lk;
    el.innerHTML = `<div class="card" style="max-width:none">
      <div style="display:flex;align-items:center;gap:12px;flex-wrap:wrap"><h2 style="margin:0">${esc(t('accounts.title'))}</h2><div class="spacer" style="flex:1"></div>
        <button class="btn" data-a="new">＋ ${esc(t('accounts.new'))}</button>
        <button class="btn secondary" data-a="edit">${esc(t('accounts.edit'))}</button>
        <button class="btn secondary" data-a="close">${esc(t('accounts.close'))}</button>
        <button class="btn secondary" data-a="tr">${esc(t('accounts.transactions'))}</button>
        <button class="btn secondary" data-a="states">${esc(t('accounts.states'))}</button>
        <button class="btn secondary" data-a="filter">${esc(t('accounts.filter_panel'))}</button>
        <button class="btn secondary" data-a="refresh">⟳ ${esc(t('accounts.refresh'))}</button>
        <button class="btn secondary" data-a="csv">${esc(t('history.export'))}</button></div>
      <div class="acc-toolbar">
        <input id="accQ" placeholder="${esc(t('accounts.quick_search'))}" value="${esc(st.q)}">
        <label>${esc(t('accounts.order'))}</label>
        ${['accno', 'name', 'currency'].map(o => `<label class="chip"><input type="radio" name="ord" value="${o}" ${f.order === o ? 'checked' : ''}> ${esc(t('accounts.order_' + o))}</label>`).join('')}
      </div>
      <form id="accFilter" class="acc-filter" style="display:${st.showFilter ? 'grid' : 'none'}">
        <label class="chip strong"><input type="checkbox" name="apply_filter" ${f.apply_filter ? 'checked' : ''}> ${esc(t('accounts.apply_filter'))}</label>
        <div>${['all', 'active', 'closed'].map(s => `<label class="chip"><input type="radio" name="status" value="${s}" ${f.status === s ? 'checked' : ''}> ${esc(t('accounts.status_' + s))}</label>`).join('')}</div>
        <div class="fl"><label class="chip"><input type="checkbox" name="use_bal" ${f.use_bal ? 'checked' : ''}> ${esc(t('accounts.by_balance'))}</label><select name="bal_cn">${opt(lk.saccs1, 'bal_cn', x => `${x.bal_cn} – ${x.balname}`, f.bal_cn)}</select></div>
        <div class="fl"><label class="chip"><input type="checkbox" name="use_cust" ${f.use_cust ? 'checked' : ''}> ${esc(t('accounts.by_customer'))}</label><select name="customer_id">${opt(lk.customers, 'id', x => `${x.id} – ${x.name}`, f.customer_id)}</select></div>
        <div class="fl"><label class="chip"><input type="checkbox" name="use_cur" ${f.use_cur ? 'checked' : ''}> ${esc(t('accounts.by_currency'))}</label><select name="currency_id">${opt(lk.currencies, 'valute', x => `${x.val_name} – ${x.valu_name || ''}`, f.currency_id)}</select></div>
        <div class="fl"><label class="chip"><input type="checkbox" name="use_fil" ${f.use_fil ? 'checked' : ''}> ${esc(t('accounts.by_filial'))}</label><select name="filial_id">${opt(lk.filials, 'id', x => `${x.id} – ${x.name}`, f.filial_id)}</select></div>
        <div class="fl"><label class="chip"><input type="checkbox" name="use_flag" ${f.use_flag ? 'checked' : ''}> ${esc(t('accounts.by_flag'))}</label><select name="flag">${opt(lk.acc_flags, 'symbol', x => `${x.symbol} – ${x.description}`, f.flag)}</select></div>
        <div><button class="btn">${esc(t('history.apply'))}</button></div>
      </form>
      <div id="accGrid"><div class="spinner"></div></div></div>`;
    const fm = el.querySelector('#accFilter');
    fm.onsubmit = (e) => { e.preventDefault(); const d = new FormData(fm);
      Object.assign(f, { apply_filter: d.has('apply_filter'), status: d.get('status'), use_bal: d.has('use_bal'), use_cust: d.has('use_cust'), use_cur: d.has('use_cur'), use_fil: d.has('use_fil'), use_flag: d.has('use_flag'),
        bal_cn: d.get('bal_cn'), customer_id: d.get('customer_id'), currency_id: d.get('currency_id'), filial_id: d.get('filial_id'), flag: d.get('flag') });
      load(el); };
    // OrderAccNoExecute: changing order refreshes immediately (AccountMainFormImpl.pas OrderAccNoExecute)
    el.querySelectorAll('[name=ord]').forEach(r => r.onchange = () => { f.order = r.value; load(el); });
    el.querySelector('#accQ').oninput = (e) => { st.q = e.target.value; renderGrid(el); };
    el.querySelector('[data-a=new]').onclick = () => editDialog(el, null);
    el.querySelector('[data-a=edit]').onclick = () => st.sel && editDialog(el, st.sel);
    el.querySelector('[data-a=close]').onclick = () => closeAccount(el);
    el.querySelector('[data-a=tr]').onclick = () => st.sel && transactionsDialog(st.sel);
    el.querySelector('[data-a=states]').onclick = () => st.sel && statesDialog(st.sel);
    el.querySelector('[data-a=filter]').onclick = () => { st.showFilter = !st.showFilter; fm.style.display = st.showFilter ? 'grid' : 'none'; };
    el.querySelector('[data-a=refresh]').onclick = () => load(el);
    el.querySelector('[data-a=csv]').onclick = () => csv('accounts.csv', COLS.map(c => [c[0], t(c[1])]), st.rows);
    load(el);
  }

  async function closeAccount(el) {
    const r = st.rows.find(x => x.accid === st.sel); if (!r) return;
    // AccountMainFormImpl.pas:816 balance check first (server re-checks), then confirmation
    if (Number(r.amount) !== 0 || Number(r.lamount) !== 0) return toast(t('accounts.err_close_balance'), 'error');
    if (!confirm(t('accounts.confirm_close', { acc: r.accno }))) return;
    try { await api(`/api/accounts/${r.accid}/close`, { method: 'POST' }); toast(t('accounts.closed_ok')); load(el); }
    catch (e) { modal(`<h3>${esc(t('accounts.close'))}</h3>${errHtml(e)}<div class="actions"><button class="btn" id="x">${esc(t('common.close'))}</button></div>`, (m, c) => m.querySelector('#x').onclick = c); }
  }

  async function editDialog(el, id) {
    const lk = st.lk;
    let a;
    try { a = id ? await api(`/api/accounts/${id}`) : await api('/api/accounts/new-defaults'); } catch (e) { return toast(t(e.key, e), 'error'); }
    const v = id ? { acc_no: a.accno, acc_name: a.accname, customer_id: a.customerid, currency_id: a.currencyid, open_date: a.opendate, sacc: a.sacc, sacc2: a.sacc2, sacc3: a.sacc3, sacc4: a.sacc4,
                     acc_limit: a.acclimit, report_symbol: a.reportsymbol, pair_acc: a.pairacc, filial_id: a.filialid, flags: a.acc_flags_checked || [] }
                 : { acc_no: '', acc_name: '', customer_id: '', currency_id: '', open_date: a.open_date, sacc: '', sacc2: 0, sacc3: 0, sacc4: 0, acc_limit: 0, report_symbol: 0, pair_acc: 0, filial_id: a.filial_id, flags: [] };
    const ro = (lbl, val) => `<div class="field"><label>${esc(t(lbl))}</label><input value="${esc(money(val))}" readonly class="ro"></div>`;
    const sel = (name, list, key, label, val) => `<select name="${name}">${opt(list, key, label, val)}</select>`;
    const root = document.getElementById('modal-root');
    root.innerHTML = `<div class="backdrop"><div class="modal wide" role="dialog"><h3>${esc(t(id ? 'accounts.edit_title' : 'accounts.new_title'))}</h3><form id="af" autocomplete="off"><div id="aerr"></div>
      ${id ? `<div class="grid2">${ro('accounts.f_amount', a.amount)}${ro('accounts.f_lamount', a.lamount)}${ro('accounts.f_daystart', a.daystartamount)}${ro('accounts.f_daystartl', a.daystartlamount)}</div>` : ''}
      <div class="grid2">
        <div class="field"><label>${esc(t('accounts.f_acc_no'))} *</label><input name="acc_no" value="${esc(v.acc_no)}" maxlength="34"></div>
        <div class="field"><label>${esc(t('accounts.f_currency_id'))} *</label>${sel('currency_id', lk.currencies, 'valute', x => `${x.valute} – ${x.valu_name || x.val_name}`, v.currency_id)}</div>
        <div class="field"><label>${esc(t('accounts.f_sacc'))} *</label>${sel('sacc', lk.saccs1, 'bal_cn', x => `${x.bal_cn} – ${x.balname}`, v.sacc)}</div>
        <div class="field"><label>${esc(t('accounts.f_customer_id'))} *</label>${sel('customer_id', lk.customers, 'id', x => `${x.id} – ${x.name}`, v.customer_id)}</div>
        <div class="field"><label>${esc(t('accounts.f_open_date'))}</label><input type="date" name="open_date" value="${esc(v.open_date)}"></div>
        <div class="field"><label>${esc(t('accounts.f_pair_acc'))}</label><input name="pair_q" list="pairList" placeholder="${esc(t('accounts.pair_hint'))}" value=""><datalist id="pairList"></datalist><input type="hidden" name="pair_acc" value="${esc(v.pair_acc || 0)}"><small class="muted" id="pairCur">${v.pair_acc ? esc(t('accounts.pair_current', { id: v.pair_acc })) : ''}</small></div>
        <div class="field" style="grid-column:1/-1"><label>${esc(t('accounts.f_acc_name'))} *</label><input name="acc_name" value="${esc(v.acc_name)}"></div>
        <div class="field"><label>${esc(t('accounts.f_limit'))}</label><input name="acc_limit" type="number" step="0.01" value="${esc(v.acc_limit)}"></div>
        <div class="field"><label>${esc(t('accounts.f_report_symbol'))}</label>${sel('report_symbol', lk.report_symbols, 'id', x => `${x.id} – ${x.name}`, v.report_symbol)}</div>
        <div class="field"><label>${esc(t('accounts.f_filial'))}</label>${sel('filial_id', lk.filials, 'id', x => `${x.id} – ${x.name}`, v.filial_id)}</div>
        <div class="field"><label>${esc(t('accounts.f_flags'))}</label><div class="flags">${lk.acc_flags.map(fl => `<label class="chip"><input type="checkbox" name="flag" value="${esc(fl.symbol + ' - ' + fl.description)}" ${v.flags.includes(fl.symbol) ? 'checked' : ''}> ${esc(fl.symbol)} – ${esc(fl.description)}</label>`).join('')}</div></div>
      </div>
      <details ${v.sacc2 || v.sacc3 || v.sacc4 ? 'open' : ''}><summary>${esc(t('accounts.additional_saccs'))}</summary><div class="grid2" style="margin-top:10px">
        <div class="field"><label>${esc(t('accounts.f_sacc2'))}</label>${sel('sacc2', lk.saccs2, 'bal_cn', x => `${x.bal_cn} – ${x.balname}`, v.sacc2)}</div>
        <div class="field"><label>${esc(t('accounts.f_sacc3'))}</label>${sel('sacc3', lk.saccs3, 'bal_cn', x => `${x.bal_cn} – ${x.balname}`, v.sacc3)}</div>
        <div class="field"><label>${esc(t('accounts.f_sacc4'))}</label>${sel('sacc4', lk.saccs4, 'bal_cn', x => `${x.bal_cn} – ${x.balname}`, v.sacc4)}</div></div></details>
      <div class="actions"><button type="button" class="btn secondary" id="acancel">${esc(t('password.cancel'))}</button><button class="btn" id="asave">${esc(t('accounts.save'))}</button></div></form></div></div>`;
    const m = root.querySelector('.modal'), fm = m.querySelector('#af');
    let modified = false; fm.addEventListener('input', () => modified = true);
    const close = () => { root.innerHTML = ''; };
    // FormCloseQuery: 'Dissmiss changes?' when modified
    const tryClose = () => { if (!modified || confirm(t('accounts.dismiss_changes'))) close(); };
    m.querySelector('#acancel').onclick = tryClose;
    m.addEventListener('keydown', (e) => {
      if (e.key === 'Escape') { e.preventDefault(); tryClose(); }   // FormKeyDown VK_ESCAPE
      // FormKeyPress VK_RETURN -> SelectNext
      if (e.key === 'Enter' && e.target.tagName !== 'BUTTON' && e.target.tagName !== 'TEXTAREA') { e.preventDefault();
        const els = [...fm.querySelectorAll('input:not([type=hidden]):not([readonly]),select,button')]; const i = els.indexOf(e.target); if (els[i + 1]) els[i + 1].focus(); }
    });
    // AccNoEditKeyPress: filter disallowed characters as you type
    fm.acc_no.addEventListener('input', () => { fm.acc_no.value = fm.acc_no.value.replace(/[^0-9a-zA-Z/\-:().,'+{} ]/g, ''); });
    // CustomerNameCBCloseUp: AccName := customer name
    fm.customer_id.addEventListener('change', () => { const c = lk.customers.find(x => String(x.id) === fm.customer_id.value); if (c) fm.acc_name.value = c.name; });
    fm.pair_q.addEventListener('input', async () => {
      const list = await api('/api/accounts/pair-lookup?q=' + encodeURIComponent(fm.pair_q.value)).catch(() => []);
      m.querySelector('#pairList').innerHTML = list.map(x => `<option value="${esc(x.accno)}" data-id="${x.accid}">`).join('');
      const hit = list.find(x => x.accno === fm.pair_q.value); if (hit) { fm.pair_acc.value = hit.accid; m.querySelector('#pairCur').textContent = t('accounts.pair_current', { id: hit.accid }); }
    });
    fm.onsubmit = async (e) => {
      e.preventDefault();
      const d = new FormData(fm), num = (k) => d.get(k) === '' || d.get(k) === null ? null : Number(d.get(k));
      const body = { acc_no: d.get('acc_no'), acc_name: d.get('acc_name'), customer_id: num('customer_id'), currency_id: num('currency_id'), sacc: num('sacc'),
        sacc2: num('sacc2') ?? 0, sacc3: num('sacc3') ?? 0, sacc4: num('sacc4') ?? 0, open_date: d.get('open_date') || null, acc_limit: d.get('acc_limit') || 0,
        report_symbol: num('report_symbol') ?? 0, pair_acc: num('pair_acc') ?? 0, filial_id: num('filial_id') ?? 0, acc_flags: d.getAll('flag') };
      try {
        const r = id ? await api(`/api/accounts/${id}`, { method: 'PUT', body }) : await api('/api/accounts', { method: 'POST', body });
        close(); toast(t('accounts.saved')); if (!id && r.accid) st.sel = r.accid; load(el);   // SafeRefresh: keep position
      } catch (er) { m.querySelector('#aerr').innerHTML = errHtml(er); if (er.field && fm[er.field]) fm[er.field].focus(); }
    };
    fm.acc_no.focus();
  }

  async function transactionsDialog(id) {
    const root = document.getElementById('modal-root');
    const show = async (start, end, tab) => {
      let r; try { r = await api(`/api/accounts/${id}/transactions` + (start ? `?start=${start}&end=${end}` : '')); } catch (e) { return toast(t(e.key, e), 'error'); }
      tab = tab || r.active_tab;
      const rows = tab === 'debit' ? r.debit : r.credit;
      const cols = tab === 'debit' ? [['operationdate', 'accounts.t_date', 2], ['debitaccno', 'accounts.t_debit'], ['creditaccno', 'accounts.t_credit'], ['debitamount', 'accounts.t_amount', 1], ['lamount', 'accounts.t_lamount', 1], ['destination', 'accounts.t_dest']]
                                   : [['operationdate', 'accounts.t_date', 2], ['debitaccno', 'accounts.t_debit'], ['creditaccno', 'accounts.t_credit'], ['creditamount', 'accounts.t_amount', 1], ['lamount', 'accounts.t_lamount', 1], ['destination', 'accounts.t_dest']];
      root.innerHTML = `<div class="backdrop"><div class="modal wide"><h3>${esc(t('accounts.transactions'))} · ${esc(r.accno)}</h3>
        <div class="filters"><div class="field"><label>${esc(t('history.from'))}</label><input type="date" id="ts" value="${r.start}"></div><div class="field"><label>${esc(t('history.to'))}</label><input type="date" id="te" value="${r.end}"></div></div>
        <div class="tabs"><button class="${tab === 'debit' ? 'on' : ''}" data-tab="debit">${esc(t('accounts.tab_debit'))} (${r.debit.length})</button><button class="${tab === 'credit' ? 'on' : ''}" data-tab="credit">${esc(t('accounts.tab_credit'))} (${r.credit.length})</button></div>
        <div class="tablewrap" style="max-height:45vh"><table class="grid"><thead><tr>${cols.map(c => `<th style="${c[2] === 1 ? 'text-align:right' : ''}">${esc(t(c[1]))}</th>`).join('')}</tr></thead>
        <tbody>${rows.map(x => `<tr>${cols.map(c => `<td style="${c[2] === 1 ? 'text-align:right' : ''}">${esc(c[2] === 1 ? money(x[c[0]]) : c[2] === 2 ? fmtDate(x[c[0]]) : x[c[0]])}</td>`).join('')}</tr>`).join('')}</tbody></table></div>
        <div class="totals"><span>${esc(t('accounts.total'))}: <b>${money(tab === 'debit' ? r.debit_total : r.credit_total)}</b></span><span>${esc(t('accounts.total_l'))}: <b>${money(tab === 'debit' ? r.debit_ltotal : r.credit_ltotal)}</b></span></div>
        <div class="actions"><button class="btn secondary" id="texp">${esc(t('history.export'))}</button><button class="btn" id="tok">${esc(t('common.close'))}</button></div></div></div>`;
      const ts = root.querySelector('#ts'), te = root.querySelector('#te');
      // StartDateEditChange / EndDateEditChange -> RefreshTransactions
      ts.onchange = te.onchange = () => show(ts.value, te.value);
      root.querySelectorAll('[data-tab]').forEach(b => b.onclick = () => show(ts.value, te.value, b.dataset.tab));
      root.querySelector('#tok').onclick = () => root.innerHTML = '';
      root.querySelector('#texp').onclick = () => csv(`transactions-${r.accno}-${tab}.csv`, cols.map(c => [c[0], t(c[1])]), rows);   // F3 export
      root.querySelector('.modal').onkeydown = (e) => { if (e.key === 'Escape') root.innerHTML = ''; };
    };
    show();
  }

  async function statesDialog(id) {
    let rows; try { rows = await api(`/api/accounts/${id}/states`); } catch (e) { return toast(t(e.key, e), 'error'); }
    const cols = [['archivedate', 'accounts.s_date', 2], ['amount', 'accounts.col_amount', 1], ['lamount', 'accounts.col_lamount', 1], ['debitturnover', 'accounts.s_dt', 1], ['debitlturnover', 'accounts.s_dtl', 1], ['creditturnover', 'accounts.s_ct', 1], ['creditlturnover', 'accounts.s_ctl', 1]];
    modal(`<h3>${esc(t('accounts.states'))}</h3><div class="tablewrap" style="max-height:55vh"><table class="grid"><thead><tr>${cols.map(c => `<th style="${c[2] === 1 ? 'text-align:right' : ''}">${esc(t(c[1]))}</th>`).join('')}</tr></thead><tbody>
      ${rows.map(x => `<tr>${cols.map(c => `<td style="${c[2] === 1 ? 'text-align:right' : ''}">${esc(c[2] === 1 ? money(x[c[0]]) : fmtDate(x[c[0]]))}</td>`).join('')}</tr>`).join('')}</tbody></table></div>
      <div class="actions"><button class="btn secondary" id="sexp">${esc(t('history.export'))}</button><button class="btn" id="sok">${esc(t('common.close'))}</button></div>`, (m, close) => {
      m.classList.add('wide'); m.querySelector('#sok').onclick = close;
      m.querySelector('#sexp').onclick = () => rows.length && csv('account-states.csv', cols.map(c => [c[0], t(c[1])]), rows);   // F3 only if RecordCount>0
    });
  }

  window.SB.pages['/m/accounts'] = async (el) => {
    el.innerHTML = '<div class="spinner"></div>';
    try { st.lk = await api('/api/accounts/lookups'); } catch (e) { el.innerHTML = `<div class="card">${errHtml(e)}</div>`; return; }
    page(el);
  };
})();

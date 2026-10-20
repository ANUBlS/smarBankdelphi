/* Deposits manager – port of Delphi NewDepositsManager (TNewDepositsManagerImpl, NewDepositsManagerForm.pas).
   Rules run in the API (api/app/deposits.py). The plugin forms (NewDeposits*.bpl) are not migrated yet. */
(function () {
  const { api, t, esc, toast } = window.SB;
  const fmtD = (v) => window.SB.fmtD(v), fmtN = (v) => window.SB.fmtN(v);
  const MONEY = new Set(['AMOUNT', 'INTEREST', 'FACTICALDEBT', 'FACTICALINTERESTDEBT']);       // DisplayFormat '#,##0.00'
  const DATES = new Set(['OPENDATE', 'CLOSEDATE', 'PROLONGATIONDATE', 'STOPCALCDATE']);
  const NUMS = new Set(['ID', 'CUSTOMERID', 'OSTAT', 'AGENTID']);
  // Axtarış Paneli: edit name 'Edit' + field (copy(Name,5,..)) -> SearchRecord field
  const SEARCH = [['CONTRACTNO', 'search_contractno'], ['ID', 'search_id'], ['CUSTOMERID', 'search_customerid'], ['FACTICALDEBT', 'search_facticaldebt'],
    ['CUSTOMERNAME', 'search_customername'], ['FACTICALINTERESTDEBT', 'search_facticalinterestdebt'], ['AGENTID', 'search_agentid'], ['OSTAT', 'search_ostat']];
  const K = (k, p) => t('deposits.' + k, p);
  const st = { init: null, rows: [], cur: null, sel: new Set(), order: null, desc: false, filtered: false, f: {}, showFilter: false, showSearch: false };
  const errText = (e) => (e.key ? t(e.key, e) : String(e)) + (e.ora ? ' — ' + e.ora : '');

  const body = () => ({ order: st.order, desc: st.desc, filtered: st.filtered, filter: st.f });
  async function load(el, keepId) {
    try {
      const r = await api('/api/deposits/list', { method: 'POST', body: body() });
      st.rows = r.rows; st.lastFilter = r.filter;
      const id = keepId ?? st.cur;
      st.cur = st.rows.some(x => x.id === id) ? id : (st.rows[0] ? st.rows[0].id : null);
      st.sel = new Set(st.cur != null ? [st.cur] : []);
      grid(el);
    } catch (e) { toast(errText(e), 'error'); }
  }
  // ActnFilterExecute: Filtered := False; Filter := BuildFilterString; Filtered := True
  const applyFilter = (el) => { st.filtered = true; load(el); };

  function grid(el) {
    const cols = st.init.grid;
    el.querySelector('#dGrid').innerHTML = `<div class="tablewrap" style="max-height:62vh"><table class="grid acc-grid" style="white-space:nowrap"><thead><tr>
      ${cols.map(c => `<th class="sortable" data-f="${c}" style="${MONEY.has(c) || NUMS.has(c) ? 'text-align:right' : ''}">${esc(K('f_' + c))}${st.order === c ? (st.desc ? ' ▼' : ' ▲') : ''}</th>`).join('')}</tr></thead><tbody>
      ${st.rows.map(r => `<tr data-id="${r.id}" class="${st.sel.has(r.id) ? 'sel' : ''}">${cols.map(c => {
        const v = r[c.toLowerCase()];
        const txt = MONEY.has(c) ? fmtN(v) : DATES.has(c) ? fmtD(v) : (v ?? '');
        return `<td style="${MONEY.has(c) || NUMS.has(c) ? 'text-align:right;font-variant-numeric:tabular-nums' : ''}">${esc(txt)}</td>`; }).join('')}</tr>`).join('')
      || `<tr><td colspan="${cols.length}" class="muted">${esc(K('empty'))}</td></tr>`}</tbody></table></div>
      <div class="gridfoot"><span class="muted">${esc(K('shown', { n: st.rows.length }))}</span>${st.filtered && st.lastFilter ? `<code class="muted" style="margin-left:12px">${esc(st.lastFilter)}</code>` : ''}</div>`;
    el.querySelectorAll('#dGrid th[data-f]').forEach(th => th.onclick = () => {     // MainGridTitleClick: FieldName ASC / DESC
      const f = th.dataset.f; st.desc = st.order === f ? !st.desc : false; st.order = f; load(el);
    });
    el.querySelectorAll('#dGrid tr[data-id]').forEach(tr => {
      const id = +tr.dataset.id;
      tr.onclick = (e) => {            // dgExtendedSelect: Ctrl+click adds to SelectedRows
        if (e.ctrlKey || e.metaKey) { st.sel.has(id) ? st.sel.delete(id) : st.sel.add(id); } else st.sel = new Set([id]);
        st.cur = id; el.querySelectorAll('#dGrid tr[data-id]').forEach(x => x.classList.toggle('sel', st.sel.has(+x.dataset.id)));
      };
      tr.ondblclick = () => { st.cur = id; plugin(el, 'contract_look'); };               // MainGridDblClick
      tr.oncontextmenu = (e) => { if (!st.sel.has(id)) { st.sel = new Set([id]); st.cur = id; grid(el); } popup(el, e); };
    });
  }

  async function plugin(el, key) {
    try {
      const r = await api('/api/deposits/plugin/' + key, { method: 'POST' });
      if (!r.migrated) toast(K('not_migrated', { bpl: r.bpl + (r.param ? ' (' + r.param + ')' : '') }), 'info');
      if (key === 'prolongation') load(el);      // N9Click: DmDataSet.Refresh after the plugin
    } catch (e) { toast(errText(e), 'error'); }
  }
  async function closeDeposit(el) {                // N18Click
    if (st.cur == null) return;
    if (!confirm(st.sel.size > 1 ? K('confirm_close_sel') : K('confirm_close'))) return;
    try { await api(`/api/deposits/${st.cur}/close`, { method: 'POST' }); toast(K('closed_pending')); load(el); } catch (e) { toast(errText(e), 'error'); }
  }
  async function toggleCalc(el) {                  // N19Click
    if (st.cur == null) { toast(K('err_no_deposit'), 'error'); return; }       // Get_SelectedContID: 'Heç bir Depozit seçilməyib!'
    try {
      const { enabled } = await api(`/api/deposits/${st.cur}/calc`);
      if (!confirm(enabled ? K('confirm_calc_stop') : K('confirm_calc_resume'))) return;
      await api(`/api/deposits/${st.cur}/calc`, { method: 'POST', body: { enabled } }); toast(K('calc_pending'));
    } catch (e) { toast(errText(e), 'error'); }
  }
  function refresh(el) { if (st.rows.length) load(el, st.cur); }                 // N28Click: only when RecordCount > 0
  async function exportXlsx(el) {                  // BitBtnexpClick
    const res = await fetch('/api/deposits/export.xlsx', { method: 'POST', headers: { 'Content-Type': 'application/json', 'X-CSRF': window.SB.csrf || '' }, credentials: 'same-origin', body: JSON.stringify(body()) });
    if (!res.ok) { const j = await res.json().catch(() => ({})); toast(errText(j.detail || { key: 'error.generic' }), 'error'); return; }
    const a = document.createElement('a'); a.href = URL.createObjectURL(await res.blob()); a.download = 'Depozitler.xlsx'; a.click();
  }

  const opsItems = (el) => [                       // ActionsMenu (toolbar Əməliyyatlar)
    { label: K('m_deposit'), onClick: () => plugin(el, 'apply_money') },
    { label: K('m_withdraw'), onClick: () => plugin(el, 'extract_money') },
    { label: K('m_capitalize'), onClick: () => plugin(el, 'capitalize') },
    { label: K('m_untimely'), onClick: () => plugin(el, 'untimely') },
    { label: K('m_percent'), onClick: () => plugin(el, 'percent_converting') },
    { label: K('m_prolongation'), onClick: () => plugin(el, 'prolongation') },
    { label: K('m_shedule'), onClick: () => plugin(el, 'shedule') }];
  const settItems = (el) => [                      // PopupMenuSettings (N1 and N6's own caption have no handler)
    { label: K('s_cccgroups'), onClick: () => plugin(el, 'sett_cccgroups') },
    { label: K('s_categories'), onClick: () => plugin(el, 'sett_categories') },
    { label: K('s_deposittypes'), onClick: () => plugin(el, 'sett_deposittypes') },
    { label: K('s_accountturning'), onClick: () => plugin(el, 'sett_accountturning') },
    { label: K('s_print'), items: [{ label: K('s_wrsetup'), onClick: () => plugin(el, 'sett_wrsetup') }, { label: K('s_wrgroups'), onClick: () => plugin(el, 'sett_wrgroups') }] },
    { label: K('s_percent'), onClick: () => plugin(el, 'sett_percent') },
    { label: K('s_balance'), onClick: () => plugin(el, 'sett_balance') }];
  const repItems = (el) => [                       // RepairMenu (Hesabatlar); N31 / N33 have no handler
    { label: K('r_period'), onClick: () => {} }, { label: K('r_mis'), onClick: () => plugin(el, 'rep_mis') },
    { label: K('r_balance'), onClick: () => {} }, { label: K('r_control'), onClick: () => plugin(el, 'rep_control') },
    { label: K('r_logs'), onClick: () => plugin(el, 'rep_logs') }];
  function popup(el, e) {                          // LastPopupMenu (MainGrid.PopupMenu)
    window.SB.contextMenu(e, [
      { label: K('m_contract'), items: [
        { label: K('m_new'), shortcut: 'Ctrl+N', onClick: () => plugin(el, 'contract_insert') },
        { label: K('m_edit'), shortcut: 'Ctrl+E', onClick: () => plugin(el, 'contract_edit') },
        { label: K('m_close'), shortcut: 'F8', onClick: () => closeDeposit(el) },
        { label: K('m_calc'), onClick: () => toggleCalc(el) },
        { label: K('m_print_ops'), onClick: () => {} },
        { label: K('m_print_contract'), onClick: () => plugin(el, 'wreport') }] },
      { label: K('m_operations'), items: [
        { label: K('m_deposit'), shortcut: 'Ctrl+D', onClick: () => plugin(el, 'apply_money') },
        { label: K('m_withdraw'), shortcut: 'Ctrl+M', onClick: () => plugin(el, 'extract_money') },
        { label: K('m_capitalize'), shortcut: 'Ctrl+T', onClick: () => {} },               // N24: no OnClick
        { label: K('m_percent'), shortcut: 'Ctrl+P', onClick: () => plugin(el, 'percent_converting') },
        { label: K('m_prolongation'), onClick: () => plugin(el, 'prolongation') }] },
      { label: K('refresh'), disabled: true },                                             // N28 -> ActnRefresh (no OnExecute)
      { label: K('m_filter_plugin'), shortcut: 'Ctrl+F', onClick: () => plugin(el, 'filter') },
      { label: K('m_search'), shortcut: 'Ctrl+Shift+S', checked: st.showSearch, onClick: () => { st.showSearch = !st.showSearch; panels(el); } },
      { label: K('m_accounts'), onClick: () => plugin(el, 'statement') }]);
  }
  const dropAt = (btn) => { const r = btn.getBoundingClientRect(); return { preventDefault() {}, clientX: r.left, clientY: r.bottom + 2 }; };

  function panels(el) {
    el.querySelector('#dFilterPanel').style.display = st.showFilter ? '' : 'none';
    el.querySelector('#dSearch').style.display = st.showSearch ? '' : 'none';
    el.querySelector('#dFilter').classList.toggle('active', st.showFilter);
  }
  function filterPanel(el) {
    const L = st.init.lookups, f = st.f;
    const sel = (id, list, key, lab, val) => `<select id="${id}">${list.map(x => `<option value="${esc(x[key])}" ${String(x[key]) === String(val) ? 'selected' : ''}>${esc(x[lab])}</option>`).join('')}</select>`;
    const grp = (cap, cb, inner) => `<fieldset class="dgrp"><legend>${esc(K(cap))}</legend><label><input type="checkbox" id="${cb}" ${f[cb] ? 'checked' : ''}> ${esc(K('apply'))}</label>${inner}</fieldset>`;
    el.querySelector('#dFilterPanel').innerHTML = `<div style="display:flex;justify-content:flex-end"><button class="btn secondary" id="dFx" title="${esc(K('close_panel'))}">✕</button></div>
      <div style="display:flex;gap:10px;flex-wrap:wrap;align-items:flex-start">
      ${grp('g_currency', 'cb_currency', sel('dCur', L.valutes, 'valute', 'valu_name', f.currency))}
      ${grp('g_categories', 'cb_persons', sel('dCat', L.categories, 'id', 'category', f.category))}
      ${grp('g_persons', 'cb_clienttype', sel('dPer', L.persons, 'id', 'name', f.person))}
      ${grp('g_filial', 'cb_filial', sel('dFil', L.filials, 'id', 'name', f.filial))}
      ${grp('g_types', 'cb_contracttype', sel('dTyp', L.types, 'id', 'type', f.contracttype))}
      ${grp('g_status', 'cb_status', `<select id="dSt"><option value="0" ${f.status_index === 0 ? 'selected' : ''}>${esc(K('st_calc'))}</option><option value="1" ${f.status_index === 1 ? 'selected' : ''}>${esc(K('st_stopped'))}</option></select>`)}
      ${grp('g_opendate', 'cb_opendat', `<input type="date" id="dD1" value="${esc(f.d1 || '')}"> – <input type="date" id="dD2" value="${esc(f.d2 || '')}">`)}
      <fieldset class="dgrp"><legend>&nbsp;</legend><button class="btn" id="dExp">${esc(K('export'))}</button></fieldset></div>`;
    const q = (s) => el.querySelector(s);
    q('#dFx').onclick = () => togglePanel(el);
    // CheckBox OnClick = CBCurrencyClick (except CBStatus: no OnClick); combos / pickers OnChange -> filter
    ['cb_currency', 'cb_persons', 'cb_clienttype', 'cb_filial', 'cb_contracttype', 'cb_opendat'].forEach(id => q('#' + id).onchange = (e) => { f[id] = e.target.checked; applyFilter(el); });
    q('#cb_status').onchange = (e) => { f.cb_status = e.target.checked; };
    [['#dCur', 'currency'], ['#dCat', 'category'], ['#dPer', 'person'], ['#dFil', 'filial'], ['#dTyp', 'contracttype'], ['#dSt', 'status_index']].forEach(([s, k]) => q(s).onchange = (e) => { f[k] = +e.target.value; applyFilter(el); });
    [['#dD1', 'd1'], ['#dD2', 'd2']].forEach(([s, k]) => q(s).onchange = (e) => { f[k] = e.target.value || null; applyFilter(el); });
    q('#dExp').onclick = () => exportXlsx(el);
  }
  function togglePanel(el) {                       // TBFilterationClick: toggle + both pickers := bank date
    st.showFilter = !st.showFilter; st.f.d1 = st.f.d2 = st.init.bank_date; filterPanel(el); panels(el);
  }
  function searchPanel(el) {
    el.querySelector('#dSearch').innerHTML = `<div style="display:flex;gap:8px;flex-wrap:wrap">${SEARCH.map(([f, k]) => `<label class="field" style="min-width:150px"><span>${esc(K(k))}</span><input data-sf="${f}"></label>`).join('')}</div>`;
    el.querySelectorAll('[data-sf]').forEach(inp => inp.onkeydown = (ev) => {
      if (ev.key !== 'Enter') return;              // EditContractNoKeyPress -> ActnSearchExecute
      const f = inp.dataset.sf.toLowerCase(), q = inp.value.toUpperCase();
      const hit = (r) => String(r[f] ?? '').toUpperCase().startsWith(q);         // srIgnoreCase + srPartialMatch on AsString
      st.sel = new Set();                                                        // MainGrid.SelectedRows.Clear
      const start = Math.max(0, st.rows.findIndex(r => r.id === st.cur));
      let i = st.rows.findIndex((r, j) => j >= start && hit(r));                  // srFromCurrent, srForward
      if (i < 0 && confirm(K('search_wrap'))) { i = st.rows.findIndex(hit); if (i < 0) alert(K('search_none')); }
      if (i >= 0) { st.cur = st.rows[i].id; st.sel = new Set([st.cur]); }
      grid(el); el.querySelector(`#dGrid tr[data-id="${st.cur}"]`)?.scrollIntoView({ block: 'nearest' });
    });
  }

  function page(el) {
    el.innerHTML = `<div class="card"><div class="toolbar" style="gap:8px;flex-wrap:wrap">
      <h2 style="margin:0 12px 0 0">${esc(K('title'))}</h2>
      <button class="btn" id="dNew">＋ ${esc(K('new_contract'))}</button><button class="btn secondary" id="dEdit">${esc(K('edit'))}</button>
      <button class="btn secondary" id="dRefresh">⟳ ${esc(K('refresh'))}</button>
      <button class="btn secondary" id="dOps">${esc(K('operations'))} ▾</button><button class="btn secondary" id="dSett">${esc(K('settings'))} ▾</button>
      <button class="btn secondary" id="dRep">${esc(K('reports'))} ▾</button><button class="btn secondary" id="dFilter">${esc(K('filter'))}</button></div>
      <div id="dFilterPanel" class="card" style="margin-top:8px;display:none"></div>
      <fieldset id="dSearch" class="dgrp" style="margin-top:8px;display:none"></fieldset>
      <div id="dGrid" style="margin-top:10px"><div class="spinner"></div></div></div>`;
    const q = (s) => el.querySelector(s);
    q('#dNew').onclick = () => plugin(el, 'contract_insert');
    q('#dEdit').onclick = () => plugin(el, 'contract_edit');
    q('#dRefresh').onclick = () => refresh(el);
    q('#dOps').onclick = (e) => { e.stopPropagation(); window.SB.contextMenu(dropAt(q('#dOps')), opsItems(el)); };
    q('#dSett').onclick = async (e) => {            // ToolButton9MouseActivate: CheckAdvancedObjectAccess('DM_ADMIN') first
      e.stopPropagation();
      try { await api('/api/deposits/settings-menu', { method: 'POST' }); window.SB.contextMenu(dropAt(q('#dSett')), settItems(el)); } catch (x) { toast(errText(x), 'error'); }
    };
    q('#dRep').onclick = (e) => { e.stopPropagation(); window.SB.contextMenu(dropAt(q('#dRep')), repItems(el)); };
    q('#dFilter').onclick = () => togglePanel(el);
    filterPanel(el); searchPanel(el); panels(el);
    el.tabIndex = -1;
    el.onkeydown = (e) => {                        // menu ShortCuts
      const k = e.key.toUpperCase(), c = e.ctrlKey || e.metaKey;
      const map = c && e.shiftKey ? { S: () => { st.showSearch = !st.showSearch; panels(el); } }
        : c ? { N: () => plugin(el, 'contract_insert'), E: () => plugin(el, 'contract_edit'), D: () => plugin(el, 'apply_money'), M: () => plugin(el, 'extract_money'),
                P: () => plugin(el, 'percent_converting'), F: () => plugin(el, 'filter'), T: () => {} }
          : { F8: () => closeDeposit(el) };
      const fn = map[k]; if (fn && !(e.target.tagName === 'INPUT' && !c)) { e.preventDefault(); fn(); }
    };
    load(el);
  }

  window.SB.pages['/m/newdepositsmanager'] = async (el) => {
    el.innerHTML = '<div class="spinner"></div>';
    try { st.init = await api('/api/deposits/init'); } catch (e) { el.innerHTML = `<div class="card"><div class="alert error">${esc(errText(e))}</div></div>`; return; }
    Object.assign(st, { rows: [], cur: null, sel: new Set(), order: null, desc: false, filtered: false, showFilter: false, showSearch: false });
    st.f = { cb_currency: false, cb_filial: false, cb_contracttype: false, cb_persons: false, cb_clienttype: false, cb_status: false, cb_opendat: false, ...st.init.defaults };
    page(el);
  };
})();

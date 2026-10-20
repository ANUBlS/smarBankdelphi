/* Deposits manager – port of the production Delphi module DepositsManager_New (TDepositsManager_new,
   Packages/DepositsManager_New/DepositsManagerImpl_new.pas). Rules run in the API (api/app/deposits.py).
   The plugin forms (SBDM_*_new.bpl) open through window.SB.depForms once ported. */
(function () {
  const { api, t, esc, toast } = window.SB;
  const fmtD = (v) => window.SB.fmtD(v), fmtN = (v) => window.SB.fmtN(v);
  const MONEY = new Set(['AMOUNT', 'FACTICALDEBT', 'FACTICALINTERESTDEBT']);            // DisplayFormat '#,##0.00'
  const DATES = new Set(['OPENDATE', 'CLOSEDATE', 'STOPCALCULATIONDATE']);
  // Axtarış Paneli: edit name 'Edit' + field (copy(Name,5,..)) -> SearchRecord field; only EditContractNo clears OnExit
  const SEARCH = [['CONTRACTNO', 'search_contractno'], ['CONTRACTACCNO', 'search_contractaccno'], ['INTERESTACCNO', 'search_interestaccno'],
    ['STOPCALCULATIONDATE', 'search_stopcalculationdate'], ['FACTICALDEBT', 'search_facticaldebt'], ['CUSTOMERNAME', 'search_customername']];
  const K = (k, p) => t('deposits.' + k, p);
  const st = { init: null, rows: [], cur: null, sel: [], filtered: false, f: {}, showFilter: false, showSearch: false };
  const errText = (e) => (e.key ? t(e.key, e) : String(e)) + (e.ora ? ' — ' + e.ora : '');
  const noDep = () => { toast(K('err_no_deposit'), 'error'); };                     // Get_SelectedContID: 'Heç bir Depozit seçilməyib!'

  const body = () => ({ filtered: st.filtered, filter: st.f });
  async function load(el, keepId) {
    try {
      const r = await api('/api/deposits/list', { method: 'POST', body: body() });
      st.rows = r.rows; st.lastFilter = r.filter;
      const id = keepId ?? st.cur;                                    // Locate('ID',SaveID,[]) / first record
      st.cur = keepId != null && st.rows.some(x => x.id === id) ? id : (st.rows[0] ? st.rows[0].id : null);
      st.sel = [];                                                    // MainGrid.SelectedRows.Clear
      grid(el);
    } catch (e) { toast(errText(e), 'error'); }
  }
  // ActnFilterExecute :590-602: SelectedRows.Clear; Filtered := False; Filter := BuildFilterString; Filtered := True
  const applyFilter = (el) => { st.filtered = true; load(el); };

  function grid(el) {
    const cols = st.init.grid;
    el.querySelector('#dGrid').innerHTML = `<div class="tablewrap" style="max-height:62vh"><table class="grid acc-grid" style="white-space:nowrap"><thead><tr>
      ${cols.map(c => `<th style="${MONEY.has(c) ? 'text-align:right' : ''}">${esc(K('f_' + c))}</th>`).join('')}</tr></thead><tbody>
      ${st.rows.map(r => `<tr data-id="${r.id}" class="${r.id === st.cur ? 'cur' : ''} ${st.sel.includes(r.id) ? 'sel' : ''}">${cols.map(c => {
        const v = r[c.toLowerCase()];
        const txt = MONEY.has(c) ? fmtN(v) : DATES.has(c) ? fmtD(v) : (v ?? '');
        return `<td style="${MONEY.has(c) ? 'text-align:right;font-variant-numeric:tabular-nums' : ''}">${esc(txt)}</td>`; }).join('')}</tr>`).join('')
      || `<tr><td colspan="${cols.length}" class="muted">${esc(K('empty'))}</td></tr>`}</tbody></table></div>
      <div class="gridfoot"><span class="muted">${esc(K('shown', { n: st.rows.length }))} · ${esc(K('sel_hint'))}</span>${st.filtered && st.lastFilter ? `<code class="muted" style="margin-left:12px">${esc(st.lastFilter)}</code>` : ''}</div>`;
    el.querySelectorAll('#dGrid tr[data-id]').forEach(tr => {
      const id = +tr.dataset.id;
      tr.onclick = (e) => {            // dgExtendedSelect / dgMarkerAutoToggle: Ctrl+click toggles the row in SelectedRows
        if (e.ctrlKey || e.metaKey) st.sel = st.sel.includes(id) ? st.sel.filter(x => x !== id) : [...st.sel, id];
        else st.sel = [id];
        st.cur = id; paintSel(el);
      };
      tr.oncontextmenu = (e) => { st.cur = id; paintSel(el); popup(el, e); };
    });
  }
  const paintSel = (el) => el.querySelectorAll('#dGrid tr[data-id]').forEach(x => {
    x.classList.toggle('sel', st.sel.includes(+x.dataset.id)); x.classList.toggle('cur', +x.dataset.id === st.cur); });

  async function plugin(el, key) {
    try {
      const r = await api('/api/deposits/plugin/' + key, { method: 'POST' });         // handler right check, then LoadPlugin
      const form = (window.SB.depForms || {})[key];
      if (r.migrated && form) { const cur = st.rows.find(x => x.id === st.cur); return form(cur ? { id: cur.id, no: cur.contractno } : null, el); }
      const bpl = r.bpl + (r.param ? ' (' + r.param + ')' : '');
      toast(r.on_hold ? K('on_hold', { bpl }) : K('not_migrated', { bpl }), 'info');
    } catch (e) { toast(errText(e), 'error'); }
  }
  async function closeDeposit(el) {                // N18Click :767-800
    try { await api('/api/deposits/right/SBCM_CLOSE_CONTRACT', { method: 'POST' }); } catch (e) { toast(errText(e), 'error'); return; }
    if (!confirm(st.sel.length > 1 ? K('confirm_close_sel') : K('confirm_close'))) return;
    try {
      const r = await api('/api/deposits/close', { method: 'POST', body: { ids: st.sel } });
      toast(r.closed ? K('closed_pending') : K('closed_none'), r.closed ? 'success' : 'info');
      load(el);                                    // DataSet.Refresh (current record kept by position in Delphi; first record here)
    } catch (e) { toast(errText(e), 'error'); load(el); }
  }
  async function toggleCalc(el) {                  // N19Click :802-826
    try {
      await api('/api/deposits/right/SBCM_STOP_START_CALCPERCENT', { method: 'POST' });
      if (st.cur == null) return noDep();
      const { enabled } = await api(`/api/deposits/${st.cur}/calc`);
      if (!confirm(enabled ? K('confirm_calc_stop') : K('confirm_calc_resume'))) return;
      await api(`/api/deposits/${st.cur}/calc`, { method: 'POST', body: { enabled } }); toast(K('calc_pending'));
    } catch (e) { toast(errText(e), 'error'); }
  }
  function refresh(el) {                           // ActnRefreshExecute :604-618
    st.sel = [];
    if (st.cur == null) return noDep();            // Get_SelectedContID raises before Refresh
    load(el, st.cur);
  }
  async function exportXlsx(el) {                  // BitBtnexpClick :477-486
    const res = await fetch('/api/deposits/export.xlsx', { method: 'POST', headers: { 'Content-Type': 'application/json', 'X-CSRF': window.SB.csrf || '' }, credentials: 'same-origin', body: JSON.stringify(body()) });
    if (!res.ok) { const j = await res.json().catch(() => ({})); toast(errText(j.detail || { key: 'error.generic' }), 'error'); return; }
    const a = document.createElement('a'); a.href = URL.createObjectURL(await res.blob()); a.download = 'Depozitler.xlsx'; a.click();
  }

  const opsItems = (el) => [                       // ActionsMenu (toolbar Əməliyyatlar, dfm:1130-1167)
    { label: K('m_deposit'), onClick: () => plugin(el, 'apply_money') },
    { label: K('m_withdraw'), onClick: () => plugin(el, 'extract_money') },
    { label: K('m_partial'), onClick: () => plugin(el, 'partial_payment') },
    { label: K('m_capitalize'), onClick: () => plugin(el, 'capitalize') },
    { label: K('m_untimely'), onClick: () => plugin(el, 'untimely') },
    { label: K('m_percent'), onClick: () => plugin(el, 'percent_converting') },
    { label: K('m_prolongation'), onClick: () => plugin(el, 'prolongation') },
    { label: K('m_shedule'), onClick: () => plugin(el, 'shedule') }];
  const settItems = (el) => [                      // PopupMenuSettings (N1 'Bankın seçmələri' and Hesablarin1 are Visible = False)
    { label: K('s_cccgroups'), onClick: () => plugin(el, 'sett_cccgroups') },
    { label: K('s_categories'), onClick: () => plugin(el, 'sett_categories') },
    { label: K('s_deposittypes'), onClick: () => plugin(el, 'sett_deposittypes') },
    { label: K('s_accountturning'), onClick: () => plugin(el, 'sett_accountturning') },
    { label: K('s_print'), onClick: () => plugin(el, 'sett_wrsetup') },
    { label: K('s_percent'), onClick: () => plugin(el, 'sett_percent') }];
  const repItems = (el) => [                       // RepairMenu (Hesabatlar) - reports are on hold by the user
    { label: K('r_period'), onClick: () => plugin(el, 'rep_period') }, { label: K('r_mis'), onClick: () => plugin(el, 'rep_mis') },
    { label: K('r_balance'), onClick: () => plugin(el, 'rep_balance') }];
  const toggleSearch = (el) => { st.showSearch = !st.showSearch; panels(el); };
  function popup(el, e) {                          // LastPopupMenu (MainGrid.PopupMenu, dfm:1679-1778)
    window.SB.contextMenu(e, [
      { label: K('m_contract'), items: [
        { label: K('m_new'), shortcut: 'Ctrl+N', onClick: () => plugin(el, 'contract_insert') },
        { label: K('m_edit'), shortcut: 'Ctrl+E', onClick: () => plugin(el, 'contract_edit') },
        { label: K('m_close'), shortcut: 'F8', onClick: () => closeDeposit(el) },
        { label: K('m_calc'), onClick: () => toggleCalc(el) },
        { label: K('m_print_ops'), onClick: () => plugin(el, 'rep_contract_ops') },
        { label: K('m_print_contract'), onClick: () => plugin(el, 'wreport') }] },
      { label: K('m_operations'), items: [
        { label: K('m_deposit'), shortcut: 'Ctrl+D', onClick: () => plugin(el, 'apply_money') },
        { label: K('m_withdraw'), shortcut: 'Ctrl+M', onClick: () => plugin(el, 'extract_money') },
        { label: K('m_capitalize'), shortcut: 'Ctrl+T', onClick: () => plugin(el, 'capitalize') },
        { label: K('m_untimely'), shortcut: 'Ctrl+U', onClick: () => plugin(el, 'untimely') },
        { label: K('m_percent'), shortcut: 'Ctrl+P', onClick: () => plugin(el, 'percent_converting') },
        { label: K('m_prolongation'), onClick: () => plugin(el, 'prolongation') }] },
      { label: K('refresh'), onClick: () => refresh(el) },                                 // N28 -> ActnRefresh
      { label: K('m_filter_plugin'), shortcut: 'Ctrl+F', onClick: () => plugin(el, 'filter') },   // N10Click: SBDM_Filter_new.bpl
      { label: K('m_search'), shortcut: 'Ctrl+Alt+S', checked: st.showSearch, onClick: () => toggleSearch(el) }]);
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
    // SpeedButton1 'X' (Panel2) has no OnClick in the dfm: it does nothing
    el.querySelector('#dFilterPanel').innerHTML = `<div style="display:flex;justify-content:flex-end"><button class="btn secondary" id="dFx" title="SpeedButton1">✕</button></div>
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
    q('#dFx').onclick = () => {};
    // The check boxes and the date pickers have no event handler: only the combos (OnChange = DBLookupComboboxEh1Change) filter
    ['cb_currency', 'cb_persons', 'cb_clienttype', 'cb_filial', 'cb_contracttype', 'cb_status', 'cb_opendat'].forEach(id => q('#' + id).onchange = (e) => { f[id] = e.target.checked; });
    [['#dCur', 'currency'], ['#dCat', 'category'], ['#dPer', 'person'], ['#dFil', 'filial'], ['#dTyp', 'contracttype'], ['#dSt', 'status_index']].forEach(([s, k]) => q(s).onchange = (e) => { f[k] = +e.target.value; applyFilter(el); });
    [['#dD1', 'd1'], ['#dD2', 'd2']].forEach(([s, k]) => q(s).onchange = (e) => { f[k] = e.target.value || null; });
    q('#dExp').onclick = () => exportXlsx(el);
  }
  function togglePanel(el) {                       // TBFilterationClick :993-999: toggle + both pickers := bank date
    st.showFilter = !st.showFilter; st.f.d1 = st.f.d2 = st.init.bank_date; filterPanel(el); panels(el);
  }
  function searchPanel(el) {
    el.querySelector('#dSearch').innerHTML = `<legend>${esc(K('m_search'))}</legend><div style="display:flex;gap:8px;flex-wrap:wrap">${SEARCH.map(([f, k]) => `<label class="field" style="min-width:150px"><span>${esc(K(k))}</span><input data-sf="${f}"></label>`).join('')}</div>`;
    el.querySelectorAll('[data-sf]').forEach(inp => {
      if (inp.dataset.sf === 'CONTRACTNO') inp.onblur = () => { inp.value = ''; };           // EditContractNoExit
      inp.onkeydown = (ev) => {
        if (ev.key !== 'Enter') return;              // EditContractNoKeyPress -> ActnSearchExecute :620-666
        const f = inp.dataset.sf.toLowerCase(), q = inp.value.toUpperCase();
        const shown = (r) => DATES.has(inp.dataset.sf) ? fmtD(r[f]) : String(r[f] ?? '');
        const hit = (r) => shown(r).toUpperCase().startsWith(q);                  // srIgnoreCase + srPartialMatch on AsString
        st.sel = [];                                                              // MainGrid.SelectedRows.Clear
        const start = Math.max(0, st.rows.findIndex(r => r.id === st.cur));
        let i = st.rows.findIndex((r, j) => j >= start && hit(r));                // srFromCurrent, srForward
        if (i < 0 && confirm(K('search_wrap'))) { i = st.rows.findIndex(hit); if (i < 0) alert(K('search_none')); }
        if (i >= 0) st.cur = st.rows[i].id;
        grid(el); el.querySelector(`#dGrid tr[data-id="${st.cur}"]`)?.scrollIntoView({ block: 'nearest' });
      };
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
    q('#dSett').onclick = (e) => { e.stopPropagation(); window.SB.contextMenu(dropAt(q('#dSett')), settItems(el)); };
    q('#dRep').onclick = (e) => { e.stopPropagation(); window.SB.contextMenu(dropAt(q('#dRep')), repItems(el)); };
    q('#dFilter').onclick = () => togglePanel(el);
    filterPanel(el); searchPanel(el); panels(el);
    el.tabIndex = -1;
    el.onkeydown = (e) => {                        // LastPopupMenu ShortCuts
      const k = e.key.toUpperCase(), c = e.ctrlKey || e.metaKey;
      const map = c && e.altKey ? { S: () => toggleSearch(el) }
        : c ? { N: () => plugin(el, 'contract_insert'), E: () => plugin(el, 'contract_edit'), D: () => plugin(el, 'apply_money'), M: () => plugin(el, 'extract_money'),
                T: () => plugin(el, 'capitalize'), U: () => plugin(el, 'untimely'), P: () => plugin(el, 'percent_converting'), F: () => plugin(el, 'filter') }
          : { F8: () => closeDeposit(el) };
      const fn = map[k]; if (fn && !(e.target.tagName === 'INPUT' && !c)) { e.preventDefault(); fn(); }
    };
    load(el);
  }

  // Shared helpers of the ported plugin forms (deposits_*.js)
  window.SB.dep = {
    errText, K,
    errHtmlInner: (e) => esc(e.key ? t(e.key, e) : String(e)) + (e.ora ? `<span class="ora">${esc(e.ora)}</span>` : ''),
    modal(html, onMount, cls) {                    // stacked modal (the BPL forms are modal over the manager)
      const d = document.createElement('div'); d.className = 'backdrop stacked';
      d.innerHTML = `<div class="modal ${cls || ''}" role="dialog">${html}</div>`; document.body.appendChild(d);
      const close = () => d.remove(); onMount && onMount(d.querySelector('.modal'), close); return close;
    },
    reloadMain(clearSel) {                         // RefreshWithSavely(True, rmMoveRecNoAfterRefresh)
      if (!st.el) return;
      const i = Math.max(0, st.rows.findIndex(x => x.id === st.cur));
      api('/api/deposits/list', { method: 'POST', body: body() }).then(r => {
        st.rows = r.rows; st.lastFilter = r.filter;
        const j = Math.min(i, st.rows.length - 1); st.cur = j >= 0 ? st.rows[j].id : null;
        st.sel = []; grid(st.el);
      }).catch(e => toast(errText(e), 'error'));
    },
    current: () => st.rows.find(x => x.id === st.cur) || null,
  };

  window.SB.pages['/m/depositsmanager-new'] = async (el) => {
    st.el = el;
    el.innerHTML = '<div class="spinner"></div>';
    try { st.init = await api('/api/deposits/init'); } catch (e) { el.innerHTML = `<div class="card"><div class="alert error">${esc(errText(e))}</div></div>`; return; }
    Object.assign(st, { rows: [], cur: null, sel: [], filtered: false, showFilter: false, showSearch: false });
    st.f = { cb_currency: false, cb_filial: false, cb_contracttype: false, cb_persons: false, cb_clienttype: false, cb_status: false, cb_opendat: false, ...st.init.defaults };
    page(el);
  };
})();

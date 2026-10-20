/* Rate difference report – port of Packages/RateDifferenceReport (TRateDifferenceReportX, RateDifferenceReportImpl.pas/.dfm,
   ReportDataModule). Layout as the Delphi form: ToolBar1 (Yeniləmək F5 / Hesabat Ctrl+P / Axtarış Alt+F), Panel3 on the
   left with PageControl1 'Seçimlər' (Tarix, Valyuta / Filial / Operator seçimi), TransactionViewer on the right and the
   hidden PanelSearch under it. Hesabat (QuickReport TQReport) is on hold. SQL in api/app/ratedifferencereport.py. */
(function () {
  const { api, t, esc, toast } = window.SB;
  const P = '/api/ratedifferencereport', T = (k, p) => t('rdr.' + k, p);
  const errT = (e) => t(e.key || 'error.generic', e) + (e.ora ? ' ' + e.ora : '');
  const fG = (v) => v === null || v === undefined || v === '' ? '' : String(v).replace('.', ',');   // FloatToStr
  const fL = (v) => {                                   // DisplayFormat '#,##.00' (no forced integer digit)
    if (v === null || v === undefined || v === '') return '';
    const n = Number(v); if (isNaN(n)) return String(v);
    const s = Math.abs(n).toFixed(2).split('.'); const ip = s[0] === '0' ? '' : s[0].replace(/\B(?=(\d{3})+(?!\d))/g, ' ');
    return (n < 0 ? '-' : '') + ip + ',' + s[1];
  };
  // TransactionViewer columns (dfm): FieldName, caption key, width, align
  const COLS = [['RecordNo', 'c_no', 42, 'right'], ['DAT', 'c_dat', 71], ['DEBETACCOUNT', 'c_debet', 190], ['DCURRENCY', 'c_cur', 30, 'center'],
    ['CREDITACCOUNT', 'c_credit', 190], ['CCURRENCY', 'c_cur', 30, 'center'], ['LAMMOUNT', 'c_amount', 104]];
  const cell = (r, f) => f === 'RecordNo' ? String(r.recordno) : f === 'DAT' ? SB.fmtD(r.dat) : f === 'LAMMOUNT' ? fL(r.lammount) : (r[f.toLowerCase()] ?? '');
  const asStr = { DAT: (r) => SB.fmtD(r.dat), DEBETACCOUNT: (r) => r.debetaccount ?? '', CREDITACCOUNT: (r) => r.creditaccount ?? '', LAMMOUNT: (r) => fG(r.lammount) };

  async function page(el) {
    el.innerHTML = '<div class="spinner"></div>';
    let I; try { I = await api(P + '/init'); } catch (e) { el.innerHTML = `<div class="card"><div class="alert error">${esc(errT(e))}</div></div>`; return; }
    const st = { rows: [], i: 0, title: I.title, last: null, search: false };
    const opts = (all, list) => `<option value="">${esc(all)}</option>` + list.map(x => `<option value="${esc(x.id)}">${esc(x.name)}</option>`).join('');
    el.innerHTML = `<div class="card rdr"><div class="toolbar"><h2 style="margin:0">${esc(T('title'))}</h2></div>
      <div class="toolbar" style="gap:6px;margin-top:6px">
        <button class="btn" id="rRefresh" title="F5">${esc(T('refresh'))}</button>
        <button class="btn secondary" id="rReport" title="Ctrl+P">${esc(T('report'))}</button>
        <button class="btn secondary" id="rSearch" title="Alt+F">${esc(T('search'))}</button></div>
      <div style="display:flex;gap:8px;margin-top:8px;align-items:flex-start">
        <div style="width:186px;flex:none;border:1px solid var(--border);border-radius:6px;padding:4px">
          <div class="tabs"><button class="on">${esc(T('tab_options'))}</button></div>
          <fieldset class="cd-g"><legend>${esc(T('g_date'))}</legend>
            <label style="display:block">${esc(T('begin'))} <input type="date" id="rBeg" value="${esc(I.date || '')}" style="width:100%"></label>
            <label style="display:block">${esc(T('end'))} <input type="date" id="rEnd" value="${esc(I.date || '')}" style="width:100%"></label></fieldset>
          <fieldset class="cd-g"><legend>${esc(T('g_currency'))}</legend><select id="rCur" style="width:100%">${opts('Bütün valyutalar', I.currencies)}</select></fieldset>
          <fieldset class="cd-g"><legend>${esc(T('g_filial'))}</legend><select id="rFil" style="width:100%">${opts('Bütün filiallar', I.filials)}</select></fieldset>
          <fieldset class="cd-g"><legend>${esc(T('g_operator'))}</legend><select id="rOp" style="width:100%">${opts('Bütün operatorlar', I.operators)}</select></fieldset>
        </div>
        <div style="flex:1;min-width:0"><div id="rErr"></div><div id="rGrid"></div>
          <div id="rPanelSearch" style="display:none;margin-top:4px;gap:0;border:1px solid var(--border)">
            ${[['EDAT', 'c_dat'], ['EDEBETACCOUNT', 'c_debet'], ['ECREDITACCOUNT', 'c_credit'], ['ELAMMOUNT', 'c_amount']].map(([id, k]) =>
              `<div style="width:185px;display:inline-block;vertical-align:top"><div style="background:#c0c0c0;padding:1px 4px">${esc(T(k))}</div><input id="${id}" data-f="${id.slice(1)}" style="width:181px"></div>`).join('')}
          </div></div></div></div>`;
    const v = (id) => el.querySelector('#' + id);
    const num = (s) => s === '' ? null : Number(s);
    function upd() {                                         // ActionReportUpdate (ActionReport and ActionSearch)
      const empty = st.rows.length === 0; v('rReport').disabled = empty; v('rSearch').disabled = empty;
    }
    function grid() {
      const head = COLS.map(([f, k, w, a]) => `<th data-f="${f}" style="cursor:pointer;min-width:${w}px${a ? ';text-align:' + a : ''}">${esc(T(k))}</th>`).join('');
      const body = st.rows.map((r, i) => `<tr data-i="${i}" class="${i === st.i ? 'sel' : ''}">${COLS.map(([f, , , a]) =>
        `<td style="${a ? 'text-align:' + a + ';' : ''}${f === 'DCURRENCY' || f === 'CCURRENCY' ? 'background:#c0c0c0;' : ''}${f === 'DAT' ? 'background:var(--bg-soft,#f0f0f0);' : ''}">${esc(cell(r, f))}</td>`).join('')}</tr>`).join('');
      v('rGrid').innerHTML = `<div class="tablewrap" style="max-height:60vh;min-height:200px"><table class="grid"><thead><tr>${head}</tr></thead>
        <tbody>${body || `<tr><td colspan="7" class="muted">${esc(T('empty'))}</td></tr>`}</tbody></table></div>`;
      v('rGrid').querySelector('.tablewrap').oncontextmenu = menu;
      v('rGrid').querySelectorAll('tr[data-i]').forEach(tr => { tr.onclick = () => { st.i = +tr.dataset.i; grid(); }; });
      v('rGrid').querySelectorAll('th[data-f]').forEach(th => { th.onclick = () => titleClick(th.dataset.f); });
      const s = v('rGrid').querySelector('tr.sel'); if (s) s.scrollIntoView({ block: 'nearest' });
      upd();
    }
    async function run(body) {
      try { const r = await api(P + '/refresh', { method: 'POST', body }); st.rows = r.rows; st.title = r.title; st.last = body; st.i = 0; v('rErr').innerHTML = ''; grid(); }
      catch (e) { v('rErr').innerHTML = `<div class="alert error">${esc(errT(e))}</div>`; }
    }
    const refresh = () => {                                  // ActionRefreshExecute: current pickers / combos, kept :Title
      if (!v('rBeg').value || !v('rEnd').value) return;
      return run({ beg: v('rBeg').value, end: v('rEnd').value, currency: num(v('rCur').value), filial: num(v('rFil').value), operator: num(v('rOp').value), title: st.title });
    };
    const titleClick = (f) => {                              // TransactionViewerTitleClick: Title := FieldName; Refresh (last SQL + binds)
      if (!st.rows.length || f === 'RecordNo' || !st.last) return;
      return run({ ...st.last, title: f });
    };
    const report = () => { if (st.rows.length) toast(T('on_hold'), 'info'); };          // ActionReportExecute: QReport.Preview
    const search = () => { if (!st.rows.length) return; st.search = !st.search; v('rPanelSearch').style.display = st.search ? 'flex' : 'none'; };
    function menu(ev) {                                      // PopupMenu N1..N5
      SB.contextMenu(ev, [{ label: T('refresh'), shortcut: 'F5', default: true, onClick: refresh }, '-',
        { label: T('report'), shortcut: 'Ctrl+P', disabled: !st.rows.length, onClick: report }, '-',
        { label: T('quick_search'), shortcut: 'Alt+F', disabled: !st.rows.length, onClick: search }]);
    }
    v('rRefresh').onclick = refresh; v('rReport').onclick = report; v('rSearch').onclick = search;
    el.querySelectorAll('#rPanelSearch input').forEach(inp => {
      inp.oninput = () => {                                  // EDATChange: Locate(Name without 'E', Text, [loCaseInsensitive, loPartialKey])
        const q = inp.value.toLowerCase(); const f = asStr[inp.dataset.f];
        const j = st.rows.findIndex(r => String(f(r)).toLowerCase().startsWith(q));
        if (j >= 0) { st.i = j; grid(); }
      };
      inp.onblur = () => { inp.value = ''; };                // EDATExit
    });
    const keys = (e) => {                                    // ActionList shortcuts F5 / Ctrl+P / Alt+F
      if (!el.isConnected) { document.removeEventListener('keydown', keys); return; }
      if (document.querySelector('.modal')) return;
      if (e.key === 'F5') { e.preventDefault(); refresh(); }
      else if (e.ctrlKey && (e.key === 'p' || e.key === 'P')) { e.preventDefault(); report(); }
      else if (e.altKey && (e.key === 'f' || e.key === 'F')) { e.preventDefault(); search(); }
    };
    document.addEventListener('keydown', keys);
    grid();
  }
  window.SB.pages['/m/ratedifferencereport'] = page;
})();

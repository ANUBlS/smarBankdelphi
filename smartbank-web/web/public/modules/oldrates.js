/* Old rates ('Old Courses') – port of Packages/LastRates (TOldRatesFormX = TFrmOldCourses, OldRatesFormImpl.pas/.dfm).
   Layout as the Delphi form: DBGrid1 (Tarix / Val. / Valyutanın kodu / Rəsmi məzənnə) on top, Panel2 at the bottom with
   'Sürətli axtarış' (EDat, EVal_name, EVal_kod, EOstat), 'Tarix' (DTP_BEG, DTP_END) and the Excel button.
   SQL / SBOP calls in api/app/oldrates.py. */
(function () {
  const { api, t, esc, toast } = window.SB;
  const P = '/api/oldrates', T = (k, p) => t('oldrates.' + k, p);
  const errT = (e) => t(e.key || 'error.generic', e) + (e.ora ? ' ' + e.ora : '');
  const fG = (v) => v === null || v === undefined || v === '' ? '' : String(v).replace('.', ',');   // TFloatField: FloatToStr
  // AsString per field (used by Locate and by the grid; no DisplayFormat on any field)
  const asStr = { DAT: (r) => SB.fmtD(r.dat), VAL_NAME: (r) => r.val_name ?? '', VAL_KOD: (r) => r.val_kod ?? '', OSTAT: (r) => fG(r.ostat) };
  const COLS = [['DAT', 'c_dat', 80], ['VAL_NAME', 'c_val', 30], ['VAL_KOD', 'c_kod', 120], ['OSTAT', 'c_ostat', 100]];

  async function download(path, body, name) {
    const res = await fetch(P + path, { method: 'POST', headers: { 'Content-Type': 'application/json', 'X-CSRF': window.SB.csrf || '' }, credentials: 'same-origin', body: JSON.stringify(body) });
    if (!res.ok) { const j = await res.json().catch(() => ({})); throw (j.detail || {}); }
    const a = document.createElement('a'); a.href = URL.createObjectURL(await res.blob()); a.download = name; a.click();
  }

  async function page(el) {
    el.innerHTML = '<div class="spinner"></div>';
    let I; try { I = await api(P + '/init'); } catch (e) { el.innerHTML = `<div class="card"><div class="alert error">${esc(errT(e))}</div></div>`; return; }
    const st = { rows: I.rows, i: 0, title: I.title };
    el.innerHTML = `<div class="card oldrates"><div class="toolbar"><h2 style="margin:0">${esc(T('title'))}</h2></div>
      <div id="oErr"></div>
      <div id="oGrid" style="margin-top:8px"></div>
      <div style="display:flex;gap:10px;flex-wrap:wrap;align-items:stretch;margin-top:8px;padding:6px;border:1px solid var(--border);border-radius:8px">
        <fieldset class="cd-g"><legend>${esc(T('g_search'))}</legend>
          <input id="oDat" style="width:80px" title="${esc(T('c_dat'))}"> <input id="oName" style="width:80px" title="${esc(T('c_val'))}">
          <input id="oKod" style="width:80px" title="${esc(T('c_kod'))}"> <input id="oOstat" style="width:80px" title="${esc(T('c_ostat'))}"></fieldset>
        <fieldset class="cd-g"><legend>${esc(T('g_date'))}</legend>
          <input type="date" id="oBeg" value="${esc(I.date || '')}"> <input type="date" id="oEnd" value="${esc(I.date || '')}"></fieldset>
        <button class="btn" id="oXls" style="min-width:121px;font-weight:bold">Excel</button>
      </div></div>`;
    const v = (id) => el.querySelector('#' + id);
    const params = () => ({ beg: v('oBeg').value, end: v('oEnd').value, title: st.title });
    function grid() {
      const head = COLS.map(([f, k, w]) => `<th data-f="${f}" style="cursor:pointer;min-width:${w}px${f === 'VAL_NAME' ? ';text-align:center' : ''}">${esc(T(k))}</th>`).join('');
      const body = st.rows.map((r, i) => `<tr data-i="${i}" class="${i === st.i ? 'sel' : ''}">${COLS.map(([f]) =>
        `<td${f === 'VAL_NAME' ? ' style="text-align:center;background:#c0c0c0;color:navy;font-size:11px"' : ''}>${esc(asStr[f](r))}</td>`).join('')}</tr>`).join('');
      v('oGrid').innerHTML = `<div class="tablewrap" style="max-height:62vh"><table class="grid"><thead><tr>${head}</tr></thead>
        <tbody>${body || `<tr><td colspan="4" class="muted">${esc(T('empty'))}</td></tr>`}</tbody></table></div>`;
      v('oGrid').querySelectorAll('tr[data-i]').forEach(tr => { tr.onclick = () => { st.i = +tr.dataset.i; grid(); }; });
      v('oGrid').querySelectorAll('th[data-f]').forEach(th => { th.onclick = () => { st.title = th.dataset.f; reopen(); }; });   // DBGrid1TitleClick
      const s = v('oGrid').querySelector('tr.sel'); if (s) s.scrollIntoView({ block: 'nearest' });
    }
    async function reopen() {                                  // ODSCourses.Close / Open
      if (!v('oBeg').value || !v('oEnd').value) return;        // a TDateTimePicker always holds a date
      try { const r = await api(P + '/courses', { method: 'POST', body: params() }); st.rows = r.rows; st.title = r.title; st.i = 0; v('oErr').innerHTML = ''; grid(); }
      catch (e) { v('oErr').innerHTML = `<div class="alert error">${esc(errT(e))}</div>`; }
    }
    // EDatChange / EVal_nameChange / EVal_kodChange / EOstatChange: Locate(field, text, [loCaseInsensitive, loPartialKey])
    const locate = (f, text) => {
      const q = String(text).toLowerCase();
      const j = st.rows.findIndex(r => String(asStr[f](r)).toLowerCase().startsWith(q));
      if (j >= 0) { st.i = j; grid(); }
    };
    v('oDat').oninput = () => locate('DAT', v('oDat').value);
    v('oName').oninput = () => locate('VAL_NAME', v('oName').value);
    v('oKod').oninput = () => locate('VAL_KOD', v('oKod').value);
    v('oOstat').oninput = () => locate('OSTAT', v('oOstat').value);
    v('oBeg').onchange = reopen; v('oEnd').onchange = reopen;  // DTP_BEGChange / DTP_ENDChange
    v('oXls').onclick = async () => {                          // XFSpeedButton1Click: CMExcelExport 'Valyuta məzənnələri'
      try { await download('/excel', params(), 'Valyuta_mezenneleri.xlsx'); } catch (e) { toast(errT(e), 'error'); }
    };
    grid();
  }
  window.SB.pages['/m/oldratesproj'] = page;
})();

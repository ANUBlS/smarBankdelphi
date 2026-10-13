/* XÖHKS – port of Packages/LVPCSSManager_Turan (TLVPCSSForm), step 1: the four tabs' lists and archives.
   Logic in api/app/xohks.py (verbatim Data_Unit.dfm SQL, otSubst titles, BitBtn1 filters). */
(function () {
  const { api, t, esc, toast } = window.SB;
  const P = '/api/xohks', K = (k) => t('xohks.' + k);
  const errT = (e) => t(e.key || 'error.generic', e) + (e.ora ? ' ' + e.ora : '');
  // Visible columns of LVPCSSImpl.dfm (FieldName, Title.Caption). '' = status image column, 'F' = filial image column.
  const C = {
    batchs: [['ID', '№'], ['FILIAL', 'F'], ['STATUS', ''], ['TRANSDATE', 'Tarix'], ['ACC_NO', 'Debet'], ['VAL_NAME', '$'], ['AMOUNT', 'Debet Məbləğ'],
      ['TRANS_REF', 'Qeydiyyat №'], ['USERNAME', 'Modifikator'], ['VUSERID', 'Verifikator'], ['AUSERID', 'Avtorizator'], ['FORMAT', 'Format'], ['SDATE', 'Verifikasiya tarixi']],
    benef: [['ID', '№'], ['STATUS', ''], ['VAL_DATE', 'Tarix'], ['CLIENT_ACC_NO', 'Kredit'], ['VAL_NAME', '$'], ['AMOUNT', 'Kredit Məbləğ'], ['MESS_REFERENCE', 'Qeydiyyat №']],
    inc: [['ID', '№'], ['FILIAL', 'F'], ['STATUS', ''], ['TRANS_DATE', 'Tarix'], ['REFERENCE', 'Qeydiyyat №'], ['SEN_ACC', 'Debet'], ['VAL_NAME', '$'],
      ['REC_CLIENT_ACC', 'Kredit'], ['AMOUNT', 'Debet Məbləğ'], ['DESCRPTIONCORRECT', 'Qeyd']],
  };
  const ST = ['msDefault', 'msCommit', 'msReject', 'msFileCreated', 'msVerifikator', 'msFVerifikator', 'msAvtorizator', 'msReturnBack', 'msReturn'];
  const cell = (r, f) => { const v = r[f.toLowerCase()]; return f === 'STATUS' ? (ST[v] ? K('st_' + ST[v]) : (v ?? '')) : (v ?? ''); };
  function table(id, cols, rows, sortable) {
    return `<table class="grid acc-grid" id="${id}"><thead><tr>${cols.map(([f, c]) => `<th data-c="${esc(c)}" ${sortable ? 'style="cursor:pointer"' : ''}>${esc(c === '' ? K('c_status') : c)}</th>`).join('')}</tr></thead>
      <tbody>${rows.map((r, i) => `<tr data-i="${i}">${cols.map(([f]) => `<td class="${f === 'STATUS' ? 'st st' + r.status : ''}">${esc(cell(r, f))}</td>`).join('')}</tr>`).join('')
      || `<tr><td colspan="${cols.length}" class="muted">${esc(K('empty'))}</td></tr>`}</tbody></table>`;
  }
  const box = (title, inner, h) => `<fieldset class="card" style="margin:8px 0;padding:8px 12px;min-width:0"><legend>${esc(title)}</legend><div class="tablewrap" style="max-height:${h || 30}vh">${inner}</div></fieldset>`;
  async function page(el) {
    const st = { tab: 'out', d: null };
    el.innerHTML = `<div class="card"><div class="toolbar" style="gap:8px"><h2 style="margin:0">${esc(K('title'))}</h2></div>
      <div class="tabs"><button data-tab="out" class="on">${esc(K('tab_out'))}</button><button data-tab="in">${esc(K('tab_in'))}</button>
      <button data-tab="oarch">${esc(K('tab_oarch'))}</button><button data-tab="iarch">${esc(K('tab_iarch'))}</button></div><div id="xbody"></div></div>`;
    const v = (id) => el.querySelector('#' + id);
    el.querySelectorAll('.tabs button').forEach(b => b.onclick = () => {
      st.tab = b.dataset.tab; el.querySelectorAll('.tabs button').forEach(x => x.classList.toggle('on', x === b)); draw();
    });
    const call = async (path, body, m) => { try { return await api(P + path, { method: m || 'POST', body }); } catch (e) { toast(errT(e), 'error'); return null; } };
    function selectable(tb, rows, onSel) {
      tb.querySelectorAll('tbody tr[data-i]').forEach(tr => tr.addEventListener('click', () => {
        tb.querySelectorAll('tr.sel').forEach(x => x.classList.remove('sel')); tr.classList.add('sel'); onSel(rows[+tr.dataset.i]);
      }));
      const f = tb.querySelector('tbody tr[data-i]'); if (f) { f.classList.add('sel'); onSel(rows[0]); } else onSel(null);  // first record current (AfterScroll)
    }
    async function benef(target, r, archive) {
      if (!r) { v(target).innerHTML = table('g_' + target, C.benef, []); return; }
      const res = await call('/beneficiary', { id: r.id, archive, filial: archive ? r.filial : undefined });
      if (!res) return;
      v(target).innerHTML = table('g_' + target, C.benef, res.rows);
      if (archive) v('x_fil').value = res.filial_name || '';
    }
    function drawOut() {
      const d = st.d;
      v('xbody').innerHTML = `<div class="toolbar" style="gap:8px;align-items:center">
        <label>${esc(K('from'))} <input type="date" class="input" id="x_beg" value="${st.beg}"></label>
        <label>${esc(K('to'))} <input type="date" class="input" id="x_end" value="${st.end}"></label>
        <button class="btn secondary" id="x_ref">${esc(K('refresh'))}</button>
        <input class="input" readonly id="x_e1" value="${esc(d.edit1)}"><input class="input" readonly id="x_e2" value="${esc(d.edit2)}"><input class="input" readonly id="x_e3" value="${esc(d.edit3)}">
        <span>${esc(K('sum'))}: <b id="x_sum">${esc(d.batchs_sum_text)}</b></span></div>
        ${box(K('box_batchs'), table('g_b', C.batchs, d.batchs, true))}
        ${st.benef_visible ? box(K('box_benef'), '<div id="xb"></div>') : ''}`;
      v('x_ref').onclick = async () => { st.beg = v('x_beg').value; st.end = v('x_end').value;
        const r = await call('/out/refresh', { beg: st.beg, end: st.end }); if (r) { Object.assign(st.d, r); draw(); } };
      v('g_b').querySelectorAll('th').forEach(h => h.onclick = async () => {
        const r = await call('/out/sort', { caption: h.dataset.c }); if (r) { Object.assign(st.d, r); draw(); } });
      selectable(v('g_b'), d.batchs, (r) => st.benef_visible && benef('xb', r, false));
    }
    function drawIn() {
      v('xbody').innerHTML = `<div class="toolbar" style="gap:8px"><button class="btn secondary" id="x_iref">${esc(K('refresh'))}</button>
        <span class="muted">${esc(K('in_hint'))}</span></div>${box(K('box_in'), table('g_i', C.inc, st.d.incoming, true), 60)}`;
      const go = async (body) => { const r = await call('/in/list', body); if (r) { st.d.incoming = r.rows; draw(); } };
      v('x_iref').onclick = () => go(null);
      v('g_i').querySelectorAll('th').forEach(h => h.onclick = () => go({ caption: h.dataset.c }));
      selectable(v('g_i'), st.d.incoming, () => {});
    }
    function drawOarch() {
      const a = st.oa || { batchs: [], sum_text: '' };
      v('xbody').innerHTML = `<div class="toolbar" style="gap:8px;align-items:center">
        <label>${esc(K('from'))} <input type="date" class="input" id="x_ab" value="${st.oab}"></label>
        <label>${esc(K('to'))} <input type="date" class="input" id="x_ae" value="${st.oae}"></label>
        <button class="btn secondary" id="x_aref">${esc(K('refresh'))}</button>
        <span>${esc(K('sum'))}: <b id="x_asum">${esc(a.sum_text)}</b></span>
        <label>${esc(K('filial'))} <input class="input" readonly id="x_fil"></label></div>
        ${box(K('box_batchs'), table('g_ab', C.batchs, a.batchs, true))}${box(K('box_benef'), '<div id="xab"></div>')}`;
      v('x_aref').onclick = async () => { st.oab = v('x_ab').value; st.oae = v('x_ae').value;
        const r = await call('/out-archive', { beg: st.oab, end: st.oae }); if (r) { st.oa = r; draw(); } };
      v('g_ab').querySelectorAll('th').forEach(h => h.onclick = async () => {
        if (!st.oa) return; const r = await call('/out-archive/sort', { caption: h.dataset.c }); if (r) { st.oa = r; draw(); } });
      selectable(v('g_ab'), a.batchs, (r) => benef('xab', r, true));
    }
    function drawIarch() {
      const a = st.ia || { rows: [], sum_text: '' }, f = st.iaf || {};
      v('xbody').innerHTML = `<div class="toolbar" style="gap:8px;align-items:center">
        <label>${esc(K('from'))} <input type="date" class="input" id="x_ib" value="${st.iab}"></label>
        <label>${esc(K('to'))} <input type="date" class="input" id="x_ie" value="${st.iae}"></label>
        <button class="btn secondary" id="x_iaref">${esc(K('refresh'))}</button>
        <button class="btn secondary" id="x_flt">${esc(K('filter'))}</button>
        <span>${esc(K('sum'))}: <b id="x_isum">${esc(a.sum_text)}</b></span></div>
        <div id="x_panel38" class="card" style="display:${st.p38 ? 'flex' : 'none'};gap:12px;align-items:center;padding:8px">
          <label><input type="checkbox" id="x_c2" ${f.check2 ? 'checked' : ''}> ${esc(K('mark'))}</label>
          <select class="input" id="x_l2">${(st.lk ? st.lk.filials : []).map(o => `<option value="${o.filial_id}" ${f.filial === o.filial_id ? 'selected' : ''}>${esc(o.filial_name)}</option>`).join('')}</select>
          <label><input type="checkbox" id="x_c3" ${f.check3 ? 'checked' : ''}> ${esc(K('mark'))}</label>
          <select class="input" id="x_l3">${(st.lk ? st.lk.codes : []).map(o => `<option value="${o.code}" ${f.code === o.code ? 'selected' : ''}>${esc(o.code)}</option>`).join('')}</select>
          <button class="btn" id="x_apply">${esc(K('apply'))}</button><button class="btn secondary" id="x_p38x">✕</button></div>
        ${box(K('box_in'), table('g_ia', C.inc, a.rows), 55)}`;
      v('x_iaref').onclick = async () => { st.iab = v('x_ib').value; st.iae = v('x_ie').value;
        const r = await call('/in-archive', { beg: st.iab, end: st.iae }); if (r) { st.ia = r; st.iaf = {}; draw(); } };   // CheckBox2/3 unchecked
      v('x_flt').onclick = async () => { st.p38 = !st.p38; if (st.p38 && !st.lk) st.lk = await call('/in-archive/lookups', undefined, 'GET'); draw(); };
      v('x_p38x').onclick = () => { st.p38 = false; draw(); };                                        // SpeedButton1Click
      v('x_apply').onclick = async () => {
        const b = { check2: v('x_c2').checked, filial: v('x_l2').value === '' ? null : +v('x_l2').value,
          check3: v('x_c3').checked, code: v('x_l3').value === '' ? null : +v('x_l3').value };
        const r = await call('/in-archive/filter', b); if (r) { st.ia = r; st.iaf = b; draw(); } };
      selectable(v('g_ia'), a.rows, () => {});
    }
    function draw() {
      if (!st.d) return;
      ({ out: drawOut, in: drawIn, oarch: drawOarch, iarch: drawIarch })[st.tab]();
    }
    const d = await call('/open');
    if (!d) return;
    st.d = d; st.benef_visible = d.beneficiary_visible;
    st.beg = st.end = st.oab = st.oae = st.iab = st.iae = d.use_date;     // StDate/EndDate = GetUseDate; archive pickers = StDate
    draw();
  }
  window.SB.pages['/m/xohks'] = page;
})();

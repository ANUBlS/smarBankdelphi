/* AZIPS – port of Packages/SWIFT_MANAGER_IBAN_NEW (TSWIFT_MAIN), part 1: IN / OUT grids, totals, archives.
   Logic in api/app/azips.py (verbatim Unit2.dfm SQL, branch rule, SQL[i] edits). Editor / creation / conversion follow. */
(function () {
  const { api, t, esc, toast, modal } = window.SB;
  const P = '/api/azips', K = (k) => t('azips.' + k);
  const errT = (e) => t(e.key || 'error.generic', e) + (e.ora ? ' ' + e.ora : '');
  const OUT_U = ['sw_main.find_username_out(s.id)', 'sw_main.find_username3_out(s.id)', 'sw_main.find_username2_out(s.id)'];
  // Columns per grid, as in SWIFT_MAINImpl1.dfm / Unit19.dfm / archivout.dfm (FieldName, i18n key)
  const C = {
    in: ['ID', 'DAT', 'REFERANCE', 'ACOUNT', 'BNK_VOIN', 'VALU', 'BIC', 'VALUTE', 'MT', 'USERH', 'INFO'],
    in2: ['ID', 'DAT', 'REFERANCE', 'ACOUNT', 'VALU', 'BIC', 'VALUTE', 'MT', 'USERH', 'INFO'],
    out: ['ID', 'MESSAGETYPE', 'RECEIVERBIC', 'MF20_REFERENCE', 'MF50_BIC', 'MF50_ACCOUNT', 'MF32A_DATE', 'MF32A_AMOUNT', 'MF32A_CURR', 'U0', 'INFO', 'CDAT'],
    out2: ['ID', 'MESSAGETYPE', 'RECEIVERBIC', 'MF20_REFERENCE', 'MF50_BIC', 'MF50_ACCOUNT', 'MF32A_DATE', 'MF32A_AMOUNT', 'MF32A_CURR', 'U0', 'U1', 'INFO', 'FDAT'],
    out3: ['ID', 'MESSAGETYPE', 'RECEIVERBIC', 'MF20_REFERENCE', 'MF50_BIC', 'MF50_ACCOUNT', 'MF32A_DATE', 'MF32A_AMOUNT', 'MF32A_CURR', 'U0', 'U1', 'U2', 'INFO', 'TDAT'],
    ain: ['ID', 'MT', 'REFERANCE', 'ACOUNT', 'VALU', 'BIC', 'VALUTE', 'INFO', 'DAT'],
    aout: ['ID', 'MF20_REFERENCE', 'MF50_ACCOUNT', 'RECEIVERBIC', 'MF32A_AMOUNT', 'MF32A_CURR', 'INFO', 'MF32A_DATE', 'CREAT', 'MODSI', 'VERI', 'AVTO', 'EDITOR', 'DELETER', 'CDAT', 'FDAT'],
  };
  const val = (r, c) => c[0] === 'U' && c.length === 2 ? r[OUT_U[+c[1]]] : r[c.toLowerCase()];
  function table(id, cols, rows, sortable) {
    return `<table class="grid acc-grid" id="${id}"><thead><tr>${cols.map(c => `<th ${sortable ? `data-s="${c}" style="cursor:pointer"` : ''}>${esc(K('c_' + c))}</th>`).join('')}</tr></thead>
      <tbody>${rows.map((r, i) => `<tr data-i="${i}">${cols.map(c => `<td>${esc(val(r, c) ?? '')}</td>`).join('')}</tr>`).join('')
      || `<tr><td colspan="${cols.length}" class="muted">${esc(K('empty'))}</td></tr>`}</tbody></table>`;
  }
  async function page(el) {
    const st = { tab: 'out', d: null, in_order: '', in2: '' };
    el.innerHTML = `<div class="card"><div class="toolbar" style="gap:8px"><h2 style="margin:0">${esc(K('title'))}</h2></div>
      <div class="tabs"><button data-tab="in">${esc(K('tab_in'))}</button><button data-tab="out" class="on">${esc(K('tab_out'))}</button></div>
      <div id="zbody"></div></div>`;
    const v = (id) => el.querySelector('#' + id);
    el.querySelectorAll('.tabs button').forEach(b => b.onclick = () => {
      st.tab = b.dataset.tab; el.querySelectorAll('.tabs button').forEach(x => x.classList.toggle('on', x === b)); draw();
    });
    function draw() {
      const d = st.d || { sw_in: [], sw_in2: [], sw_out: [], sw_out_2: [], sw_out3: [] };
      const box = (title, inner) => `<fieldset class="card" style="margin:8px 0;padding:8px 12px;min-width:0"><legend>${esc(title)}</legend><div class="tablewrap" style="max-height:30vh">${inner}</div></fieldset>`;
      if (st.tab === 'in') {
        v('zbody').innerHTML = `<div class="toolbar" style="gap:8px"><button class="btn secondary" id="z_ref">${esc(K('refresh'))}</button>
          <button class="btn secondary" id="z_arxin">${esc(K('archive'))}</button></div>
          ${box(K('box_in'), table('g_in', C.in, d.sw_in, true))}${box(K('box_in2'), table('g_in2', C.in2, d.sw_in2, true))}`;
        v('g_in').querySelectorAll('th[data-s]').forEach(h => h.onclick = () => load({ in_sort: h.dataset.s }));
        v('g_in2').querySelectorAll('th[data-s]').forEach(h => h.onclick = () => { st.in2 = h.dataset.s; load({}); });
        v('z_arxin').onclick = () => arch('in');
      } else {
        v('zbody').innerHTML = `<div class="toolbar" style="gap:8px"><button class="btn secondary" id="z_ref">${esc(K('refresh'))}</button>
          <button class="btn secondary" id="z_arxout">${esc(K('archive'))}</button><button class="btn" id="z_now">${esc(K('archive_now'))}</button></div>
          <input class="input" readonly id="z_s1" style="width:100%;margin-top:6px" value="${esc(d.sum_send_text != null ? 'Bu gün göndəriləcək ümumi məbləğ = ' + d.sum_send_text + ' AZN' : '')}">
          <input class="input" readonly id="z_s2" style="width:100%;margin-top:4px" value="${esc(d.sum_verify_text != null ? 'Bu gün verifikasiya olunacaq ümumi məbləğ = ' + d.sum_verify_text + ' AZN' : '')}">
          ${box(K('box_out'), table('g_out', C.out, d.sw_out))}${box(K('box_out2'), table('g_out2', C.out2, d.sw_out_2))}${box(K('box_out3'), table('g_out3', C.out3, d.sw_out3))}`;
        v('z_arxout').onclick = () => arch('out');
        v('z_now').onclick = async () => {
          try { toast((await api(P + '/archive-now', { method: 'POST' })).message); load({}); } catch (e) { toast(errT(e), 'error'); }
        };
      }
      v('z_ref').onclick = () => load({});
    }
    async function load(extra) {
      try {
        const r = await api(P + '/list', { method: 'POST', body: { in_order: st.in_order, in2_sort: st.in2 || null, ...extra } });
        st.d = r; st.in_order = r.in_order;
      } catch (e) { toast(errT(e), 'error'); }
      draw();
    }
    function arch(kind) {
      const today = new Date().toISOString().slice(0, 10);
      const types = kind === 'in' ? ['MT103', 'MT102', 'MT205', 'MT950', 'MT900', 'MT910', 'MT298'] : ['MT103', 'MT102', 'MT205', 'MT999', 'MT941', 'MT942', 'MT298'];
      modal(`<h3>${esc(K(kind === 'in' ? 'arch_in' : 'arch_out'))}</h3>
        <div class="toolbar" style="gap:8px;flex-wrap:wrap">
          <label class="field"><span>${esc(K('from'))}</span><input type="date" id="a1" value="${today}"></label>
          <label class="field"><span>${esc(K('to'))}</span><input type="date" id="a2" value="${today}"></label>
          <label class="field"><span>${esc(K('type'))}</span><select id="at"><option value="">—</option><option value="0">Bütün tiplər</option>${types.map((x, i) => `<option value="${i + 1}">${x}</option>`).join('')}</select></label>
          ${kind === 'out' ? `<label class="field"><span>${esc(K('operator'))}</span><select id="ao"></select></label>` : ''}
          <button class="btn" id="ago">${esc(K('show'))}</button></div>
        <div class="tablewrap" style="max-height:55vh" id="ag"></div>
        <div class="actions"><button class="btn secondary" id="ax">${esc(K('close'))}</button></div>`, async (m, close) => {
        const q = (id) => m.querySelector('#' + id);
        m.style.width = "min(1200px, 95vw)"; m.style.maxWidth = "95vw";
        let title = 'id';
        q('ax').onclick = close;
        if (kind === 'out') {
          try { q('ao').innerHTML = (await api(P + '/operators')).map(o => `<option value="${o.id}">${esc(o.name)}</option>`).join(''); } catch (e) { toast(errT(e), 'error'); }
        }
        async function go() {
          const body = { dat1: q('a1').value, dat2: q('a2').value, title, mt_index: q('at').value === '' ? null : +q('at').value };
          if (kind === 'out') body.oper = +q('ao').value;
          try {
            const r = await api(P + (kind === 'in' ? '/archive-in' : '/archive-out'), { method: 'POST', body });
            q('ag').innerHTML = table('g_arch', kind === 'in' ? C.ain : C.aout, r.rows, true);
            q('ag').querySelectorAll('th[data-s]').forEach(h => h.onclick = () => { title = h.dataset.s; go(); });
          } catch (e) { toast(errT(e), 'error'); }
        }
        q('ago').onclick = go; go();                                  // FormActivate opens with today..today
      }, true);
    }
    load({});
  }
  window.SB.pages['/m/azips'] = page;
})();

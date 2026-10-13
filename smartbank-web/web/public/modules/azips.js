/* AZIPS – port of Packages/SWIFT_MANAGER_IBAN_NEW (TSWIFT_MAIN), part 1: IN / OUT grids, totals, archives.
   Logic in api/app/azips.py (verbatim Unit2.dfm SQL, branch rule, SQL[i] edits). Part 2 (editor / creation) in azips_edit.js; part 3 file generation (Avtorizator) below, logic in api/app/azips_files.py. */
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
          <button class="btn secondary" id="z_arxin">${esc(K('archive'))}</button>
          <button class="btn" id="z_konv" title="${esc(K('konv_hint'))}">${esc(K('konvert'))}</button>
          <button class="btn danger" id="z_indel">${esc(K('delete'))}</button>
          <input type="file" id="z_konvf" style="display:none"></div>
          ${box(K('box_in'), table('g_in', C.in, d.sw_in, true))}${box(K('box_in2'), table('g_in2', C.in2, d.sw_in2, true))}`;
        v('g_in').querySelectorAll('th[data-s]').forEach(h => h.onclick = () => load({ in_sort: h.dataset.s }));
        v('g_in2').querySelectorAll('th[data-s]').forEach(h => h.onclick = () => { st.in2 = h.dataset.s; load({}); });
        v('z_arxin').onclick = () => arch('in');
        v('z_konv').onclick = () => v('z_konvf').click();
        v('g_in').querySelectorAll('tbody tr[data-i]').forEach(tr => tr.onclick = () => {
          v('g_in').querySelectorAll('tr').forEach(x => x.classList.toggle('sel', x === tr)); st.sel_in = d.sw_in[+tr.dataset.i].id;
        });
        v('z_indel').onclick = () => act('in_delete', st.sel_in, 'q_delete');      // ToolButton6Click -> DeleteExecute
        v('z_konvf').onchange = (e) => { const f = e.target.files[0]; e.target.value = ''; if (f) konvert(f); };
      } else {
        v('zbody').innerHTML = `<div class="toolbar" style="gap:8px"><button class="btn secondary" id="z_ref">${esc(K('refresh'))}</button>
          <button class="btn secondary" id="z_arxout">${esc(K('archive'))}</button><button class="btn" id="z_now">${esc(K('archive_now'))}</button>
          <button class="btn" id="z_new">${esc(K('new_msg'))}</button><button class="btn secondary" id="z_edit">${esc(K('edit_msg'))}</button>
          <button class="btn secondary" id="z_view">${esc(K('view_msg'))}</button>
          <button class="btn" id="z_file" title="${esc(K('file_hint'))}">${esc(K('create_file'))}</button>
          <button class="btn danger" id="z_odel">${esc(K('delete'))}</button><button class="btn" id="z_verify">${esc(K('verify'))}</button>
          <button class="btn secondary" id="z_back">${esc(K('back'))}</button><button class="btn secondary" id="z_sback">${esc(K('sending_back'))}</button>
          <button class="btn secondary" id="z_tsend">${esc(K('transend'))}</button></div>
          <input class="input" readonly id="z_memo2" style="width:100%;margin-top:6px" value="${esc(st.memo2 || '')}">
          <input class="input" readonly id="z_s1" style="width:100%;margin-top:6px" value="${esc(d.sum_send_text != null ? 'Bu gün göndəriləcək ümumi məbləğ = ' + d.sum_send_text + ' AZN' : '')}">
          <input class="input" readonly id="z_s2" style="width:100%;margin-top:4px" value="${esc(d.sum_verify_text != null ? 'Bu gün verifikasiya olunacaq ümumi məbləğ = ' + d.sum_verify_text + ' AZN' : '')}">
          ${box(K('box_out'), table('g_out', C.out, d.sw_out))}${box(K('box_out2'), table('g_out2', C.out2, d.sw_out_2))}${box(K('box_out3'), table('g_out3', C.out3, d.sw_out3))}`;
        v('z_arxout').onclick = () => arch('out');
        const pick = (gid, rows, key) => v(gid).querySelectorAll('tbody tr[data-i]').forEach(tr => tr.onclick = () => {
          v(gid).querySelectorAll('tr').forEach(x => x.classList.toggle('sel', x === tr)); st[key] = rows[+tr.dataset.i].id;
        });
        pick('g_out', d.sw_out, 'sel_out'); pick('g_out2', d.sw_out_2, 'sel_out2');
        // Gridout3 (dgMultiSelect): click = current row, Ctrl+click toggles a selected row (TBookmarkList)
        st.sel3 = (st.sel3 || []).filter(id => d.sw_out3.some(r => r.id === id));
        const mark3 = () => v('g_out3').querySelectorAll('tbody tr[data-i]').forEach(tr => {
          const id = d.sw_out3[+tr.dataset.i].id; tr.classList.toggle('sel', st.sel3.includes(id) || id === st.cur3);
        });
        v('g_out3').querySelectorAll('tbody tr[data-i]').forEach(tr => tr.onclick = (e) => {
          const id = d.sw_out3[+tr.dataset.i].id;
          if (e.ctrlKey || e.metaKey) st.sel3 = st.sel3.includes(id) ? st.sel3.filter(x => x !== id) : [...st.sel3, id];
          else st.sel3 = [id];
          st.cur3 = id; mark3();
        });
        mark3();
        v('z_file').onclick = () => createFiles(d);
        v('z_odel').onclick = () => act('out_delete', st.sel_out, 'q_delete');          // ToolButton9Click -> out_deleteExecute
        v('z_back').onclick = () => act('out_back', st.sel_out2, 'q_back');             // opendayClick -> backClick -> geriExecute
        v('z_verify').onclick = () => verify(d);                                        // ToolButton13Click -> commitingExecute + Form12
        v('z_sback').onclick = () => act('sending_back', st.cur3, null);                // Geriqaytar1Click
        v('z_tsend').onclick = () => act('transend', st.sel_out, null);                 // mliyyatGnnsndlringondrm1Click
        const AE = window.SB.azipsEdit;
        const AN = window.SB.azipsNew;
        v('z_new').onclick = () => AN.open('1', 'toolbutton1', () => load({}));   // toolbar 'Yeni' = ToolButton1Click -> filereport.bpl 'Azipsnew' '1'
        // grid double clicks (SWIFT_MAINImpl1.pas): grid_outDblClick -> Azipsnew id (edit), GRIDOUT2/gridout3DblClick -> '-'+id (view)
        v('g_out').querySelectorAll('tbody tr[data-i]').forEach(tr => tr.ondblclick = () => AN.open(String(d.sw_out[+tr.dataset.i].id), 'grid_out', () => load({})));
        v('g_out2').querySelectorAll('tbody tr[data-i]').forEach(tr => tr.ondblclick = () => AN.open('-' + d.sw_out_2[+tr.dataset.i].id, 'gridout2', () => load({})));
        v('g_out3').querySelectorAll('tbody tr[data-i]').forEach(tr => tr.ondblclick = () => AN.open('-' + d.sw_out3[+tr.dataset.i].id, 'gridout3', () => load({})));
        v('z_edit').onclick = () => st.sel_out ? AE.edit(st.sel_out, () => load({})) : toast(K('pick_row'), 'error');   // ToolButton2Click
        v('z_view').onclick = () => st.sel_out2 ? AE.view(st.sel_out2) : toast(K('pick_row'), 'error');                // Redakteet1Click
        v('z_now').onclick = async () => {
          try { toast((await api(P + '/archive-now', { method: 'POST' })).message); load({}); } catch (e) { toast(errT(e), 'error'); }
        };
      }
      v('z_ref').onclick = () => load({});
    }
    // part 4a row actions (api/app/azips_actions.py): MessageDlg per row -> answers sent with the request
    async function act(kind, id, q, form12) {
      if (id == null) return toast(K('pick_row'), 'error');
      if (q && !confirm(K(q).replace('%d', id))) return;
      try {
        const r = await api(P + '/action', { method: 'POST', body: { kind, current: id, answers: (q || kind === 'out_commit') ? ['yes'] : [], form12: form12 || [] } });
        if (r.memo2) st.memo2 = r.memo2;
        if (r.message) toast(r.message, r.wrong ? 'error' : undefined); else toast(K('done'));
      } catch (e) { toast(errT(e), 'error'); }
      load({});
    }
    async function verify(d) {
      const id = st.sel_out2;
      if (id == null) return toast(K('pick_row'), 'error');
      if (!confirm(K('q_verify').replace('%d', id))) return;
      let cur = [];
      try { cur = await api(P + '/commit-currencies'); } catch (e) { return toast(errT(e), 'error'); }
      modal(`<h3>Avtorizasiya</h3><div class="toolbar" style="gap:8px"><select class="input" id="f12c">${cur.map(c => `<option>${esc(c)}</option>`).join('')}</select>
        <input class="input" id="f12a" inputmode="decimal" placeholder="${esc(K('amount'))}"></div>
        <div class="actions"><button class="btn" id="f12ok">Təsdiq et</button><button class="btn secondary" id="f12x">Çıx</button></div>`, (m, close) => {
        const a = m.querySelector('#f12a');
        a.onkeypress = (e) => { if (!/[0-9.]/.test(e.key)) e.preventDefault(); };      // Edit1KeyPress: 0..9, #8, '.'
        m.querySelector('#f12ok').onclick = () => { close(); act('out_commit', id, null, [{ amount: a.value, curr: m.querySelector('#f12c').value }]).then(() => {}); };
        m.querySelector('#f12x').onclick = () => { close(); act('out_commit', id, null, [{ close: true }]); };
      });
    }
    async function load(extra) {
      try {
        const r = await api(P + '/list', { method: 'POST', body: { in_order: st.in_order, in2_sort: st.in2 || null, ...extra } });
        st.d = r; st.in_order = r.in_order;
      } catch (e) { toast(errT(e), 'error'); }
      draw();
    }
    // 'Konvert' (ToolButton4Click -> konvert3 / Konvertex), part 3b: ONE uploaded file = the Delphi FileListBox content
    async function konvert(f) {
      const buf = new Uint8Array(await f.arrayBuffer());
      let bin = ''; for (let i = 0; i < buf.length; i += 0x8000) bin += String.fromCharCode.apply(null, buf.subarray(i, i + 0x8000));
      let r;
      try { r = await api(P + '/import', { method: 'POST', body: { name: f.name, b64: btoa(bin) } }); }
      catch (e) { toast(errT(e), 'error'); return; }
      const ins = r.calls.filter(c => /^insert_in/.test(c[1]));
      modal(`<h3>${esc(K('konv_title'))}: ${esc(r.file)}</h3>
        ${r.error ? `<p class="error">${esc(r.error)}</p>` : ''}
        ${!r.listed ? `<p class="error">${esc(K('konv_mask').replace('{m}', r.mask))}</p>` : ''}
        ${r.listed && r.fileformat === 0 ? `<p class="muted">${esc(K('konv_swf'))}</p>` : ''}
        <p>${esc(K('konv_done').replace('{n}', ins.length))}</p>
        ${ins.map(c => `<p class="muted">${esc(c[1])}: ${esc(String(c[2][c[1] === 'insert_in' ? 1 : 0]))} ${esc(c[1] === 'insert_in' ? c[2][9] + ' ' + c[2][2] + ' ' + c[2][4] : c[2][4])}</p>`).join('')}
        ${r.messages.map(m => `<p>${esc(m)}</p>`).join('')}
        <div class="actions"><button class="btn secondary" id="kx">${esc(K('close'))}</button></div>`, (m, close) => {
        m.querySelector('#kx').onclick = () => { close(); load({}); };
      }, true);
    }
    // 'Avtorizator' (CreateFileClick -> PACS0008Execute), part 3: files come back for download (+ optional server folder)
    async function createFiles(d) {
      const cur = st.cur3 ?? (d.sw_out3[0] || {}).id;
      if (cur == null) { toast(K('pick_row'), 'error'); return; }
      const n = st.sel3.length || 1;
      if (!confirm(K('file_confirm').replace('{n}', n))) return;
      let r;
      try {
        r = await api(P + '/create-files', { method: 'POST', body: { selected: st.sel3, current: cur, out2_current: st.sel_out2 ?? (d.sw_out_2[0] || {}).id ?? null } });
      } catch (e) { toast(errT(e), 'error'); return; }
      const link = (f) => {
        const b = Uint8Array.from(atob(f.b64), c => c.charCodeAt(0));
        return `<a class="btn secondary" download="${esc(f.name)}" href="${URL.createObjectURL(new Blob([b], { type: 'application/xml' }))}">${esc(f.name)} (${f.size} B)</a>`;
      };
      modal(`<h3>${esc(K('files_title'))}</h3>
        ${r.error ? `<p class="error">${esc(r.error)}</p>` : ''}
        <div class="toolbar" style="gap:8px;flex-wrap:wrap" id="fl">${r.files.map(link).join('') || `<span class="muted">${esc(K('no_files'))}</span>`}</div>
        ${r.server_dir ? `<p class="muted">${esc(K('server_dir'))}: ${esc(r.server_dir)}</p>` : ''}
        ${r.messages.map(m => `<p>${esc(m)}</p>`).join('')}
        ${r.plugins.length ? `<p class="muted">${esc(K('plugin_np'))}</p>` : ''}
        ${r.files[0] ? `<pre id="fprev" style="max-height:40vh;overflow:auto;font-size:12px">${esc(new TextDecoder('windows-1254').decode(Uint8Array.from(atob(r.files[0].b64), c => c.charCodeAt(0))))}</pre>` : ''}
        <div class="actions"><button class="btn secondary" id="fx">${esc(K('close'))}</button></div>`, (m, close) => {
        m.style.width = "min(1000px, 95vw)"; m.style.maxWidth = "95vw";
        m.querySelector('#fx').onclick = () => { close(); load({}); };
      }, true);
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
    const onKey = (e) => {                                                   // Yeni ShortCut 16462 = Ctrl+N
      if (!document.body.contains(el)) { document.removeEventListener('keydown', onKey); return; }
      if (e.ctrlKey && (e.key === 'n' || e.key === 'N') && st.tab === 'out') { e.preventDefault(); window.SB.azipsEdit.newForm(() => load({})); }
    };
    document.addEventListener('keydown', onKey);
    load({});
  }
  window.SB.pages['/m/azips'] = page;
})();

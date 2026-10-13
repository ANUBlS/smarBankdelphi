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
  // dgMultiSelect grid (Grid_out, GRIDOUT2, Gridin): click = current row, Ctrl+click toggles SelectedRows (TBookmarkList)
  function multi(tb, rows, st, key) {
    const ms = key + '_m';
    st[ms] = (st[ms] || []).filter(id => rows.some(r => r.id === id));
    if (!rows.some(r => r.id === st[key])) st[key] = null;
    const mark = () => tb.querySelectorAll('tbody tr[data-i]').forEach(tr => {
      const id = rows[+tr.dataset.i].id; tr.classList.toggle('sel', st[ms].includes(id) || id === st[key]);
    });
    tb.querySelectorAll('tbody tr[data-i]').forEach(tr => tr.addEventListener('click', (e) => {
      const id = rows[+tr.dataset.i].id;
      if (e.ctrlKey || e.metaKey) st[ms] = st[ms].includes(id) ? st[ms].filter(x => x !== id) : [...st[ms], id];
      else st[ms] = [id];
      st[key] = id; mark();
    }));
    mark();
  }
  // MessageDlg(mtConfirmation, [mbYes, mbNo, mbCancel(, mbYesToAll)]) -> 'yes' | 'no' | 'cancel' | 'all'
  function dlg(text, yesAll, noNo) {
    return new Promise(res => modal(`<p>${esc(text)}</p><div class="actions">
      <button class="btn" data-a="yes">${esc(K('yes'))}</button>${noNo ? '' : `<button class="btn secondary" data-a="no">${esc(K('no'))}</button>`}
      <button class="btn secondary" data-a="cancel">${esc(K('cancel'))}</button>${yesAll ? `<button class="btn" data-a="all">${esc(K('yes_all'))}</button>` : ''}</div>`,
      (m, close) => m.querySelectorAll('button[data-a]').forEach(b => b.onclick = () => { close(); res(b.dataset.a); })));
  }
  // The Delphi loop: per selected row (grid order) ask; mbYesToAll -> second dialog '%d sayda ...' with Count-Index (Yes / Cancel)
  async function ask(ids, q, qa) {
    const answers = [];
    for (let i = 0; i < ids.length; i++) {
      let a = await dlg(K(q).replace('%d', ids[i]), !!qa);
      if (a === 'all') a = (await dlg(K(qa).replace('{n}', ids.length - i), false, true)) === 'yes' ? 'all' : 'all_no';
      answers.push(a);
      if (a === 'cancel' || a === 'all') break;
    }
    return answers;
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
          <button class="btn" id="z_incommit">${esc(K('in_commit'))}</button>
          <button class="btn secondary" id="z_checkacc">${esc(K('checkacc'))}</button>
          <button class="btn secondary" id="z_inred">${esc(K('in_redakte'))}</button>
          <button class="btn secondary" id="z_tranzit">${esc(K('tranzit'))}</button>
          <button class="btn secondary" id="z_settin">${esc(K('settings'))}</button>
          <button class="btn secondary" id="z_inprint">${esc(K('print'))}</button>
          <button class="btn secondary" id="z_xmlcap">XML CAP</button>
          <input type="file" id="z_konvf" style="display:none"></div>
          ${box(K('box_in'), table('g_in', C.in, d.sw_in, true))}${box(K('box_in2'), table('g_in2', C.in2, d.sw_in2, true))}`;
        v('g_in').querySelectorAll('th[data-s]').forEach(h => h.onclick = () => load({ in_sort: h.dataset.s }));
        v('g_in2').querySelectorAll('th[data-s]').forEach(h => h.onclick = () => { st.in2 = h.dataset.s; load({}); });
        v('z_arxin').onclick = () => arch('in');
        v('z_konv').onclick = () => v('z_konvf').click();
        multi(v('g_in'), d.sw_in, st, 'sel_in');
        v('z_indel').onclick = () => act('in_delete', 'sel_in', 'q_delete', 'qa_delete');      // ToolButton6Click -> DeleteExecute
        v('z_incommit').onclick = () => inCommit();                                     // comitClick :3906 -> AddINTransNewExecute :7118
        v('z_checkacc').onclick = () => checkAcc();                                      // popup Rdk 'Hesabi yoxla' (Hesabiyoxla1Click :4323)
        v('g_in').querySelectorAll('tbody tr[data-i]').forEach(tr => tr.addEventListener('contextmenu', (e) => {
          e.preventDefault(); st.sel_in = d.sw_in[+tr.dataset.i].id; checkAcc();
        }));
        v('z_inred').onclick = () => inRedakte();                                       // popup Rdk 'Redaktə et' (Redaktet1Click :3595 -> Unit16)
        v('z_tranzit').onclick = () => tranzit();
        v('z_inprint').onclick = () => inPrint('ALL_TEXT2');                           // printClick :3984
        v('z_xmlcap').onclick = () => inPrint('ALL_TEXT');                             // ToolButton17Click :7106
        v('g_in').querySelectorAll('tbody tr[data-i]').forEach(tr => tr.addEventListener('dblclick', () => {
          st.sel_in = d.sw_in[+tr.dataset.i].id; inPrint('ALL_TEXT2');                 // GridINDblClick -> printClick
        }));
        v('z_settin').onclick = () => window.SB.azipsSett.open('in', () => load({}));      // ToolButton10Click -> insett.pas                                        // ToolButton7Click :5391 -> Tranzit_account.pas
        v('z_konvf').onchange = (e) => { const f = e.target.files[0]; e.target.value = ''; if (f) konvert(f); };
      } else {
        v('zbody').innerHTML = `<div class="toolbar" style="gap:8px"><button class="btn secondary" id="z_ref">${esc(K('refresh'))}</button>
          <button class="btn secondary" id="z_arxout">${esc(K('archive'))}</button><button class="btn" id="z_now">${esc(K('archive_now'))}</button>
          <button class="btn" id="z_new">${esc(K('new_msg'))}</button><button class="btn secondary" id="z_edit">${esc(K('edit_msg'))}</button>
          <button class="btn secondary" id="z_view">${esc(K('view_msg'))}</button>
          <button class="btn" id="z_file" title="${esc(K('file_hint'))}">${esc(K('create_file'))}</button>
          <button class="btn danger" id="z_odel">${esc(K('delete'))}</button><button class="btn" id="z_modif">${esc(K('modif'))}</button><button class="btn" id="z_verify">${esc(K('verify'))}</button>
          <button class="btn secondary" id="z_back">${esc(K('back'))}</button><button class="btn secondary" id="z_sback">${esc(K('sending_back'))}</button>
          <button class="btn secondary" id="z_tsend">${esc(K('transend'))}</button>
          <button class="btn secondary" id="z_settout">${esc(K('settings'))}</button></div>
          <input class="input" readonly id="z_memo2" style="width:100%;margin-top:6px" value="${esc(st.memo2 || '')}">
          <input class="input" readonly id="z_s1" style="width:100%;margin-top:6px" value="${esc(d.sum_send_text != null ? 'Bu gün göndəriləcək ümumi məbləğ = ' + d.sum_send_text + ' AZN' : '')}">
          <input class="input" readonly id="z_s2" style="width:100%;margin-top:4px" value="${esc(d.sum_verify_text != null ? 'Bu gün verifikasiya olunacaq ümumi məbləğ = ' + d.sum_verify_text + ' AZN' : '')}">
          ${box(K('box_out'), table('g_out', C.out, d.sw_out))}${box(K('box_out2'), table('g_out2', C.out2, d.sw_out_2))}${box(K('box_out3'), table('g_out3', C.out3, d.sw_out3))}`;
        v('z_arxout').onclick = () => arch('out');
        v('z_settout').onclick = () => window.SB.azipsSett.open('out', () => load({}));   // ToolButton12Click -> MTsett.pas
        multi(v('g_out'), d.sw_out, st, 'sel_out'); multi(v('g_out2'), d.sw_out_2, st, 'sel_out2');
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
        // right click = the grid's PopupMenu; RecordCount>0 is implied by a row existing
        [['g_out', d.sw_out, 1, 'Cap et!', 'sel_out'], ['g_out2', d.sw_out_2, 2, 'Cap Et!', 'sel_out2'], ['g_out3', d.sw_out3, 3, 'Cap Et!', null]].forEach(([g, rows, c, cap, key]) =>
          v(g).querySelectorAll('tbody tr[data-i]').forEach(tr => tr.addEventListener('contextmenu', (e) => {
            const id = rows[+tr.dataset.i].id;
            if (key) st[key] = id; else st.cur3 = id;
            outMenu(e, c, id, cap);
          })));
        v('z_file').onclick = () => createFiles(d);
        v('z_odel').onclick = () => act('out_delete', 'sel_out', 'q_delete', 'qa_delete');
        v('z_modif').onclick = () => act('modifikator', 'sel_out', 'q_modif', 'qa_modif');        // ToolButton11Click -> addtrans2Execute          // ToolButton9Click -> out_deleteExecute
        v('z_back').onclick = () => act('out_back', 'sel_out2', 'q_back', 'qa_back');             // opendayClick -> backClick -> geriExecute
        v('z_verify').onclick = () => verify(d);                                        // ToolButton13Click -> commitingExecute + Form12
        v('z_sback').onclick = () => act('sending_back', null, null, null, st.cur3);                // Geriqaytar1Click
        v('z_tsend').onclick = () => act('transend', null, null, null, st.sel_out);                 // mliyyatGnnsndlringondrm1Click
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
    // selected ids in grid order (TBookmarkList is sorted); none selected -> current row
    function chosen(key) {
      const rows = { sel_out: st.d.sw_out, sel_out2: st.d.sw_out_2, sel_in: st.d.sw_in }[key] || [];
      const m = st[key + '_m'] || [];
      return m.length ? rows.map(r => r.id).filter(id => m.includes(id)) : (st[key] != null ? [st[key]] : []);
    }
    async function act(kind, key, q, qa, single, form12, answers) {
      const ids = key ? chosen(key) : (single != null ? [single] : []);
      if (!ids.length) return toast(K('pick_row'), 'error');
      if (q && !answers) { answers = await ask(ids, q, qa); if (!answers.some(a => a === 'yes' || a === 'all')) return; }
      try {
        const r = await api(P + '/action', { method: 'POST', body: { kind, selected: key ? (st[key + '_m'] || []) : [], current: key ? st[key] : single,
          answers: answers || [], form12: form12 || [] } });
        if (r.memo2) st.memo2 = r.memo2;
        if (r.message) toast(r.message, r.wrong ? 'error' : undefined); else toast(K('done'));
        if (key) st[key + '_m'] = [];
      } catch (e) { toast(errT(e), 'error'); }
      load({});
    }
    // commitingExecute: [mbYes, mbNo, mbCancel] per row (no YesToAll), Form12 for each Yes; 'Çıx' or a mismatch exits the loop
    async function verify(d) {
      const ids = chosen('sel_out2');
      if (!ids.length) return toast(K('pick_row'), 'error');
      let cur = [];
      try { cur = await api(P + '/commit-currencies'); } catch (e) { return toast(errT(e), 'error'); }
      const answers = [], forms = [];
      for (const id of ids) {
        const a = await dlg(K('q_verify').replace('%d', id), false);
        answers.push(a);
        if (a === 'cancel') break;
        if (a !== 'yes') continue;
        const f = await new Promise(res => modal(`<h3>Avtorizasiya #${esc(id)}</h3><div class="toolbar" style="gap:8px"><select class="input" id="f12c">${cur.map(c => `<option>${esc(c)}</option>`).join('')}</select>
          <input class="input" id="f12a" inputmode="decimal" placeholder="${esc(K('amount'))}"></div>
          <div class="actions"><button class="btn" id="f12ok">Təsdiq et</button><button class="btn secondary" id="f12x">Çıx</button></div>`, (m, close) => {
          const a = m.querySelector('#f12a');
          a.onkeypress = (e) => { if (!/[0-9.]/.test(e.key)) e.preventDefault(); };      // Edit1KeyPress: 0..9, #8, '.'
          m.querySelector('#f12ok').onclick = () => { close(); res({ amount: a.value, curr: m.querySelector('#f12c').value }); };
          m.querySelector('#f12x').onclick = () => { close(); res({ close: true }); };
        }));
        forms.push(f);
        if (f.close) break;
      }
      if (!answers.includes('yes')) return;
      act('out_commit', 'sel_out2', null, null, null, forms, answers);
    }
    // part 4b-2 (api/app/azips_in.py). comitClick on the current GridIN row; SelectedRows = Ctrl-selected rows (a plain
    // click only moves the current row in a dgMultiSelect grid, so [current] alone is sent as "no selection").
    async function inCommit() {
      const cur = st.sel_in;
      if (cur == null) return toast(K('pick_row'), 'error');
      const m = (st.sel_in_m || []).filter(x => !(st.sel_in_m.length === 1 && x === cur));
      let r;
      try {
        r = await api(P + '/in-commit', { method: 'POST', body: { current: cur, selected: m } });
        if (r.ask) {
          const a = await dlg(r.ask, false, true);                                     // MessageDlg [mbYes, mbCancel]
          r = await api(P + '/in-commit/answer', { method: 'POST', body: { answer: a === 'yes' ? 'yes' : 'cancel' } });
        } else if (r.status != null) toast(K('in_status_not2'));
      } catch (e) { toast(errT(e), 'error'); load({}); return; }
      if (r.messages && r.messages.length) {                                          // ShowMessage calls, in order
        modal(`${r.messages.map(x => `<p>${esc(x)}</p>`).join('')}<div class="actions"><button class="btn" id="mx">OK</button></div>`,
          (mm, close) => { mm.querySelector('#mx').onclick = close; });
      } else if (r.done) toast(K('done'));
      st.sel_in_m = [];
      load({});
    }
    // Checkacc.pas TCheckinacc: Edit1 = ACOUNT (editable), Edit3 = id, 'Yoxla' -> acc_check + upd_none; empty name closes
    function checkAcc() {
      const r0 = (st.d.sw_in || []).find(x => x.id === st.sel_in);
      if (!r0) return toast(K('pick_row'), 'error');
      modal(`<h3>Checking_acc</h3><div class="toolbar" style="gap:8px;flex-wrap:wrap">
        <label class="field"><span>${esc(K('account'))}</span><input class="input" id="ca1" value="${esc(r0.acount || '')}"></label>
        <label class="field"><span>${esc(K('acc_name'))}</span><input class="input" id="ca2" readonly></label>
        <input class="input" id="ca3" readonly value="${esc(r0.id)}" style="width:90px"></div>
        <div class="actions"><button class="btn" id="cab">${esc(K('checkacc_btn'))}</button><button class="btn secondary" id="cax">${esc(K('close'))}</button></div>`, (m, close) => {
        m.querySelector('#cax').onclick = () => { close(); load({}); };
        m.querySelector('#cab').onclick = async () => {
          try {
            const r = await api(P + '/in-checkacc', { method: 'POST', body: { id: r0.id, acc: m.querySelector('#ca1').value } });
            m.querySelector('#ca2').value = r.name;
            if (r.closed) { close(); load({}); }
          } catch (e) { toast(errT(e), 'error'); }
        };
      });
    }
    // cap.pas TPrintform 'Cap': text starting with '<' -> browser view (TWebBrowser), else RichEdit text -> PDF (prt.Print('A.Z.I.P.S'))
    async function inPrint(field) {
      if (st.sel_in == null) return toast(K('pick_row'), 'error');
      let r;
      try { r = await api(P + '/in-print', { method: 'POST', body: { id: st.sel_in, field } }); } catch (e) { return toast(errT(e), 'error'); }
      showCap(r, st.sel_in);
    }
    // OUT popups 'Cap et!' (Capet1 / N3 / CapEt2) -> Edit1 := c -> ToolButton8Click :6179 -> cap.pas TPrintform
    async function outPrint(c, id) {
      let r;
      try { r = await api(P + '/out-print', { method: 'POST', body: { c, id } }); } catch (e) { return toast(errT(e), 'error'); }
      showCap(r, id);
    }
    function outMenu(e, c, id, caption) {
      e.preventDefault();
      document.querySelectorAll('.az_pop').forEach(x => x.remove());
      const m = document.createElement('div');
      m.className = 'az_pop card'; m.id = 'az_pop' + c;
      m.style.cssText = `position:fixed;left:${e.clientX}px;top:${e.clientY}px;z-index:1000;padding:4px;min-width:120px`;
      m.innerHTML = `<button class="btn secondary" style="width:100%" data-print="${c}">${esc(caption)}</button>`;
      document.body.appendChild(m);
      m.querySelector('button').onclick = () => { m.remove(); outPrint(c, id); };
      setTimeout(() => document.addEventListener('click', () => m.remove(), { once: true }), 0);
    }
    function showCap(r, rid) {
      const url = URL.createObjectURL(new Blob([Uint8Array.from(atob(r.pdf_b64), c => c.charCodeAt(0))], { type: 'application/pdf' }));
      const view = r.html ? `<iframe sandbox="" id="cap_v" style="width:100%;height:60vh;border:1px solid #ccc;background:#fff"></iframe>`
        : `<pre id="cap_v" style="max-height:60vh;overflow:auto;font-size:14px;white-space:pre-wrap">${esc(r.text)}</pre>`;
      modal(`<h3>Cap</h3>${view}<div class="actions"><a class="btn" id="cap_p" href="${url}" target="_blank" download="AZIPS-${esc(rid)}.pdf">Print (PDF)</a>
        <button class="btn secondary" id="cap_x">Bagla</button></div>`, (m, close) => {
        m.style.width = 'min(1000px, 95vw)'; m.style.maxWidth = '95vw';
        if (r.html) m.querySelector('#cap_v').srcdoc = r.text;
        m.querySelector('#cap_x').onclick = close;
      }, true);
    }
    // Unit16.pas TrdkİN 'Redakte İN': Hesab № (Edit1), Vöen (Edit2), 'Yadda saxla' -> sw_main.UPDIN
    function inRedakte() {
      const r0 = (st.d.sw_in || []).find(x => x.id === st.sel_in);
      if (!r0) return toast(K('pick_row'), 'error');
      modal(`<h3>Redakte İN</h3><div class="toolbar" style="gap:8px;flex-wrap:wrap">
        <label class="field"><span>Hesab №</span><input class="input" id="rd1" value="${esc(r0.acount || '')}"></label>
        <label class="field"><span>Vöen</span><input class="input" id="rd2" value="${esc(r0.voin2 || '')}"></label></div>
        <div class="actions"><button class="btn" id="rdok">Yadda saxla</button><button class="btn secondary" id="rdx">${esc(K('close'))}</button></div>`, (m, close) => {
        m.querySelector('#rdx').onclick = close;
        m.querySelector('#rdok').onclick = async () => {
          try { await api(P + '/in-redakte', { method: 'POST', body: { id: r0.id, acount: m.querySelector('#rd1').value, voin2: m.querySelector('#rd2').value } }); close(); load({}); }
          catch (e) { toast(errT(e), 'error'); }
        };
      });
    }
    // Tranzit_account.pas: grid of sw_transit_acc, 'Əlavə et' (two InputQuery) and 'Sil'
    function tranzit() {
      modal(`<h3>Tranzit accounts</h3><div class="tablewrap" style="max-height:50vh" id="trg"></div>
        <div class="actions"><button class="btn" id="tra">${esc(K('tranzit_add'))}</button><button class="btn danger" id="trd">${esc(K('tranzit_del'))}</button>
        <button class="btn secondary" id="trx">${esc(K('close'))}</button></div>`, async (m, close) => {
        let rows = [], cur = null;
        m.style.width = "min(900px, 95vw)"; m.style.maxWidth = "95vw";
        const q = (id) => m.querySelector('#' + id);
        async function fill() {
          try { rows = await api(P + '/tranzit'); } catch (e) { toast(errT(e), 'error'); close(); return; }
          q('trg').innerHTML = table('g_tr', ['ID', 'MAIN_ACC', 'TRANZIT_ACC', 'TRANSIT_ACC_NAME'], rows);
          q('trg').querySelectorAll('tbody tr[data-i]').forEach(tr => tr.onclick = () => {
            cur = rows[+tr.dataset.i]; q('trg').querySelectorAll('tr').forEach(x => x.classList.toggle('sel', x === tr));
          });
          cur = rows[0] || null;
          const f = q('trg').querySelector('tbody tr[data-i]'); if (f) f.classList.add('sel');
        }
        q('trx').onclick = close;
        q('tra').onclick = async () => {
          const v1 = prompt(`Tranzit Hesablar\n${K('tranzit_main')}`) ?? '';             // InputQuery: Cancel keeps ''
          const v2 = prompt(`Tranzit Hesablar\n${K('tranzit_acc')}`) ?? '';
          try { toast((await api(P + '/tranzit', { method: 'POST', body: { main_acc: v1, tranzit_acc: v2 } })).message); } catch (e) { toast(errT(e), 'error'); }
          fill();
        };
        q('trd').onclick = async () => {
          if (!cur || !confirm(K('tranzit_q_del'))) return;
          try { await api(P + '/tranzit/delete', { method: 'POST', body: { rowid: cur.rowid } }); } catch (e) { toast(errT(e), 'error'); }
          fill();
        };
        fill();
      }, true);
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

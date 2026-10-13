/* Cards – port of Packages/Cards_New/cards_azericard (production build) (CARDS.dpr, TMAINFORM). Step 1: the main menu
   (MAINFORMImpl1.dfm toolbar + PopupMenu1 / PopupMenu2) and the card-holder list 'Müştərilər' (customers.pas Tclients,
   api/app/cards.py). Screens not yet ported show a notice; the Delphi right check runs on the server when they are. */
(function () {
  const { api, t, esc, toast } = window.SB;
  const P = '/api/cards', K = (k) => t('cards.' + k);
  const errT = (e) => t(e.key || 'error.generic', e) + (e.ora ? ' ' + e.ora : '');
  // isertbtn.DropdownMenu = PopupMenu1, ToolButton1.DropdownMenu = PopupMenu2 (cards_azericard MAINFORMImpl1.dfm; Dilling1 Visible = False).
  // cards_azericard adds 'Exchange file' (E1) and 'RbsTax' (T1) and captions R1 'RbsDoFile' (Turan: 'RBS DO').
  const MENU1 = ['clients', 'balance', 'payment', 'application', 'newcards', 'verif', 'online', 'k1'];
  const MENU2 = ['cfile', 'dxxx', 'sms', 'intretail', 'rvisa', 'dfile', 'exchange', 'rbsdo', 'rbstax', 'kliring', 'excel', 'cardnumber', 'rez', 'limits', 'poscomm'];
  const DATECOLS = new Set(['DATEOPEN', 'EXPIRY', 'DAT', 'CRDAT']);
  const fmtD = (v) => v ? String(v).slice(0, 10).split('-').reverse().join('.') : '';
  const EDITS = ['CARDNUMBER', 'RBSNUMBER', 'FNAME', 'LNAME', 'CARDHOLDER', 'CREDIT_LIM', 'OLD_ACC_NO'];   // Panel4 (customers.dfm:534-602)
  async function page(el) {
    el.innerHTML = `<div class="card"><div class="toolbar" style="gap:8px;flex-wrap:wrap"><h2 style="margin:0">${esc(K('title'))}</h2>
      ${dd('m1', K('m_proc'), MENU1)}${dd('m2', K('m_oper'), MENU2)}
      <button class="btn secondary" data-ni="sett">${esc(K('m_sett'))}</button><button class="btn secondary" data-ni="rep">${esc(K('m_rep'))}</button></div>
      <div id="cbody"><p class="muted">${esc(K('mi_clients'))} …</p></div></div>`;
    el.querySelectorAll('details.dd [data-mi]').forEach(b => b.onclick = (ev) => { ev.target.closest('details').open = false; item(b.dataset.mi); });
    el.querySelectorAll('[data-ni]').forEach(b => b.onclick = () => toast(K('not_ported')));
    function dd(id, title, items) {
      return `<details class="dd" id="${id}" style="position:relative;display:inline-block"><summary class="btn secondary">${esc(title)} ▾</summary>
        <div class="card" style="position:absolute;z-index:20;min-width:240px;padding:4px">${items.map(i => `<button class="btn ghost sm" style="display:block;width:100%;text-align:left" data-mi="${i}">${esc(K('mi_' + i))}</button>`).join('')}</div></details>`;
    }
    function item(i) {
      if (i === 'clients') return clients(el.querySelector('#cbody'));
      if (i === 'application') return applications(el.querySelector('#cbody'));
      toast(K('not_ported'));
    }
    clients(el.querySelector('#cbody'));                 // the web opens straight on the list (Delphi shows an empty form + logo)
  }

  // Tclients2 edit boxes -> label column (FormActivate :172 field mapping, api/app/cards.py FORM_FIELDS)
  const FF = [['DBLookupComboBox6', 'f_account'], ['Edit14', 'f_kli'], ['Edit29', 'c_CURRENCY'], ['DBEdit17', 'f_ostat'], ['Edit24', 'c_CARDNUMBER'],
    ['Edit15', 'c_FNAME'], ['Edit16', 'c_LNAME'], ['Edit18', 'c_PASSPORT'], ['DateTimePicker7', 'c_BIRTHDAY'], ['Edit17', 'c_HOMEPHONE'],
    ['Edit27', 'c_WORKPHONE'], ['Edit20', 'c_COUNTRY'], ['Edit19', 'c_CITY'], ['Edit22', 'c_ADDRESS'], ['ComboBox4', 'c_RESIDENT'],
    ['ComboBox1', 'c_CARDTYPE'], ['ComboBox12', 'c_CARDSTATUS'], ['Edit28', 'c_CREDIT_LIM'], ['DateTimePicker5', 'c_DATEOPEN'],
    ['DateTimePicker6', 'c_EXPIRY'], ['Edit26', 'c_REFERENCE'], ['Edit23', 'c_EMBOSSNAME'], ['ComboBox2', 'c_COMPANY'], ['Edit25', 'c_SECURITY'],
    ['Edit21', 'c_LANG_CODE'], ['ComboBox11', 'c_TYPES'], ['ComboBox10', 'c_TITUL'], ['ComboBox5', 'f_with'], ['DateTimePicker8', 'f_expiry8']];
  // Tclients2 (Unitclient2.pas): FormActivate :172 opens it; Button1 'Yeni' :583, Button3 'Redaktə et' :1506, ComboBox9Click :1652,
  // Edit14KeyPress :468, DBLookupComboBox6 :2120-2248, CheckBox1Click (emboss name), Button2 'Yadda saxla' :676, Button4 'Bağla'.
  const CBI = { ComboBox4: ['RESIDENT', 'NON-RESIDENT'], ComboBox5: ['WITH', 'WITHOUT'], ComboBox10: ['', 'DR', 'DR.', 'MISS', 'MR', 'MR.', 'MRS', 'MRS.', 'MS', 'MS.', 'Ms', 'PR', 'PR.'],
    ComboBox11: ['', 'VIP'], ComboBox12: ['CARD OK', 'Card Do Not Honor -05', 'PickUp-04', 'PickUp L-41', 'PickUp S-43', 'Z-Decline-57'] };
  // a second dialog on top of the Tclients2 modal (Tkrinfo / TMultiCurrency are ShowModal'ed from inside it)
  function sub(html, onMount) {
    const w = document.createElement('div'); w.className = 'backdrop'; w.style.zIndex = 1100;
    w.innerHTML = `<div class="modal" role="dialog">${html}</div>`; document.body.appendChild(w);
    const close = () => w.remove(); onMount && onMount(w.querySelector('.modal'), close); return close;
  }

  // TMultiCurrency (multiform.pas): shown modally from Button2Click when CheckBox4 (MultiCard) is ticked
  function multi(mc) {
    return new Promise(async (done) => {
      let o; try { o = await api(P + '/clients/form/multi/open', { method: 'POST', body: {} }); } catch (e) { toast(errT(e), 'error'); return done(); }
      const opts = `<option></option>` + o.accounts.map(a => `<option value="${esc(a.acc)}">${esc(a.acc)}</option>`).join('');
      sub(`<h2>MultiCurrency</h2>
        <div style="display:grid;grid-template-columns:auto 1fr 60px;gap:6px;align-items:center">
          <label><input type="checkbox" id="mc_m1"> Multihesab 1</label><select id="mc_a1" style="background:#7fffff">${opts}</select><input id="mc_e1" disabled style="background:#7fffff">
          <label><input type="checkbox" id="mc_m2"> Multihesab 2</label><select id="mc_a2" style="background:#7fffff">${opts}</select><input id="mc_e2" disabled style="background:#7fffff"></div>
        <div class="actions"><button class="btn" id="mc_save">${esc(K('b_save'))}</button></div>`, (mm, cl) => {
        const cur = (a) => (o.accounts.find(x => x.acc === a) || {}).currency || '';
        mm.querySelector('#mc_a1').onchange = (e) => mm.querySelector('#mc_e1').value = cur(e.target.value);   // DBLookupComboBox1Change
        mm.querySelector('#mc_a2').onchange = (e) => mm.querySelector('#mc_e2').value = cur(e.target.value);   // DBLookupComboboxEh2Change
        mm.querySelector('#mc_save').onclick = async () => {
          let r; try { r = await api(P + '/clients/form/multi/save', { method: 'POST', body: { multi1: mm.querySelector('#mc_m1').checked, multi2: mm.querySelector('#mc_m2').checked,
            acc1: mm.querySelector('#mc_a1').value, acc2: mm.querySelector('#mc_a2').value } }); } catch (e) { toast(errT(e), 'error'); return; }
          (r.messages || []).forEach(x => toast(K('msg_' + x.key), 'success')); cl(); done(r);
        };
      });
    });
  }

  async function form(mode, id) {
    let d;
    try { d = await api(P + '/clients/form', { method: 'POST', body: { mode, id } }); } catch (e) { toast(errT(e), 'error'); return; }
    const call = async (path, body) => { try { return await api(P + '/clients/form' + path, { method: 'POST', body }); } catch (e) { toast(errT(e), 'error'); return null; } };
    const st = { f: Object.assign({}, d.fields), en: {}, acc: d.accounts || [], card: (d.cards[0] || {}).id, dbedit18: d.dbedit18 || '' };
    const all = FF.map(x => x[0]).concat(['ComboBox9', 'CheckBox2', 'CheckBox3', 'Edit_acc_name', 'DateTimePicker2']);
    all.forEach(k => st.en[k] = d.enabled);
    if (d.enabled) Object.assign(st.en, { Edit26: false, Edit28: false, ComboBox9: false, ComboBox5: false });
    else st.en.ComboBox9 = false;
    if (!st.f.DateTimePicker2) st.f.DateTimePicker2 = new Date().toISOString().slice(0, 10);   // FormShow: DateTimePicker2 := Date
    const req = new Set(d.required);
    const grid = (cols, rows, gid) => `<div class="tablewrap" style="max-height:22vh"><table class="grid" id="${gid}"><thead><tr>${cols.map(c => `<th>${esc(K('c_' + c))}</th>`).join('')}</tr></thead>
      <tbody>${rows.map(r => `<tr data-id="${r.id}" class="${r.id === st.card && gid === 'cf_g5' ? 'sel' : ''}">${cols.map(c => `<td>${esc(DATECOLS.has(c) ? fmtD(r[c.toLowerCase()]) : (r[c.toLowerCase()] ?? ''))}</td>`).join('')}</tr>`).join('') || `<tr><td colspan="${cols.length}" class="muted">${esc(K('empty'))}</td></tr>`}</tbody></table></div>`;
    const sel = (k, items) => `<select id="cf_${k}" style="width:100%">${(items.includes(st.f[k] ?? '') ? items : [st.f[k] ?? ''].concat(items)).map(x => `<option ${x === (st.f[k] ?? '') ? 'selected' : ''}>${esc(x)}</option>`).join('')}</select>`;
    const ctl = (k) => {
      const aq = req.has(k) ? 'background:#7fffff;' : '';
      if (k === 'ComboBox1') return sel(k, [''].concat(d.cardtypes));
      if (k === 'ComboBox2') return sel(k, [' '].concat(d.companies));
      if (CBI[k]) return sel(k, CBI[k]);
      if (k === 'DBLookupComboBox6') return `<input id="cf_${k}" list="cf_accl" value="${esc(st.f[k] ?? '')}" style="width:100%"><datalist id="cf_accl"></datalist>`;
      return `<input id="cf_${k}" ${k.startsWith('DateTime') ? 'type="date"' : ''} value="${esc(st.f[k] ?? '')}" style="width:100%;${aq}">`;
    };
    window.SB.modal(`<h2>${esc(mode === 'NEW' ? K('form_new') : K('form_edit'))}</h2>
      <div class="toolbar" style="gap:6px;flex-wrap:wrap;margin-bottom:6px">
        <label>${esc(K('f_apptype'))} <select id="cf_ComboBox9">${d.apptype.map(x => `<option>${esc(x)}</option>`).join('')}</select></label>
        <label><input type="checkbox" id="cf_CheckBox4" ${d.multicard ? 'checked' : ''}> MultiCard</label>
        <label><input type="checkbox" id="cf_CheckBox2"> ${esc(K('f_urgent'))}</label>
        <label><input type="checkbox" id="cf_CheckBox3"> ${esc(K('f_kr'))}</label>
        <label><input type="checkbox" id="cf_CheckBox1"> ${esc(K('f_embauto'))}</label>
        <label>${esc(K('f_trandate'))} <input type="date" id="cf_DateTimePicker2" value="${esc(st.f.DateTimePicker2)}" style="background:#7fffff"></label>
        <span class="muted">${esc(K('f_valname'))}: <b id="cf_DBEdit18">${esc(st.dbedit18)}</b></span></div>
      <div style="display:grid;grid-template-columns:repeat(4,1fr);gap:6px 12px">
        ${FF.map(([k, l]) => `<label>${esc(K(l))}<br>${ctl(k)}</label>`).join('')}
        <label>${esc(K('f_accname'))}<br><input id="cf_Edit_acc_name" value="${esc(st.f.Edit_acc_name ?? '')}" style="width:100%"></label></div>
      <div id="cf_grids">${mode === 'EDIT' ? `<h3>${esc(K('g_cards'))}</h3>${grid(d.grid5, d.cards, 'cf_g5')}<h3>${esc(K('g_ops'))}</h3><div id="cf_g6w">${grid(d.grid6, d.operations, 'cf_g6')}</div>
        <h3>${esc(K('g_credits'))}</h3>${grid(['NUMBEROFCREDIT'], d.credits, 'cf_g1')}` : ''}</div>
      <div class="actions"><button class="btn secondary" id="cf_b1">${esc(K('b_new'))}</button>
        ${d.button3 ? `<button class="btn secondary" id="cf_b3">${esc(K('b_edit2'))}</button>` : ''}
        <button class="btn" id="cf_b2">${esc(K('b_save'))}</button><button class="btn secondary" id="cf_close">${esc(t('common.close') || 'Close')}</button></div>`,
      (m, close) => {
        m.style.maxWidth = '1200px'; m.style.width = '95vw';
        const q = (k) => m.querySelector('#cf_' + k);
        const read = () => { FF.forEach(([k]) => { const e = q(k); if (e) st.f[k] = e.value; }); st.f.Edit_acc_name = q('Edit_acc_name').value; st.f.DateTimePicker2 = q('DateTimePicker2').value; };
        const put = (f) => Object.entries(f || {}).forEach(([k, v]) => { st.f[k] = v; const e = q(k); if (!e) return;
          if (e.tagName === 'SELECT' && ![...e.options].some(o => o.value === v)) e.insertAdjacentHTML('afterbegin', `<option>${esc(v)}</option>`); e.value = v; });
        const paint = () => { Object.entries(st.en).forEach(([k, on]) => { const e = q(k); if (e) e.disabled = !on; });
          m.querySelector('#cf_accl').innerHTML = st.acc.map(a => `<option value="${esc(a)}">`).join(''); q('DBEdit18').textContent = st.dbedit18; };
        paint();
        const say = async (r) => { if (!r) return; if (r.error) toast(r.error, 'error');
          for (const x of r.messages || []) toast(K('msg_' + x.key).replace('{date}', (x.args || {}).date || ''), x.key === 'saved' || x.key === 'added' ? 'success' : 'error'); };
        q('close').onclick = close;
        // DBGrid5CellClick :2406 / DblClick :2278 (same body): fill the boxes from the card row and disable them
        m.querySelectorAll('#cf_g5 tbody tr[data-id]').forEach(tr => tr.onclick = async () => { st.card = +tr.dataset.id; m.querySelectorAll('#cf_g5 tr.sel').forEach(x => x.classList.remove('sel')); tr.classList.add('sel');
          const r = await call('/card-click', { card_id: st.card }); if (!r) return; put(r.fields); Object.assign(st.en, r.enabled); q('CheckBox2').checked = false; paint(); });
        // DBGrid1DblClick :556 -> Tkrinfo (creditinfopas.pas, CM_ACTIVE)
        m.querySelectorAll('#cf_g1 tbody tr[data-id]').forEach(tr => tr.ondblclick = async () => {
          const r = await call('/credit-info', { id: +tr.dataset.id }); if (!r) return;
          sub(`<h2>Kredit Info</h2><div class="tablewrap" style="max-height:50vh"><table class="grid" id="kr_g"><thead><tr>${r.columns.map(c => `<th>${esc(c)}</th>`).join('')}</tr></thead>
            <tbody>${r.rows.map(x => `<tr>${r.columns.map(c => `<td>${esc(x[c.toLowerCase()] ?? '')}</td>`).join('')}</tr>`).join('')}</tbody></table></div>
            <div class="actions"><button class="btn secondary" id="kr_close">${esc(t('common.close') || 'Close')}</button></div>`,
            (mm, cl) => { mm.style.maxWidth = '1300px'; mm.style.width = '95vw'; mm.querySelector('#kr_close').onclick = cl; });
        });
        // DBGrid6 PopupMenu1 'SIL' -> SIL1Click :2114 (delete_application, no confirmation, then Refresh)
        const bindG6 = () => m.querySelectorAll('#cf_g6 tbody tr[data-id]').forEach(tr => tr.oncontextmenu = (e) => {
          e.preventDefault(); document.querySelectorAll('.cf_pop').forEach(x => x.remove());
          const pm = document.createElement('div'); pm.className = 'cf_pop'; pm.style.cssText = `position:fixed;left:${e.clientX}px;top:${e.clientY}px;z-index:1200;background:#fff;border:1px solid #888;box-shadow:0 2px 6px #0003`;
          pm.innerHTML = `<button class="btn secondary" id="cf_sil">SIL</button>`; document.body.appendChild(pm);
          const off = () => { pm.remove(); document.removeEventListener('click', off); }; setTimeout(() => document.addEventListener('click', off), 0);
          pm.querySelector('#cf_sil').onclick = async () => { off(); const r = await call('/delete-application', { id: +tr.dataset.id }); if (!r) return;
            q('g6w').innerHTML = grid(d.grid6, r.operations, 'cf_g6'); bindG6(); };
        });
        bindG6();
        // ComboBox1Enter :1462 / ComboBox2Enter :1623 - list reloads (with the Delphi duplicates)
        ['ComboBox1', 'ComboBox2'].forEach(k => q(k).onfocus = async () => { const e = q(k);
          const r = await call('/combo-enter', { combo: k, items: [...e.options].map(o => o.value), item_index: e.selectedIndex }); if (!r) return;
          const v = e.value; e.innerHTML = r.items.map(x => `<option>${esc(x)}</option>`).join('');
          if (r.items.includes(v)) e.value = v; else e.selectedIndex = r.item_index;
          if (r.combobox9_add) q('ComboBox9').insertAdjacentHTML('beforeend', '<option> </option>'); });
        q('Edit28').onkeypress = (e) => { if (!/[0-9]/.test(e.key)) e.preventDefault(); };          // Edit28KeyPress
        ['Edit15', 'Edit16', 'Edit23'].forEach(k => q(k).onkeypress = (e) => { if (e.key.length === 1 && (e.key.charCodeAt(0) > 126 || e.key === '?')) e.preventDefault(); });
        q('CheckBox1').onclick = () => { if (q('CheckBox1').checked) { read(); put({ Edit23: (st.f.ComboBox10 || '') + '/' + st.f.Edit15 + '/' + st.f.Edit16 }); } };
        q('b1').onclick = async () => { const r = await call('/new', {}); if (!r) return; put(r.fields); Object.assign(st.en, r.enabled); st.acc = []; st.dbedit18 = '';
          q('CheckBox2').checked = false; m.querySelectorAll('#cf_grids tbody').forEach(b => b.innerHTML = ''); paint(); };
        if (q('b3')) q('b3').onclick = async () => { const r = await call('/edit', { card_id: st.card ?? null }); if (!r) return; put(r.fields); Object.assign(st.en, r.enabled); q('CheckBox2').checked = false; paint(); };
        q('ComboBox9').onchange = async () => { read(); const r = await call('/apptype', { text: q('ComboBox9').value, edit14: st.f.Edit14 || '', dtp8: st.f.DateTimePicker8 || null });
          if (!r) return; Object.assign(st.en, r.enabled); if (r.accounts) st.acc = r.accounts; put(r.fields); paint(); };
        q('Edit14').onkeydown = async (e) => { if (e.key !== 'Enter') return; const r = await call('/edit14', { edit14: q('Edit14').value }); if (!r) return; await say(r);
          if (r.accounts) st.acc = r.accounts; put(r.fields); paint(); };
        q('DBLookupComboBox6').onchange = async () => { read(); const r = await call('/account', { acc: q('DBLookupComboBox6').value, edit14: st.f.Edit14 || '', event: 'change' });
          if (!r) return; await say(r); put(r.fields); if (r.dbedit18 !== undefined) st.dbedit18 = r.dbedit18; paint(); };
        q('b2').onclick = async () => {
          read();
          const body = { fields: Object.fromEntries(Object.entries(st.f).filter(([k]) => !['ComboBox9', 'DBEdit18'].includes(k))), checkbox2: q('CheckBox2').checked,
            checkbox3: q('CheckBox3').checked, checkbox4: q('CheckBox4').checked, combobox9: q('ComboBox9').value.trim() ? q('ComboBox9').value : '' };
          let r = await call('/save', body); if (!r) return;
          if (r.confirm) { if (!window.confirm(K('msg_' + r.confirm.key).replace('{date}', r.confirm.args.date))) return; r = await call('/save', Object.assign(body, { confirmed: true })); if (!r) return; }
          await say(r);
          if (r.fields) { if (r.fields.ComboBox9 === '') q('ComboBox9').value = d.apptype[0]; const f = Object.assign({}, r.fields); delete f.ComboBox9; put(f); }
          if (r.edit28_red !== undefined) q('Edit28').style.background = r.edit28_red ? '#ff6060' : '';
          if (r.operations && q('g6w')) q('g6w').innerHTML = grid(d.grid6, r.operations, 'cf_g6');
          if (r.operations && q('g6w')) bindG6();
          if (r.multicurrency) await multi(r.multicurrency);
          if (r.close) close();
        };
      });
  }

  // Prosedur ▸ Application (applicationpas.pas TApplications, api/app/cards_app.py): DBGrid1 = urgent (TƏCİLİ), DBGrid2 = simple (NORMAL)
  async function applications(box) {
    const call = async (path, body) => { try { return await api(P + '/applications' + path, { method: 'POST', body }); } catch (e) { toast(errT(e), 'error'); return null; } };
    let d = await call('/open'); if (!d) return;
    const sel = { urgent: new Set(), simple: new Set() };
    const hdr = (c) => c === '' ? '' : K('c_' + c.toUpperCase());
    const cell = (r, c) => { if (c === '') { const n = d.status_img[r.status]; return n !== undefined ? `<img src="/img/cards/app_status_${n}.png" alt="${esc(r.status)}" title="STATUS ${esc(r.status)}">` : ''; }
      const v = r[c.toLowerCase()]; return esc(DATECOLS.has(c.toUpperCase()) ? fmtD(v) : (v ?? '')); };
    const grid = (g) => `<div class="tablewrap" style="max-height:30vh"><table class="grid" id="ap_${g}"><thead><tr>${d.cols.map(c => `<th data-f="${esc(c)}" style="cursor:pointer">${esc(hdr(c))}</th>`).join('')}</tr></thead>
      <tbody>${d[g].map(r => `<tr data-id="${r.id}" class="${sel[g].has(r.id) ? 'sel' : ''}">${d.cols.map(c => `<td>${cell(r, c)}</td>`).join('')}</tr>`).join('') || `<tr><td colspan="${d.cols.length}" class="muted">${esc(K('empty'))}</td></tr>`}</tbody></table></div>`;
    function draw() {
      box.innerHTML = `<h3 style="margin:8px 0">${esc(K('mi_application'))}</h3>
        <div class="toolbar" style="gap:6px"><label>${esc(K('ap_date'))} <input type="date" id="ap_d" value="${esc(d.date)}"></label><button class="btn" id="ap_ref">${esc(K('b_refresh'))}</button></div>
        ${['urgent', 'simple'].map(g => `<h4 style="margin:10px 0 4px">${esc(K('ap_' + g))}</h4>
          <div class="toolbar" style="gap:6px"><button class="btn secondary" data-file="${g}">${esc(K('ap_file'))}</button><button class="btn secondary" data-xls="${g}">${esc(K('b_excel'))}</button>
          <span class="muted">${esc(K('count'))}: ${d[g].length}</span></div>${grid(g)}`).join('')}`;
      box.querySelector('#ap_ref').onclick = async () => { const r = await call('/refresh', { date: box.querySelector('#ap_d').value }); if (r) { d = r; sel.urgent.clear(); sel.simple.clear(); draw(); } };
      ['urgent', 'simple'].forEach(g => {
        const tb = box.querySelector('#ap_' + g);
        tb.querySelectorAll('th').forEach(th => th.onclick = async () => { const r = await call('/sort', { grid: g, field: th.dataset.f }); if (r) { d = r; draw(); } });
        // dgMultiSelect: Ctrl/Shift-click toggles, a plain click selects one row
        tb.querySelectorAll('tbody tr[data-id]').forEach(tr => tr.onclick = (e) => { const id = +tr.dataset.id;
          if (e.ctrlKey || e.metaKey || e.shiftKey) { sel[g].has(id) ? sel[g].delete(id) : sel[g].add(id); } else { sel[g].clear(); sel[g].add(id); } draw(); });
        // PopupMenu1 selectall1 / PopupMenu2 MenuItem1 'SELECT ALL'
        tb.oncontextmenu = (e) => { e.preventDefault(); document.querySelectorAll('.cf_pop').forEach(x => x.remove());
          const pm = document.createElement('div'); pm.className = 'cf_pop'; pm.style.cssText = `position:fixed;left:${e.clientX}px;top:${e.clientY}px;z-index:1200;background:#fff;border:1px solid #888`;
          pm.innerHTML = `<button class="btn secondary" id="ap_all">SELECT ALL</button>`; document.body.appendChild(pm);
          const off = () => { pm.remove(); document.removeEventListener('click', off); }; setTimeout(() => document.addEventListener('click', off), 0);
          pm.querySelector('#ap_all').onclick = () => { off(); d[g].forEach(r => sel[g].add(r.id)); draw(); }; };
      });
      box.querySelectorAll('[data-xls]').forEach(b => b.onclick = async () => {
        const res = await fetch(P + '/applications/excel', { method: 'POST', headers: { 'Content-Type': 'application/json', 'X-CSRF': window.SB.csrf || '' }, credentials: 'same-origin', body: JSON.stringify({ grid: b.dataset.xls }) });
        if (!res.ok) { const j = await res.json().catch(() => ({})); toast(errT(j.detail || {}), 'error'); return; }
        const a = document.createElement('a'); a.href = URL.createObjectURL(await res.blob()); a.download = 'Application.xlsx'; a.click(); });
      // Button2Click :1416 (urgent) / Button5Click :1393 (simple) 'FAYL YARAT': right + MessageDlg, then cr_file2 / cr_file1 on the
      // selected rows (DBGrid.SelectedRows); the created files are downloaded (CARDS_OUT_DIR keeps a server copy)
      const MSG = { 'Fayl yaratmaq istəyirsiniz?': 'msg_ap_file_q', 'Fayl yaradıldı!': 'msg_ap_file_done' };
      const tr = (m) => MSG[m] ? K(MSG[m]) : m;
      box.querySelectorAll('[data-file]').forEach(b => b.onclick = async () => {
        const g = b.dataset.file, body = { grid: g, ids: [...sel[g]] };
        const q = await call('/file', body); if (!q) return;
        if (!window.confirm(tr(q.confirm))) return;
        const r = await call('/file', Object.assign(body, { confirmed: true })); if (!r) return;
        r.files.forEach(f => { const bb = Uint8Array.from(atob(f.b64), c => c.charCodeAt(0)); const a = document.createElement('a');
          a.href = URL.createObjectURL(new Blob([bb], { type: 'application/octet-stream' })); a.download = f.name; a.click(); });
        if (r.error) toast(r.error, 'error');
        r.messages.forEach(m => toast(tr(m) + (r.files.length ? ' ' + r.files.map(f => f.name).join(', ') : '')));
        d = r.view; sel[g].clear(); draw(); });
    }
    draw();
  }

  async function clients(box) {
    const st = { d: null, cur: 0 };
    const call = async (path, body) => { try { return await api(P + path, { method: 'POST', body }); } catch (e) { toast(errT(e), 'error'); return null; } };
    const d = await call('/clients/open');
    if (!d) { box.innerHTML = ''; return; }
    st.d = d;
    document.querySelectorAll('[data-mi=verif]').forEach(b => b.style.display = d.dord === 1 ? '' : 'none');
    const today = new Date(d.today + 'T00:00:00');
    const opt = (a) => `<option value=""></option>` + a.map(x => `<option>${esc(x)}</option>`).join('');
    box.innerHTML = `<h3 style="margin:8px 0">${esc(K('mi_clients'))}</h3>
      <div class="toolbar" style="gap:6px;flex-wrap:wrap">
        <button class="btn" id="c_add">${esc(K('b_add'))}</button><button class="btn" id="c_edit">${esc(K('b_edit'))}</button>
        <button class="btn secondary" id="c_del">${esc(K('b_delete'))}</button><button class="btn secondary" id="c_xls">${esc(K('b_excel'))}</button>
        <button class="btn secondary" id="c_ref">${esc(K('b_refresh'))}</button><button class="btn secondary" id="c_flt">${esc(K('b_filter'))}</button>
        <button class="btn secondary" id="c_srch">${esc(K('b_search'))}</button>
        <span class="muted" style="margin-left:auto"><span style="background:#7fffff;padding:0 6px">&nbsp;</span> ${esc(K('legend_soon'))}
        &nbsp;<span style="background:#ff00ff;padding:0 6px">&nbsp;</span> ${esc(K('legend_exp'))} &nbsp; ${esc(K('count'))}: <b id="c_cnt"></b></span></div>
      <div id="c_p5" class="card" style="display:none;margin:6px 0;padding:8px;gap:10px;flex-wrap:wrap">
        <label><input type="checkbox" data-c="0"> ${esc(K('f_dates'))}</label> <input type="date" id="c_d1" disabled> <input type="date" id="c_d2" disabled>
        <label><input type="checkbox" data-c="1"> ${esc(K('f_filial'))}</label> <select id="c_l1" disabled>${opt(d.lookups.filial)}</select>
        <label><input type="checkbox" data-c="2"> ${esc(K('f_valuta'))}</label> <select id="c_l2" disabled>${opt(d.lookups.valuta)}</select>
        <label><input type="checkbox" data-c="3"> ${esc(K('f_type'))}</label> <select id="c_l3" disabled>${opt(d.lookups.cardtype)}</select>
        <label><input type="checkbox" data-c="4"> ${esc(K('f_status'))}</label> <select id="c_l4" disabled>${opt(d.lookups.cardstatus)}</select>
        <label><input type="checkbox" data-c="5"> ${esc(K('f_company'))}</label> <select id="c_l5" disabled>${opt(d.lookups.company)}</select>
        <button class="btn" id="c_apply">${esc(K('b_apply'))}</button> <code id="c_memo"></code></div>
      <div class="tablewrap" style="max-height:62vh" id="c_grid"></div>
      <div id="c_p4" class="card" style="display:none;margin:6px 0;padding:8px;gap:8px;flex-wrap:wrap">
        ${EDITS.map(f => `<label>${esc(K('c_' + f))}<br><input data-e="${f}" style="width:150px"></label>`).join('')}</div>
      <p class="muted" id="c_ftxt"></p>`;
    const v = (id) => box.querySelector('#' + id);
    const cols = d.cols.filter(c => !d.hidden.includes(c));
    function colour(r) {   // dbGrid2DrawColumnCell :542 - expiry - settings.dateclose < Date -> clAqua, expiry < Date -> clFuchsia
      if (!r.expiry) return (new Date(1899, 11, 30) < today) ? '#ff00ff' : '';
      const e = new Date(String(r.expiry).slice(0, 10) + 'T00:00:00');
      if (e < today) return '#ff00ff';
      if (new Date(e.getTime() - d.dateclose * 86400000) < today) return '#7fffff';
      return '';
    }
    function draw(res) {
      if (res) Object.assign(st.d, res);
      const rows = st.d.rows;
      if (st.cur >= rows.length) st.cur = 0;
      v('c_cnt').textContent = rows.length;
      v('c_ftxt').textContent = st.d.filter ? K('filter_text') + ' ' + st.d.filter : '';
      if (st.d.filter_error) toast(st.d.filter_error, 'error');
      v('c_grid').innerHTML = `<table class="grid acc-grid" id="g_c"><thead><tr>${cols.map(c => `<th data-f="${c}" style="cursor:pointer">${esc(K('c_' + c))}</th>`).join('')}</tr></thead>
        <tbody>${rows.map((r, i) => `<tr data-i="${i}" class="${i === st.cur ? 'sel' : ''}" style="${colour(r) ? 'background:' + colour(r) : ''}">${cols.map(c =>
          `<td>${esc(DATECOLS.has(c) ? fmtD(r[c.toLowerCase()]) : (r[c.toLowerCase()] ?? ''))}</td>`).join('')}</tr>`).join('')
        || `<tr><td colspan="${cols.length}" class="muted">${esc(K('empty'))}</td></tr>`}</tbody></table>`;
      v('c_grid').querySelectorAll('tbody tr[data-i]').forEach(tr => tr.onclick = () => { st.cur = +tr.dataset.i; v('c_grid').querySelectorAll('tr.sel').forEach(x => x.classList.remove('sel')); tr.classList.add('sel'); });
      v('c_grid').querySelectorAll('th[data-f]').forEach(th => th.onclick = async () => { const r = await call('/clients/sort', { field: th.dataset.f }); if (r) draw(r); });
    }
    draw();
    const toggle = (id) => { const p = v(id); p.style.display = p.style.display === 'none' ? 'flex' : 'none'; };
    v('c_flt').onclick = () => toggle('c_p5');           // ToolButton13Click: Panel5.Visible toggle
    v('c_srch').onclick = () => toggle('c_p4');          // ToolButton21Click: Panel4.Visible toggle
    v('c_ref').onclick = async () => { const r = await call('/clients/refresh'); if (r) { box.querySelectorAll('[data-e]').forEach(i => i.value = ''); draw(r); } };
    // isertbtnClick :208 / ToolButton3Click :228 -> Tclients2 (Unitclient2.pas FormShow + FormActivate). Read-only for now.
    v('c_add').onclick = () => form('NEW');
    v('c_edit').onclick = () => { const r = st.d.rows[st.cur]; if (r) form('EDIT', r.id); };
    v('c_xls').onclick = async () => {   // ToolButton7Click :778 -> toexcelExecute :672 (cliexcel) - .xlsx download instead of live Excel
      const res = await fetch(P + '/clients/excel', { method: 'POST', headers: { 'Content-Type': 'application/json', 'X-CSRF': window.SB.csrf || '' }, credentials: 'same-origin', body: '{}' });
      if (!res.ok) { const j = await res.json().catch(() => ({})); toast(errT(j.detail || {}), 'error'); return; }
      const a = document.createElement('a'); a.href = URL.createObjectURL(await res.blob()); a.download = 'CARDS.xlsx'; a.click();
      toast(K('excel_done'));
    };
    v('c_del').onclick = async () => {
      const r = st.d.rows[st.cur]; if (!r) return;
      const ok = confirm(K('confirm_delete'));
      const res = await call('/clients/delete', { id: r.id, confirmed: ok }); if (res) draw(res);
    };
    // CheckBox1..6Click enable their pickers
    const ctl = [['c_d1', 'c_d2'], ['c_l1'], ['c_l2'], ['c_l3'], ['c_l4'], ['c_l5']];
    box.querySelectorAll('#c_p5 [data-c]').forEach(c => c.onchange = () => ctl[+c.dataset.c].forEach(id => v(id).disabled = !c.checked));
    v('c_d1').value = v('c_d2').value = '2011-04-20';     // DateTimePicker Date = 40654 (dfm)
    v('c_apply').onclick = async () => {
      const checks = [...box.querySelectorAll('#c_p5 [data-c]')].map(c => c.checked);
      const r = await call('/clients/filter', { checks, d1: v('c_d1').value, d2: v('c_d2').value, filial: v('c_l1').value, valuta: v('c_l2').value,
        cardtype: v('c_l3').value, cardstatus: v('c_l4').value, company: v('c_l5').value });
      if (r) { v('c_memo').textContent = r.filter; draw(r); }
    };
    // Panel4: OnChange -> Filter; Enter -> SearchRecord(field, text, [srIgnoreCase, srPartialMatch, srFromCurrent, srForward])
    box.querySelectorAll('[data-e]').forEach(inp => {
      inp.oninput = async () => { const r = await call('/clients/edit-filter', { field: inp.dataset.e, text: inp.value }); if (r) draw(r); };
      inp.onkeydown = (ev) => {
        if (ev.key !== 'Enter') return;
        const f = inp.dataset.e.toLowerCase(), q = inp.value.toLowerCase(), rows = st.d.rows;
        const hit = (r) => String(r[f] ?? '').toLowerCase().startsWith(q);   // srPartialMatch = prefix, srFromCurrent includes the current row
        let i = rows.findIndex((r, j) => j >= st.cur && hit(r));
        if (i < 0 && confirm(K('search_wrap'))) { i = rows.findIndex(hit); if (i < 0) alert(K('not_found')); }
        if (i >= 0) { st.cur = i; draw(); v('c_grid').querySelector(`tr[data-i="${i}"]`)?.scrollIntoView({ block: 'nearest' }); }
      };
    });
  }
  window.SB.pages['/m/cards'] = page;
})();

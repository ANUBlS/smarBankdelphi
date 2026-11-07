/* Exchange Manager chunk 3 – set-up forms (Packages/ExchangeMGR-NBC). API: api/app/em_setup.py.
   'Valyuta D. M.': FormAddExch / FormEditExch / office delete / 'Sazlama' / FormParametr / FormAccount + FormExAccModify;
   'Resurslar': FormGivenResurs / FormResursRetrun (PopupMenuResurs), 'Təsdiq etmə', 'Ləğv et';
   'Əməliyyatlar': FormRemainder ('Qalıqlar'); 'Filiallar üzrə məzənnələr': DBNavigator1 (Edit / Post / Cancel / Refresh), Excel. */
(function () {
  const { api, t, esc, toast, modal } = window.SB;
  const P = '/api/exchangemgr/setup', T = (k, p) => t('em.' + k, p);
  const errT = (e) => t(e.key || 'error.generic', e) + (e.ora ? ' ' + e.ora : '');
  const d10 = (s) => String(s || '').slice(0, 10);
  const post = (url, body) => api(P + url, { method: 'POST', body: body || {} });
  const head = (cap, id) => `<div class="cap-head"><h3>${esc(cap)}</h3><button class="btn secondary" id="${id}">✕</button></div>`;
  const noRight = (j) => { if (j && j.message === 'em.err_no_right') { toast(T('err_no_right'), 'error'); return true; } return false; };
  const opts = (rs, key, lab, sel, blank) => (blank ? '<option value=""></option>' : '') + rs.map(r => `<option value="${esc(r[key])}" ${r[key] === sel ? 'selected' : ''}>${esc(r[lab])}</option>`).join('');
  const escKey = (done, m) => { const f = (e) => { if (e.key === 'Escape' && [...document.querySelectorAll('.modal')].pop() === m) done(); }; document.addEventListener('keydown', f); return () => document.removeEventListener('keydown', f); };
  // FormExAccModify is modal over FormAccount: SB.modal holds one dialog, so the nested form gets its own stacked backdrop
  function modal2(html, onMount) {
    const root = document.createElement('div');
    root.innerHTML = `<div class="backdrop" style="z-index:1100"><div class="modal" role="dialog">${html}</div></div>`;
    document.body.appendChild(root);
    const close = () => root.remove();
    onMount && onMount(root.querySelector('.modal'), close);
    return close;
  }
  const simpleGrid = (id, cols, rs, cur) => `<div class="em-grid"><table class="grid acc-grid" id="${id}"><thead><tr>${cols.map(c => `<th>${esc(T(c[1]))}</th>`).join('')}</tr></thead><tbody>${
    rs.map((r, i) => `<tr data-i="${i}" class="${i === cur ? 'sel' : ''}">${cols.map(c => `<td>${esc(r[c[0]] ?? '')}</td>`).join('')}</tr>`).join('')}</tbody></table></div>`;

  // ------------------------------------------------------------------ FormAddExch / FormEditExch
  async function officeDialog(ctx, edit) {
    const o = ctx.office();
    let j;
    try { j = edit ? await post('/office/edit-open', { id: o ? o.id : null }) : await post('/office/add-open'); } catch (e) { toast(errT(e), 'error'); return; }
    if (noRight(j)) return;
    const v = edit ? j : { ex_no: '', ex_name: '', ex_address: '', ex_worker_name: '', ex_check_no: '', filial: j.filial };   // FormActivate clears
    const row = (id, k, val, extra) => `<label>${esc(T(k))}</label><input id="${id}" value="${esc(val ?? '')}" ${extra || ''}>`;
    modal(`${head(edit ? 'Edit' : 'ADD', 'oX')}<div class="em-form em-form-2">
        ${row('oNo', 'ae_no', v.ex_no, 'inputmode="numeric"')}${row('oName', 'ae_name', v.ex_name)}${row('oAddr', 'ae_addr', v.ex_address)}
        ${row('oWork', 'ae_worker', v.ex_worker_name)}${row('oChk', 'ae_check', v.ex_check_no)}
        <label>${esc(T('ae_filial'))}</label><select id="oFil">${opts(j.filials, 'id', 'name', v.filial, v.filial === null || v.filial === undefined)}</select></div>
      <div class="toolbar" style="justify-content:flex-end"><button class="btn" id="oOk">${esc(T('b_ok'))}</button><button class="btn secondary" id="oAb">${esc(T('b_abort'))}</button></div>`, (m, close) => {
      m.style.width = 'min(640px, 96vw)';
      const q = (id) => m.querySelector('#' + id);
      const off = escKey(() => done(), m), done = () => { off(); close(); };
      q('oX').onclick = done; q('oAb').onclick = done;
      // Edit_ex_noKeyPress: AddExch ['0'..'9', ',', '.', #8], EditExch ['0'..'9', #8]
      q('oNo').onkeypress = (e) => { if (!(edit ? /[0-9]/ : /[0-9.,]/).test(e.key)) e.preventDefault(); };
      q('oNo').focus();
      q('oOk').onclick = async () => {                                                    // SpBtnOkClick
        const body = { ex_no: q('oNo').value, ex_name: q('oName').value, ex_address: q('oAddr').value, ex_worker_name: q('oWork').value,
          ex_check_no: q('oChk').value, filial: q('oFil').value === '' ? null : +q('oFil').value, id: edit && o ? o.id : null };
        try { const r = await post(edit ? '/office/edit' : '/office/add', body); if (noRight(r)) return; ctx.S.offices = r.offices; done(); ctx.draw(); }
        catch (e) { toast(errT(e), 'error'); }                                             // exception -> the form stays open
      };
    });
  }
  async function officeDelete(ctx) {                                                       // ToolBtnDeleteClick2
    const o = ctx.office();
    try {
      let j = await post('/office/delete', { id: o ? o.id : null });
      if (noRight(j)) return;
      if (j.ask) { if (!confirm(T('q_delete'))) return; j = await post('/office/delete', { id: o ? o.id : null, confirmed: true }); }
      if (j.offices) { ctx.S.offices = j.offices; if (ctx.S.cur >= j.offices.length) ctx.S.cur = 0; }
    } catch (e) { toast(errT(e), 'error'); }
    ctx.draw();
  }
  async function iniSettings(file) {                                                       // ToolButton15Click2 / TBGBClick
    try { const j = await post('/role'); if (noRight(j)) return; if (j.done) toast(T('ini_local', { file }), 'info'); } catch (e) { toast(errT(e), 'error'); }
  }

  // ------------------------------------------------------------------ FormAccount + FormExAccModify
  const ACC = [['val_name', 'ac_val'], ['purchase_acc_no', 'ac_purchase'], ['selling_acc_no', 'ac_selling'], ['profit_acc_no', 'ac_profit'],
    ['harm_acc_no', 'ac_harm'], ['cash_acc_no', 'ac_cash'], ['pur_acc_no', 'ac_pur']];
  async function accountForm(ctx) {                                                        // ToolButton17Click
    const ex_no = ctx.office() ? ctx.office().ex_no : null;
    let acc;
    try { acc = (await post('/acc/list', { ex_no })).acc; } catch (e) { toast(errT(e), 'error'); return; }
    let cur = 0;
    modal(`${head('FormAccount', 'aX')}<div class="toolbar">${['aAdd:add', 'aEdit:edit', 'aDel:delete', 'aCancel:b_cancel', 'aRef:refresh', 'aSet:settings']
      .map(x => { const [id, k] = x.split(':'); return `<button class="btn secondary" id="${id}">${esc(T(k))}</button>`; }).join('')}</div><div id="aGrid"></div>`, (m, close) => {
      m.style.width = 'min(1100px, 96vw)'; m.style.maxWidth = '96vw';
      const q = (id) => m.querySelector('#' + id);
      const off = escKey(() => done(), m), done = () => { off(); close(); };
      const draw = () => { q('aGrid').innerHTML = simpleGrid('gAcc', ACC, acc, cur); m.querySelectorAll('#gAcc tr[data-i]').forEach(tr => tr.onclick = () => { cur = +tr.dataset.i; draw(); }); };
      draw();
      q('aX').onclick = done;
      q('aCancel').onclick = async () => { try { const j = await post('/acc/refresh', { ex_no }); if (!noRight(j)) done(); } catch (e) { toast(errT(e), 'error'); } };   // ToolButton17Click (SMART only)
      q('aRef').onclick = async () => { try { const j = await post('/acc/refresh', { ex_no }); if (!noRight(j)) { acc = j.acc; cur = 0; draw(); } } catch (e) { toast(errT(e), 'error'); } };
      q('aSet').onclick = () => iniSettings('ExchangeBalance.ini');
      q('aDel').onclick = async () => {                                                  // ToolBtnDeleteChClick
        const a = acc[cur], body = { ex_no, acc_id: a ? a.id : null };
        try {
          let j = await post('/acc/delete', body); if (noRight(j)) return;
          if (j.ask) { if (!confirm(T('q_delete'))) return; j = await post('/acc/delete', { ...body, confirmed: true }); }
          if (j.acc) { acc = j.acc; cur = 0; draw(); }
        } catch (e) { toast(errT(e), 'error'); }
      };
      const modify = (mode) => accModify(ex_no, mode, acc[cur], (rs) => { acc = rs; cur = 0; draw(); });
      q('aAdd').onclick = () => modify(1); q('aEdit').onclick = () => modify(2);
    });
  }
  async function accModify(ex_no, mode, cur, after) {
    let j;
    try { j = await post('/acc/open', { ex_no, mode, acc_id: cur ? cur.id : null }); } catch (e) { toast(errT(e), 'error'); return; }
    if (noRight(j) || !j.done) return;
    const L = { ...j };
    const accSel = (id, list, val) => `<select id="${id}"><option value="" ${val === null ? 'selected' : ''}></option>${val === -1 ? '<option value="-1" selected></option>' : ''}${opts(L[list], 'id', 'acc_no', val)}</select>`;
    const valSel = () => `<select id="mVal">${j.val_id === -1 ? '<option value="-1" selected></option>' : ''}${opts(j.valutes, 'valute', 'val_name', j.val_id)}</select>`;
    const S_ = j.sel;
    // UnitExAccModify.dfm order (Top): Filial, Valyutası, Manat, Valyuta, Kredit, Debit, Kassa(manat), Kassa(valyuta)
    modal2(`${head(mode === 1 ? 'AddAccount' : 'EditAccount', 'mX')}<div class="em-form em-form-1">
        <label>${esc(T('ac_filial'))}</label><select id="mFil" disabled>${opts(j.filials, 'id', 'name', j.filial)}</select>
        <label>${esc(T('ac_val'))}</label>${valSel()}
        <label>${esc(T('ac_purchase'))}</label>${accSel('mPu', 'main_debt', S_.purchase)}
        <label>${esc(T('ac_selling'))}</label><span id="mSeW">${accSel('mSe', 'main_cred', S_.selling)}</span>
        <label>${esc(T('ac_profit'))}</label>${accSel('mPr', 'child_debt', S_.profit)}
        <label>${esc(T('ac_harm'))}</label>${accSel('mHa', 'child_cred', S_.harm)}
        <label>${esc(T('ac_cash'))}</label>${accSel('mCa', 'cash_debt', S_.cash)}
        <label>${esc(T('ac_pur'))}</label><span id="mPcW">${accSel('mPc', 'cash_kredit', S_.pur)}</span></div>
      <div class="toolbar" style="justify-content:center"><button class="btn" id="mOk">${esc(T('b_ok'))}</button></div>`, (m, close) => {
      const q = (id) => m.querySelector('#' + id);
      const off = escKey(() => done(), m), done = () => { off(); close(); };
      q('mX').onclick = done;
      const key = (id) => { const v = q(id).value; return v === '' ? null : +v; };
      q('mVal').onchange = async () => {                                                  // DBCBoxValuteClick
        try {
          const r = await post('/acc/currency', { val_id: key('mVal'), filial: j.filial });
          const se = key('mSe'), pc = key('mPc'); L.main_cred = r.main_cred; L.cash_kredit = r.cash_kredit;
          q('mSeW').innerHTML = accSel('mSe', 'main_cred', se); q('mPcW').innerHTML = accSel('mPc', 'cash_kredit', pc);
        } catch (e) { toast(errT(e), 'error'); }
      };
      q('mOk').onclick = async () => {                                                    // BtnOkClick
        const sv = q('mVal'), body = { mode, ex_no, acc_id: cur ? cur.id : null, val_id: key('mVal'), val_name: sv.value === '-1' ? '' : (sv.selectedOptions[0] || {}).textContent || '',
          purchase_acc_id: key('mPu'), selling_acc_id: key('mSe'), profit_acc_id: key('mPr'), harm_acc_id: key('mHa'), cash_acc_id: key('mCa'), pur_acc_id: key('mPc') };
        try { const r = await post('/acc/save', body); if (noRight(r)) return; after(r.acc); done(); } catch (e) { toast(errT(e), 'error'); }
      };
    });
  }

  // ------------------------------------------------------------------ FormParametr (ToolButton31Click)
  async function parametrForm() {
    let j;
    try { j = await post('/param/open'); } catch (e) { toast(errT(e), 'error'); return; }
    if (noRight(j)) return;
    let cu = 0, co = 0, ca = 0, ai = j.admin_in;
    modal(`${head('FormParametr', 'pX')}<div class="em-par">
        <fieldset class="cd-g"><legend>${esc(T('pa_users'))}</legend><div id="pU"></div></fieldset>
        <fieldset class="cd-g"><legend>${esc(T('pa_offices'))}</legend><div class="em-par2"><div id="pO"></div><div id="pA"></div></div></fieldset></div>`, (m, close) => {
      m.style.width = 'min(900px, 96vw)'; m.style.maxWidth = '96vw';
      const q = (id) => m.querySelector('#' + id);
      const off = escKey(() => done(), m), done = () => { off(); close(); };
      q('pX').onclick = done;
      const user = () => j.users[cu] || {};
      const draw = () => {
        q('pU').innerHTML = simpleGrid('gPU', [['name', 'pa_user']], j.users, cu);
        q('pO').innerHTML = simpleGrid('gPO', [['ex_name', 'pa_all']], j.offices, co);
        q('pA').innerHTML = simpleGrid('gPA', [['ex_name', 'pa_sel']], ai, ca);
        m.querySelectorAll('#gPU tr[data-i]').forEach(tr => tr.onclick = async () => {   // ODSExAdminIn master ODSParametr
          cu = +tr.dataset.i; ca = 0; try { ai = (await post('/param/admin-in', { user_id: user().id })).admin_in; } catch (e) { toast(errT(e), 'error'); } draw(); });
        m.querySelectorAll('#gPO tr[data-i]').forEach(tr => { tr.onclick = () => { co = +tr.dataset.i; draw(); }; tr.ondblclick = add; });
        m.querySelectorAll('#gPA tr[data-i]').forEach(tr => { tr.onclick = () => { ca = +tr.dataset.i; draw(); }; tr.ondblclick = del; });
      };
      async function add() {                                                              // DBGrid2DblClick
        const o = j.offices[co]; if (!o) return;
        try { const r = await post('/param/add', { user_id: user().id, user_name: user().name || '', ex_no: o.ex_no }); if (!noRight(r)) ai = r.admin_in; } catch (e) { toast(errT(e), 'error'); }
        draw();
      }
      async function del() {                                                              // DBGrid3DblClick / Delete key
        const a = ai[ca]; if (!a) return;
        try { const r = await post('/param/del', { user_id: user().id, ex_no: a.ex_id }); if (!noRight(r)) { ai = r.admin_in; ca = 0; } } catch (e) { toast(errT(e), 'error'); }
        draw();
      }
      m.tabIndex = -1;
      m.onkeydown = (e) => { if (e.key === 'Delete' && m.querySelector('#gPA tr.sel')) del(); if (e.key === 'Enter' && m.querySelector('#gPO tr.sel')) add(); };
      draw();
    });
  }

  // ------------------------------------------------------------------ FormRemainder (TlBOstatClick2)
  const REM = [['dat', 'c_date'], ['val_name', 'c_dollar'], ['first_ostat', 'c_first'], ['ftpe_ostat', 'c_ftpe'], ['pefr_ostat', 'c_pefr'],
    ['purchase_turn', 'c_pturn'], ['selling_turn', 'c_sturn'], ['current_ostat', 'c_current']];
  function remainderForm(ctx) {
    const ex_no = ctx.office() ? ctx.office().ex_no : null;
    let dat = d10(ctx.S.dat), rs = [];                                                     // DateTimePicker1 := DTP_System_Date
    modal(`${head('View Current Remainder....', 'rmX')}<div class="toolbar"><button class="btn secondary" id="rmRef">${esc(T('refresh'))}</button>
        <input type="date" id="rmDat" value="${esc(dat)}"><button class="btn secondary" id="rmPrint">${esc(T('print'))}</button></div><div id="rmG"></div>`, (m, close) => {
      m.style.width = 'min(1000px, 96vw)'; m.style.maxWidth = '96vw';
      const q = (id) => m.querySelector('#' + id);
      const off = escKey(() => done(), m), done = () => { off(); close(); };
      q('rmX').onclick = done;
      const fmt = (r) => ({ ...r, dat: d10(r.dat).split('-').reverse().join('.') });
      const run = async () => {                                                           // ToolButton1Click (FormShow too)
        try { rs = (await post('/remainder', { ex_no, dat: q('rmDat').value || dat })).rows; } catch (e) { toast(errT(e), 'error'); }
        q('rmG').innerHTML = simpleGrid('gRm', REM, rs.map(fmt), -1);
      };
      q('rmRef').onclick = run;
      q('rmPrint').onclick = () => rs.length ? toast(T('on_hold', { what: T('print') }), 'info') : toast(T('err_nothing_found'), 'info');   // Excel1Click
      run();
    });
  }

  // ------------------------------------------------------------------ Resurslar: FormGivenResurs / FormResursRetrun
  async function resursDialog(ctx, give) {
    const b = { ...ctx.body(), rem_dat: d10(ctx.S.dat) };
    let j;
    try { j = await post(give ? '/resurs/give-open' : '/resurs/return-open', b); } catch (e) { toast(errT(e), 'error'); return; }
    modal(`${head(T(give ? 'rs_give' : 'rs_return'), 'gX')}<div class="em-head">${esc(T(give ? 'rs_give_h' : 'rs_return_h'))}</div>
      <div class="em-form em-form-2">
        <label>${esc(T('rs_vdm'))}</label><input readonly value="${esc(j.vdm || '')}">
        <label>${esc(T('rs_val'))}</label><select id="gVal"><option value="-1" selected></option>${opts(j.valutes, 'valute', 'val_name', null)}</select>
        <label>${esc(T('rs_amount'))}</label><input id="gAmt" value="0.00" style="text-align:right">
        ${give ? `<label><input type="checkbox" id="gNext"> ${esc(T('rs_next'))}</label><input type="date" id="gNd" disabled>` : ''}</div>
      <div class="toolbar" style="justify-content:center"><button class="btn" id="gOk">${esc(T('b_ok'))}</button><button class="btn secondary" id="gAb">${esc(T('b_abort'))}</button></div>`, (m, close) => {
      m.style.width = 'min(560px, 96vw)';
      const q = (id) => m.querySelector('#' + id);
      const off = escKey(() => done(), m), done = () => { off(); close(); };
      q('gX').onclick = done; q('gAb').onclick = done;
      const num = () => { const n = Number(String(q('gAmt').value).replace(/\s/g, '').replace(',', '.')); return isNaN(n) ? 0 : n; };
      if (give) q('gNext').onchange = () => { q('gNd').disabled = !q('gNext').checked; };   // CheckBox1Click
      if (!give) q('gVal').onchange = async () => {                                        // DBLookupComboBox2CloseUp
        try { const r = await post('/resurs/return-amount', { ...b, val_id: +q('gVal').value }); q('gAmt').value = Number(r.amount).toFixed(2); } catch (e) { toast(errT(e), 'error'); }
      };
      q('gOk').onclick = async () => {                                                    // Button1Click
        const sv = q('gVal'), body = { ...b, val_id: +sv.value, val_name: sv.value === '-1' ? '' : sv.selectedOptions[0].textContent, amount: num() };
        if (give) Object.assign(body, { next_day: q('gNext').checked, next_dat: q('gNd').value || null });
        try {
          const r = await post(give ? '/resurs/give' : '/resurs/return', body);
          if (r.message) { toast(T(r.message.slice(3)), 'error'); return; }
          ctx.S.resurs = r.resurs; done(); ctx.draw();
        } catch (e) { toast(errT(e), 'error'); }
      };
    });
  }
  async function resursConfirm(ctx, r) {                                                   // ToolButton34Click
    try { const j = await post('/resurs/confirm', { ...ctx.body(), id: r ? r.id : null }); if (j.resurs) ctx.S.resurs = j.resurs; if (j.done) toast(T('confirmed'), 'success'); }
    catch (e) { toast(errT(e), 'error'); }
    ctx.draw();
  }
  async function resursDelete(ctx, r) {                                                    // ToolButton38Click
    if (!r) return;
    try {
      let j = await post('/resurs/delete', { ...ctx.body(), id: r.id });
      if (j.ask) { if (!confirm(T('q_resurs_delete'))) return; j = await post('/resurs/delete', { ...ctx.body(), id: r.id, confirmed: true }); }
      if (j.resurs) { ctx.S.resurs = j.resurs; ctx.S.curR = 0; }
    } catch (e) { toast(errT(e), 'error'); }
    ctx.draw();
  }

  // ------------------------------------------------------------------ DBNavigator1 on ODSRatesFilial
  const RF_EDIT = ['val_purchase_course_user', 'val_selling_course_user', 'cashless_purchase_course', 'cashless_selling_course'];
  async function rfNav(ctx, button) {
    const S = ctx.S, row = S.rates_filial[S.curF];
    if (button === 'post') {
      if (!S.rfEdit) return;
      const changes = {};
      RF_EDIT.forEach(k => { if (k in S.rfEdit.vals && S.rfEdit.vals[k] !== S.rfEdit.orig[k]) changes[k.toUpperCase()] = S.rfEdit.vals[k]; });
      const bad = Object.values(changes).find(v => typeof v === 'string');
      if (bad !== undefined) { toast(`'${bad}' is not a valid floating point value`, 'error'); return; }   // TFloatField.SetAsString
      if (!Object.keys(changes).length) { S.rfEdit = null; ctx.draw(); return; }        // nothing modified -> no UPDATE
      try {
        const j = await post('/rates-filial/post', { rowid: S.rfEdit.rowid, changes, ex_id: S.filialKey, dat: S.filialDate });
        S.rates_filial = j.rates_filial; S.rfEdit = null;
        if (j.message) toast(j.message, 'error');
      } catch (e) { toast(errT(e), 'error'); }                                            // post failed -> stays in edit mode
      ctx.draw(); return;
    }
    if (button === 'edit') { if (!row || S.rfEdit) return; S.rfEdit = { rowid: row.rowid, i: S.curF, orig: { ...row }, vals: { ...row } }; }
    if (button === 'cancel') { if (!S.rfEdit) return; S.rfEdit = null; }
    if (button === 'refresh' && S.rfEdit) { await rfNav(ctx, 'post'); }                  // Refresh -> CheckBrowseMode posts first
    try {
      const j = await post('/rates-filial/nav', { button, ex_id: S.filialKey, dat: S.filialDate });
      if (j.rates_filial) S.rates_filial = j.rates_filial;
      if (j.message) toast(j.message, 'error');
    } catch (e) { toast(errT(e), 'error'); }
    ctx.draw();
  }

  window.SB.emSetup = { officeDialog, officeDelete, iniSettings, accountForm, parametrForm, remainderForm, resursDialog, resursConfirm, resursDelete, rfNav, RF_EDIT };
})();

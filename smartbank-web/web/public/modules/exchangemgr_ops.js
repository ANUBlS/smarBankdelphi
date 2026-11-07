/* Exchange Manager chunk 2 – 'Əməliyyatlar' operations (Packages/ExchangeMGR-NBC). API: api/app/em_trans.py.
   FormPurchase (UnitPurchase.pas/.dfm) and FormSelling (UnitSelling.pas/.dfm) opened from the 'Əlavə et' PopupMenu
   (Purchase / Selling; the third item ExchangeCurrency is Visible = False in Delphi and is not shown), 'Təsdiq etmə'
   (ToolButton27Click) and 'Ləğv et' (ToolButton6Click2). */
(function () {
  const { api, t, esc, toast, modal } = window.SB;
  const P = '/api/exchangemgr/trans', T = (k, p) => t('em.' + k, p);
  const errT = (e) => t(e.key || 'error.generic', e) + (e.ora ? ' ' + e.ora : '');
  const msgT = (j) => j.message === 'em.err_raw' ? j.text : t(j.message);
  const d10 = (s) => String(s || '').slice(0, 10);
  // FormatFloat('0.000000', x) (UnitPurchase) / FormatFloat('#.0000000', x) (UnitSelling); Null.AsFloat = 0
  const fmtP = (v) => Number(v || 0).toFixed(6);
  const fmtS = (v) => { const s = Number(v || 0).toFixed(7); return s.startsWith('0.') ? s.slice(1) : s.startsWith('-0.') ? '-' + s.slice(2) : s; };
  const asStr = (v) => v === null || v === undefined ? '' : String(v);           // TField.AsString of a Float

  // ------------------------------------------------------------------ FormPurchase / FormSelling
  async function opDialog(kind, ctx) {
    const b = ctx.body();
    let j;
    try { j = await api(P + '/open', { method: 'POST', body: { kind, ...b, rf_ex_id: ctx.S.filialKey, rf_dat: ctx.S.filialDate } }); }
    catch (e) { toast(errT(e), 'error'); return; }
    if (!j.opened) { toast(T(j.message.slice(3)), 'error'); return; }               // 'Yeni kurslar daxil edin!!!'
    const P_ = kind === 'purchase', K = (a, s) => T(P_ ? a : s);
    const st = ctx.S.opForm[kind] || (ctx.S.opForm[kind] = {});
    // FormActivate: ex_date_change = 2 -> exit before ClearEdit (the auto-created form keeps its last contents)
    if (j.clear || !st.f) st.f = { val_id: null, nb: '', course: '', beg: '', end: '', amount: '', ekv: '', fee: '', setting: '', cashless: false,
      cust_name: '', cust_lname: '', cust_father: '', cust_passport: '', cust_date: '', cust_confirm: '', cust_giving_member: '', cust_country: '', country: 'AZE' };
    const F = st.f; F.cashless = false;                                              // RadioButton1.Checked := True
    const acc = j.acc, office = ctx.office();
    const lk = (id, k) => `<select id="${id}" disabled><option></option>${(j.cust[k] || []).map(v => `<option>${esc(v)}</option>`).join('')}</select>`;
    const inp = (id, v, ro, extra) => `<input id="${id}" value="${esc(v)}" ${ro ? 'readonly' : ''} ${extra || ''}>`;
    modal(`<div class="cap-head"><h3>${esc(K('ps_title_p', 'ps_title_s'))}</h3><button class="btn secondary" id="psX">✕</button></div>
      <fieldset class="cd-g"><legend>${esc(K('ps_main_p', 'ps_main_s'))}</legend>
        <div class="em-form">
          <label>${esc(T('l_date'))}</label><input type="date" disabled value="${esc(d10(j.date))}">
          <label>${esc(T('l_time'))}</label><input id="psTime" disabled value="${esc(j.time || '')}" style="width:90px">
          <label>${esc(T('ps_exch'))}</label>${inp('psExch', office ? office.ex_name : '', true)}
          <label>${esc(T('ps_setting'))}</label>${inp('psSet', F.setting, true, 'style="grid-column:span 3"')}
        </div>
        <div class="em-head">${esc(K('ps_head_p', 'ps_head_s'))}</div>
        <div class="toolbar"><label><input type="radio" name="psR" value="0" checked> ${esc(T('ps_cash'))}</label>
          <label><input type="radio" name="psR" value="1"> ${esc(P_ ? T('ps_cashless') : T('ps_cash'))}</label></div>
        <fieldset class="cd-g"><legend>${esc(T('ps_g_cur'))}</legend><div class="em-form">
          <label>${esc(T('ps_currency'))}</label><select id="psCur"><option value=""></option>${acc.map(a => `<option value="${a.val_id}" ${a.val_id === F.val_id ? 'selected' : ''}>${esc(a.val_name)}</option>`).join('')}</select>
          <label>${esc(T('ps_nb'))}</label>${inp('psNb', F.nb, true)}
          <label>${esc(K('ps_course_p', 'ps_course_s'))}</label>${inp('psCourse', F.course, true)}
          <label>==></label>${inp('psAzn', 'AZN', true)}</div></fieldset>
        <fieldset class="cd-g"><legend>${esc(K('ps_range_p', 'ps_range_s'))}</legend><div class="em-form">
          <label>${esc(T('ps_beg'))}</label>${inp('psBeg', F.beg, true)}<label>${esc(T('ps_end'))}</label>${inp('psEnd', F.end, true)}</div></fieldset>
        <div class="em-form">
          <label>${esc(T('ps_amount'))}</label>${inp('psAmt', F.amount, false, F.val_id === null ? 'disabled' : '')}
          <label>${esc(T('ps_ekv'))}</label>${inp('psEkv', F.ekv, true)}
          <label>${esc(T('ps_fee'))}</label>${inp('psFee', F.fee, true)}</div>
        <fieldset class="cd-g"><legend>${esc(T('ps_g_cust'))}</legend><div class="em-form em-form-cust">
          <label>${esc(T('ps_cname'))}</label>${inp('psCn', F.cust_name)}${lk('psLCn', 'cust_name')}
          <label>${esc(T('ps_clname'))}</label>${inp('psCl', F.cust_lname)}${lk('psLCl', 'cust_lname')}
          <label>${esc(T('ps_cfather'))}</label>${inp('psCf', F.cust_father)}${lk('psLCf', 'cust_father')}
          <label>${esc(T('ps_passport'))}</label>${inp('psPas', F.cust_passport, false, 'maxlength="8"')}<span></span>
          <label>${esc(T('ps_cdate'))}</label><input id="psCd" type="date" value="${esc(F.cust_date)}"><span></span>
          <label>${esc(T('ps_cconfirm'))}</label>${inp('psCc', F.cust_confirm)}${lk('psLCc', 'cust_confirm')}
          <label>${esc(T('ps_cgiving'))}</label>${inp('psCg', F.cust_giving_member)}${lk('psLCg', 'cust_giving_member')}
          <label>${esc(T('ps_country'))}</label>${inp('psCo', F.cust_country)}<span>${lk('psLCo', 'cust_country')} ${inp('psAze', F.country)}</span>
        </div></fieldset>
        <div class="toolbar" style="justify-content:flex-end"><button class="btn" id="psRun">${esc(T('ps_run'))}</button><button class="btn secondary" id="psExit">${esc(T('ps_exit'))}</button></div>
      </fieldset>`, (m, close) => {
      m.style.width = 'min(860px, 96vw)'; m.style.maxWidth = '96vw';
      const q = (id) => m.querySelector('#' + id);
      const timer = setInterval(() => { const x = q('psTime'); if (!x) return clearInterval(timer); x.value = new Date().toTimeString().slice(0, 8); }, 1000);   // TimerTimer
      const done = () => { clearInterval(timer); document.removeEventListener('keydown', esc_); close(); };
      const esc_ = (e) => { if (e.key === 'Escape') done(); };                                      // FormKeyPress / FormKeyDown VK_ESCAPE
      document.addEventListener('keydown', esc_);
      const cur = () => acc.find(a => a.val_id === F.val_id);
      const sync = () => { q('psNb').value = F.nb; q('psCourse').value = F.course; q('psBeg').value = F.beg; q('psEnd').value = F.end;
        q('psAmt').value = F.amount; q('psEkv').value = F.ekv; q('psFee').value = F.fee; q('psSet').value = F.setting; q('psAmt').disabled = F.val_id === null || F.amountOff; };
      let seq = 0;
      async function amountChange() {                                                // Edit_Purchase_AmountChange / Edit_Selling_AmountChange
        const n = ++seq, a = cur();
        try {
          const r = await api(P + '/calc', { method: 'POST', body: { kind, amount: F.amount, course: F.course, nb_course: F.nb, val_name: a ? a.val_name : '' } });
          if (n !== seq) return;
          if (r.error) { toast(r.error, 'error'); return; }                           // EConvertError
          F.setting = r.setting; F.ekv = r.ekv_amount; F.fee = r.fee_amount; sync();
        } catch (e) { toast(errT(e), 'error'); }
      }
      function currencyClick() {                                                      // DBLC_CurrencyClick
        const a = cur(); if (!a) return;
        const f = P_ ? fmtP : fmtS, side = P_ ? 'purchase' : 'selling';
        F.beg = f(a[`val_${side}_course`]); F.end = f(a[`val_${side}_course_end`]);
        F.course = f(F.cashless ? a[`cashless_${side}_course`] : a[`val_${side}_course_user`]);
        F.nb = asStr(a.val_nb_course); F.amountOff = false; sync();
        if (F.amount !== '') amountChange();
      }
      function clearEdit() {                                                          // ClearEdit + Edit_*_Amount.Enabled := false
        if (F.amount !== '') F.setting = '';                                          // Edit_*_Amount.Text := '' fires OnChange
        Object.assign(F, { val_id: null, nb: '', course: '', amount: '', ekv: '', fee: '',
          cust_name: '', cust_lname: '', cust_father: '', cust_passport: '', cust_date: '', cust_confirm: '', cust_giving_member: '', cust_country: '' });
        if (P_) { F.beg = ''; F.end = ''; }                                           // FormSelling.ClearEdit leaves EditSellingCourseBegin/End
        F.amountOff = true; q('psCur').value = '';
        ['psCn', 'psCl', 'psCf', 'psPas', 'psCd', 'psCc', 'psCg', 'psCo'].forEach(id => q(id).value = '');
        sync();
      }
      q('psCur').onchange = () => { F.val_id = q('psCur').value === '' ? null : +q('psCur').value; currencyClick(); };
      m.querySelectorAll('input[name=psR]').forEach(r => r.onchange = () => { F.cashless = r.value === '1'; clearEdit(); });   // RadioButton1Click
      q('psAmt').oninput = () => { F.amount = q('psAmt').value; if (F.amount === '') { F.setting = F.ekv = F.fee = ''; sync(); } else amountChange(); };
      q('psAmt').onblur = () => {                                                     // Edit_*_AmountExit: course range
        const s = Number(F.course), lo = Number(F.beg), hi = Number(F.end);
        if (F.course === '' || isNaN(s)) return;
        if (s < lo) { toast(K('ps_lt_beg_p', 'ps_lt_beg_s'), 'error'); F.course = F.beg; sync(); }
        if (s > hi) { toast(K('ps_gt_end_p', 'ps_gt_end_s'), 'error'); F.course = F.end; sync(); }
      };
      if (P_) q('psPas').onkeypress = (e) => { if (!/[0-9.]/.test(e.key)) e.preventDefault(); };     // Edit_PasportKeyPress (purchase only)
      const bind = (id, k) => q(id).oninput = () => { F[k] = q(id).value; };
      [['psCn', 'cust_name'], ['psCl', 'cust_lname'], ['psCf', 'cust_father'], ['psPas', 'cust_passport'], ['psCd', 'cust_date'], ['psCc', 'cust_confirm'],
        ['psCg', 'cust_giving_member'], ['psCo', 'cust_country'], ['psAze', 'country']].forEach(([id, k]) => bind(id, k));
      q('psX').onclick = done; q('psExit').onclick = done;
      if (j.clear) { F.amountOff = true; sync(); }
      q('psRun').onclick = async () => {                                              // BtnRunClick
        const a = cur(), btn = q('psRun'); btn.disabled = true;
        try {
          const r = await api(P + '/save', { method: 'POST', body: { kind, ...ctx.body(), trans_date: d10(j.date), val_id: F.val_id, val_name: a ? a.val_name : '',
            amount: F.amount, ekv_amount: F.ekv, fee_amount: F.fee, course: F.course, nb_course: F.nb, setting: F.setting, exch_name: office ? office.ex_name || '' : '',
            cashless: F.cashless, cust_name: F.cust_name, cust_lname: F.cust_lname, cust_father: F.cust_father, cust_passport: F.cust_passport,
            cust_date: F.cust_date || null, cust_confirm: F.cust_confirm, cust_giving_member: F.cust_giving_member, cust_country: F.cust_country, country: F.country } });
          if (r.message) toast(msgT(r), 'error');
          if (r.closed) { ctx.apply(r); done(); ctx.draw(); }
        } catch (e) { toast(errT(e), 'error'); }
        btn.disabled = false;
      };
    });
  }

  // ------------------------------------------------------------------ ToolButton27Click / ToolButton6Click2
  async function confirmTrans(ctx, r) {
    if (!r) return;
    try { const j = await api(P + '/confirm', { method: 'POST', body: { ...ctx.body(), id: r.id } }); ctx.apply(j); if (j.done) toast(T('confirmed'), 'success'); }
    catch (e) { toast(errT(e), 'error'); try { ctx.apply(await api('/api/exchangemgr/office', { method: 'POST', body: ctx.body() })); } catch (_) { /* keep */ } }
    ctx.draw();
  }
  async function deleteTrans(ctx, r) {
    if (!r) return;
    try {
      let j = await api(P + '/delete', { method: 'POST', body: { ...ctx.body(), id: r.id } });
      if (j.ask) { if (!confirm(T('q_delete'))) return; j = await api(P + '/delete', { method: 'POST', body: { ...ctx.body(), id: r.id, confirmed: true } }); }
      ctx.apply(j);
    } catch (e) { toast(errT(e), 'error'); }
    ctx.draw();
  }
  window.SB.emOps = { opDialog, confirmTrans, deleteTrans };
})();

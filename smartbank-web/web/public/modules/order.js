/* Order ('Sərəncam') – port of Packages/Order (TOrderForm, OrderImpl.pas/.dfm + OrderDataModuleUnit).
   Layout as the Delphi form (one tab 'Sərəncam'): GroupBox1 (№, TARİX, Valyuta), p5 (Müştərinin tipi + Hesablaşma /
   Ehtiyyat hesabı search edits with the account name), p1-p4 (Əsas borcundan / Faiz borcundan / Ehtiyyat hesabından /
   Cərimə sanksiyası: check box, amount, ' - ', qəpik), Panel23 (RGDescription, RGReserveDescription), Button1 'Sərəncam'
   and the three signature edits. Button1 builds a QuickReport (OrderRpt.Preview): print on hold.
   TSearchEdit (SBCM_ComponentsStorage/SearchEdit.pas) and the master/detail account lists are reproduced here;
   SQL in api/app/order.py. */
(function () {
  const { api, t, esc, toast } = window.SB;
  const P = '/api/order', T = (k, p) => t('ord.' + k, p);
  const errT = (e) => t(e.key || 'error.generic', e) + (e.ora ? ' ' + e.ora : '');

  // TSearchEdit: Change -> Locate(SearchField, Text, [loCaseInsensitive, loPartialKey]) (only while focused and Tag = 0);
  // found -> white + text completed with the found value (completed part selected); not found -> red, Tag := 1.
  // KeyDown: Delete / Backspace -> Tag := 1, other keys Tag := 0; Enter -> Text := current value. DoExit: white;
  // Text <> '' -> Text := current value.
  function searchEdit(inp, ds, field, onMove) {
    let tag = 0;
    inp.addEventListener('keydown', (e) => {
      tag = (e.key === 'Delete' || e.key === 'Backspace') ? 1 : 0;
      if (e.key === 'Enter') { const r = ds.rows[ds.i]; inp.value = r ? (r[field] ?? '') : ''; }
    });
    inp.addEventListener('input', () => {
      if (tag !== 0 || inp.value === '') return;
      const q = inp.value.toLowerCase(), last = inp.value.length;
      const j = ds.rows.findIndex(r => String(r[field] ?? '').toLowerCase().startsWith(q));
      if (j >= 0) {
        ds.i = j; onMove(); const s = String(ds.rows[j][field] ?? '');
        inp.value = s; inp.setSelectionRange(last, s.length); inp.style.background = '#ffffff';
      } else { inp.style.background = '#ff0000'; tag = 1; }
    });
    inp.addEventListener('blur', () => {
      inp.style.background = '#ffffff';
      if (inp.value !== '') { const r = ds.rows[ds.i]; inp.value = r ? (r[field] ?? '') : ''; }
    });
  }

  async function page(el) {
    el.innerHTML = '<div class="spinner"></div>';
    let I; try { I = await api(P + '/init'); } catch (e) { el.innerHTML = `<div class="card"><div class="alert error">${esc(errT(e))}</div></div>`; return; }
    const S = { cur: 0, client: { rows: I.client, i: 0 }, reserve: { rows: I.reserve, i: 0 } };
    const line = (n, cap, checked) => `<div class="ord-line" style="display:flex;align-items:center;gap:6px;height:30px;border:1px solid var(--border);padding:0 4px">
        <span style="width:160px;font-size:15px">${esc(T(cap))}</span><input type="checkbox" id="oCB${n}" ${checked ? 'checked' : ''}>
        <span style="flex:1"></span><input id="oA${n}" style="width:158px"><input id="oS${n}" value=" - " style="width:29px"><input id="oC${n}" style="width:62px"></div>`;
    el.innerHTML = `<div class="card order"><div class="toolbar"><h2 style="margin:0">${esc(T('title'))}</h2></div>
      <div class="tabs" style="margin-top:6px"><button class="tab active">${esc(T('tab'))}</button></div>
      <div style="max-width:732px;border:1px solid var(--border);padding:0">
        <fieldset class="cd-g" style="margin:0;display:flex;align-items:center;gap:8px;height:44px">
          <span style="font-size:15px">№</span><input id="oNum" style="width:110px">
          <span style="font-size:15px;margin-left:20px">${esc(T('date'))}</span><input type="date" id="oDate" value="${esc(I.date)}" style="width:138px">
          <span style="font-size:15px;margin-left:30px">${esc(T('currency'))}</span>
          <select id="oCur" style="width:70px">${I.currencies.map((c, i) => `<option value="${i}">${esc(c.val_name ?? '')}</option>`).join('')}</select></fieldset>
        <div style="display:flex;min-height:74px;border:1px solid var(--border)">
          <fieldset class="cd-g" style="width:120px;margin:0;font-size:12px;white-space:nowrap;box-sizing:border-box"><legend>${esc(T('cust_type'))}</legend>
            <label><input type="radio" name="oUT" value="0"> ${esc(T('ut_phys'))}</label><br><label><input type="radio" name="oUT" value="1"> ${esc(T('ut_legal'))}</label></fieldset>
          <div style="flex:1;display:flex;flex-direction:column">
            <div style="display:flex;align-items:center;gap:6px;height:35px;padding:0 4px"><b style="width:130px;font-size:12px">${esc(T('settle_acc'))}</b>
              <input id="oContract" style="width:182px"><input id="oClientName" readonly style="width:276px"></div>
            <div style="display:flex;align-items:center;gap:6px;height:34px;padding:0 4px"><b style="width:130px;font-size:12px">${esc(T('reserve_acc'))}</b>
              <input id="oReserve" style="width:182px"><input id="oReserveName" readonly style="width:276px"></div></div></div>
        ${line(1, 'main_debt', true)}${line(2, 'interest_debt', true)}${line(3, 'reserve_from', false)}${line(4, 'penalty', false)}
        <div style="display:flex;height:108px;border:1px solid var(--border)">
          <fieldset class="cd-g" style="width:319px;margin:0">${['d_partial', 'd_full', 'd_interest'].map((k, i) => `<label><input type="radio" name="oRGD" value="${i}" ${i === 0 ? 'checked' : ''}> ${esc(T(k))}</label><br>`).join('')}</fieldset>
          <fieldset class="cd-g" style="width:250px;margin:0">${['r_decrease', 'r_increase'].map((k, i) => `<label><input type="radio" name="oRGR" value="${i}"> ${esc(T(k))}</label><br>`).join('')}</fieldset></div>
        <div style="height:44px;display:flex;align-items:center;justify-content:flex-end;padding-right:24px;border:1px solid var(--border)">
          <button class="btn" id="oBtn" style="width:81px">${esc(T('btn'))}</button></div>
        ${[['sign_chef', 'oE1'], ['sign_credit_chef', 'oE2'], ['sign_manager', 'oE3']].map(([k, id]) => `<div style="display:flex;align-items:center;gap:6px;height:34px;padding:0 17px">
          <span style="width:170px;font-size:12px">${esc(T(k))}</span><input id="${id}" style="width:345px"></div>`).join('')}
      </div></div>`;
    const v = (id) => el.querySelector('#' + id);
    const showNames = () => {                                         // DBEdit2 / DBEdit3: NAME of the current detail record
      const c = S.client.rows[S.client.i], r = S.reserve.rows[S.reserve.i];
      v('oClientName').value = c ? (c.name ?? '') : ''; v('oReserveName').value = r ? (r.name ?? '') : '';
    };
    // ActiveFormCreate :395-396: both search edits take Acc_No of the first detail record
    v('oContract').value = S.client.rows[0] ? S.client.rows[0].acc_no : '';
    v('oReserve').value = S.reserve.rows[0] ? S.reserve.rows[0].acc_no : '';
    showNames();
    searchEdit(v('oContract'), S.client, 'acc_no', showNames);
    searchEdit(v('oReserve'), S.reserve, 'acc_no', showNames);
    v('oContract').addEventListener('keypress', (e) => {               // ContractAccountsKeyPress :536-547
      if (e.key !== 'Enter') return;
      const c = S.client.rows[S.client.i]; const id = c ? Math.trunc(c.kli_id) : 0;   // FieldByName('KLI_ID').AsInteger
      const j = S.reserve.rows.findIndex(r => r.kli_id === id); if (j >= 0) S.reserve.i = j;   // Locate('KLI_ID', ID, [])
      const r = S.reserve.rows[S.reserve.i]; v('oReserve').value = r ? (r.acc_no ?? '') : ''; showNames();
    });
    v('oCur').onchange = async () => {                                 // CBCurrencys: master moves -> details re-open; OnChange clears
      const c = I.currencies[+v('oCur').value];
      v('oContract').value = ''; v('oReserve').value = '';             // CBCurrencysChange :530-534
      try { const d = await api(P + '/accounts', { method: 'POST', body: { valute: c.valute } });
        S.client.rows = d.client; S.client.i = 0; S.reserve.rows = d.reserve; S.reserve.i = 0; showNames(); }
      catch (e) { toast(errT(e), 'error'); }
    };
    v('oBtn').onclick = () => toast(T('on_hold'), 'info');             // Button1Click: OrderRpt.Preview (QuickReport) - on hold
  }
  window.SB.pages['/m/order'] = page;
})();

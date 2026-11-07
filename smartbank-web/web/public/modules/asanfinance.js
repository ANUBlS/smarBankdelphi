/* ASAN Finance – port of Packages/ASANFinance (TASANFinanceForm, ASANFinanceImpl.pas/.dfm + AsanDmInpl TAsanDm).
   Layout as the Delphi form: PageControl1 tabs 'Məlumat' (inner tabs 'Balans haqqında məlumat' / 'Xərclər haqqında
   məlumat'; 'Ödənişlər' is TabVisible = False), 'Fərdi məlumat' (active at start: TabIndex := 1), 'İş yeri məlumatları',
   'Təqaüd və Müavinət', 'Təsərrüfat məlumatla(EKTİS)', 'VÖEN İnfo'. The 'Çap et' buttons are QuickReport prints (on hold).
   The HTTP calls to ASAN Finance and the asan_log writes run in api/app/asanfinance.py. */
(function () {
  const { api, t, esc, toast } = window.SB;
  const P = '/api/asan', T = (k, p) => t('asan.' + k, p);
  const errT = (e) => t(e.key || 'error.generic', e) + (e.ora ? ' ' + e.ora : '');
  const PERS = [['DocumentNumber', 'l_doc'], ['Name', 'l_name'], ['Surname', 'l_surname'], ['Patronymic', 'l_patronymic'], ['BirthDate', 'l_birthdate'],
    ['BirthAddress', 'l_birthplace'], ['Gender', 'l_gender'], ['RegistrationAddress', 'l_regaddr'], ['GivenDate', 'l_given'], ['ExpireDate', 'l_expire'],
    ['MaritalStatus', 'l_marital'], ['GivenOrganization', 'l_givenorg'], ['Citizenship', 'l_citizen'], ['MilitaryStatus', 'l_military'],
    ['BloodType', 'l_blood'], ['EyeColor', 'l_eye'], ['Height', 'l_height']];
  const GRID = {
    xerc: [['ROW_NUMBER', 'No'], ['ID', 'ID'], ['PIN', 'PIN'], ['DAT', 'DAT'], ['SERVICE', 'SERVICE'], ['AMOUNT', 'AMOUNT'], ['IPADDRESS', 'IPADDRESS']],
    active: [['ROW_NUMBER', 'No'], ['ID', 'ID'], ['VOEN', 'c_voen'], ['NAME', 'c_wp_name'], ['WORKERCOUNT', 'c_workers'], ['LEGALADDRESS', 'c_legaladdr'],
      ['EMLAKNOVU', 'c_property'], ['ISHCIADI', 'c_name'], ['SURNAME', 'c_surname'], ['PATRONYMIC', 'c_patronymic'], ['PHONE', 'c_phone'],
      ['ISHYERINOVU', 'c_worktype'], ['WORKPLACE', 'c_workplace'], ['POSITION', 'c_position'], ['SALARY', 'c_salary'], ['BEGINDATE', 'c_contract'], ['MQAVILE_BITME', 'c_contract_end']],
    deactive: [['ROW_NUMBER', 'No'], ['ID', 'ID'], ['VOEN', 'c_voen'], ['NAME', 'c_wp_name'], ['POSITION', 'c_position'], ['SALARY', 'c_salary'], ['BEGINDATE', 'c_begin'], ['ENDDATE', 'c_end']],
    farms: [['ROW_NUMBER', 'No'], ['ID', 'ID'], ['NAME', 'c_farm_region'], ['VILLAGENAME', 'c_village'], ['DOCTYPE', 'c_land_type'], ['PLNAME', 'c_plants'], ['PLFIELDAMOUNT', 'c_pl_area'], ['PLUNIT', 'c_pl_unit']],
    voen: [['ROW_NUMBER', 'No'], ['ID', 'ID'], ['PAYER_TYPE', 'PAYER_TYPE'], ['PAYER_DESCRIPTION', 'PAYER_DESCRIPTION'], ['LEGAL_ADDRESS', 'LEGAL_ADDRESS'], ['VOEN', 'VOEN'],
      ['VOEN_CREATE_DATE', 'VOEN_CREATE_DATE'], ['CHIEF_NAME', 'CHIEF_NAME'], ['CHIEF_SURNAME', 'CHIEF_SURNAME'], ['CHIEF_PATRONYMIC', 'CHIEF_PATRONYMIC']],
  };
  const cap = (c) => /^[A-Z_]+$/.test(c) || c === 'No' ? c : T(c);
  const grid = (key, rows) => `<thead><tr>${GRID[key].map(([, c]) => `<th>${esc(cap(c))}</th>`).join('')}</tr></thead>
    <tbody>${(rows || []).map(r => `<tr>${GRID[key].map(([f]) => `<td>${esc(r[f.toLowerCase()] ?? '')}</td>`).join('')}</tr>`).join('')}</tbody>`;

  async function page(el) {
    el.innerHTML = '<div class="spinner"></div>';
    let I; try { I = await api(P + '/init'); } catch (e) { el.innerHTML = `<div class="card"><div class="alert error">${esc(errT(e))}</div></div>`; return; }
    const pinPanel = (n, lab, btn) => `<div class="toolbar" style="gap:8px;align-items:center;border:1px solid var(--border);padding:6px">
      <span>${esc(T(lab))}</span><input id="aE${n}" style="width:150px"><button class="btn secondary" id="aB${n}">${esc(T(btn))}</button>
      <button class="btn secondary" id="aP${n}">${esc(T('print'))}</button></div>`;
    const dbe = (id, lab) => `<label style="display:flex;gap:6px;align-items:center;font-size:12px;margin:2px 0"><span style="width:130px">${esc(T(lab))}</span><input id="${id}" readonly style="width:220px"></label>`;
    el.innerHTML = `<div class="card asan"><div class="toolbar"><h2 style="margin:0">${esc(T('title'))}</h2></div>
      <div class="tabs" id="aTabs" style="margin-top:6px">${['t_info', 't_personal', 't_work', 't_pension', 't_farm', 't_voen'].map((k, i) =>
        `<button class="tab${i === 1 ? ' active' : ''}" data-t="${i}">${esc(T(k))}</button>`).join('')}</div>
      <div class="a-page" data-p="0" style="display:none">
        <div class="tabs" id="aTabs2"><button class="tab" data-t="0">${esc(T('t_balance'))}</button><button class="tab active" data-t="1">${esc(T('t_expenses'))}</button></div>
        <div class="a-page2" data-p="0" style="display:none"><div class="toolbar" style="gap:10px;align-items:center;border:1px solid var(--border);padding:8px">
          <span>${esc(T('rest_balance'))}</span><b id="aBal">0</b><button class="btn secondary" id="aBalBtn">${esc(T('load'))}</button></div></div>
        <div class="a-page2" data-p="1"><fieldset class="cd-g"><legend>${esc(T('selection'))}</legend>
          <div style="display:flex;gap:10px;align-items:center;flex-wrap:wrap">
            <label>StartDate <input type="datetime-local" step="1" id="aD1" value="${esc(I.now.replace(' ', 'T'))}"></label>
            <label>EndDate <input type="datetime-local" step="1" id="aD2" value="${esc(I.now.replace(' ', 'T'))}"></label>
            <label>Offset <input id="aOff" value="0" style="width:70px"></label><label>Limit <input id="aLim" value="0" style="width:70px"></label>
            <button class="btn secondary" id="aExpBtn">${esc(T('load'))}</button><button class="btn secondary" id="aXls">Excel</button></div>
          <div style="font-size:12px">${esc(T('limit_hint'))}</div><textarea id="aMemo4" rows="2" style="width:100%" readonly></textarea></fieldset>
          <div class="tablewrap" style="min-height:300px"><table class="grid" id="aGX">${grid('xerc', [])}</table></div></div></div>
      <div class="a-page" data-p="1">
        <div class="toolbar" style="gap:8px;align-items:center;border:1px solid var(--border);padding:6px">
          <span>${esc(T('enter_pin'))}</span><input id="aPIN" style="width:120px"><span>${esc(T('series_no'))}</span><input id="aPasp" style="width:120px">
          <button class="btn secondary" id="aPersBtn">${esc(T('load'))}</button><button class="btn secondary" id="aPersPrint">${esc(T('print'))}</button>
          <button class="btn secondary" id="aCust">${esc(T('open_customer'))}</button><span id="aL46" style="font-size:12px"></span></div>
        <div style="display:flex;gap:20px;margin-top:8px"><div>${PERS.map(([f, l]) => `<label style="display:flex;gap:6px;align-items:center;font-size:12px;margin:2px 0">
          <span style="width:190px">${esc(T(l))}</span><input id="aF_${f}" readonly style="width:300px"></label>`).join('')}</div>
          <div style="width:160px;height:200px;border:1px solid var(--border)"><img id="aImg" alt="" style="max-width:100%;max-height:100%;display:none"></div></div></div>
      <div class="a-page" data-p="2" style="display:none">${pinPanel(1, 'enter_pin', 'load')}
        <fieldset class="cd-g"><legend>${esc(T('active_wp'))}</legend><div class="tablewrap" style="min-height:180px"><table class="grid" id="aGA">${grid('active', [])}</table></div></fieldset>
        <fieldset class="cd-g"><legend>${esc(T('deactive_wp'))}</legend><div class="tablewrap" style="min-height:140px"><table class="grid" id="aGD">${grid('deactive', [])}</table></div></fieldset></div>
      <div class="a-page" data-p="3" style="display:none">${pinPanel(2, 'enter_pin', 'load')}
        <div style="display:flex;gap:10px;flex-wrap:wrap;margin-top:6px">
          <fieldset class="cd-g"><legend>${esc(T('personal_data'))}</legend>${dbe('aPN_NAME', 'c_name')}${dbe('aPN_SURNAME', 'c_surname')}${dbe('aPN_PATRONYMIC', 'c_patronymic')}${dbe('aPN_BIRTHDATE', 'l_birthdate')}</fieldset>
          <fieldset class="cd-g"><legend>${esc(T('pension_data'))}</legend>${dbe('aPN_PENSTARTDATE', 'c_begin')}${dbe('aPN_PENENDDATE', 'c_end')}${dbe('aPN_PENDESCRIPTION', 'pen_type')}${dbe('aPN_PENAMOUNT', 'pen_amount')}${dbe('aPN_PENLABEL', 'pen_label')}</fieldset>
          <fieldset class="cd-g"><legend>${esc(T('allowance_data'))}</legend>${dbe('aPN_ALLBEGINDATE', 'c_begin')}${dbe('aPN_ALLENDDATE', 'c_end')}${dbe('aPN_ALLTYPE', 'all_type')}${dbe('aPN_ALLGROUP', 'all_group')}${dbe('aPN_ALLAMOUNT', 'c_amount')}</fieldset></div></div>
      <div class="a-page" data-p="4" style="display:none">${pinPanel(3, 'enter_pin', 'load')}
        <fieldset class="cd-g"><legend>${esc(T('personal_data'))}</legend>${dbe('aFP_FIRSTNAME', 'c_name')}${dbe('aFP_LASTNAME', 'c_surname')}${dbe('aFP_FATHERNAME', 'c_patronymic')}${dbe('aFP_BIRTHDATE', 'l_birthdate')}</fieldset>
        <div class="tablewrap" style="min-height:200px"><table class="grid" id="aGF">${grid('farms', [])}</table></div></div>
      <div class="a-page" data-p="5" style="display:none">${pinPanel(4, 'enter_voen', 'load')}
        <div class="tablewrap" style="min-height:200px"><table class="grid" id="aGV">${grid('voen', [])}</table></div></div></div>`;
    const v = (id) => el.querySelector('#' + id);
    const S = { xid: null };
    const tabs = (bar, cls) => bar.querySelectorAll('.tab').forEach(b => { b.onclick = () => {
      bar.querySelectorAll('.tab').forEach(x => x.classList.toggle('active', x === b));
      el.querySelectorAll(cls).forEach(p => { p.style.display = p.dataset.p === b.dataset.t ? '' : 'none'; }); }; });
    tabs(v('aTabs'), '.a-page'); tabs(v('aTabs2'), '.a-page2');
    const held = () => toast(T('print_on_hold'), 'info');
    ['aPersPrint', 'aP1', 'aP2', 'aP3', 'aP4'].forEach(id => { v(id).onclick = held; });
    // common result handling: connection error message (CheckAsan), then Status message (exit) or the datasets
    function shown(j) {
      if (j.conn_error) alert(T('conn_problem', { msg: j.conn_error }));
      if (j.error) { alert(T(j.error.replace('asan.', ''), { field: j.field || '' })); return false; }
      if (j.message !== undefined) { alert(j.message); return false; }
      return true;
    }
    async function call(path, body) {
      try { return await api(P + path, { method: 'POST', body }); } catch (e) { alert(errT(e)); return null; }
    }
    const fillDB = (prefix, row) => el.querySelectorAll(`[id^="${prefix}"]`).forEach(i => { i.value = row ? (row[i.id.slice(prefix.length).toLowerCase()] ?? '') : ''; });
    v('aBalBtn').onclick = async () => { const j = await call('/balance', {}); if (j && shown(j)) v('aBal').textContent = j.balance; };          // Button3Click
    v('aExpBtn').onclick = async () => {                                                                                                   // Button7Click
      const dt = (id) => v(id).value.replace('T', ' ') + (v(id).value.length === 16 ? ':00' : '');
      const j = await call('/expenses', { start: dt('aD1'), end: dt('aD2'), offset: +v('aOff').value || 0, limit: +v('aLim').value || 0 });
      if (!j) return; v('aMemo4').value = j.memo4 || ''; S.xid = j.id; if (shown(j)) v('aGX').innerHTML = grid('xerc', j.expenses);
    };
    v('aXls').onclick = async () => {                                                                                                      // Button8Click
      const res = await fetch(P + '/expenses_excel', { method: 'POST', headers: { 'Content-Type': 'application/json', 'X-CSRF': window.SB.csrf || '' }, credentials: 'same-origin', body: JSON.stringify({ id: S.xid ?? -1 }) });
      if (!res.ok) { const j = await res.json().catch(() => ({})); toast(errT(j.detail || {}), 'error'); return; }
      const a = document.createElement('a'); a.href = URL.createObjectURL(await res.blob()); a.download = 'Xercler.xlsx'; a.click();
    };
    v('aPersBtn').onclick = async () => {                                                                                                  // Button2Click
      v('aL46').textContent = T('connecting');
      const j = await call('/personal', { pin: v('aPIN').value, doc: v('aPasp').value });
      v('aL46').textContent = T('connected');
      if (!j) return;
      Object.entries(j.fill || {}).forEach(([k, x]) => { if (k === 'PIN') v('aPIN').value = x; else v('aF_' + k).value = x; });
      if (!shown(j)) return;
      const img = v('aImg'); if (j.image) { img.src = 'data:image/jpeg;base64,' + j.image; img.style.display = ''; } else { img.removeAttribute('src'); img.style.display = 'none'; }
    };
    v('aCust').onclick = async () => {                                                                                                     // Button9Click
      const fields = { PIN: v('aPIN').value }; PERS.forEach(([f]) => { fields[f] = v('aF_' + f).value; });
      const j = await call('/add_customer', { fields }); if (j && j.cust_id > 0) alert(T('cust_opened', { id: j.cust_id }));
    };
    v('aB1').onclick = async () => {                                                                                                       // Button4Click
      v('aPasp').value = ''; const j = await call('/employee', { pin: v('aE1').value });
      if (j && shown(j)) { v('aGA').innerHTML = grid('active', j.active); v('aGD').innerHTML = grid('deactive', j.deactive); }
    };
    v('aB2').onclick = async () => {                                                                                                       // Button5Click
      v('aPasp').value = ''; const j = await call('/pension', { pin: v('aE2').value });
      if (j && shown(j)) fillDB('aPN_', (j.pension || [])[0]);
    };
    v('aB3').onclick = async () => {                                                                                                       // Button6Click
      const j = await call('/farm', { pin: v('aE3').value, doc: v('aPasp').value });
      if (j && shown(j)) { fillDB('aFP_', (j.person || [])[0]); v('aGF').innerHTML = grid('farms', j.farms); }
    };
    v('aB4').onclick = async () => {                                                                                                       // Button10Click
      const j = await call('/voen', { pin: v('aE4').value, doc: v('aPasp').value });
      if (j && shown(j)) v('aGV').innerHTML = grid('voen', j.voen);
    };
  }
  window.SB.pages['/m/asanfinance'] = page;
})();

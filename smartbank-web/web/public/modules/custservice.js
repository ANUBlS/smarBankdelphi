/* Customer service - port of Delphi Packages/PCustService_irshad (PCustServiceForm + FormCustomers picker + PEPUnit +
   Creditİmpl + DepozLmpl + FormOperationLmpl). All business rules / SQL live in the API (api/app/custservice.py);
   this file only mirrors the form: PageControl1 tab 0 (Seçim) is the shared left filter sidebar, tabs 1..12 are the
   detail card, MainGrid / MainGrid2 / XDBGrid2 are the grids. Not-yet-migrated actions show a message on their own button. */
(function () {
  const { api, t, esc, toast } = window.SB;
  const fmtD = (v) => window.SB.fmtD(v);
  const L = (k, p) => t('csv.' + k, p);
  const FL = (k) => t('csv.f_' + k);
  const P = '/api/custservice';
  // label number -> control that carries the red '*' (XFLabelN beside the control in the dfm)
  const STAR = {8:'CBoxDocType1',26:'EditDocSerie1',92:'EditPINCode1',12:'EditITN',41:'Resident',42:'EditITN',144:'Eh3',24:'EditFullName',
    62:'DBLC_INCORP_CNTR',66:'Dtp_Ustav',67:'incor_number',101:'Dpt_Nal',9:'EditFirstName',10:'EditPatronymic',11:'EditLastName',
    86:'CBoxCitizenship',118:'CBoxGender',119:'CBoxFamStatus',121:'CBox',122:'cust_compani',145:'Eh2',81:'CBoxBirthState',82:'CBoxBirthCity',
    97:'BirthDate',80:'EditAddress',83:'CBoxAddressState',84:'CBoxAddressCity',68:'Fakt_Adrs_State',69:'Fakt_Adrs_City',28:'EditAddressFactical',
    75:'issue_country',85:'CBoxDocPlace2',87:'CBoxDocType',98:'DocDate',99:'DocExpiryDate',27:'EditDocSerie',54:'Address_type',55:'CityByConctType',
    56:'db_tph_adress',58:'tph_contact_type',59:'tph_communication_type',60:'Db_tph_number',25:'CountryByConctType',127:'EditEmail',
    128:'EditPhoneMob',146:'EditPhoneCity',104:'WORK_VID_SOB',105:'WORK_OTRASLI',112:'Edit_activity',113:'Edit_profession',
    115:'Work_Place',116:'Work_Post',117:'Work_Address'};
  // dependent combos (DataModPCustService AfterScroll): field -> [lookup, key, list, parent, parent value -> bind]
  const DEP = {
    CBoxBirthCity: ['Odscities', 'CITY_NAME', 'CITY_NAME', 'CBoxBirthState', (v) => cntrId('Odscountries1', v)],
    CBoxAddressCity: ['Odscities1', 'CITY_NAME', 'CITY_NAME', 'CBoxAddressState', (v) => cntrId('Odscountries2', v)],
    Fakt_Adrs_City: ['ODSFakt_Adrs_City', 'ID', 'CITY_NAME', 'Fakt_Adrs_State', (v) => v],
    CityByConctType: ['CityByConctType', 'ID', 'CITY_NAME', 'CountryByConctType', (v) => v],
    Comb_riskdescid: ['ODS_CUST_RISK_DESC', 'ID', 'NAME', 'ComboBox_risk', (v) => v],
  };
  // [field, kind, tab]  kind: t text, c combo, d date, m memo, dep dependent combo, dl text + list (TComboBox), ro read-only
  const FIELDS = [
    ['EditFullName','t',1],['EditShort_name','t',1],['OrganizationTypeCB','c',1],['BranchCB','c',1],['TaXAreaCB','c',1],['gerdat','d',1],
    ['Edit_reg_no','t',1],['DBLC_INCORP_CNTR','c',1],['DB_INCORP_STATE','t',1],['incor_number','t',1],['Dtp_Ustav','d',1],['Dpt_Nal','d',1],
    ['EditLastName','t',2],['EditFirstName','t',2],['EditPatronymic','t',2],['Edit10','t',2],['CBoxCitizenship','c',2],['DBLookupComboBox1','c',2],
    ['CBoxGender','c',2],['CBoxFamStatus','c',2],
    ['ComboBox_risk','c',3],['Comb_riskdescid','dep',3],['samelydate','d',3],['CBoxGroup','c',3],['Relation','c',3],['Eh2','c',3],['CBox','c',3],
    ['ActionAreaCB','c',3],['sfereday_kod','c',3],['cust_compani','c',3],
    ['BirthDate','d',4],['CBoxBirthState','c',4],['CBoxBirthCity','dep',4],['CBoxAddressState','c',4],['CBoxAddressCity','dep',4],['EditAddress','t',4],
    ['Fakt_Adrs_State','c',4],['Fakt_Adrs_City','dep',4],['ZipFakt','t',4],['EditAddressFactical','t',4],['fakt_adress_owner','c',4],
    ['CBoxDocType','c',5],['EditPINCode','t',5],['EditDocSerie','t',5],['EditDocNumber','t',5],['issue_country','c',5],['CBoxDocPlace2','dl',5],
    ['DocDate','d',5],['DocExpiryDate','d',5],['Eh1','c',5],['Edit3','t',5],['Edit2','t',5],['borrower_occupation','c',5],['BankKard','c',5],
    ['Eh5','c',5],['Edit_Income','t',5],['Income_cur','c',5],['Eh6','c',5],['borrower_bad','c',5],
    ['Address_type','c',6],['tph_contact_type','c',6],['tph_communication_type','c',6],['CountryByConctType','c',6],['CityByConctType','dep',6],
    ['db_tph_state','t',6],['db_tph_adress','t',6],['DB_tph_zip','t',6],['tph_country_prefix','c',6],['CountryCode','t',6],['Db_tph_number','t',6],
    ['Db_tph_extension','t',6],['EditEmail','t',6],['Edit1','t',6],['Edit_url','t',6],['EditPhoneMob','t',6],['EditPhoneCity','t',6],
    ['Work_Place','t',7],['Work_Post','t',7],['Work_Address','t',7],['Work_Phone','t',7],['Edit_MONTHLYPROFIT','t',7],['WORK_VID_SOB','c',7],
    ['WORK_OTRASLI','c',7],['Edit_activity','t',7],['Edit_profession','t',7],['Edit_work_inn','t',7],['source_of_income','c',7],['par1','c',7],
    ['edit4','t',7],['par2','c',7],
    ['MemoNotes','m',8],
    ['idxal','c',11],['finance','c',11],['ReportingDate','d',11],['ReportType','c',11],['Revenue','t',11],['Ebitda','t',11],['Ebit','t',11],
    ['InterestExpences','t',11],['InterestExpenceLiabilities','t',11],['ForeignInterestExpenceLiabilities','t',11],['TotalAssets','t',11],
    ['TotalCapital','t',11],['TotalAssetsForeignCurrency','t',11],['TotalLiabilitiesForeignCurrency','t',11],['TotalLiabilities','t',11],
    ['NetProfit','t',11],['InsolvencyStatus','c',11],['iflas','c',11],['Isoplost','c',11],
    ['Edit_grop_name','t',12],['grop','c',12],
  ];
  const SIDE = ['EditID','EditITN','Eh3','CBoxDocType1','EditPINCode1','EditDocSerie1','EditDocNumber1','id_quality'];
  // PageControl1 visible tabs per XFRadioGroupCust_type item (XFRadioGroupCust_typeClick)
  const TABS = { 0: [1,3,6,8,11], 1: [2,3,4,5,6,7,8], 4: [2,3,4,5,6,7,8], 2: [2,3,4,5,6,7,8,11], 3: [2,3,4,5,6,7,8,11], 5: [12] };
  // MainGrid columns (dfm) and per-type visibility (columns 2..9 / 1 / 11)
  const GCOLS = [['ID','g_id'],['CUST_NAME','g_name'],['LASTNAME','g_last'],['FIRSTNAME','g_first'],['PATRONYMIC','g_patr'],['PASSP_NUMBER','g_passno'],
    ['PASSPIN','g_pin'],['PHONE_MOB','g_mob'],['PHONE','g_phone'],['PASSPORT','g_pass'],['OPENDATE','g_open'],['INN','g_inn'],['USNAM','g_usnam']];
  function colVis(type, i) {
    if (type === 0) return !(i >= 2 && i <= 9);
    if (type === 1 || type === 4) return !(i === 1 || i === 11);
    if (type === 2 || type === 3) return i !== 1;
    return true;
  }
  const POZ = [['CUSTID2','c_custid2'],['NAME','c_name'],['WORK_NAME','c_work'],['PRINAD_NAME','c_prinad'],['PERCENT_ADD','c_percent'],
    ['CUST_NAME','c_company'],['SIGNATORY_NAME','c_sign'],['ACCOWNER_NAME','c_owner'],['CUSTID','c_custid']];

  const st = { init: null, mode: 'search', step: 0, type: -1, type1: -1, radio1: -1, resident: '', rows: [], sel: null, cust: null,
    det: null, f: {}, tab: 0, vis: [], sort: 'ID', dep: {}, lists: {}, layout: null, el: null, req: {}, typeLocked: false };

  function dlg(html, onMount, wide) {
    const d = document.createElement('div'); d.className = 'backdrop stacked';
    d.innerHTML = `<div class="modal ${wide ? 'wide' : ''}" role="dialog">${html}</div>`; document.body.appendChild(d);
    const close = () => d.remove(); onMount && onMount(d.querySelector('.modal'), close); return close;
  }
  const errHtml = (e) => `<div class="alert error">${esc(e && e.msg ? e.msg : t((e && e.key) || 'error.generic', e))}</div>`;
  function msgDlg(text, title) {   // ShowMessage / MessageDlg(mtInformation)
    return new Promise(res => dlg(`<h3>${esc(title || L('title'))}</h3><p class="csv-msg">${esc(text)}</p>
      <div class="actions"><button class="btn" data-x>${esc(t('common.close'))}</button></div>`, (m, c) => { m.querySelector('[data-x]').onclick = () => { c(); res(); }; }));
  }
  function ask(text) {             // MessageDlg(mtConfirmation, [mbYes, mbNo])
    return new Promise(res => dlg(`<h3>${esc(L('title'))}</h3><p class="csv-msg">${esc(text)}</p><div class="actions">
      <button class="btn" data-y>${esc(L('yes'))}</button><button class="btn secondary" data-n>${esc(L('no'))}</button>
      <button class="btn secondary" data-x>${esc(t('common.close'))}</button></div>`, (m, c) => {
        m.querySelector('[data-y]').onclick = () => { c(); res(true); };
        m.querySelector('[data-n]').onclick = m.querySelector('[data-x]').onclick = () => { c(); res(false); };
      }));
  }
  const stub = (name) => msgDlg(L('stub', { name }));
  async function call(fn) { try { return await fn(); } catch (e) { dlg(`<h3>${esc(L('title'))}</h3>${errHtml(e)}<div class="actions"><button class="btn" data-x>${esc(t('common.close'))}</button></div>`, (m, c) => m.querySelector('[data-x]').onclick = c); return null; } }
  // server replies {ok:false, kind:'msg'|'confirm'|'black', msg}: confirm/black are re-sent with confirm / black_ok
  async function flow(path, body) {
    for (let i = 0; i < 4; i++) {
      const r = await call(() => api(path, { method: 'POST', body })); if (!r) return null;
      if (r.ok !== false) return r;
      if (r.kind === 'confirm') { if (!(await ask(r.msg))) return null; body.confirm = true; continue; }
      if (r.kind === 'black') { if (!(await ask(r.msg))) return null; body.black_ok = true; continue; }
      await msgDlg(r.msg); return null;
    }
    return null;
  }

  // ---------------------------------------------------------------- combos
  const data = (ds) => st.lists[ds] || (st.init && st.init.lookups.data[ds]) || [];
  const combo = (k) => st.init && st.init.lookups.combos[k];
  function cntrId(ds, name) { const r = data(ds).find(x => String(x.CNTR_NAME) === String(name ?? '')); return r ? r.ID : null; }
  function options(k) {
    if (DEP[k]) return st.dep[k] || [];
    const c = combo(k); if (!c) return [];
    return data(c.ds).map(r => [r[c.key], r[c.list]]);
  }
  const optHtml = (list, val) => '<option value=""></option>' + list.map(([v, l]) => `<option value="${esc(v)}" ${String(v) === String(val ?? '') ? 'selected' : ''}>${esc(l)}</option>`).join('');
  function rawVal(k, s) {         // keep the original key type of the lookup row (ID numbers vs. SYMBOL strings)
    if (s === '') return '';
    const o = options(k).find(([v]) => String(v) === s); return o ? o[0] : s;
  }
  async function loadDep(k, parentVal) {
    const [name, key, list] = DEP[k];
    const v = parentVal === '' || parentVal === null || parentVal === undefined ? null : parentVal;
    const rs = v === null ? [] : (await call(() => api(`${P}/lookup/${name}?value=${encodeURIComponent(v)}`)) || []);
    st.dep[k] = rs.map(r => [r[key], r[list] ?? r.NAME]);
  }
  async function loadDocPlaces(doctype) {     // odsPassDeps (v_doctype) -> CBoxDocPlace2.Items
    const rs = doctype === '' || doctype == null ? [] : (await call(() => api(`${P}/lookup/odsPassDeps?value=${encodeURIComponent(doctype)}`)) || []);
    st.lists.docPlaces = rs.map(r => r.NAME);
  }
  async function refreshDeps() {
    for (const k of Object.keys(DEP)) await loadDep(k, DEP[k][4](st.f[DEP[k][3]]));
    await loadDocPlaces(st.f.CBoxDocType);
  }

  // ---------------------------------------------------------------- field rendering
  const star = (k) => Object.entries(STAR).some(([n, f]) => f === k && st.req[n]) ? '<span class="csv-star">*</span>' : '';
  function fieldHtml(k, kind, extra = '') {
    const v = st.f[k] ?? '', dis = disabled(k) ? 'disabled' : '';
    let ctl;
    if (kind === 'c' || kind === 'dep') ctl = `<select data-k="${k}" ${dis}>${optHtml(options(k), v)}</select>`;
    else if (kind === 'd') ctl = `<input type="date" data-k="${k}" value="${esc(String(v).slice(0, 10))}" ${dis}>`;
    else if (kind === 'm') ctl = `<textarea data-k="${k}" rows="6" ${dis}>${esc(v)}</textarea>`;
    else if (kind === 'dl') ctl = `<input data-k="${k}" list="csvDl_${k}" value="${esc(v)}" ${dis}><datalist id="csvDl_${k}">${(st.lists.docPlaces || []).map(x => `<option value="${esc(x)}">`).join('')}</datalist>`;
    else ctl = `<input data-k="${k}" value="${esc(v)}" ${kind === 'ro' ? 'readonly' : ''} ${dis}>`;
    return `<div class="field"><label>${esc(FL(k))}${star(k)}</label>${ctl}${extra}</div>`;
  }
  // XFRadioGroupCust_typeClick enable/disable rules on tab 0
  function disabled(k) {
    const ty = st.mode === 'search' ? st.type : st.type1;
    if (k === 'id_quality') return st.mode === 'search' && !!st.cust && String(st.f.id_quality ?? '') !== '';   // id_quality.Enabled := IsNull
    if (ty === 0) return ['CBoxDocType1','EditDocSerie1','EditDocNumber1','EditPINCode1'].includes(k);
    if (ty === 1 || ty === 4) return ['EditITN','CBox','ActionAreaCB'].includes(k);
    return false;
  }
  function gather(root) {
    root.querySelectorAll('[data-k]').forEach(n => {
      const k = n.dataset.k;
      if (n.tagName === 'SELECT') { st.f[k] = rawVal(k, n.value); (st.f.txt ||= {})[k] = n.value === '' ? '' : n.options[n.selectedIndex].text; }
      else st.f[k] = n.value;
    });
  }
  // OnChange mirrors: EditDocSerie1Change / EditDocSerieChange, EditDocNumber*, EditPINCode*, Edit10Change / EditFullNameChange,
  // CBoxDocType1CloseUp / CBoxDocTypeCloseUp; EditAddressChange copies to db_tph_adress + EditAddressFactical when ins_edit (add mode)
  const MIRROR = { EditDocSerie1: ['EditDocSerie'], EditDocSerie: ['EditDocSerie1'], EditDocNumber1: ['EditDocNumber'], EditDocNumber: ['EditDocNumber1'],
    EditPINCode1: ['EditPINCode'], EditPINCode: ['EditPINCode1'], Edit10: ['EditFullName'], EditFullName: ['Edit10'], CBoxDocType1: ['CBoxDocType'], CBoxDocType: ['CBoxDocType1'] };
  function mirror(k) {
    (MIRROR[k] || []).forEach(o => { st.f[o] = st.f[k]; st.el.querySelectorAll(`[data-k="${o}"]`).forEach(n => { n.value = st.f[k] ?? ''; }); });
    if (k === 'EditAddress' && st.mode !== 'search') ['db_tph_adress', 'EditAddressFactical'].forEach(o => { st.f[o] = st.f[k]; });
    if (k === 'CBoxDocType1') {                    // CBoxDocType1CloseUp: series of the OdsDoctaypes row; empty -> issue_country := -1
      const r = data('OdsDoctaypes').find(x => String(x.ID) === String(st.f[k]));
      if (r && r.SERIES !== undefined) { st.f.EditDocSerie1 = st.f.EditDocSerie = r.SERIES ?? ''; }
      if ((st.f.EditDocSerie1 ?? '') === '') st.f.issue_country = -1;
      st.el.querySelectorAll('[data-k=EditDocSerie1],[data-k=EditDocSerie]').forEach(n => { n.value = st.f.EditDocSerie1 ?? ''; });
    }
  }
  function payload() {
    gather(st.el);
    const f = { ...st.f, txt: { ...(st.f.txt || {}) } };
    f.type = st.mode === 'search' ? st.type : st.type1;
    f.type1 = st.type1; f.Resident = st.resident === '' ? '' : Number(st.resident);
    f.doc_enabled = f.type !== 0;
    if (st.radio1 !== -1) f.radio1 = st.radio1;
    return f;
  }

  // ---------------------------------------------------------------- sidebar (tab 0 Seçim)
  function radio(name, items, val, disabledItems = [], allDisabled = false) {
    return `<div class="csv-radio">${items.map((lab, i) => `<label><input type="radio" name="${name}" value="${i}" ${String(val) === String(i) ? 'checked' : ''}
      ${allDisabled || disabledItems.includes(i) ? 'disabled' : ''}> ${esc(lab)}</label>`).join('')}</div>`;
  }
  function sidebar() {
    const b = st.layout.body, add = st.mode !== 'search';
    const types = [0,1,2,3,4,5].map(i => L('ty' + i));
    b.innerHTML = `
      ${add ? `<div class="field"><label>${esc(L('cust_type'))}</label>${radio('type1', types, st.type1, [3], st.step === 1)}</div>`
            : `<div class="field"><label>${esc(L('cust_type'))}</label>${radio('type', types, st.type, [], st.typeLocked)}</div>`}
      ${!add && st.type === 3 ? `<div class="field"><label>${esc(L('radio1'))}</label>${radio('radio1', [L('ty1'), L('ty2')], st.radio1)}</div>` : ''}
      ${fieldHtml('EditID', 't')}${fieldHtml('EditITN', 't')}${fieldHtml('Eh3', 'c')}
      <div class="field"><label>${esc(L('resident'))}${star('Resident')}</label>${radio('Resident', [L('nonresident'), L('resident')], st.resident)}</div>
      ${fieldHtml('CBoxDocType1', 'c')}${fieldHtml('EditPINCode1', 't')}
      <div class="grid2">${fieldHtml('EditDocSerie1', 't')}${fieldHtml('EditDocNumber1', 't')}</div>
      ${fieldHtml('id_quality', 'c')}
      <div class="actions csv-side-actions">
        ${add && st.step === 0 ? `<button class="btn" data-s="continue">${esc(L('continue'))}</button>` : ''}
        ${add && st.step === 1 ? `<button class="btn" data-s="save">${esc(L('save'))}</button><button class="btn secondary" data-s="hms">${esc(L('hms'))}</button>` : ''}
        ${add ? `<button class="btn secondary" data-s="cancel">${esc(L('clear'))}</button>` : ''}
        ${!add && st.cust && st.cust.row.CUST_TYPE === 4 ? `<button class="btn secondary small" data-s="nominal">${esc(L('nominal_conv'))}</button>` : ''}
        ${!add && st.rows.length === 1 && st.cust ? `<button class="btn secondary small" data-s="meyar">${esc(L('meyar'))}</button>` : ''}
      </div>`;
    st.layout.side.querySelector('.flt-foot').style.display = add ? 'none' : '';
    b.querySelectorAll('input[name=type]').forEach(n => n.onchange = () => { gather(b); typeClick(Number(n.value)); });
    b.querySelectorAll('input[name=type1]').forEach(n => n.onchange = () => { gather(b); type1Click(Number(n.value)); });
    b.querySelectorAll('input[name=radio1]').forEach(n => n.onchange = () => { st.radio1 = Number(n.value); });
    b.querySelectorAll('input[name=Resident]').forEach(n => n.onchange = () => { st.resident = n.value; });
    const on = (s, fn) => { const n = b.querySelector(`[data-s=${s}]`); if (n) n.onclick = fn; };
    on('continue', doContinue); on('save', doAdd); on('hms', () => stub(L('hms'))); on('cancel', clearAll);
    on('nominal', doNominal); on('meyar', () => stub(L('meyar')));
    b.oninput = b.onchange = (e) => { const k = e.target.dataset && e.target.dataset.k; if (k) { gather(b); mirror(k); } };
    b.onkeydown = (e) => { if (e.key === 'Enter' && st.mode === 'search' && e.target.tagName === 'INPUT') { e.preventDefault(); doSearch(); } };
  }
  async function typeClick(ty) {            // XFRadioGroupCust_typeClick
    st.type = ty;
    if (ty === 0) st.f.EditPINCode1 = '';
    if (ty === 3) st.typeLocked = true;      // XFRadioGroup1.Visible := True; XFRadioGroupCust_type.Enabled := False
    st.vis = TABS[ty] || [];
    await typeLookups(ty);
    st.req = (ty === 0 || ty === 5) ? st.init.required_by_type[ty] : st.init.req;
    render();
  }
  async function type1Click(ty) {           // XFRadioGroupCust_type1Click (add mode)
    st.type1 = ty;
    if (ty === 0) st.f.EditPINCode1 = '';
    if (ty === 2) { ['CBoxCitizenship','Citizenship2','Citizenship3','Fakt_Adrs_State','CountryByConctType'].forEach(k => st.f[k] = 1); st.f.EditPINCode1 = ''; st.f.EditITN = ''; }
    await typeLookups(ty);
    st.req = (ty === 0 || ty === 5) ? st.init.required_by_type[ty] : st.init.req;
    render();
  }
  async function typeLookups(ty) {          // EstateTypeData / Ods_WORK_VID_SOB re-open with the cust_type line
    for (const ds of ['EstateTypeData', 'Ods_WORK_VID_SOB']) {
      const rs = await call(() => api(`${P}/lookup/${ds}?cust_type=${ty}`)); if (rs) st.lists[ds] = rs;
    }
  }

  // ---------------------------------------------------------------- main area
  function gridHtml(cols, rs, vis, selId, attr) {
    const cs = cols.filter((c, i) => vis(i));
    return `<div class="grid acc-grid csv-grid"><table><thead><tr>${cs.map(c => `<th data-sort="${c[0]}">${esc(L(c[1]))}</th>`).join('')}</tr></thead><tbody>
      ${rs.length ? rs.map((r, i) => `<tr data-${attr}="${i}" class="${selId !== undefined && r.ID === selId ? 'sel' : ''}">${cs.map(c => `<td>${esc(/DATE|DAT$/.test(c[0]) ? fmtD(r[c[0]]) : (r[c[0]] ?? ''))}</td>`).join('')}</tr>`).join('')
        : `<tr><td colspan="${cs.length}" class="muted">—</td></tr>`}</tbody></table></div>`;
  }
  function main() {
    const m = st.layout.main, d = st.det, ty = st.cust ? st.cust.row.CUST_TYPE : st.type;
    const tabs = st.mode === 'search' ? st.vis : (st.step === 1 ? st.vis : []);
    if (tabs.length && !tabs.includes(st.tab)) st.tab = tabs[0];
    m.innerHTML = `
      ${st.mode === 'search' ? `<div class="card csv-card"><div class="csv-row"><b>${esc(L('grid_main'))}</b><span class="muted">${esc(L('rows', { n: st.rows.length }))}</span>
        ${d && d.tipacc ? `<span class="csv-red">${esc(L('tipacc'))}</span>` : ''}${d && d.samely ? `<span class="csv-red">${esc(d.samely)}</span>` : ''}</div>
        <div id="csvMain">${gridHtml(GCOLS, st.rows, (i) => colVis(st.type, i), st.sel, 'r')}</div></div>` : ''}
      ${tabs.length ? `<div class="card csv-card"><div class="tabs csv-tabs">${tabs.map(n => `<button type="button" data-tab="${n}" class="${n === st.tab ? 'on' : ''}">${esc(L('t' + n))}</button>`).join('')}
        <span style="flex:1"></span><button class="btn secondary small" data-a="prev">${esc(L('prev'))}</button><button class="btn secondary small" data-a="next">${esc(L('next'))}</button></div>
        <div class="csv-tab">${tabHtml(st.tab, ty)}</div></div>` : ''}
      ${st.mode === 'search' && d ? `<div class="card csv-card"><div class="csv-cols">
        <div><b>${esc(L('grid_related'))}</b>${gridHtml(GCOLS.slice(0, 12), d.related || [], (i) => i === 0 || ([0,1,2,3,4].includes(ty) ? !colVis(ty, i) : true), undefined, 'rel')}</div>
        <div><div class="csv-row"><b>${esc(L('grid_bank'))}</b><span style="flex:1"></span><button class="btn secondary small" data-a="bankdel">${esc(L('delete'))}</button></div>
          ${gridHtml([['CUSTID','c_custid'],['CUSTID1','g_custid1'],['NAME','c_name']], d.bank_stetment || [], () => true, undefined, 'bk')}</div>
        <div><b>${esc(L('busproc'))}</b><div class="csv-bp">${(d.busproc || []).map(b => `<button class="btn secondary small" data-bp="${esc(b.NAME)}">${esc(b.NAME)}</button>`).join('') || '<span class="muted">—</span>'}</div></div>
      </div></div>` : ''}`;
    m.querySelectorAll('#csvMain tr[data-r]').forEach(tr => {
      const r = st.rows[Number(tr.dataset.r)];
      tr.onclick = () => { st.sel = r.ID; m.querySelectorAll('#csvMain tr.sel').forEach(x => x.classList.remove('sel')); tr.classList.add('sel'); };
      tr.ondblclick = () => openCust(r.ID);
    });
    m.querySelectorAll('#csvMain th[data-sort]').forEach(th => th.onclick = () => { st.sort = th.dataset.sort; doSearch(); });   // MainGridTitleClick
    m.querySelectorAll('[data-tab]').forEach(b => b.onclick = () => { gather(m); st.tab = Number(b.dataset.tab); main(); });
    const go = (dir) => { gather(m); const i = tabs.indexOf(st.tab) + dir; if (i >= 0 && i < tabs.length) { st.tab = tabs[i]; main(); } };
    const on = (a, fn) => m.querySelectorAll(`[data-a=${a}]`).forEach(n => n.onclick = fn);
    on('prev', () => go(-1)); on('next', () => go(1));                         // XFBitBtn11 / XFBitBtn1
    let bkSel = null;
    m.querySelectorAll('tr[data-bk]').forEach(tr => tr.onclick = () => { bkSel = d.bank_stetment[Number(tr.dataset.bk)]; m.querySelectorAll('tr[data-bk]').forEach(x => x.classList.remove('sel')); tr.classList.add('sel'); });
    on('bankdel', () => { const r = bkSel || (d.bank_stetment || [])[0]; if (r) unlink(2, r.CUSTID, r.CUSTID1); });   // XFButton10Click
    m.querySelectorAll('[data-bp]').forEach(b => b.onclick = () => stub(b.dataset.bp));
    wireTab(m);
  }
  function tabHtml(n, ty) {
    const d = st.det || {};
    const fs = FIELDS.filter(x => x[2] === n);
    let h = `<div class="grid2">${fs.filter(x => x[1] !== 'm').map(([k, kind]) => {
      if (k === 'Edit10') return fieldHtml(k, kind, `<button type="button" class="btn secondary small" data-a="fullname">${esc(L('fullname_gen'))}</button>`);
      if (k === 'Relation') return fieldHtml(k, kind, String(st.f.Relation ?? '0') !== '0' && st.f.Relation !== '' ? `<button type="button" class="btn secondary small" data-a="bank">${esc(L('link_bank'))}</button>` : '');
      return fieldHtml(k, kind);
    }).join('')}</div>`;
    if (n === 3) h += `<div class="actions"><button class="btn secondary small" data-a="help">${esc(L('bank_info'))}</button></div>`;
    if (n === 8) h = fieldHtml('MemoNotes', 'm') + gridHtml([['NOTE','g_note']], d.notes || [], () => true, undefined, 'nt')
      + `<div class="actions"><button class="btn secondary small" data-a="notes">${esc(L('m_notes'))}</button></div>`;
    if (n === 9) h = `<div class="actions"><button class="btn secondary small" data-a="poz" ${ty === 0 || ty === 1 ? '' : 'disabled'}>${esc(L('link'))}</button>
      <button class="btn secondary small" data-a="pozdel">${esc(L('unlink'))}</button></div>${gridHtml(POZ, d.pozition || [], () => true, undefined, 'pz')}`;
    if (n === 10) h = `<div class="csv-imgs">${['img_photo','img_sign','img_stamp'].map((k, i) => { const im = (d.images || [])[i];
      return `<div class="csv-img"><b>${esc(L(k))}</b>${im && im.SRC ? `<img src="${esc(im.SRC)}" alt="">` : '<div class="muted">—</div>'}</div>`; }).join('')}</div>
      <div class="actions"><button class="btn secondary small" data-a="imgadd">${esc(L('add_img'))}</button><button class="btn secondary small" data-a="zoom">${esc(L('zoom'))}</button></div>`;
    if (n === 12) h += `<div class="actions"><button class="btn secondary small" data-a="grp">${esc(L('link_group'))}</button>
      <button class="btn secondary small" data-a="grpdel">${esc(L('delete'))}</button></div>${gridHtml([['CUSTID1','c_custid'],['CUSTID2','c_custid2'],['NAME','c_name']], d.group_info || [], () => true, undefined, 'gr')}`;
    return h;
  }
  function wireTab(m) {
    const on = (a, fn) => m.querySelectorAll(`[data-a=${a}]`).forEach(n => n.onclick = fn);
    const cid = () => st.cust && st.cust.row.ID;
    on('fullname', () => {                                                          // BtnFullNameGeneratorClick
      gather(m); const { EditFirstName: a = '', EditPatronymic: b = '', EditLastName: c = '' } = st.f;
      st.f.Edit10 = (a === '' && b === '' && c === '') ? '' : `${c} ${a} ${b}`; main();
    });
    on('help', () => stub(L('bank_info'))); on('notes', () => stub(L('m_notes')));
    on('imgadd', () => stub(L('add_img'))); on('zoom', () => stub(L('zoom')));
    on('bank', () => cid() && picker(2));                                           // XFButton7Click
    on('poz', () => cid() && picker(1));                                            // XFButton6Click
    on('grp', () => cid() && picker(3));                                            // XFButton8Click
    let pz = null, gr = null;
    m.querySelectorAll('tr[data-pz]').forEach(tr => tr.onclick = () => { pz = st.det.pozition[Number(tr.dataset.pz)]; tr.parentNode.querySelectorAll('tr').forEach(x => x.classList.remove('sel')); tr.classList.add('sel'); });
    m.querySelectorAll('tr[data-gr]').forEach(tr => tr.onclick = () => { gr = st.det.group_info[Number(tr.dataset.gr)]; tr.parentNode.querySelectorAll('tr').forEach(x => x.classList.remove('sel')); tr.classList.add('sel'); });
    on('pozdel', () => { const r = pz || (st.det.pozition || [])[0]; if (r) unlink(1, r.CUSTID, r.CUSTID2); });   // XFButton19Click
    on('grpdel', () => { const r = gr || (st.det.group_info || [])[0]; if (r) unlink(3, r.CUSTID1, r.CUSTID2); });  // XFButton9Click
    m.querySelectorAll('input[data-k]').forEach(n => n.oninput = () => { gather(m); mirror(n.dataset.k); });
    m.querySelectorAll('select[data-k]').forEach(s => s.onchange = async () => {
      gather(m); const k = s.dataset.k; mirror(k);
      for (const [dk, dd] of Object.entries(DEP)) if (dd[3] === k) { await loadDep(dk, dd[4](st.f[k])); st.f[dk] = ''; }
      if (k === 'ComboBox_risk' && st.f[k] !== '') {                                // ComboBox_riskCloseUp
        const r = await call(() => api(`${P}/months?risk=${encodeURIComponent(st.f[k])}`)); if (r && r.dat) st.f.samelydate = r.dat;
      }
      if (k === 'CBoxDocType') { await loadDocPlaces(st.f[k]); st.f.CBoxDocPlace2 = ''; }
      if (k in DEP || k === 'ComboBox_risk' || k === 'CBoxDocType' || k === 'Relation' || Object.values(DEP).some(d => d[3] === k)) main();
    });
  }

  // ---------------------------------------------------------------- actions
  async function doSearch() {                                  // XFBitBtnSearchClick
    if (st.mode !== 'search') return;
    const r = await call(() => api(`${P}/search`, { method: 'POST', body: { f: payload(), sort: st.sort } })); if (!r) return;
    st.rows = r.rows; st.sel = r.rows[0] ? r.rows[0].ID : null; st.cust = null; st.det = null;
    if (r.msg) await msgDlg(r.msg);
    render();
  }
  async function openCust(id) {                               // MainGridDblClick
    const r = await call(() => api(`${P}/cust/${id}?radio1_visible=${st.type === 3}`)); if (!r) return;
    st.sel = id; st.cust = r; st.det = r;
    const keep = { EditID: st.f.EditID };
    st.f = { ...r.f }; if (st.f.EditID === undefined) st.f.EditID = keep.EditID;
    st.resident = r.f.Resident === '' || r.f.Resident == null ? '' : String(r.f.Resident);
    const ty = r.row.CUST_TYPE;
    st.vis = ty === 5 ? TABS[5] : [...(TABS[ty] || []), 9, 10].sort((a, b) => a - b);
    await refreshDeps();
    render();
  }
  function curCust() { if (!st.cust) { msgDlg(L('no_cust')); return null; } return st.cust.row; }
  async function doEdit() {                                   // CustEdit1Click
    const c = curCust(); if (!c) return;
    const r = await flow(`${P}/edit`, { f: payload(), row_id: c.ID }); if (!r) return;
    toast(L('saved')); await openCust(c.ID);
  }
  async function doClose() {                                  // CustClose1Click
    const c = curCust(); if (!c) return;
    let r = await call(() => api(`${P}/close/${c.ID}`, { method: 'POST' })); if (!r) return;
    if (r.ok === false && r.kind === 'confirm') { if (!(await ask(r.msg))) return; r = await call(() => api(`${P}/close/${c.ID}?confirm=true`, { method: 'POST' })); }
    else if (r.ok === false) return msgDlg(r.msg);
    if (r && r.ok) { toast(L('saved')); doSearch(); }
  }
  async function doNominal() {                                // XFBitBtn2Click
    const c = curCust(); if (!c) return;
    const r = await call(() => api(`${P}/nominal/${c.ID}?radio=${st.type}`, { method: 'POST' })); if (!r) return;
    if (r.kind === 'msg') return msgDlg(r.msg);
    if (!(await ask(r.msg))) return;
    const s = await flow(`${P}/edit`, { f: payload(), row_id: c.ID, convert_nominal: true, confirm: true });
    if (s) { toast(L('saved')); openCust(c.ID); }
  }
  function startAdd() {                                       // CustAdd1Click
    st.mode = 'add'; st.step = 0; st.type1 = -1; st.cust = null; st.det = null; st.rows = []; st.sel = null; st.vis = []; st.resident = '';
    const q = data('Ods_cust_quality').find(x => x.NAME === 'Yüksək'); st.f = { id_quality: q ? q.ID : '' };
    render();
  }
  async function doContinue() {                               // XFBitcontinueClick
    const r = await flow(`${P}/continue`, { f: payload() }); if (!r) return;
    st.step = 1; st.vis = TABS[r.type] || []; st.f.CBoxCitizenship = '';
    st.tab = { TabSheet13: 12, TabSheet8: 1, TabSheet1: 2 }[r.tab] || st.vis[0];
    render();
    if (r.pep) pepDlg(st.f.EditFirstName || '', st.f.EditLastName || '');
  }
  async function doAdd() {                                    // XFCustClick -> add_customers_prosess
    const r = await flow(`${P}/add`, { f: payload() }); if (!r) return;
    toast(L('saved')); clearAll();
  }
  function clearAll() {                                       // CustClear1Click / Təmizlə
    Object.assign(st, { mode: 'search', step: 0, type: -1, type1: -1, radio1: -1, resident: '', rows: [], sel: null, cust: null, det: null,
      f: {}, tab: 0, vis: [], dep: {}, typeLocked: false, req: st.init ? st.init.req : {} });
    render();
  }
  async function unlink(kind, custid, custid2) {
    const r = await flow(`${P}/rel/delete`, { custid, custid2, kind }); if (r) openCust(st.cust.row.ID);
  }

  // FormCustomers (CustomersImpl): CBSearch + EditSearch, Qəbul -> ins_elaqe 1/2/3
  function picker(kind) {
    const cols = [['ID','g_id'],['CUST_NAME','g_name'],['LASTNAME','g_last'],['FIRSTNAME','g_first'],['PATRONYMIC','g_patr']];
    let rs = [], sel = null;
    dlg(`<h3>${esc(L('picker_title'))}</h3><div class="grid2"><div class="field"><label>${esc(L('picker_col'))}</label>
      <select data-pc>${cols.map((c, i) => `<option value="${i}">${esc(L(c[1]))}</option>`).join('')}</select></div>
      <div class="field"><label>${esc(L('picker_text'))}</label><input data-pt></div></div><div data-pg></div>
      <div class="actions"><button class="btn" data-ok>${esc(L('ok'))}</button><button class="btn secondary" data-no>${esc(L('cancel'))}</button>
      <button class="btn secondary" data-x>${esc(t('common.close'))}</button></div>`, (m, close) => {
      const load = async () => {
        rs = await call(() => api(`${P}/picker?col=${m.querySelector('[data-pc]').value}&text=${encodeURIComponent(m.querySelector('[data-pt]').value)}`)) || [];
        sel = rs[0] || null; m.querySelector('[data-pg]').innerHTML = gridHtml(cols, rs, () => true, sel && sel.ID, 'p');
        m.querySelectorAll('tr[data-p]').forEach(tr => tr.onclick = () => { sel = rs[Number(tr.dataset.p)]; m.querySelectorAll('tr[data-p]').forEach(x => x.classList.remove('sel')); tr.classList.add('sel'); });
      };
      m.querySelector('[data-pt]').oninput = load; m.querySelector('[data-pc]').onchange = load;
      m.querySelector('[data-no]').onclick = m.querySelector('[data-x]').onclick = close;
      m.querySelector('[data-ok]').onclick = async () => {
        if (!sel) return;
        const r = await call(() => api(`${P}/rel`, { method: 'POST', body: { custid: st.cust.row.ID, custid2: sel.ID, kind } }));
        if (r) { close(); openCust(st.cust.row.ID); }
      };
      load();
    }, true);
  }
  // PEPUnit (Pep_change): Ad / Soyad, Yoxla -> Memo1; > 2 lines -> warning
  function pepDlg(name, surname) {
    dlg(`<h3>${esc(L('pep_title'))}</h3><div class="grid2"><div class="field"><label>${esc(L('pep_name'))}</label><input data-n value="${esc(name)}"></div>
      <div class="field"><label>${esc(L('pep_surname'))}</label><input data-s value="${esc(surname)}"></div></div>
      <div class="field"><textarea data-memo rows="6" readonly></textarea></div>
      <div class="actions"><button class="btn" data-c>${esc(L('check'))}</button><button class="btn secondary" data-x>${esc(t('common.close'))}</button></div>`, (m, close) => {
      m.querySelector('[data-x]').onclick = close;
      m.querySelector('[data-c]').onclick = async () => {
        const q = new URLSearchParams({ name: m.querySelector('[data-n]').value, surname: m.querySelector('[data-s]').value });
        const r = await call(() => api(`${P}/pep?${q}`, { method: 'POST' })); if (!r) return;
        if (r.ok === false) return msgDlg(r.msg);
        const memo = m.querySelector('[data-memo]'); memo.value = (memo.value ? memo.value + '\n' : '') + r.line;
        if (memo.value.split('\n').length > 2) msgDlg(r.warn_text, r.warn_title);
      };
    });
  }
  function tableDlg(title, rs, extra, onMount) {
    const cols = rs.length ? Object.keys(rs[0]).map(k => [k, k]) : [];
    const body = rs.length ? `<div class="grid acc-grid csv-grid"><table><thead><tr>${cols.map(c => `<th data-sort="${esc(c[0])}">${esc(c[1])}</th>`).join('')}</tr></thead>
      <tbody>${rs.map(r => `<tr>${cols.map(c => `<td>${esc(/DATE|DAT$/.test(c[0]) ? fmtD(r[c[0]]) : (r[c[0]] ?? ''))}</td>`).join('')}</tr>`).join('')}</tbody></table></div>` : '<p class="muted">—</p>';
    return dlg(`<h3>${esc(title)}</h3>${extra || ''}<div data-body>${body}</div><div class="actions"><button class="btn secondary" data-x>${esc(t('common.close'))}</button></div>`,
      (m, c) => { m.querySelector('[data-x]').onclick = c; onMount && onMount(m, c); }, true);
  }
  async function credits() {                                  // Mtrininkreditlri1Click -> CreditFrm
    const c = curCust(); if (!c) return;
    const r = await call(() => api(`${P}/credits/${c.ID}?cust_phys=${c.CUST_PHYS || 0}&cust_fs=${c.CUST_FS || 0}`)); if (!r) return;
    if (r.ok === false) return msgDlg(r.msg);
    tableDlg(L('credits_title'), r.rows);
  }
  async function deposits(sort = 'id', close) {               // Depozit1Click -> DepozitFrm (title click re-sorts)
    const c = curCust(); if (!c) return;
    const r = await call(() => api(`${P}/deposits/${c.ID}?cust_phys=${c.CUST_PHYS || 0}&cust_fs=${c.CUST_FS || 0}&sort=${encodeURIComponent(sort)}`)); if (!r) return;
    if (r.ok === false) return msgDlg(r.msg);
    close && close();
    tableDlg(L('deposits_title'), r.rows, '', (m, cl) => m.querySelectorAll('th[data-sort]').forEach(th => th.onclick = () => deposits(th.dataset.sort, cl)));
  }
  function businessOps() {                                    // ƏməliyyatClick -> FormOperation (bdat / edat)
    const c = curCust(); if (!c) return;
    const d0 = (data('ODS_SYSDATE')[0] || {}).TEK_DAT || new Date().toISOString().slice(0, 10);
    tableDlg(L('ops_title'), [], `<div class="grid2"><div class="field"><label>${esc(L('bdat'))}</label><input type="date" data-b value="${esc(String(d0).slice(0, 10))}"></div>
      <div class="field"><label>${esc(L('edat'))}</label><input type="date" data-e value="${esc(String(d0).slice(0, 10))}"></div></div>
      <div class="actions"><button class="btn" data-go>${esc(L('show'))}</button></div>`, (m) => {
      m.querySelector('[data-go]').onclick = async () => {
        const r = await call(() => api(`${P}/business-ops/${c.ID}?cust_type=${c.CUST_TYPE}&bdat=${m.querySelector('[data-b]').value}&edat=${m.querySelector('[data-e]').value}`)); if (!r) return;
        if (r.ok === false) return msgDlg(r.msg);
        const rs = r.rows, cols = rs.length ? Object.keys(rs[0]) : [];
        m.querySelector('[data-body]').innerHTML = rs.length ? `<div class="grid acc-grid csv-grid"><table><thead><tr>${cols.map(k => `<th>${esc(k)}</th>`).join('')}</tr></thead>
          <tbody>${rs.map(x => `<tr>${cols.map(k => `<td>${esc(x[k] ?? '')}</td>`).join('')}</tr>`).join('')}</tbody></table></div>` : '<p class="muted">—</p>';
      };
    });
  }
  function pepMenu() {                                        // PEPYoxlama1Click
    if (!st.cust) return msgDlg(L('no_data'));
    const r = st.cust.row;
    if (r.CUST_TYPE !== 0) pepDlg(r.FIRSTNAME || '', r.LASTNAME || ''); else pepDlg(r.CUST_NAME || '', '');
  }

  // ---------------------------------------------------------------- toolbar (ToolBar1; Visible per get_Modle_comp)
  function toolbar() {
    const c = (st.init && st.init.comp) || {}, ok = (k) => c[k] !== false;
    const s = (k) => () => stub(L(k));
    const menus = {
      cust: [ok('potencialm1') && { label: L('m_potencial'), onClick: s('m_potencial') }, { label: L('m_search'), onClick: doSearch },
        { label: L('m_add'), onClick: startAdd }, { label: L('m_edit'), onClick: doEdit }, { label: L('m_close'), onClick: doClose },
        { label: L('m_clear'), onClick: clearAll }, '-', ok('Sazlama1') && { label: L('m_sazlama'), onClick: s('m_sazlama') },
        ok('Qeydlr1') && { label: L('m_notes'), onClick: s('m_notes') }, { label: L('m_other'), onClick: s('m_other') },
        { label: L('m_hms'), onClick: s('m_hms') }, { label: L('m_pep'), onClick: pepMenu }, { label: L('m_scoring'), onClick: s('m_scoring') }],
      acc: [ok('HesabAmaq1') && { label: L('m_acc_open'), onClick: s('m_acc_open') }, ok('Hesabdanxar2') && { label: L('m_acc_stmt'), onClick: s('m_acc_stmt') },
        { label: L('m_acc_work'), onClick: s('m_acc_work') }, ok('dmtapr1') && { label: L('m_payorder'), onClick: s('m_payorder') },
        ok('Expemmeliyyat1') && { label: L('m_dealing'), onClick: s('m_dealing') }, ok('Qaime') && { label: L('m_qaime'), onClick: s('m_qaime') },
        ok('tonaj') && { label: L('m_tonaj'), onClick: s('m_tonaj') }],
      tr: [ok('XHKS1') && { label: L('m_xohks'), onClick: s('m_xohks') }, ok('AZPS1') && { label: L('m_azips'), onClick: s('m_azips') },
        ok('SWFT1') && { label: L('m_swift'), onClick: s('m_swift') }],
      prod: [ok('Kreditler') && { label: L('m_credits'), items: [ok('Yenikreditinverilmsi1') && { label: L('m_credit_new'), onClick: () => { if (st.cust && st.cust.row.ID) pepMenu(); stub(L('m_credit_new')); } },
          ok('Mtrininkreditlri1') && { label: L('m_credit_list'), onClick: credits }].filter(Boolean) },
        ok('Depozit1') && { label: L('m_deposits'), onClick: () => deposits() }, ok('PlastikKartlar') && { label: L('m_cards'), onClick: s('m_cards') },
        { label: L('m_memorial'), onClick: s('m_memorial') }, { label: L('m_kassa'), onClick: s('m_kassa') }],
      docs: [{ label: L('m_tarif'), onClick: s('m_tarif') }, { label: L('m_mq'), onClick: s('m_mq') }, { label: L('m_contract_s'), onClick: s('m_contract_s') },
        { label: L('m_contract'), onClick: s('m_contract') }, { label: L('m_contract_nom'), onClick: s('m_contract_nom') }, { label: L('m_embassy'), onClick: s('m_embassy') }],
    };
    Object.keys(menus).forEach(k => menus[k] = menus[k].filter(Boolean));
    return { menus, html: `
      <button class="btn secondary" data-m="cust">${esc(L('tb_customers'))}</button>
      ${ok('ToolButton1') ? `<button class="btn secondary" data-m="acc">${esc(L('tb_accounts'))}</button>` : ''}
      ${ok('Köçermeler') ? `<button class="btn secondary" data-m="tr">${esc(L('tb_transfers'))}</button>` : ''}
      ${ok('Əməliyyat') ? `<button class="btn secondary" data-t="ops">${esc(L('tb_ops'))}</button>` : ''}
      ${ok('Məhsullar') ? `<button class="btn secondary" data-m="prod">${esc(L('tb_products'))}</button>` : ''}
      ${ok('ToolButton6') ? `<button class="btn secondary" data-m="docs">${esc(L('tb_docs'))}</button>` : ''}
      <button class="btn secondary" data-t="refresh">${esc(L('tb_refresh'))}</button>
      ${ok('SM_Email') ? `<button class="btn secondary" data-t="sms">${esc(L('tb_sms'))}</button>` : ''}
      <button class="btn secondary" data-t="filter">${esc(L('filter_title'))}</button>` };
  }

  function render() {
    const el = st.el, tb = toolbar();
    el.innerHTML = `<div class="card" style="max-width:none">
      <div style="display:flex;align-items:center;gap:10px;flex-wrap:wrap;margin-bottom:12px"><h2 style="margin:0">${esc(L('title'))}</h2><div class="spacer" style="flex:1"></div>${tb.html}</div>
      <div id="csvLayout"></div></div>`;
    st.layout = window.SB.filterLayout(el.querySelector('#csvLayout'), { key: 'custservice', title: L('filter_title'),
      applyLabel: L('search'), clearLabel: L('clear'), onApply: doSearch, onClear: clearAll });
    el.querySelectorAll('[data-m]').forEach(b => b.onclick = (ev) => { ev.stopPropagation(); gather(el); const r = b.getBoundingClientRect();
      window.SB.contextMenu({ preventDefault() {}, clientX: r.left, clientY: r.bottom + 2 }, tb.menus[b.dataset.m]); });
    const on = (a, fn) => { const n = el.querySelector(`[data-t=${a}]`); if (n) n.onclick = fn; };
    on('ops', businessOps); on('sms', () => stub(L('tb_sms'))); on('filter', () => st.layout.toggle());
    on('refresh', async () => { if (st.cust) await openCust(st.cust.row.ID); else if (st.rows.length) await doSearch(); });   // ToolButton3Click
    sidebar(); main();
  }

  window.SB.pages['/m/pcustservice'] = async (el) => {
    st.el = el; el.innerHTML = '<div class="spinner"></div>';
    const init = await call(() => api(`${P}/init`)); if (!init) { el.innerHTML = ''; return; }
    st.init = init; st.lists = {}; clearAll();
  };
})();

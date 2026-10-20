/* Exchange Manager chunk 4 – 'Dövriyyə' tab (TabSheet2 / PageControl1, Packages/ExchangeMGR-NBC). API: api/app/em_turnover.py.
   Sub-tabs: Əməliyyatlara baxış, Kurslara baxış, Silinmiş əməliyyatlara baxış, Toplam, Reyestr. Reports (BtnPrint QRepTurn,
   BitBtn6 receipt, BitBtn10 Toplam, BitBtn13 Reyestr) show the "on hold" notice. */
(function () {
  const { api, t, esc, toast } = window.SB;
  const P = '/api/exchangemgr/turnover', T = (k, p) => t('em.' + k, p);
  const errT = (e) => t(e.key || 'error.generic', e) + (e.ora ? ' ' + e.ora : '');
  const d10 = (s) => String(s || '').slice(0, 10);
  const fD = (s) => { if (!s) return ''; const [y, m, d] = d10(s).split('-'); return `${d}.${m}.${y}`; };
  const fN = (v) => v === null || v === undefined || v === '' ? '' : typeof v === 'number' ? String(Number(v.toPrecision(15))).replace('.', ',') : String(v);
  const SUBS = ['tv_trans', 'tv_rates', 'tv_deleted', 'tv_toplam', 'tv_reestr'];
  // DBGridEh2 / DBGridEh3 / DBGridEh4 / DBGridReporting / DBGrid1 columns (Unit_ExchangeMGR.dfm TabSheet2)
  const G = {
    trans: ['ID', 'STATUS_STR', 'DAT', 'VAL_NAME', 'DEBITAMOUNT', 'VAL_CHANGED_NAME', 'LAMOUNT', 'FEE_AMOUNT', 'OP_COURSE', 'VAL_NB_COURSE', 'FILIALNAME', 'VDMNAME',
      'OPER_NAME', 'OP_TIME', 'SESSIONNAME', 'USERNAME', 'VAL_CHANGED_COURSE', 'CUSTNAME', 'CUST_CONFIRM', 'CUSTPASSPORT', 'CUST_DATE', 'CUST_GIVING_MEMBER', 'CUST_COUNTRY'],
    rates: ['DAT', 'VAL_NAME', 'VAL_PURCHASE_COURSE', 'VAL_PURCHASE_COURSE_END', 'VAL_SELLING_COURSE', 'VAL_SELLING_COURSE_END', 'VAL_NB_COURSE', 'TIM', 'USERNAME'],
    deleted: ['ID', 'STATUS_STR', 'DAT', 'VAL_NAME', 'DEBITAMOUNT', 'VAL_CHANGED_NAME', 'LAMOUNT', 'FEE_AMOUNT', 'OP_COURSE', 'VAL_CHANGED_COURSE', 'CUSTNAME', 'CUST_CONFIRM',
      'CUSTPASSPORT', 'CUST_DATE', 'CUST_GIVING_MEMBER', 'CUST_COUNTRY', 'FILIALNAME', 'OPER_NAME', 'VDMNAME', 'OP_TIME', 'SESSIONNAME', 'USERNAME', 'DEL_TIME', 'DEL_USERNAME'],
    toplam: ['EX_NAME', 'FILIAL', 'VAL_NAME', 'PURCHASE', 'EXCHANGERATE', 'PURCHASEAMOUNT', 'PURCHASENUMBER', 'SALE', 'SALECOURSE', 'SALESAMOUNT', 'SALESNUMBER', 'DELTAAMOUNT'],
    reestr: ['VAL_NAME', 'PURCHASE|tcr_purchase', 'PURCHASENUMBER|tcr_purchasenumber', 'PURCHASEAMOUNT|tc_saleamount', 'SALECOURSE', 'SALENUMBER', 'SALEAMOUNT'],
  };
  const cell = (k, v) => k === 'DAT' || k === 'CUST_DATE' ? fD(v) : (k === 'OP_TIME' || k === 'TIM' || k === 'DEL_TIME') && v ? `${fD(v)} ${String(v).slice(11, 19)}` : fN(v);
  const grid = (id, cols, rs) => `<div class="em-grid"><table class="grid acc-grid" id="${id}"><thead><tr>${cols.map(x => { const [c, k] = x.split('|'); return `<th>${esc(T(k || 'tc_' + c.toLowerCase()))}</th>`; }).join('')}</tr></thead><tbody>${
    rs.map(r => `<tr>${cols.map(x => { const c = x.split('|')[0], v = r[c.toLowerCase()]; return `<td ${typeof v === 'number' ? 'style="text-align:right"' : ''}>${esc(cell(c, v))}</td>`; }).join('')}</tr>`).join('')}</tbody></table></div>`;
  const opt = (rs, k, l, sel) => `<option value="" ${sel === null ? 'selected' : ''}></option>` + rs.map(r => `<option value="${esc(r[k])}" ${r[k] === sel ? 'selected' : ''}>${esc(r[l])}</option>`).join('');
  const val = (x) => (x.value === '' ? null : +x.value);
  const stat = (id, v) => `<select id="${id}">${['st_all', 'st_purchase', 'st_selling'].map((k, i) => `<option value="${i}" ${v === i ? 'selected' : ''}>${esc(T(k))}</option>`).join('')}</select>`;
  const btn = (id, k) => `<button class="btn secondary" id="${id}">${esc(T(k))}</button>`;
  const date = (id, v) => `<input type="date" id="${id}" value="${esc(v)}">`;

  function init(S) {
    if (S.tv) return S.tv;
    const d = d10(S.dat);
    // ActiveFormCreate :2184-2204: sysdat for DTP_Begin/End/Dat, DateTimePicker3/4, DTP_DateReestr; CBox_Status / ComboBox1 = 0;
    // DBLC_Exchange / DBLC_Currency = -1. DateTimePicker1/2 keep their design-time date (25.11.2006).
    S.tv = { sub: 0, lists: null,
      tr: { beg: d, end: d, status: 0, val: -1, ex: -1, valOn: false, exOn: false, rows: [], sums: [null, null, null] },
      rt: { dat: d, rows: [] }, dl: { beg: '2006-11-25', end: '2006-11-25', status: 0, val: null, ex: null, rows: [] },
      tp: { beg: d, end: d, val: null, ex: null, valOn: false, exOn: false, rows: [] }, rs: { dat: d, val: null, ex: null, rows: [] } };
    return S.tv;
  }

  function html(S) {
    const V = init(S), L = V.lists || {};
    const tabs = `<div class="tabs em-subtabs">${SUBS.map((k, i) => `<button data-sub="${i}" class="${V.sub === i ? 'on' : ''}">${esc(T(k))}</button>`).join('')}</div>`;
    if (!V.lists) return tabs + `<p>${esc(t('app.loading'))}</p>`;
    let body = '';
    const cb = (id, on) => `<input type="checkbox" id="${id}" ${on ? 'checked' : ''}>`;
    switch (V.sub) {
      case 0: { const R = V.tr;
        body = `<div class="toolbar em-filter"><fieldset class="cd-g"><legend>${esc(T('tv_range'))}</legend>${date('trB', R.beg)} ${date('trE', R.end)}</fieldset>
          <fieldset class="cd-g"><legend>Status</legend>${stat('trS', R.status)}</fieldset>
          <fieldset class="cd-g"><legend>${esc(T('rs_val'))}</legend>${cb('trCV', R.valOn)}<select id="trV">${opt(L.avalute, 'valute', 'val_name', R.val)}</select></fieldset>
          <fieldset class="cd-g"><legend>V.D.M</legend>${cb('trCE', R.exOn)}<select id="trX">${opt(L.vdm_all, 'ex_no', 'ex_name', R.ex)}</select></fieldset>
          ${btn('trGo', 'tv_search')}${btn('trPrint', 'tv_print')}${btn('trXls', 'tv_excel')}${btn('trRcpt', 'tv_receipt')}</div>
          ${grid('gTv', G.trans, R.rows)}
          <div class="toolbar">${R.sums.map(v => `<input readonly value="${esc(fN(v))}" style="width:160px;text-align:right">`).join('')}</div>`; break; }
      case 1: body = `<div class="toolbar">${esc(T('l_date'))} ${date('rtD', V.rt.dat)}${btn('rtGo', 'tv_f9')}${btn('rtXls', 'tv_excel')}</div>${grid('gTv', G.rates, V.rt.rows)}`; break;
      case 2: { const R = V.dl;
        body = `<div class="toolbar em-filter"><fieldset class="cd-g"><legend>${esc(T('tv_range'))}</legend>${date('dlB', R.beg)} ${date('dlE', R.end)}</fieldset>
          <fieldset class="cd-g"><legend>Status</legend>${stat('dlS', R.status)}</fieldset>
          <fieldset class="cd-g"><legend>${esc(T('rs_val'))}</legend>${cb('dlCV', false)}<select id="dlV">${opt(L.avalute_del, 'valute', 'val_name', R.val)}</select></fieldset>
          <fieldset class="cd-g"><legend>V.D.M</legend>${cb('dlCE', false)}<select id="dlX">${opt(L.vdm_del, 'ex_no', 'ex_name', R.ex)}</select></fieldset>
          ${btn('dlGo', 'tv_search')}${btn('dlXls', 'tv_excel')}</div>${grid('gTv', G.deleted, R.rows)}`; break; }
      case 3: { const R = V.tp;
        body = `<div class="toolbar em-filter"><fieldset class="cd-g"><legend>${esc(T('tv_range'))}</legend>${date('tpB', R.beg)} ${date('tpE', R.end)}</fieldset>
          <fieldset class="cd-g"><legend>${esc(T('rs_val'))}</legend>${cb('tpCV', R.valOn)}<select id="tpV">${opt(L.avalute_top, 'valute', 'val_name', R.val)}</select></fieldset>
          <fieldset class="cd-g"><legend>V.D.M</legend>${cb('tpCE', R.exOn)}<select id="tpX">${opt(L.vdm_top, 'ex_no', 'ex_name', R.ex)}</select></fieldset>
          ${btn('tpGo', 'tv_search')}${btn('tpPrint', 'tv_print')}</div>${grid('gTv', G.toplam, R.rows)}`; break; }
      case 4: { const R = V.rs;
        body = `<div class="toolbar em-filter"><fieldset class="cd-g"><legend>${esc(T('l_date'))}</legend>${date('rsD', R.dat)}</fieldset>
          <fieldset class="cd-g"><legend>${esc(T('rs_val'))}</legend><select id="rsV">${opt(L.reestr_val, 'val_id', 'val_name', R.val)}</select></fieldset>
          <fieldset class="cd-g"><legend>V.D.M</legend><select id="rsX">${opt(L.reestr_vdm, 'ex_no', 'filial', R.ex)}</select></fieldset>
          ${btn('rsGo', 'tv_search')}${btn('rsPrint', 'tv_print')}</div>${grid('gTv', G.reestr, R.rows)}`; break; }
    }
    return tabs + body;
  }

  async function download(url, body, name) {
    const r = await fetch(url, { method: 'POST', credentials: 'same-origin', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(body) });
    if (!r.ok) { let e = {}; try { e = (await r.json()).detail || {}; } catch (_) { /* */ } throw e; }
    const a = document.createElement('a'); a.href = URL.createObjectURL(await r.blob()); a.download = name; a.click(); setTimeout(() => URL.revokeObjectURL(a.href), 1000);
  }

  function bind(root, S, redraw) {
    const V = init(S), q = (id) => root.querySelector('#' + id), on = (id, f) => { const x = q(id); if (x) x.onclick = f; };
    root.querySelectorAll('[data-sub]').forEach(x => x.onclick = () => { V.sub = +x.dataset.sub; redraw(); });
    if (!V.lists) { api(P + '/lists').then(l => { V.lists = l; redraw(); }).catch(e => toast(errT(e), 'error')); return; }
    const held = () => toast(T('on_hold', { what: T('tv_print') }), 'info');
    const call = async (url, body, after) => { try { const j = await api(P + url, { method: 'POST', body }); if (j.message) toast(T(j.message.slice(3)), 'error'); else after(j); } catch (e) { toast(errT(e), 'error'); } redraw(); };
    const nothing = () => toast(T('err_nothing_found'), 'info');                                   // 'Heç bir məlumat tapılmadı!...'
    const xls = (url, body, rows, name) => rows.length ? download(P + url, body, name).catch(e => toast(errT(e), 'error')) : nothing();
    // the ChBox / CheckBox handlers all set DBLC_Currency / DBLC_Exchange of 'Əməliyyatlara baxış' (KeyValue 1 or -1), as in Delphi
    const chC = (x) => { if (x) x.onchange = () => { V.tr.val = x.checked ? 1 : -1; V.tr.valOn = x.checked; if (x.id === 'tpCV') V.tp.valOn = x.checked; redraw(); }; };
    const chE = (x) => { if (x) x.onchange = () => { V.tr.ex = x.checked ? 1 : -1; V.tr.exOn = x.checked; if (x.id === 'tpCE') V.tp.exOn = x.checked; redraw(); }; };
    ['trCV', 'dlCV', 'tpCV'].forEach(id => chC(q(id))); ['trCE', 'dlCE', 'tpCE'].forEach(id => chE(q(id)));
    const keep = (id, o, k, f) => { const x = q(id); if (x) x.onchange = () => { o[k] = f ? f(x) : x.value; }; };
    // Əməliyyatlara baxış
    keep('trB', V.tr, 'beg'); keep('trE', V.tr, 'end'); keep('trS', V.tr, 'status', x => +x.value); keep('trV', V.tr, 'val', val); keep('trX', V.tr, 'ex', val);
    const trBody = () => ({ beg: V.tr.beg, end: V.tr.end, status: V.tr.status, val_id: V.tr.val, ex_no: V.tr.ex });
    on('trGo', () => call('/search', trBody(), j => { V.tr.rows = j.rows; V.tr.sums = j.sums; }));      // BtnSearchClick
    on('trXls', () => xls('/search/xlsx', trBody(), V.tr.rows, 'Emeliyyatlar.xlsx'));               // BitBtn3Click
    on('trPrint', held); on('trRcpt', held);                                                        // BtnPrintClick / BitBtn6Click
    // Kurslara baxış
    keep('rtD', V.rt, 'dat');
    on('rtGo', () => call('/rates', { dat: V.rt.dat }, j => { V.rt.rows = j.rows; }));               // BitBtn2Click
    on('rtXls', () => xls('/rates/xlsx', { dat: V.rt.dat }, V.rt.rows, 'Kurslar.xlsx'));            // BitBtn4Click
    // Silinmiş
    keep('dlB', V.dl, 'beg'); keep('dlE', V.dl, 'end'); keep('dlS', V.dl, 'status', x => +x.value); keep('dlV', V.dl, 'val', val); keep('dlX', V.dl, 'ex', val);
    const dlBody = () => ({ beg: V.dl.beg, end: V.dl.end, status: V.dl.status, val_id: V.dl.val, ex_no: V.dl.ex });
    on('dlGo', () => call('/deleted', dlBody(), j => { V.dl.rows = j.rows; }));                      // BitBtn5Click
    on('dlXls', () => xls('/deleted/xlsx', dlBody(), V.dl.rows, 'Silinmis.xlsx'));                  // BitBtn7Click
    // Toplam
    keep('tpB', V.tp, 'beg'); keep('tpE', V.tp, 'end'); keep('tpV', V.tp, 'val', val); keep('tpX', V.tp, 'ex', val);
    on('tpGo', () => { const sv = q('tpV'); call('/toplam', { beg: V.tp.beg, end: V.tp.end, val_on: V.tp.valOn, val_id: V.tp.val, val_name: sv.value === '' ? '' : sv.selectedOptions[0].textContent,
      ex_on: V.tp.exOn, ex_no: V.tp.ex }, j => { V.tp.rows = j.rows; }); });                       // BitBtn9Click
    on('tpPrint', held);                                                                            // BitBtn10Click
    // Reyestr
    keep('rsD', V.rs, 'dat'); keep('rsV', V.rs, 'val', val); keep('rsX', V.rs, 'ex', val);
    on('rsGo', () => call('/reestr', { dat: V.rs.dat, ex_no: V.rs.ex, val_id: V.rs.val }, j => { V.rs.rows = j.rows; }));   // BitBtn11Click
    on('rsPrint', held);                                                                            // BitBtn13Click
  }

  window.SB.emTurnover = { html, bind };
})();

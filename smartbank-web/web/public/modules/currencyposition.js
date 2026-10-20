/* Currency Position – port of Packages/CurrencyPosition (TFrmCurrencyPosition, CurrencyPositionImpl.pas). SQL and the
   sb_currencyposition calls run in the API (api/app/currencyposition.py). Layout as the Delphi ActiveForm: Panel1
   (Tarix aralığı, Balans planı, file name, toolbar), Panel3 'Seçmələr' (Tarix / Valyuta), DBGrid1, Panel4 'Cəmi :'.
   TFrmChecking ('Yoxlamalar...') keeps its CachedUpdates what-if editing on the client, as in Delphi (never posted to
   the DB; CancelUpdates on close). TFrmTuning 'Hesabat' / 'Excel-ə at' (CPReport, VALYUTA_MOVQE.xlsx) are on hold;
   TfrmCapital ('Kapital') is not ported yet. */
(function () {
  const { api, t, esc, toast, modal } = window.SB;
  const P = '/api/currencyposition', T = (k, p) => t('cp.' + k, p);
  const errT = (e) => t(e.key || 'error.generic', e) + (e.ora ? ' ' + e.ora : '');
  const MON = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  const d10 = (s) => String(s || '').slice(0, 10);
  // FormatDateTime('dd/mmm/yyyy') (FillDate :484) / FormatDateTime('dd/mm/yyyy') (InputBox prompt :828)
  const fMon = (s) => { const [y, m, d] = d10(s).split('-'); return `${d}/${MON[+m - 1]}/${y}`; };
  const fDMY = (s) => { const [y, m, d] = d10(s).split('-'); return `${d}/${m}/${y}`; };
  const fG = (v) => v === null || v === undefined || v === '' ? '' : String(v).replace('.', ',');   // FloatToStr
  const fF = (v, d) => { if (v === null || v === undefined || v === '' || isNaN(Number(v))) return ''; const n = Number(v);   // '#,##0.00'
    const s = Math.abs(n).toFixed(d).split('.'); return (n < 0 ? '-' : '') + s[0].replace(/\B(?=(\d{3})+(?!\d))/g, ' ') + (d ? ',' + s[1] : ''); };
  const strToFloat = (s) => { const x = String(s ?? '').trim(); if (!/^[-+]?(\d+(,\d*)?|,\d+)([eE][-+]?\d+)?$/.test(x)) return NaN; return Number(x.replace(',', '.')); };
  const COLS = [['BANKID', 'c_bankid'], ['SHORTNAME', 'c_currency'], ['RATE', 'c_rate'], ['BALANCE', 'c_balance'],
    ['ACTIVE', 'c_active'], ['PASSIVE', 'c_passive'], ['PRESENTDATE', 'c_date']];          // CurrencyPositionImpl.dfm:335-444

  async function download(path, body, name) {
    const res = await fetch(P + path, { method: 'POST', headers: { 'Content-Type': 'application/json', 'X-CSRF': window.SB.csrf || '' }, credentials: 'same-origin', body: JSON.stringify(body) });
    if (!res.ok) { const j = await res.json().catch(() => ({})); throw (j.detail || {}); }
    const a = document.createElement('a'); a.href = URL.createObjectURL(await res.blob()); a.download = name; a.click();
  }
  const baseName = (p) => String(p || '').split(/[\\/]/).pop();

  async function page(el) {
    el.innerHTML = '<div class="spinner"></div>';
    let I; try { I = await api(P + '/init'); } catch (e) { el.innerHTML = `<div class="card"><div class="alert error">${esc(errT(e))}</div></div>`; return; }
    const st = { modified: true, filled: false, dates: [], rows: [], sa: null, sp: null, cur: 0, tuningOn: true, checkOn: false,
      chk: { active: false, rows: [], capital: '0', label: 'ResultTotal', color: '', date: 0, cur: 0 }, manager: '' };
    const day = d10(I.bank_day);
    const tb = (id, key, dis) => `<button class="btn secondary" id="${id}" ${dis ? 'disabled' : ''}>${esc(T(key))}</button>`;
    el.innerHTML = `<div class="card cp"><div class="toolbar"><h2 style="margin:0">${esc(T('title'))}</h2></div>
      <div style="display:flex;gap:8px;flex-wrap:wrap;align-items:stretch;margin-top:6px">
        <fieldset class="cd-g"><legend>${esc(T('g_period'))}</legend><label>${esc(T('begin'))} <input type="date" id="pBeg" value="${day}"></label><br>
          <label>${esc(T('end'))} <input type="date" id="pEnd" value="${day}"></label></fieldset>
        <fieldset class="cd-g"><legend>${esc(T('g_plan'))}</legend><select id="pPlan">${[1, 2, 3, 4].map(i => `<option value="${i}">${esc(T('plan' + i))}</option>`).join('')}</select></fieldset>
        <div style="display:flex;flex-direction:column;gap:6px">
          <div class="toolbar" style="gap:6px">${tb('bRun', 'run')}${tb('bRefresh', 'refresh')}${tb('bFile', 'file')}${tb('bTuning', 'tuning')}${tb('bCheck', 'checking', true)}${tb('bCapital', 'capital')}</div>
          <div style="display:flex;gap:4px;align-items:center"><input id="pPath" readonly value="${esc(I.file)}" style="width:220px;background:#eee">
            <button class="btn secondary" id="pBrowse" title="${esc(T('save_as'))}">…</button></div></div></div>
      <fieldset class="cd-g" style="margin-top:6px"><legend>${esc(T('g_select'))}</legend>
        <label>${esc(T('g_date'))} <select id="sDate"></select></label>
        <label style="margin-left:12px">${esc(T('g_currency'))} <select id="sCur"><option value="-1">${esc(T('all_currencies'))}</option>${I.currencies.map((c, i) => `<option value="${i}">${esc(c.name ?? '')}</option>`).join('')}</select></label></fieldset>
      <div id="pErr"></div><div id="pGrid" style="margin-top:8px;max-height:60vh;overflow:auto"></div>
      <div style="display:flex;gap:8px;align-items:center;margin-top:6px;justify-content:flex-end"><b>${esc(T('total'))}</b>
        <input id="sA" readonly style="width:160px;text-align:right"><input id="sP" readonly style="width:160px;text-align:right"></div></div>`;
    const v = (id) => el.querySelector('#' + id);
    const setMod = () => { st.modified = true; v('bRun').disabled = false; };        // DTPBeginChange :590-594
    ['pBeg', 'pEnd', 'pPlan'].forEach(id => v(id).addEventListener('change', setMod));
    const fillDates = () => { v('sDate').innerHTML = `<option value="-1">${esc(T('all_dates'))}</option>` + st.dates.map((d, i) => `<option value="${i}">${esc(fMon(d))}</option>`).join(''); };
    fillDates();
    function grid() {
      v('pGrid').innerHTML = `<table class="grid acc-grid"><thead><tr>${COLS.map(c => `<th>${esc(T(c[1]))}</th>`).join('')}</tr></thead><tbody>${
        st.rows.map((r, i) => `<tr data-i="${i}" class="${i === st.cur ? 'sel' : ''}">${COLS.map(([c]) => {
          const x = r[c.toLowerCase()]; return c === 'PRESENTDATE' ? `<td>${esc(SB.fmtD(x))}</td>` : c === 'SHORTNAME' || c === 'BANKID' ? `<td>${esc(x ?? '')}</td>` : `<td style="text-align:right">${esc(fG(x))}</td>`; }).join('')}</tr>`).join('')}</tbody></table>`;
      v('pGrid').querySelectorAll('tr[data-i]').forEach(tr => tr.onclick = () => { st.cur = +tr.dataset.i; grid(); });
      v('sA').value = fG(st.sa); v('sP').value = fG(st.sp);
    }
    grid();
    const show = (j) => { st.rows = j.rows; st.sa = j.sum_active; st.sp = j.sum_passive; st.cur = 0; grid(); };
    const fail = (e) => { v('pErr').innerHTML = `<div class="alert error">${esc(errT(e))}</div>`; };
    const ok = () => { v('pErr').innerHTML = ''; };

    v('bRun').onclick = async () => {                                                 // ToolButton1Click :596-639
      if (!st.modified) return;
      v('bRun').disabled = true;
      try {
        const j = await api(P + '/execute', { method: 'POST', body: { beg: v('pBeg').value, end: v('pEnd').value, plan: +v('pPlan').value } });
        ok(); show(j); st.dates = j.dates; fillDates(); v('sDate').value = '-1'; st.filled = true; st.modified = false;
        v('bTuning').disabled = false; v('bCheck').disabled = false;
      } catch (e) { v('bRun').disabled = !st.modified; fail(e); }
    };
    async function refresh() {                                                         // TBRefreshClick :641-709
      if (!st.filled) { toast(T('no_records'), 'error'); return; }
      const di = +v('sDate').value, ci = +v('sCur').value;
      try { ok(); show(await api(P + '/refresh', { method: 'POST', body: { date: di >= 0 ? d10(st.dates[di]) : null, currency: ci >= 0 ? I.currencies[ci].valute : null } })); }
      catch (e) { fail(e); }
    }
    v('bRefresh').onclick = refresh;
    v('pBrowse').onclick = () => saveAs(baseName(v('pPath').value) || 'BALANSB.dbf', (f) => { v('pPath').value = f; });  // SpeedButton1Click
    v('bFile').onclick = async () => {                                                 // ToolButton5Click :718-866
      const fn = v('pPath').value, name = baseName(fn) || 'Balansb.dbf';
      try {
        if (!st.filled) { await download('/file', { filename: fn, active: false }, name); return; }
        const pr = await api(P + '/file/prepare', { method: 'POST', body: {} });
        const caps = [];
        for (const d of pr.dates) caps.push(await inputBox(T('capital_caption'), T('capital_prompt', { date: fDMY(d.date) }), d.capital));
        await download('/file', { filename: fn, active: true, capitals: caps }, name);
        st.dates = pr.dates.map(d => d.date); fillDates(); v('sDate').value = '-1'; v('sCur').value = '-1';
        show(await api(P + '/refresh', { method: 'POST', body: {} }));
        toast(T('file_ok'), 'success');
      } catch (e) { toast(T('file_fail') + (e.key ? ' ' + errT(e) : ''), 'error'); }
    };
    v('bTuning').onclick = () => tuning(st);
    v('bCheck').onclick = () => checking(st);
    v('bCapital').onclick = () => toast(T('capital_not_ported'), 'info');
  }

  function inputBox(caption, prompt, def) {                     // Dialogs.InputBox: Cancel returns the default
    return new Promise(res => modal(`<h3>${esc(caption)}</h3><div class="field"><span>${esc(prompt)}</span><input id="ib" value="${esc(def)}"></div>
      <div class="actions"><button class="btn" id="ibOk">${esc(T('ok'))}</button><button class="btn secondary" id="ibCancel">${esc(T('cancel'))}</button></div>`, (m, close) => {
      const i = m.querySelector('#ib'); i.focus(); i.select();
      m.querySelector('#ibOk').onclick = () => { const x = i.value; close(); res(x); };
      m.querySelector('#ibCancel').onclick = () => { close(); res(def); };
      i.onkeydown = (e) => { if (e.key === 'Enter') m.querySelector('#ibOk').click(); if (e.key === 'Escape') m.querySelector('#ibCancel').click(); };
    }));
  }
  function saveAs(def, done) {                                  // TSaveDialog (Filter '*.dbf|*.dbf', FileName 'BALANSB.dbf')
    modal(`<h3>${esc(T('save_as'))}</h3><div class="field"><span>${esc(T('file_name'))}</span><input id="fn" value="${esc(def)}"></div>
      <div class="actions"><button class="btn" id="fOk">${esc(T('ok'))}</button><button class="btn secondary" id="fCancel">${esc(T('cancel'))}</button></div>`, (m, close) => {
      m.querySelector('#fOk').onclick = () => { const f = m.querySelector('#fn').value.trim(); close(); if (f) done(f); };
      m.querySelector('#fCancel').onclick = close;
    });
  }

  // ---------------------------------------------------------------- TFrmTuning 'Hesabatlar...' (UntMore.pas)
  async function tuning(st) {
    if (!st.dates.length) { toast(T('list_index'), 'error'); return; }   // FormShow: Items.Delete(0) on an empty list
    let R; try { R = (await api(P + '/tuning')).row; } catch (e) { toast(errT(e), 'error'); return; }
    const val = { BANK: R ? R.bank : '', SVM: R ? R.svm : null, CAPITAL: R ? R.capital : null }, changed = {};
    modal(`<h3>${esc(T('tuning'))}</h3>
      <div class="field"><span>${esc(T('bank_name'))}</span><input id="tBank" value="${esc(val.BANK ?? '')}"></div>
      <div class="field"><span>${esc(T('manager'))}</span><input id="tMan" value="${esc(st.manager)}"></div>
      <div class="field"><span>${esc(T('svm'))}</span><input id="tSvm" value="${esc(fG(val.SVM))}"></div>
      <div class="field"><span>${esc(T('cur_capital'))}</span><input id="tCap" value="${esc(fG(val.CAPITAL))}">
        <button class="btn secondary" id="tCommit" disabled title="${esc(T('commit'))}">✓</button></div>
      <fieldset class="cd-g"><legend>${esc(T('g_svm'))}</legend><label>${esc(T('g_date'))} <select id="tDate">${st.dates.map((d, i) => `<option value="${i}">${esc(fMon(d))}</option>`).join('')}</select></label>
        <div class="toolbar" style="gap:6px;margin-top:6px"><button class="btn secondary" id="tRep">${esc(T('report'))}</button><button class="btn secondary" id="tXls">${esc(T('to_excel'))}</button><button class="btn secondary" id="tClose">${esc(T('exit'))}</button></div>
        <label><input type="checkbox" id="tAuto"> ${esc(T('auto_capital'))}</label></fieldset>`, (m, close) => {
      const q = (id) => m.querySelector('#' + id);
      const mark = (f, x) => { changed[f] = x; q('tCommit').disabled = false; };     // DataSource1DataChange: Modified
      q('tBank').oninput = () => mark('BANK', q('tBank').value);
      q('tSvm').oninput = () => mark('SVM', q('tSvm').value);
      q('tCap').oninput = () => mark('CAPITAL', q('tCap').value);
      q('tMan').oninput = () => { st.manager = q('tMan').value; };
      const auto = async () => {                                                       // ComBoxPresentDatesClick :515-531
        if (!q('tAuto').checked) return;
        try { const c = (await api(P + '/capital', { method: 'POST', body: { date: d10(st.dates[+q('tDate').value]) } })).capital; q('tCap').value = c; mark('CAPITAL', c); }
        catch (e) { toast(errT(e), 'error'); }
      };
      q('tDate').onchange = auto; q('tAuto').onclick = auto;                          // CBCalcCapitalClick
      q('tCommit').onclick = async () => {                                            // SpeedButtonCommitClick: Edit; Post
        try { await api(P + '/tuning/save', { method: 'POST', body: { rowid: R ? R.rowid : '', values: changed } }); Object.keys(changed).forEach(k => delete changed[k]); q('tCommit').disabled = true; }
        catch (e) { toast(errT(e), 'error'); }
      };
      const held = () => toast(T('on_hold', { what: T('report') }), 'info');
      q('tRep').onclick = held; q('tXls').onclick = held;                              // CPReport / To_Excel - on hold
      q('tCap').onkeydown = (e) => { if (e.key === 'Enter') held(); };                 // ECapitalKeyPress -> TBReport.Click
      q('tClose').onclick = close;
      m.onkeydown = (e) => { if (e.key === 'Escape') close(); };                       // FormKeyPress #27
    });
  }

  // ---------------------------------------------------------------- TFrmChecking 'Yoxlamalar...' (UntChecking.pas)
  // Columns UntChecking.dfm:177-250; Tag of the TFloatFields (dfm:415-460): RATE 0, ACTIVES 1, POK_ACTIVES 2, PASSIVES 3, POK_PASSIVES 4
  const CCOLS = [['SHORTNAME', 'k_currency', true], ['LIMIT', 'k_limit', true], ['RATE', 'k_rate', false, 0], ['ACTIVES', 'k_actives', false, 1],
    ['POK_ACTIVES', 'k_pok_actives', false, 2], ['PASSIVES', 'k_passives', false, 3], ['POK_PASSIVES', 'k_pok_passives', false, 4],
    ['CALCLIMIT', 'k_calclimit', true], ['STATUS', 'k_status', true]];
  const calcLimit = (a, p, cap) => (a - p) * 100 / cap;                                // TFrmTuning.CalcLimit (UntMore.pas:82-85)
  function calcFields(r, capText) {                                                     // ODSCheckingCalcFields :151-196
    const cap = strToFloat(capText);
    const cl = calcLimit(+r.pok_actives || 0, +r.pok_passives || 0, cap);
    if (!isFinite(cl)) return false;                                                    // EConvertError / EZeroDivide / EInvalidOp
    r.calclimit = Number(Math.abs(cl).toFixed(2)) * Math.sign(cl);                     // AsString := FormatFloat('#0.00', ...)
    r.status = Math.abs(r.calclimit) < Math.abs(+r.limit || 0) ? 'NORMA' : 'CƏRİMƏ !';
    const L = +r.limit || 0, rate = +r.rate;
    r.avialableactive = Math.abs((L * cap / 100) - (+r.pok_passives || 0)) / rate;
    r.avialablepassive = Math.abs((+r.pok_actives || 0) - (L * cap / 100)) / rate;
    return true;
  }
  function calculated(r, tag, x) {                                                      // TFrmChecking.Calculated :89-110
    if (tag === 0) { r.pok_passives = (+r.passives || 0) * x; r.pok_actives = (+r.actives || 0) * x; }
    if (tag === 1) r.pok_actives = (+r.rate || 0) * x;
    if (tag === 3) r.pok_passives = (+r.rate || 0) * x;
    if (tag === 2) r.actives = x / (+r.rate);
    if (tag === 4) r.passives = x / (+r.rate);
  }
  function checking(st) {
    const C = st.chk;
    if (!st.dates.length) { toast(T('list_index'), 'error'); return; }
    let rows = C.rows.map(r => ({ ...r }));                                             // CancelUpdates on every close
    modal(`<h3>${esc(T('checking'))}</h3>
      <div style="display:flex;gap:8px;flex-wrap:wrap;align-items:center">
        <fieldset class="cd-g"><legend>${esc(T('g_date'))}</legend><select id="kDate">${st.dates.map((d, i) => `<option value="${i}">${esc(fMon(d))}</option>`).join('')}</select></fieldset>
        <div class="toolbar" style="gap:6px"><button class="btn secondary" id="kCreate">${esc(T('create'))}</button><button class="btn secondary" id="kRefresh">${esc(T('refresh'))}</button><button class="btn secondary" id="kClose">${esc(T('exit'))}</button></div>
        <fieldset class="cd-g"><legend>${esc(T('capital'))}</legend><input id="kCap" value="${esc(C.capital)}" style="width:150px"></fieldset>
        <b id="kLabel" style="font-size:1.2em"></b></div>
      <div id="kGrid" style="margin-top:8px;max-height:45vh;overflow:auto"></div>
      <fieldset class="cd-g" style="margin-top:6px"><legend>${esc(T('overall'))}</legend><input id="kAA" readonly style="width:160px;text-align:right"> <input id="kAP" readonly style="width:160px;text-align:right"></fieldset>`, (m, close) => {
      const q = (id) => m.querySelector('#' + id);
      m.style.width = 'min(1250px, 96vw)'; m.style.maxWidth = '96vw';
      const label = () => { q('kLabel').textContent = C.label; q('kLabel').style.color = C.color; };
      const afterPost = () => {                                                         // ODSCheckingAfterPost :231-256
        const s = rows.reduce((a, r) => a + (+r.calclimit || 0), 0);
        if (s >= 20) { C.label = 'CƏRİMƏ !'; C.color = 'red'; } else { C.label = 'Normal'; C.color = 'green'; }
        label();
      };
      const recalc = () => { for (const r of rows) if (!calcFields(r, q('kCap').value)) { toast(T('bad_capital'), 'error'); return false; } return true; };
      function draw() {
        q('kGrid').innerHTML = `<table class="grid acc-grid"><thead><tr>${CCOLS.map(c => `<th>${esc(T(c[1]))}</th>`).join('')}</tr></thead><tbody>${
          rows.map((r, i) => `<tr data-i="${i}" class="${i === C.cur ? 'sel' : ''}">${CCOLS.map(([c, , ro, tag]) => {
            const x = r[c.toLowerCase()];
            if (c === 'SHORTNAME' || c === 'STATUS') return `<td>${esc(x ?? '')}</td>`;
            const txt = fF(x, c === 'RATE' ? 6 : 2);
            return ro ? `<td style="text-align:right">${esc(txt)}</td>` : `<td style="text-align:right"><input data-tag="${tag}" data-f="${c.toLowerCase()}" value="${esc(txt)}" style="width:110px;text-align:right;border:0;background:transparent"></td>`;
          }).join('')}</tr>`).join('')}</tbody></table>`;
        const r = rows[C.cur]; q('kAA').value = r ? fF(r.avialableactive, 2) : ''; q('kAP').value = r ? fF(r.avialablepassive, 2) : '';
        q('kGrid').querySelectorAll('tr[data-i]').forEach(tr => tr.onclick = () => { if (C.cur !== +tr.dataset.i) { C.cur = +tr.dataset.i; draw(); } });
        q('kGrid').querySelectorAll('input[data-tag]').forEach(inp => inp.onchange = () => {   // Post -> BeforePost / AfterPost
          const i = +inp.closest('tr').dataset.i, x = strToFloat(inp.value.replace(/\s/g, ''));
          if (isNaN(x)) { toast(T('bad_float', { value: inp.value }), 'error'); draw(); return; }
          const rr = rows[i]; rr[inp.dataset.f] = x; calculated(rr, +inp.dataset.tag, x);
          C.cur = i; if (recalc()) afterPost(); draw();
        });
      }
      const load = async (path, body) => {
        try { const j = await api(P + path, { method: 'POST', body }); rows = j.rows; C.rows = j.rows.map(r => ({ ...r })); C.active = true; C.cur = 0;
          if (!recalc()) { rows = []; C.active = false; draw(); return false; } draw(); return true; }
        catch (e) { toast(errT(e), 'error'); return false; }
      };
      const create = async () => { if (await load('/checking/create', { date: d10(st.dates[+q('kDate').value]) })) afterPost(); };   // TBCreateClick :134-149
      q('kCreate').onclick = create;
      q('kRefresh').onclick = () => C.active ? load('/checking/refresh', {}) : create();                                         // TBRefreshClick :198-206
      q('kCap').onkeydown = (e) => { if (e.key === 'Enter') create(); };                                                       // Edit1KeyPress #13
      q('kCap').oninput = () => { C.capital = q('kCap').value; };
      q('kDate').onchange = async () => {                                                                                       // CmbBoxDatesChange :258-263
        try { q('kCap').value = C.capital = (await api(P + '/capital', { method: 'POST', body: { date: d10(st.dates[+q('kDate').value]) } })).capital; }
        catch (e) { toast(errT(e), 'error'); }
      };
      q('kClose').onclick = close;
      label(); if (rows.length) recalc(); draw();
    });
  }
  window.SB.pages['/m/currencyposition'] = page;
})();

/* Currency Position 'Kapital' – port of Packages/CurrencyPosition/UntCapital.pas/.dfm (TfrmCapital). API:
   api/app/cp_capital.py. The form is created once per page (tb_CapitalClick: if not Assigned(frmCapital) then Create;
   ShowModal), so the datasets, their Filter / current record, the tab indexes and the unit variable 'a' (string[10])
   live in st.cap and survive closing the dialog. Filters (Setfilter / SetOUTfilter :316-324) are TDataSet.Filter, i.e.
   client side. Layout as the dfm: GroupBox1 'Kapital növünün seçilməsi' (cb_Main), GroupBox2 'Kapitalın növü' with the
   hidden-tab page control pc_Main (pages 0-6). */
(function () {
  const { api, t, esc, toast, modal } = window.SB;
  const P = '/api/currencyposition/capital', T = (k, p) => t('cp.' + k, p);
  const errT = (e) => t(e.key || 'error.generic', e) + (e.ora ? ' ' + e.ora : '');
  const d10 = (s) => String(s || '').slice(0, 10);
  const fG = (v) => v === null || v === undefined ? '' : String(v).replace('.', ',');           // TFloatField.AsString
  // StrToIntDef: Integer range, otherwise the default (ed_outbal allows 10 digits, e.g. 9999999999 -> 0)
  const strToIntDef = (s, d) => { s = String(s ?? '').trim(); if (!/^[+-]?\d+$/.test(s)) return d; const n = Number(s); return n >= -2147483648 && n <= 2147483647 ? n : d; };
  const PAGES = ['p_first', 'p_second', 'p_risk', 'p_capital', 'p_adi', 'p_capeh', 'p_metal'];  // cb_Main.Items (dfm:39-46)
  // TTabSheet.OnShow -> Setfilter(Type, tabset.TabIndex+1); tbs_capitalShow Setfilter('F',0); tbs_qiymetal has none
  const SHOW = { 0: ['I', 'optype'], 1: ['II', 'active'], 2: ['A', 'risk'], 3: ['F', null], 4: ['E', 'adi'], 5: ['C', 'capeh'] };

  async function open(host) {
    if (!host.cap) {                                                                 // TfrmCapital.Create + FormShow
      try { const j = await api(P + '/form'); host.cap = init(j); }
      catch (e) { toast(errT(e), 'error'); return; }
    }
    show(host.cap);
  }

  function init(j) {
    return { page: 0, rows: j.capital, ods2: j.ods2, ods3: j.ods3, accounts: j.accounts, adi: j.adi, ods1: j.ods1,
      date: d10(j.date), order: null, orderOut: null, outActive: false, out: [], accOut: [],
      filter: ['I', 1], outFilter: null, cur: null, curOut: null, cur2: 0, cur3: 0,
      acc: j.accounts.length ? 0 : -1, accO: -1,                                     // ds_account cursor (FirstAfterOpen)
      tabs: { optype: 0, active: 0, risk: 0, riskout: 0, adi: 0, capeh: 0 }, riskPage: 1, metalPage: 1,   // ActivePage = TabSheet2 / TabSheet4
      a: '', memos: {}, formula: null, ed: {} };
  }

  function show(S) {
    modal(`<div class="cap-head"><h3>${esc(T('cap_title'))}</h3><button class="btn secondary" id="cX" title="${esc(T('exit'))}">✕</button></div>
      <fieldset class="cd-g"><legend>${esc(T('cap_g_select'))}</legend>
        <select id="cMain">${PAGES.map((p, i) => `<option value="${i}" ${i === S.page ? 'selected' : ''}>${esc(T('cap_' + p))}</option>`).join('')}</select></fieldset>
      <fieldset class="cd-g" style="margin-top:6px"><legend>${esc(T('cap_g_kind'))}</legend><div id="cPage"></div></fieldset>`, (m, close) => {
      m.style.width = 'min(840px, 96vw)'; m.style.maxWidth = '96vw';
      const q = (id) => m.querySelector('#' + id);
      const visible = () => S.rows.filter(r => r.bal_type === 1 && r.type === S.filter[0] && r.op_type === S.filter[1]);
      const visibleOut = () => S.outFilter ? S.out.filter(r => r.bal_type === 2 && r.type === S.outFilter[0] && r.op_type === S.outFilter[1]) : S.out;
      const current = () => { const v = visible(); return v.find(r => r.id === S.cur) || v[0] || null; };
      const currentOut = () => { const v = visibleOut(); return v.find(r => r.id === S.curOut) || v[0] || null; };
      const body = () => ({ order: S.order, order_out: S.orderOut, out_active: S.outActive });
      const apply = (j) => { if (j.capital) S.rows = j.capital; if (j.ods2) S.ods2 = j.ods2; if (j.ods3) S.ods3 = j.ods3; if (j.capital_out) S.out = j.capital_out; };
      // CheckBrowseMode (Filter / Refresh): a modified DBEdit1 (FORMULA) is posted first
      const browse = async () => { if (S.formula !== null) { const r = current(); const f = S.formula; S.formula = null; if (r) await api(P + '/formula', { method: 'POST', body: { rowid: r.rowid, formula: f === '' ? null : f } }); } };
      const setFilter = async (type, op) => { try { await browse(); } catch (e) { toast(errT(e), 'error'); } S.filter = [type, op]; S.cur = null; };
      const call = async (path, b) => { try { await browse(); apply(await api(P + path, { method: 'POST', body: { ...body(), ...b } })); } catch (e) { toast(errT(e), 'error'); } draw(); };

      // ------------------------------------------------ actions (UntCapital.pas)
      const insert = (type, bal, acc, percent, op, balType) => call('/insert', { type, bal, acc, sum: 0, percent, formula: '', op_type: op, bal_type: balType || 0 });
      const delCapital = () => { const r = current(); if (r && r.id > 0) call('/delete', { id: r.id }); };           // Delete_capital :425-430
      const delOut = () => { const r = currentOut(); if (S.outActive && r && r.id > 0) call('/delete', { id: r.id, out: true }); };   // Delete_capital_out :432-440
      const accId = () => S.acc >= 0 ? S.accounts[S.acc].id : 0;                     // ds_accountId.AsInteger
      const accOutId = () => S.accO >= 0 ? S.accOut[S.accO].id : 0;
      const ed = (k) => S.ed[k] ?? '';
      function insFirst(edK, seK, type, tab) {                                        // Insert_FIRST_capital / Insert_SECOND_capital
        const bal = strToIntDef(ed(edK), 0), acc = ed(seK) !== '' ? accId() : 0;
        if (bal === 0 && acc === 0) return;
        insert(type, bal, acc, 0, S.tabs[tab] === 0 ? 1 : 2);
      }
      function insRisk(out) {                                                         // Insert_Risk_capital / Insert_Risk_capital_OUT
        const [eb, es, ep, tab] = out ? ['outbal', 'outacc', 'outpercent', 'riskout'] : ['balActive', 'accActive', 'percent', 'risk'];
        const bal = strToIntDef(ed(eb), 0), acc = ed(es) !== '' ? (out ? accOutId() : accId()) : 0;
        if (bal === 0 && acc === 0) return;
        let pct = 0;
        if (ed(ep) !== '') { pct = strToIntDef(ed(ep), NaN); if (isNaN(pct)) { toast(T('cap_bad_int', { value: ed(ep) }), 'error'); return; } }   // StrToInt
        if (out && !S.outActive) return;
        insert('A', bal, acc, pct, S.tabs[tab] === 0 ? 1 : 2, out ? 2 : 0);
      }
      function insA(type, edK, tab) {                                                 // BitBtn10/12/14/16Click -> Insert_ADIEHT/CAPEH/Ametal/Pmetal
        if (ed(edK) !== '') S.a = ed(edK).slice(0, 10);
        S.ed[edK] = ''; S.ed['cb_' + edK] = '';                                       // ed.Clear; DBViewComboBoxN.Text := ''
        const bal = strToIntDef(S.a, 0), acc = S.a !== '' ? accId() : 0;
        if (bal === 0 && acc === 0) { draw(); return; }
        if (type === 'E' || type === 'C') { if (S.tabs[tab] === 0) insert(type, bal, acc, 0, 1); else draw(); }   // else branch commented out
        else insert(type, bal, acc, 0, type === 'AM' ? 3 : 4, 1);
      }
      const calc = async () => {                                                       // BitBtn3Click
        try { const j = await api(P + '/calc', { method: 'POST', body: { date: S.date } }); S.memos = j.memos; if (j.error) toast(j.error, 'error'); }
        catch (e) { toast(errT(e), 'error'); }
        draw();
      };
      const connect = async () => {                                                    // SpeedButton2Click
        if (S.outActive) return;
        try { const j = await api(P + '/out/open', { method: 'POST', body: body() }); S.accOut = j.accounts_out; S.accO = S.accOut.length ? 0 : -1; S.out = j.capital_out; S.outActive = true; S.outFilter = ['A', 1]; S.curOut = null; }
        catch (e) { toast(errT(e), 'error'); }
        draw();
      };

      // ------------------------------------------------ widgets
      const digits = (max) => `data-max="${max}" inputmode="numeric"`;                // ed_balKeyPress (5 digits) / ed_outbalKeyPress (10)
      const inp = (k, max, dis) => `<input data-ed="${k}" ${digits(max)} value="${esc(ed(k))}" style="width:90px" ${dis ? 'disabled' : ''}>`;
      const accList = (list, cur) => list.map((a, i) => `<option value="${i}">${esc(a.acc_no)}</option>`).join('');
      const search = (k, out, dis) => `<input data-se="${k}" data-out="${out ? 1 : 0}" maxlength="28" value="${esc(ed(k))}" style="width:230px" ${dis ? 'disabled' : ''}>
        <select data-cb="${k}" data-out="${out ? 1 : 0}" style="width:22px" ${dis ? 'disabled' : ''}><option value=""></option>${accList(out ? S.accOut : S.accounts)}</select>`;
      const balCombo = (k, list) => `<select data-bc="${k}" style="width:120px"><option value="" ${ed('cb_' + k) === '' ? 'selected' : ''}></option>${list.map(b => `<option ${String(b.bal_cn) === ed('cb_' + k) ? 'selected' : ''}>${esc(b.bal_cn)}</option>`).join('')}</select>`;
      const btn = (id, cap, extra = '') => `<button class="btn secondary" id="${id}" ${extra}>${esc(T(cap))}</button>`;
      const tabset = (k) => `<div class="tabs cap-ts">${[' + ', ' - '].map((x, i) => `<button data-ts="${k}" data-i="${i}" class="${S.tabs[k] === i ? 'on' : ''}">${x}</button>`).join('')}</div>`;
      const COLS = { BAL: 'cap_c_bal', ACC_NO: 'cap_c_acc', PERCENT: 'cap_c_percent' };
      const grid = (id, rows, cols, cur, title = true) => `<div style="max-height:30vh;overflow:auto"><table class="grid acc-grid" id="${id}"><thead><tr>${cols.map(c => `<th ${title ? `data-ord="${c}" style="cursor:pointer"` : ''}>${esc(T(COLS[c]))}</th>`).join('')}</tr></thead>
        <tbody>${rows.map((r, i) => `<tr data-i="${i}" class="${r === cur ? 'sel' : ''}">${cols.map(c => `<td ${c !== 'ACC_NO' ? 'style="text-align:right"' : ''}>${esc(c === 'ACC_NO' ? (r.acc_no ?? '') : fG(r[c.toLowerCase()]))}</td>`).join('')}</tr>`).join('')}</tbody></table></div>`;
      const lbl = (k) => `<span style="min-width:100px">${esc(T(k))}</span>`;

      function pageHtml() {
        const cur = current();
        switch (S.page) {
          case 0: case 1: { const [e, s, a, d, ts, g] = S.page === 0 ? ['bal', 'acc', 'bAdd1', 'bDel1', 'optype', 'gFirst'] : ['balsecond', 'accsecond', 'bAdd6', 'bDel7', 'active', 'gSecond'];
            return `<fieldset class="cd-g"><legend>${esc(T(S.page === 0 ? 'cap_p_first' : 'cap_p_second'))}</legend>
              <div class="cap-row">${lbl('cap_l_bal')}${inp(e, 5)} ${lbl('cap_l_acc')}${search(s)} ${btn(a, 'cap_add', 'data-default')} ${btn(d, 'cap_del', 'data-cancel')}</div></fieldset>
              ${grid(g, visible(), ['BAL', 'ACC_NO'], cur)}${tabset(ts)}`; }
          case 2: {
            const tabs = `<div class="tabs">${['cap_t_bal', 'cap_t_out'].map((k, i) => `<button data-rp="${i}" class="${S.riskPage === i ? 'on' : ''}">${esc(T(k))}</button>`).join('')}</div>`;
            if (S.riskPage === 0) return `${tabs}<fieldset class="cd-g"><legend>${esc(T('cap_t_bal'))}</legend>
              <div class="cap-row">${lbl('cap_l_percent')}${inp('percent', 5)} ${lbl('cap_l_bal')}${inp('balActive', 5)} ${lbl('cap_l_acc')}${search('accActive')} ${btn('bAdd4', 'cap_add', 'data-default')} ${btn('bDel5', 'cap_del', 'data-cancel')}</div></fieldset>
              ${grid('gRisk', visible(), ['BAL', 'ACC_NO', 'PERCENT'], cur)}${tabset('risk')}`;
            const dis = !S.outActive;
            return `${tabs}<fieldset class="cd-g"><legend>${esc(T('cap_t_out'))}</legend>
              <div class="cap-row"><button class="btn secondary" id="bConnect" title="Connect">⇄</button> ${lbl('cap_l_percent')}${inp('outpercent', 5, dis)} ${lbl('cap_l_bal')}${inp('outbal', 10, dis)} ${lbl('cap_l_acc')}${search('outacc', true, dis)} ${btn('bAdd8', 'cap_add', 'data-default')} ${btn('bDel9', 'cap_del', 'data-cancel')}</div></fieldset>
              <div class="${dis ? 'cap-off' : ''}">${grid('gOut', S.outActive ? visibleOut() : [], ['BAL', 'ACC_NO', 'PERCENT'], currentOut())}</div>${tabset('riskout')}`; }
          case 3: { const M = (k) => `<input readonly class="cap-memo" value="${esc(S.memos[k] ?? '')}" id="${k}">`;
            const f = S.formula !== null ? S.formula : (cur ? cur.formula ?? '' : '');
            return `<fieldset class="cd-g"><legend>${esc(T('cap_p_capital'))}</legend><div class="cap-calc">
              <div class="cap-row"><input type="date" id="cDate" value="${esc(S.date)}"> ${btn('bCalc', 'cap_calc')}</div>
              <div class="cap-row">${lbl('cap_l_formula')}<input id="cFormula" maxlength="255" value="${esc(f)}" style="width:260px" ${cur ? '' : 'disabled'}><button class="btn secondary" id="bPost" title="Post">✓</button></div>
              ${[['cap_m_first', 'm_firstcap'], ['cap_m_second', 'm_seccap'], ['cap_m_risk', 'm_actcap'], ['cap_m_adi', 'm_adieh'], ['cap_m_cap', 'm_cap'], ['cap_m_capeh', 'm_capeh'], ['cap_m_capumh', 'm_capumh'], ['cap_m_activm', 'm_activm'], ['cap_m_passivm', 'm_passivm']]
                .map(([l, k]) => `<div class="cap-row"><span style="min-width:260px">${esc(T(l))}</span>${M(k)}</div>`).join('')}</div></fieldset>`; }
          case 4: case 5: { const [e, a, d, ts, g, leg] = S.page === 4 ? ['baleh', 'bAdd10', 'bDel11', 'adi', 'gAdi', 'cap_p_adi'] : ['capeh', 'bAdd12', 'bDel13', 'capeh', 'gCapeh', 'cap_p_capeh'];
            return `<fieldset class="cd-g"><legend>${esc(T(leg))}</legend><div class="cap-row">${lbl('cap_l_bal2')}${inp(e, 5)} ${balCombo(e, S.adi)} ${btn(a, 'cap_add2')} ${btn(d, 'cap_del2')}</div></fieldset>
              ${grid(g, visible(), ['BAL'], cur)}${tabset(ts)}`; }
          case 6: { const tabs = `<div class="tabs">${['cap_t_active', 'cap_t_passive'].map((k, i) => `<button data-mp="${i}" class="${S.metalPage === i ? 'on' : ''}">${esc(T(k))}</button>`).join('')}</div>`;
            const A = S.metalPage === 0, rows = A ? S.ods2 : S.ods3, e = A ? 'ametal' : 'pmetal';
            return `${tabs}<fieldset class="cd-g"><legend>${esc(T(A ? 'cap_g_actives' : 'cap_g_passives'))}</legend><div class="cap-row">${lbl('cap_l_bal2')}${inp(e, 5)} ${balCombo(e, S.ods1)} ${btn(A ? 'bAdd14' : 'bAdd16', 'cap_add')} ${btn(A ? 'bDel15' : 'bDel17', 'cap_del2')}</div></fieldset>
              ${grid(A ? 'gAm' : 'gPm', rows, ['BAL'], rows[A ? S.cur2 : S.cur3], false)}`; }
        }
        return '';
      }

      function locate(list, text) {                                                   // Locate(ACC_NO, Text, [loCaseInsensitive, loPartialKey])
        const u = text.toUpperCase();
        return list.findIndex(a => String(a.acc_no || '').toUpperCase().startsWith(u));
      }

      function draw() {
        q('cPage').innerHTML = pageHtml();
        const pg = q('cPage');
        // grids: row click = current record; Delete key = BitBtn2Click / BitBtn9Click / BitBtn15Click; title click = ReOrder
        pg.querySelectorAll('table.grid').forEach(tb => {
          const id = tb.id, out = id === 'gOut';
          tb.tabIndex = 0;
          tb.querySelectorAll('tr[data-i]').forEach(tr => tr.onclick = () => {
            const i = +tr.dataset.i;
            if (id === 'gAm') S.cur2 = i; else if (id === 'gPm') S.cur3 = i;
            else if (out) S.curOut = visibleOut()[i].id; else { S.cur = visible()[i].id; S.formula = null; }
            draw(); pg.querySelector('#' + id).focus();
          });
          tb.querySelectorAll('th[data-ord]').forEach(th => th.onclick = async () => {
            if (out) { if (!S.outActive) return; S.orderOut = th.dataset.ord; await call('/rows', { out: true, order_out: S.orderOut }); }
            else { S.order = th.dataset.ord; await call('/rows', { order: S.order }); }
          });
          tb.onkeydown = (e) => {
            if (e.key !== 'Delete') return;
            if (id === 'gAm') pg.querySelector('#bDel15').click();                      // DBGrid6KeyDown
            else if (id === 'gPm') return;                                             // DBGrid7 has no OnKeyDown
            else if (out) delOut(); else delCapital();                                  // DBGrid3KeyDown / dbg_balaccKeyDown
          };
        });
        // digit-only edits (ed_balKeyPress / ed_outbalKeyPress / ed_capehKeyPress / AmetalKeyPress / PMetalKeyPress)
        pg.querySelectorAll('input[data-ed]').forEach(el => {
          const k = el.dataset.ed, max = +el.dataset.max;
          el.onkeypress = (e) => { if (e.key.length !== 1) return; const sel = el.selectionEnd - el.selectionStart;
            if ((el.value.length > max - 1 && sel === 0) || !/[0-9]/.test(e.key)) e.preventDefault(); };
          el.oninput = () => { S.ed[k] = el.value; };
          el.onfocus = () => {                                                          // OnEnter handlers
            const clr = { bal: 'acc', balsecond: 'accsecond', balActive: 'accActive', outbal: 'outacc', baleh: 'baleh', capeh: 'capeh', ametal: 'ametal', pmetal: 'pmetal' }[k];
            if (clr) { S.ed[clr] = ''; const t2 = pg.querySelector(`[data-se="${clr}"],[data-ed="${clr}"]`); if (t2) t2.value = ''; }
          };
        });
        // TSearchEdit + TDBViewComboBox on Account / account_out
        pg.querySelectorAll('input[data-se]').forEach(el => {
          const k = el.dataset.se, out = el.dataset.out === '1', list = () => out ? S.accOut : S.accounts;
          // OnChange: se_ACC_NO / se_acc_noActive -> se_ACC_NOChange (ed_balActive.Clear); se_acc_nosecond -> ed_balsecond; se_outacc -> ed_outbal
          const onChange = () => { const c = { acc: 'balActive', accActive: 'balActive', accsecond: 'balsecond', outacc: 'outbal' }[k]; S.ed[c] = ''; const t2 = pg.querySelector(`[data-ed="${c}"]`); if (t2) t2.value = ''; };
          let tag = 0;
          el.onkeydown = (e) => {
            tag = (e.key === 'Delete' || e.key === 'Backspace') ? 1 : 0;
            if (e.key === 'Enter') { const i = out ? S.accO : S.acc; if (i >= 0) el.value = S.ed[k] = list()[i].acc_no; }
          };
          el.oninput = () => {
            const txt = el.value;
            if (txt !== '') {
              const i = locate(list(), txt);
              if (i >= 0) { if (out) S.accO = i; else S.acc = i; el.style.background = '';
                if (tag === 0) { const full = list()[i].acc_no; el.value = full; el.setSelectionRange(txt.length, full.length); } }
              else { el.style.background = '#f8c4c4'; tag = 1; }
            }
            S.ed[k] = el.value; onChange();
          };
          el.onfocus = () => {                                                          // se_*Enter
            const c = { acc: 'bal', accActive: 'balActive', accsecond: 'balsecond', outacc: 'outbal' }[k]; S.ed[c] = ''; const t2 = pg.querySelector(`[data-ed="${c}"]`); if (t2) t2.value = '';
          };
          el.onblur = () => { el.style.background = ''; if (el.value !== '') { const i = out ? S.accO : S.acc; if (i >= 0) el.value = S.ed[k] = list()[i].acc_no; } };   // DoExit
          el._change = onChange;
        });
        pg.querySelectorAll('select[data-cb]').forEach(cb => cb.onchange = () => {    // dbw_acc_noChange / DBViewComboBox1/2Change / dbv_outaccChange
          if (cb.value === '') return;
          const out = cb.dataset.out === '1', k = cb.dataset.cb, i = +cb.value;
          if (out) S.accO = i; else S.acc = i;
          const se = pg.querySelector(`input[data-se="${k}"]`), a = (out ? S.accOut : S.accounts)[i];
          if (se.value !== a.acc_no) { se.value = S.ed[k] = a.acc_no; se._change(); }
          cb.value = '';
        });
        pg.querySelectorAll('select[data-bc]').forEach(cb => cb.onchange = () => { S.ed['cb_' + cb.dataset.bc] = cb.value; S.a = cb.value.slice(0, 10); });   // a := DBViewComboBoxN.Text
        // tab sets: ts_*Change -> Setfilter / SetOutfilter (Type, NewTab+1)
        pg.querySelectorAll('button[data-ts]').forEach(b => b.onclick = async () => {
          const k = b.dataset.ts, i = +b.dataset.i; S.tabs[k] = i;
          if (k === 'riskout') { S.outFilter = ['A', i + 1]; S.curOut = null; }
          else await setFilter({ optype: 'I', active: 'II', risk: 'A', adi: 'E', capeh: 'C' }[k], i + 1);
          draw();
        });
        pg.querySelectorAll('button[data-rp]').forEach(b => b.onclick = () => { S.riskPage = +b.dataset.rp; draw(); });
        pg.querySelectorAll('button[data-mp]').forEach(b => b.onclick = () => { S.metalPage = +b.dataset.mp; draw(); });
        const on = (id, fn) => { const x = pg.querySelector('#' + id); if (x) x.onclick = fn; };
        on('bAdd1', () => insFirst('bal', 'acc', 'I', 'optype')); on('bDel1', delCapital);
        on('bAdd6', () => insFirst('balsecond', 'accsecond', 'II', 'active')); on('bDel7', delCapital);   // BitBtn7.OnClick = BitBtn2Click
        on('bAdd4', () => insRisk(false)); on('bDel5', delCapital);
        on('bAdd8', () => insRisk(true)); on('bDel9', delOut); on('bConnect', connect);
        on('bAdd10', () => insA('E', 'baleh', 'adi')); on('bDel11', delCapital);
        on('bAdd12', () => insA('C', 'capeh', 'capeh')); on('bDel13', delCapital);
        on('bAdd14', () => insA('AM', 'ametal')); on('bAdd16', () => insA('PM', 'pmetal'));
        on('bDel15', () => call('/delete', { id: S.ods2[S.cur2] ? S.ods2[S.cur2].id : 0 }));   // fieldbyname('id').asinteger (0 when empty)
        on('bDel17', () => call('/delete', { id: S.ods3[S.cur3] ? S.ods3[S.cur3].id : 0 }));
        on('bCalc', calc);
        on('bPost', async () => { try { await browse(); } catch (e) { toast(errT(e), 'error'); } const r = await api(P + '/rows', { method: 'POST', body: { order: S.order } }).catch(() => null); if (r) S.rows = r.capital; draw(); });
        const dt = pg.querySelector('#cDate'); if (dt) dt.onchange = () => { S.date = dt.value; };
        const fm = pg.querySelector('#cFormula'); if (fm) fm.oninput = () => { S.formula = fm.value; };   // ds_capital State = dsEdit
      }

      q('cMain').onchange = async () => {                                              // cb_MainChange
        S.page = +q('cMain').value;
        try { const j = await api(P + '/page', { method: 'POST', body: { index: S.page } }); S.date = d10(j.date); if (j.adi) S.adi = j.adi; if (j.ods1) S.ods1 = j.ods1; }
        catch (e) { toast(errT(e), 'error'); }
        const sh = SHOW[S.page]; if (sh) await setFilter(sh[0], sh[1] ? S.tabs[sh[1]] + 1 : 0);
        draw();
      };
      // Default (Enter) / Cancel (Esc) buttons of the visible page: BitBtn1/6/4/8 Default, BitBtn2/7/9 Cancel
      m.onkeydown = (e) => {
        if (e.target.tagName === 'BUTTON' || e.target.tagName === 'SELECT' || e.target.tagName === 'TABLE') return;
        if (e.key === 'Enter') { const b = m.querySelector('#cPage [data-default]'); if (b) { e.preventDefault(); setTimeout(() => b.click()); } }
        if (e.key === 'Escape') { const b = m.querySelector('#cPage [data-cancel]'); if (b) { e.preventDefault(); b.click(); } }
      };
      q('cX').onclick = async () => { try { await browse(); } catch (e) { toast(errT(e), 'error'); } close(); };   // window close
      (async () => { const sh = SHOW[S.page]; if (sh) await setFilter(sh[0], sh[1] ? S.tabs[sh[1]] + 1 : 0); draw(); })();   // FormShow -> page OnShow
    });
  }
  window.SB.cpCapital = open;
})();

/* Off-balance repair – port of Delphi Packages/out_repair (TOut_RepairFrm, TOutRepairEdit, TOutRep_delete).
   CheckTransaction, the Out_Correct.Main call, the dataset Filter string and the amount rounding run in the API
   (api/app/out_repair.py). PrepareInBalance (KASSA_B MedioCrity filter) is mirrored here for the dropdown only;
   the server re-checks it on save. */
(function () {
  const { api, t, esc, toast } = window.SB;
  const P = '/api/out-repair', T = (k, p) => t('out_repair.' + k, p);
  const money = (v) => v === null || v === undefined || v === '' ? '' : Number(v).toLocaleString(window.I18N.lang, { minimumFractionDigits: 2, maximumFractionDigits: 2 });
  const errT = (e) => t(e.key || 'error.generic', e) + (e.ora ? ' ' + e.ora : '');
  function modal(html, onMount, wide) {
    const d = document.createElement('div'); d.className = 'backdrop stacked';
    d.innerHTML = `<div class="modal ${wide ? 'wide' : ''}" role="dialog">${html}</div>`; document.body.appendChild(d);
    const close = () => d.remove(); onMount && onMount(d.querySelector('.modal'), close); return close;
  }
  // Out_dbMain columns (Out_RepairImpl1.dfm)
  const COLS = [['id', 'ID', 0], ['transactiondate', 'TRANSACTIONDATE', 0], ['debitaccno', 'DEBITACCNO', 0], ['debitcurrencysname', 'DEBITCURRENCYSNAME', 0],
    ['creditaccno', 'CREDITACCNO', 0], ['creditcurrencysname', 'CREDITCURRENCYSNAME', 0], ['debitamount', 'DEBITAMOUNT', 1], ['creditamount', 'CREDITAMOUNT', 1],
    ['lamount', 'LAMOUNT', 1], ['operatorid', 'OPERATORID', 0]];
  const inBalanceState = (d, c) => (d && +d.iscacheaccount === 1 && +d.val_acc === 0) ? 0 : (c && +c.iscacheaccount === 1 && +c.val_acc === 0) ? 1 : -1;

  async function page(el) {
    el.innerHTML = '<div class="spinner"></div>';
    let I; try { I = await api(P + '/init'); } catch (e) { el.innerHTML = `<div class="card"><div class="alert error">${esc(errT(e))}</div></div>`; return; }
    const st = { rows: [], i: 0, title: null, showAdv: false, search: false,
      f: { user_index: 0, valute_checked: [...I.valutes.map(() => true), true], operation_checked: I.operations.map(() => true), debit_filial: 0, credit_filial: 0 } };
    el.innerHTML = `<div class="card"><div class="toolbar" style="gap:8px;flex-wrap:wrap"><h2 style="margin:0">${esc(T('title'))}</h2>
        <span class="muted">${esc(T('sysdate'))} <b>${esc(I.date)}</b></span>
        <label class="field" style="margin:0"><span>${esc(T('beg'))}</span><input type="date" id="rd1" value="${I.date}"></label>
        <label class="field" style="margin:0"><span>${esc(T('end'))}</span><input type="date" id="rd2" value="${I.date}"></label>
        <button class="btn" id="r_add">${esc(T('add'))}</button><button class="btn secondary" id="r_edit">${esc(T('edit'))}</button>
        <button class="btn secondary" id="r_del">${esc(T('delete'))}</button><button class="btn secondary" id="r_ref">${esc(T('refresh'))}</button>
        <button class="btn secondary" id="r_full">${esc(T('full_refresh'))}</button><button class="btn secondary" id="r_adv">${esc(T('filters'))}</button>
        <button class="btn secondary" id="r_srch">${esc(T('search'))}</button></div>
      <div style="display:flex;gap:12px;margin-top:8px"><div id="radv" style="display:none;min-width:280px;max-width:320px"></div>
        <div style="flex:1;min-width:0"><div id="rsearch"></div><div id="rg"></div><div class="muted" id="rname" style="margin-top:4px"></div></div></div></div>`;
    const v = (id) => el.querySelector('#' + id);
    const cur = () => st.rows[st.i];
    function grid() {
      const body = st.rows.map((r, i) => `<tr data-i="${i}" class="${i === st.i ? 'sel' : ''}">${COLS.map(([k, , m]) => `<td style="${m ? 'text-align:right' : ''}">${esc(m ? money(r[k]) : r[k] ?? '')}</td>`).join('')}</tr>`).join('');
      v('rg').innerHTML = `<div class="tablewrap" style="max-height:60vh"><table class="grid"><thead><tr>${COLS.map(([k, f]) => `<th data-f="${f}" style="cursor:pointer">${esc(T('c_' + k))}</th>`).join('')}</tr></thead>
        <tbody>${body || `<tr><td colspan="${COLS.length}" class="muted">${esc(T('empty'))}</td></tr>`}</tbody></table></div>`;
      v('rname').textContent = cur() ? (cur().name || '') : '';                          // dbeTransactionDescr (NAME)
      v('rg').querySelectorAll('tr[data-i]').forEach(tr => { tr.onclick = () => { st.i = +tr.dataset.i; grid(); }; tr.ondblclick = () => { st.i = +tr.dataset.i; edit('update'); }; });
      v('rg').querySelectorAll('th[data-f]').forEach(th => th.onclick = () => { if (!st.rows.length) return; st.title = th.dataset.f; load(); });  // Out_dbMainTitleClick
    }
    async function load(withFilter = true) {
      try {
        const r = await api(P + '/list', { method: 'POST', body: { dat: v('rd1').value, dat2: v('rd2').value, title: st.title, filter: withFilter ? st.f : null } });
        st.rows = r.rows; if (st.i >= st.rows.length) st.i = Math.max(0, st.rows.length - 1); grid();
      } catch (e) { toast(errT(e), 'error'); }
    }
    function adv() {                                                                     // Out_pnLeftAdvanced: pcFilters (tbFilter, tbFilial)
      const f = st.f, chk = (id, arr, i, label) => `<label style="display:block"><input type="checkbox" data-b="${id}" data-i="${i}" ${arr[i] ? 'checked' : ''}> ${esc(label)}</label>`;
      const sel = (id, list, val) => `<select id="${id}"><option value="0">${esc(T('none'))}</option>${list.map((x, i) => `<option value="${i + 1}" ${val === i + 1 ? 'selected' : ''}>${esc(x.name)}</option>`).join('')}</select>`;
      v('radv').innerHTML = `<fieldset><legend>${esc(T('f_user'))}</legend>${sel('fu', I.users, f.user_index)}</fieldset>
        <fieldset><legend>${esc(T('f_valute'))}</legend>${I.valutes.map((x, i) => chk('v', f.valute_checked, i, x.name)).join('')}${chk('v', f.valute_checked, I.valutes.length, 'Yox')}</fieldset>
        <fieldset><legend>${esc(T('f_operation'))}</legend><div style="max-height:160px;overflow:auto">${I.operations.map((x, i) => chk('o', f.operation_checked, i, x.name)).join('')}</div></fieldset>
        <fieldset><legend>${esc(T('f_branch'))}</legend><label class="field"><span>${esc(T('f_debit_branch'))}</span>${sel('fdb', I.filials, f.debit_filial)}</label>
          <label class="field"><span>${esc(T('f_credit_branch'))}</span>${sel('fcb', I.filials, f.credit_filial)}</label></fieldset>
        <label><input type="checkbox" id="fauto" ${st.auto ? 'checked' : ''}> ${esc(T('f_auto'))}</label>
        <div><button class="btn sm" id="fapply" style="margin-top:6px">${esc(T('f_apply'))}</button></div>`;
      const changed = () => { if (st.auto) load(); };                                   // cbFiltrOptions.Checked -> FilterExecute
      v('radv').querySelectorAll('[data-b]').forEach(c => c.onchange = () => { (c.dataset.b === 'v' ? f.valute_checked : f.operation_checked)[+c.dataset.i] = c.checked; changed(); });
      v('fu').onchange = () => { f.user_index = +v('fu').value; changed(); };
      v('fdb').onchange = () => { f.debit_filial = +v('fdb').value; changed(); };
      v('fcb').onchange = () => { f.credit_filial = +v('fcb').value; changed(); };
      v('fauto').onchange = () => { st.auto = v('fauto').checked; };
      v('fapply').onclick = () => load();
    }
    function search() {                                                                  // CreateSearchPanel / FastSearch (srPartialMatch, ignore case)
      if (!st.search) { v('rsearch').innerHTML = ''; return; }
      v('rsearch').innerHTML = `<div style="display:flex;gap:4px;flex-wrap:wrap;margin-bottom:6px">${COLS.map(([k]) => `<input data-s="${k}" placeholder="${esc(T('c_' + k))}" style="width:110px">`).join('')}
        <button class="btn sm secondary" data-o="-1">▲</button><button class="btn sm secondary" data-o="0">●</button><button class="btn sm secondary" data-o="1">▼</button></div>`;
      let order = 0, last = null;
      const find = (inp) => {
        const txt = inp.value.toLowerCase(); if (!txt) return; const k = inp.dataset.s, n = st.rows.length;
        const m = (r) => String(r[k] ?? '').toLowerCase().startsWith(txt);
        if (order === 0) { const i = st.rows.findIndex(m); if (i >= 0) st.i = i; }
        else for (let j = 1; j <= n; j++) { const i = st.i + order * j; if (i < 0 || i >= n) break; if (m(st.rows[i])) { st.i = i; break; } }
        grid();
      };
      v('rsearch').querySelectorAll('input[data-s]').forEach(i => { i.oninput = () => { last = i; find(i); }; i.onkeydown = (e) => { if (e.key === 'Enter') { order = 0; find(i); } if (e.key === 'ArrowUp') { order = -1; find(i); e.preventDefault(); } if (e.key === 'ArrowDown') { order = 1; find(i); e.preventDefault(); } }; });
      v('rsearch').querySelectorAll('[data-o]').forEach(b => b.onclick = () => { order = +b.dataset.o; last && find(last); });
    }
    async function edit(action) {
      const r = action === 'update' ? cur() : null;
      if (action === 'update' && !r) return;                                             // ShowEditFormExecute: RecordCount>0
      const s = r ? { date: r.transactiondate, dc: r.debitcurrencyid, cc: r.creditcurrencyid, did: r.debitid, cid: r.creditid, dr: r.debitrate, cr: r.creditrate,
          da: r.debitamount, ca: r.creditamount, la: r.lamount, name: r.name || '', inb: r.inbalancechar, outb: r.outbalancechar }
        : { date: v('rd1').value, dc: 0, cc: 0, did: null, cid: null, dr: null, cr: null, da: 0, ca: 0, la: 0, name: '', inb: null, outb: null };   // AddInitialize
      let rates = await api(P + '/rates?date=' + s.date), dAcc = [], cAcc = [], descr = [];
      const rate = (c) => { const x = rates.find(y => y.id === +c); return x ? +x.rate : 0; };
      if (s.dr === null) s.dr = rate(s.dc); if (s.cr === null) s.cr = rate(s.cc);
      const curOpt = (val) => I.currencies.map(c => `<option value="${c.valute}" ${+c.valute === +val ? 'selected' : ''}>${esc(c.valute + ' · ' + c.valu_name)}</option>`).join('');
      modal(`<h3>${esc(T(action === 'insert' ? 'add' : 'edit'))}</h3><div id="eerr"></div>
        <div style="display:grid;grid-template-columns:1fr 1fr;gap:10px 16px">
          <fieldset><legend>${esc(T('debit'))}</legend><label class="field"><span>${esc(T('currency'))}</span><select id="edc">${curOpt(s.dc)}</select></label>
            <label class="field"><span>${esc(T('rate'))}</span><input id="edr" readonly></label><label class="field"><span>${esc(T('account'))}</span><select id="eda"></select></label></fieldset>
          <fieldset><legend>${esc(T('credit'))}</legend><label class="field"><span>${esc(T('currency'))}</span><select id="ecc">${curOpt(s.cc)}</select></label>
            <label class="field"><span>${esc(T('rate'))}</span><input id="ecr" readonly></label><label class="field"><span>${esc(T('account'))}</span><select id="eca"></select></label></fieldset>
          <label class="field"><span>${esc(T('trdate'))}</span><input type="date" id="edt" value="${s.date}"></label>
          <div><label><input type="checkbox" id="eprofit"> ${esc(T('ch_profit'))}</label><br><label><input type="checkbox" id="erate"> ${esc(T('ch_rate'))}</label></div>
          <fieldset style="grid-column:1/3"><legend>${esc(T('amounts'))}</legend><div style="display:flex;gap:10px">
            <label class="field"><span>${esc(T('debit_amount'))}</span><input type="number" step="0.01" id="eda1"></label>
            <label class="field"><span>${esc(T('credit_amount'))}</span><input type="number" step="0.01" id="eca1"></label>
            <label class="field"><span>${esc(T('lamount'))}</span><input type="number" step="0.01" id="ela1"></label></div></fieldset>
          <fieldset style="grid-column:1/3"><legend>${esc(T('info'))}</legend><div style="display:flex;gap:10px">
            <label class="field" style="flex:1"><span>${esc(T('in_balance'))}</span><select id="einb"></select></label>
            <label class="field" style="flex:1"><span>${esc(T('convert'))}</span><select id="eoutb"><option value=""></option>${I.convert.map(c => `<option value="${c.id}" ${+c.id === s.outb && s.outb !== null ? 'selected' : ''}>${esc(c.fullpath || c.shortname || c.id)}</option>`).join('')}</select></label></div></fieldset>
          <label class="field" style="grid-column:1/3"><span>${esc(T('description'))}</span><input id="ename" list="edl" value="${esc(s.name)}"><datalist id="edl"></datalist></label></div>
        <div class="actions"><button class="btn secondary" id="eclear">${esc(T('clear'))}</button><button class="btn secondary" id="ecancel">${esc(T('cancel'))}</button><button class="btn" id="esave">${esc(T('save'))}</button></div>`, async (m, close) => {
        const q = (id) => m.querySelector('#' + id);
        const setAmt = () => { q('eda1').value = s.da; q('eca1').value = s.ca; q('ela1').value = s.la; q('edr').value = s.dr; q('ecr').value = s.cr; };
        const kassa = () => {                                                               // PrepareInBalance -> InBalanceCharData.Filter
          const md = inBalanceState(dAcc.find(a => a.id === s.did), cAcc.find(a => a.id === s.cid));
          q('einb').innerHTML = '<option value=""></option>' + I.kassa.filter(k => +k.mediocrity === md).map(k => `<option value="${esc(k.symbol)}" ${String(k.symbol) === String(s.inb) ? 'selected' : ''}>${esc(k.symbol + ' · ' + k.name)}</option>`).join('');
          if (!q('einb').value) s.inb = null;
        };
        const accs = async (side) => {                                                     // DebetAccData/CreditAccData :val_acc
          const list = await api(`${P}/accounts?side=${side}&val_acc=${side === 'debit' ? s.dc : s.cc}`);
          if (side === 'debit') dAcc = list; else cAcc = list;
          const id = side === 'debit' ? s.did : s.cid;
          q(side === 'debit' ? 'eda' : 'eca').innerHTML = '<option value=""></option>' + list.map(a => `<option value="${a.id}" ${a.id === id ? 'selected' : ''}>${esc(a.acc_no + ' · ' + a.name)}</option>`).join('');
          kassa();
        };
        setAmt(); await accs('debit'); await accs('credit');
        api(P + '/descriptions').then(d => { descr = d; q('edl').innerHTML = d.map(x => `<option value="${esc(x)}">`).join(''); });
        const curChange = async (side) => {                                                 // ValuteChange: rate, ClearAmounts, SetFilter (clears account + kassa)
          if (side === 'debit') { s.dc = +q('edc').value; s.dr = rate(s.dc); s.did = null; } else { s.cc = +q('ecc').value; s.cr = rate(s.cc); s.cid = null; }
          s.inb = null; s.da = s.ca = s.la = 0; setAmt(); await accs(side);
        };
        q('edc').onchange = () => curChange('debit'); q('ecc').onchange = () => curChange('credit');
        q('eda').onchange = () => { s.did = q('eda').value ? +q('eda').value : null; kassa(); };
        q('eca').onchange = () => { s.cid = q('eca').value ? +q('eca').value : null; kassa(); };
        q('einb').onchange = () => { s.inb = q('einb').value === '' ? null : +q('einb').value; };
        q('eoutb').onchange = () => { s.outb = q('eoutb').value === '' ? null : +q('eoutb').value; };
        q('edt').onchange = async () => {                                                   // dtpRepaireditChange: rates for the date, ChangeRates both sides
          s.date = q('edt').value; rates = await api(P + '/rates?date=' + s.date); s.dr = rate(s.dc); s.cr = rate(s.cc); s.da = s.ca = s.la = 0; setAmt();
        };
        const amt = async (side, id) => {                                                   // ceDebetAmountChange / ceKreditAmountChange / ceLamountChange
          const val = +q(id).value || 0; if (side === 'debit') s.da = val; else if (side === 'credit') s.ca = val; else s.la = val;
          try { const a = await api(P + '/amounts', { method: 'POST', body: { side, date: s.date, debit_currency_id: s.dc, credit_currency_id: s.cc, debit: s.da, credit: s.ca, lamount: s.la } });
            s.da = a.debit; s.ca = a.credit; s.la = a.lamount; setAmt(); } catch (e) { toast(errT(e), 'error'); }
        };
        q('eda1').onchange = () => amt('debit', 'eda1'); q('eca1').onchange = () => amt('credit', 'eca1'); q('ela1').onchange = () => amt('lamount', 'ela1');
        q('ecancel').onclick = close;
        q('eclear').onclick = () => { close(); edit(action); };                             // btClearClick: re-initialise
        const save = async (confirmed) => {
          const body = { action, id: r ? r.id : null, date: s.date, debit_currency_id: s.dc, credit_currency_id: s.cc, debit_id: s.did, credit_id: s.cid,
            debit_rate: s.dr, credit_rate: s.cr, debit_amount: s.da, credit_amount: s.ca, lamount: s.la, name: q('ename').value,
            inbalancechar: s.inb, outbalancechar: s.outb, ch_rate: q('erate').checked, ch_profit: q('eprofit').checked, convert_confirmed: confirmed };
          try {
            const res = await api(P + '/save', { method: 'POST', body });
            if (res.ask_convert) {                                                          // erConvert: Yes = keep editing, İmtina = save
              modal(`<div style="white-space:pre-line">${esc(T('err_convert'))}</div><div class="actions"><button class="btn secondary" id="cn">${esc(T('cancel'))}</button><button class="btn" id="cy">${esc(t('common.yes'))}</button></div>`,
                (mm, cc) => { mm.querySelector('#cy').onclick = cc; mm.querySelector('#cn').onclick = () => { cc(); save(true); }; });
              return;
            }
            close(); await load();
            st.i = action === 'insert' ? st.rows.length - 1 : Math.max(0, st.rows.findIndex(x => x.id === r.id)); grid();   // Last / Locate('ID')
          } catch (e) { q('eerr').innerHTML = `<div class="alert error">${esc(errT(e))}</div>`; }                            // ErrorBox.ShowMessage
        };
        q('esave').onclick = () => save(false);
      }, true);
    }
    function del() {                                                                     // DelTransExecute -> ShowDeleteConfirm (TOutRep_delete)
      const r = cur(); if (!r) return;
      modal(`<h3>${esc(T('del_title'))}</h3><p>${esc(T('del_ask'))}</p>
        <label style="display:block"><input type="checkbox" id="drate" checked> ${esc(T('ch_rate'))}</label>
        <label style="display:block"><input type="checkbox" id="dprofit" checked> ${esc(T('ch_profit'))}</label>
        <div class="actions"><button class="btn secondary" id="dno">${esc(T('cancel'))}</button><button class="btn" id="dyes">${esc(T('accept'))}</button></div>`, (m, close) => {
        m.querySelector('#dno').onclick = close;
        m.querySelector('#dyes').onclick = async () => {
          try { await api(P + '/delete', { method: 'POST', body: { dat: v('rd1').value, dat2: v('rd2').value, id: r.id, ch_rate: m.querySelector('#drate').checked, ch_profit: m.querySelector('#dprofit').checked } }); close(); load(); }
          catch (e) { close(); toast(errT(e), 'error'); }
        };
      });
    }
    v('r_add').onclick = () => edit('insert'); v('r_edit').onclick = () => edit('update'); v('r_del').onclick = del;
    v('r_ref').onclick = () => load(false);                                               // RefreshTransExecute (Filter.Execute commented out)
    v('r_full').onclick = async () => { I = await api(P + '/init').catch(() => I); st.f.valute_checked = [...I.valutes.map(() => true), true]; st.f.operation_checked = I.operations.map(() => true); adv(); load(); };  // TrFullRefresh: FilterShowAction(ftAll)+Filter
    v('r_adv').onclick = () => { st.showAdv = !st.showAdv; v('radv').style.display = st.showAdv ? 'block' : 'none'; };
    v('r_srch').onclick = () => { st.search = !st.search; search(); };
    el.addEventListener('keydown', (e) => { if (e.target.tagName === 'INPUT' || e.target.tagName === 'SELECT') return;
      if (e.key === 'Enter') edit('update'); if (e.key === 'Delete') del(); if (e.key === 'Insert') edit('insert'); });  // Out_dbMainKeyDown
    adv(); load();                                                                        // DataModuleCreate -> FullRefresh
  }
  window.SB.pages['/m/out-repair'] = page;
})();

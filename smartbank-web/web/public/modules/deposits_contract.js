/* NewDepositsContract.bpl – new / edit / view contract form (TNewFormDepositContract, NewFormDepositContractImpl.pas).
   Every Delphi event handler runs in the API (api/app/dep_contract.py); the browser only renders the panels. */
(function () {
  const { api, t, esc, toast } = window.SB;
  const D = () => window.SB.dep;
  const K = (k, p) => t('deposits.' + k, p);
  const FIELDS_RO = new Set(['CONTRACTNO', 'OPENDATE', 'CLOSEDATE', 'INTEREST', 'DUEINTEREST', 'OVERDUEINTEREST']);

  async function open(mode, sel) {
    let r;
    try { r = await api('/api/deposits/contract/open', { method: 'POST', body: { mode, selected_id: sel?.id ?? null, selected_no: sel?.no ?? null } }); }
    catch (e) { toast(D().errText(e), 'error'); return; }
    const f = { st: r.state, rec: r.rec, ui: r.ui, modified: true, hint: '', thirdRO: true, busy: false };   // FormShow: ThirdPerson.ReadOnly
    D().modal(`<div id="dcBody"></div>`, (m, close) => { f.m = m; f.close = close; render(f); bindKeys(f); m.querySelector('#dcCustNo')?.focus(); }, 'dep-contract');
  }

  const v = (x) => x ?? '';
  const sel = (id, list, key, lab, val, extra = '') => `<select id="${id}" ${extra}><option value=""></option>${(list || []).map(x => `<option value="${esc(x[key])}" ${String(x[key]) === String(val ?? '') ? 'selected' : ''}>${esc(x[lab])}</option>`).join('')}</select>`;
  const idx = (id, items, val) => `<select id="${id}">${items.map((s, i) => `<option value="${i}" ${i === val ? 'selected' : ''}>${esc(s)}</option>`).join('')}</select>`;
  function panelHtml(f, name) {
    const { rec, ui, st } = f;
    const row = (lab, star, inner, dis) => `<div class="dc-row ${dis ? 'dis' : ''}" data-panel="${name}"><label>${star ? '<b class="req">*</b>' : ''}${esc(K(lab))}</label><div>${inner}</div></div>`;
    const ro = (val) => `<input class="ro" readonly value="${esc(v(val))}">`;
    switch (name) {
      case 'CustNomPanel': return row('c_custno', true, `<input id="dcCustNo" inputmode="numeric" value="${esc(st.custno_text)}">`);
      case 'CustNamePanel': return row('c_custname', false, ro(ui.cust_name));
      case 'FilialPanel': return row('c_filial', false, ro(ui.filial_name));
      case 'DepTypePanel': return row('c_type', true, sel('dcType', ui.types, 'id', 'type', rec.CONTRACTTYPE));
      case 'ComboBoxPrizePanel': return row('c_prize', false, idx('dcPrize', ui.prizes, st.prize));
      case 'ValyutaPanel': return row('c_currency', true, sel('dcCur', ui.valutes, 'valute', 'valu_name', rec.CURRENCY));
      case 'DepAmountPanel': return row('c_amount', true, `<input id="dcAmount" inputmode="decimal" value="${esc(v(rec.AMOUNT))}">`);
      case 'PeriodPanel': return row('c_period', true, sel('dcPeriod', ui.periods, 'id', 'description', rec.PERIODID));
      case 'CapitalPeriodPanel': return row('c_capper', true, sel('dcCap', ui.capperiods, 'id', 'description', rec.CAPITALPERID));
      case 'PlasticCardPanel': return row('c_card', true, idx('dcCard', ui.cards, st.card_index));
      case 'PecentDatePanel': return row('c_firstpay', true, `<input type="date" id="dcFirstPay" value="${esc(v(rec.FIRSTINTERESTPAYDAT))}">`);
      case 'AgentPanel': return row('c_agent', false, `<input id="dcAgent" value="${esc(v(rec.AGENTID))}">`);
      case 'ContractNumPanel': return row('c_contractno', false, ro(rec.CONTRACTNO), true);
      case 'OpenDatPanel': return row('c_opendate', false, `<input type="date" class="ro" readonly value="${esc(v(rec.OPENDATE))}">`, true);
      case 'CloseDatPanel': return row('c_closedate', false, `<input type="date" class="ro" readonly value="${esc(v(rec.CLOSEDATE))}" ${ui.dtclose_enabled ? '' : 'disabled'}>`, true);
      case 'PercentPanel': return row('c_interest', false, ro(rec.INTEREST) + (ui.percent_list_visible ? ' ' + sel('dcPctList', ui.settings, 'id', 'interestrate', null) : ''));
      case 'PeriodAfterPercentPanel': return row('c_due', false, ro(rec.DUEINTEREST));
      case 'PeriodBeforePercentPanel': return row('c_overdue', false, ro(rec.OVERDUEINTEREST), true);
      case 'CustCategoryPanel': return row('c_category', false, ro(ui.category));
      case 'CustTypePanel': return row('c_custtype', false, ro(ui.custtype_name));
      case 'ProlonqasiyaPanel': return row('c_prolan', false, sel('dcProlan', ui.prolan, 'id', 'name', rec.PROLANID, 'disabled'));
      case 'CreditParticepatePanel': return row('c_credit', false, `<button class="btn secondary" id="dcCredits" type="button">${esc(K('c_credit_list'))}</button>`);
      case 'ThirdPersonNamePanel': return row('c_third', false, `<span style="display:flex;gap:6px"><input id="dcThird" ${f.thirdRO ? 'readonly class="ro"' : ''} value="${esc(v(rec.PERSONSID))}"><button class="btn secondary" id="dcThirdBtn" type="button">...</button></span>`);
    }
    return '';
  }
  function render(f) {
    const { ui, st } = f;
    f.m.querySelector('#dcBody').innerHTML = `<h3 title="${esc(ui.caption)}">${esc(st.mode === 'InsertContract' ? K('c_caption_new') : K('c_caption_edit', { no: st.selected_no || '' }))}</h3>
      <div class="dc-form">${ui.panels.filter(p => p.visible).map(p => panelHtml(f, p.name)).join('')}</div>
      ${f.hint ? `<div class="alert error" id="dcHint">${f.hint}</div>` : ''}
      <div class="actions" style="justify-content:space-between;align-items:center">
        <span class="muted"><a href="#" id="dcF5">${esc(K('c_f5'))}</a>${ui.user != null ? ` &nbsp; ${esc(K('c_user'))} <b id="dcUser">${esc(ui.user)}</b>` : ''}</span>
        <span style="display:flex;gap:8px">${ui.buttons ? `<button class="btn" id="dcSave">${esc(K('c_save'))}</button><button class="btn secondary" id="dcCancel">${esc(K('c_cancel'))}</button>` : ''}
        <button class="btn secondary" id="dcClose">${esc(K('c_close'))}</button></span></div>`;
    bind(f);
  }
  const body = (f) => ({ state: f.st, rec: { ...f.rec, _ui: f.ui } });
  async function ev(f, event) {
    if (f.st.browse) return;
    try {
      const r = await api('/api/deposits/contract/event', { method: 'POST', body: { ...body(f), event } });
      f.st = r.state; f.rec = r.rec; f.ui = { ...f.ui, ...r.ui }; f.modified = true; f.hint = ''; render(f);
    } catch (e) { f.hint = D().errHtmlInner(e); render(f); }
  }
  function bind(f) {
    const q = (s) => f.m.querySelector(s);
    const num = (s) => s === '' ? null : (isNaN(+s) ? s : +s);
    let tm;
    const cust = q('#dcCustNo');
    if (cust) cust.oninput = () => { f.st.custno_text = cust.value; f.rec.CUSTOMERID = num(cust.value); clearTimeout(tm); tm = setTimeout(() => ev(f, 'customer').then(() => { const c = f.m.querySelector('#dcCustNo'); c && (c.focus(), c.setSelectionRange(c.value.length, c.value.length)); }), 300); };
    const on = (s, fn) => { const x = q(s); if (x) x.onchange = () => fn(x.value); };
    on('#dcType', (x) => { f.rec.CONTRACTTYPE = num(x); ev(f, 'type'); });                 // ContractTypesChange
    on('#dcPrize', (x) => { f.st.prize = +x; ev(f, 'type'); });                             // ComboBoxPrize.OnClick = ContractTypesChange
    on('#dcCur', (x) => { f.rec.CURRENCY = num(x); ev(f, 'customer'); });                  // DBLCBValutes.OnChange = DBEditNumberChange
    on('#dcPeriod', (x) => { f.rec.PERIODID = num(x); ev(f, 'period'); });                 // LCBPeriodsKeyValueChanged
    on('#dcCap', (x) => { f.rec.CAPITALPERID = num(x); ev(f, 'capper'); });                // LCBCapPerChange
    on('#dcCard', (x) => { f.st.card_index = +x; f.st.tocard = +x; f.modified = true; }); // ComboBoxCardChange
    const amt = q('#dcAmount'); if (amt) amt.oninput = () => { f.rec.AMOUNT = num(amt.value.replace(',', '.')); f.modified = true; };   // OnChange body commented out
    const fp = q('#dcFirstPay'); if (fp) fp.onchange = () => { f.rec.FIRSTINTERESTPAYDAT = fp.value || null; f.modified = true; };
    const ag = q('#dcAgent'); if (ag) ag.oninput = () => { f.rec.AGENTID = num(ag.value); f.modified = true; };
    const th = q('#dcThird'); if (th) th.oninput = () => { f.rec.PERSONSID = num(th.value); f.modified = true; };
    const tb = q('#dcThirdBtn'); if (tb) tb.onclick = () => { f.thirdRO = !f.thirdRO; render(f); };   // SpeedButton1Click
    const cr = q('#dcCredits'); if (cr) cr.onclick = () => credits(f);
    q('#dcF5').onclick = (e) => { e.preventDefault(); refreshLists(f); };
    q('#dcSave') && (q('#dcSave').onclick = () => save(f));
    q('#dcCancel') && (q('#dcCancel').onclick = () => cancel(f));
    q('#dcClose').onclick = () => tryClose(f);
  }
  function bindKeys(f) {
    f.m.addEventListener('keydown', (e) => {
      if (e.key === 'Escape') { e.preventDefault(); e.stopPropagation(); tryClose(f); }                 // FormKeyPress VK_ESCAPE
      else if (e.key === 'F5') { e.preventDefault(); refreshLists(f); }                                // FormKeyDown VK_F5
      else if (e.key === 'Enter' && e.target.matches('input,select')) {                                  // KeyPress VK_RETURN: SelectNext
        e.preventDefault(); const all = [...f.m.querySelectorAll('input:not([readonly]):not([disabled]),select:not([disabled]),button')];
        const i = all.indexOf(e.target); all[i + 1]?.focus();
      }
    });
  }
  async function refreshLists(f) {
    try { const r = await api('/api/deposits/contract/refresh', { method: 'POST', body: body(f) }); f.ui = { ...f.ui, ...r.ui }; render(f); }
    catch (e) { toast(D().errText(e), 'error'); }
  }
  async function save(f) {                         // XFBitBtn1Click
    if (f.busy) return; f.busy = true;
    try {
      const r = await api('/api/deposits/contract/save', { method: 'POST', body: body(f) });
      f.st = r.state; f.hint = '';
      if (r.closed) { f.modified = false; finish(f); return; }      // Edit: SaveState -> Self.Close
      f.rec = r.rec; f.ui = { ...f.ui, ...r.ui }; f.modified = true; render(f);
      toast(K('c_saved', { n: r.accounts }));
      f.m.querySelector('#dcCustNo')?.focus();
    } catch (e) { f.hint = D().errHtmlInner(e); render(f); }
    finally { f.busy = false; }
  }
  function cancel(f) {                             // XFBitBtn2Click -> SaveState(False)
    if (!f.st.inserted) { f.modified = false; finish(f); return; }
    f.st.browse = true; f.modified = false;        // Cancel: the inserted record is dropped, no new one (AddContract is not called)
    Object.keys(f.rec).forEach(k => { if (k !== '_ui') f.rec[k] = null; });
    f.st.custno_text = ''; Object.assign(f.ui, { cust_name: '', custtype_name: '', category: '' });
    render(f);
  }
  function tryClose(f) {                           // FormCloseQuery
    if (f.modified && !confirm(K('c_close_confirm'))) return;
    finish(f);
  }
  function finish(f) {                             // FormClose: if FCommited then RefreshWithSavely(True)
    f.close();
    if (f.st.commited) D().reloadMain(true);
  }
  async function credits(f) {                      // XFPanel22Click -> TFormCredit
    if (f.st.inserted) return;
    try {
      const r = await api('/api/deposits/contract/credits', { method: 'POST', body: body(f) });
      const cols = [['creditid', 'cr_id'], ['numberofcredit', 'cr_no'], ['name', 'cr_name'], ['dateofconclusion', 'cr_open'], ['duedatefirstcontract', 'cr_close'],
        ['creditlineamount', 'cr_amount'], ['annualyinterestrate', 'cr_rate'], ['rest', 'cr_rest'], ['interestrest', 'cr_irest'], ['filialname', 'cr_filial']];
      D().modal(`<h3>${esc(K('c_credit_list'))}</h3><div class="tablewrap"><table class="grid"><thead><tr>${cols.map(c => `<th>${esc(K(c[1]))}</th>`).join('')}</tr></thead>
        <tbody>${r.rows.map(x => `<tr>${cols.map(c => `<td>${esc(v(x[c[0]]))}</td>`).join('')}</tr>`).join('') || `<tr><td colspan="${cols.length}" class="muted">${esc(K('empty'))}</td></tr>`}</tbody></table></div>
        <div class="actions"><button class="btn" id="crX">${esc(K('c_close'))}</button></div>`, (m, close) => m.querySelector('#crX').onclick = close, 'wide');
    } catch (e) { toast(D().errText(e), 'error'); }
  }

  window.SB.depForms = window.SB.depForms || {};
  window.SB.depForms.contract_insert = () => open('InsertContract');
  window.SB.depForms.contract_edit = (sel) => open('EditContract', sel);
  window.SB.depForms.contract_look = (sel) => open('LookContract', sel);
})();

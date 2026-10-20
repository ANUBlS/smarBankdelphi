/* SBDM_Contract_new.bpl – new / edit deposit contract form (TfrmDepositContract_new, Packages/SBDM_Contract_new).
   Every Delphi event handler runs in the API (api/app/dep_contract.py); the browser renders the two dfm panels. */
(function () {
  const { api, t, esc, toast } = window.SB;
  const D = () => window.SB.dep;
  const K = (k, p) => t('deposits.' + k, p);
  const v = (x) => x ?? '';
  const GENINT = new Set(['dcType', 'dcPeriod', 'dcCap', 'dcCur', 'dcAmount']);   // OnKeyPress -> GenAnnualInt on Enter

  async function open(mode, sel) {
    let r;
    try { r = await api('/api/deposits/contract/open', { method: 'POST', body: { mode, selected_id: sel?.id ?? null, selected_no: sel?.no ?? null } }); }
    catch (e) { toast(D().errText(e), 'error'); return; }
    const f = { st: r.state, rec: r.rec, ui: r.ui, modified: true, hint: '', busy: false };
    D().modal(`<div id="dcBody"></div>`, (m, close) => { f.m = m; f.close = close; render(f); bindKeys(f); m.querySelector('#dcType')?.focus(); }, 'dep-contract dc-wide');
  }

  const sel = (id, list, key, lab, val, extra = '') => `<select id="${id}" ${extra}><option value=""></option>${(list || []).map(x => `<option value="${esc(x[key])}" ${String(x[key]) === String(val ?? '') ? 'selected' : ''}>${esc(x[lab])}</option>`).join('')}</select>`;
  const accSel = (id, list, val) => `<select id="${id}"><option value=""></option>${(list || []).map(x => `<option value="${esc(x.id)}" ${String(x.id) === String(val ?? '') ? 'selected' : ''}>${esc(x.accno)} · ${esc(x.clientname)}</option>`).join('')}${val != null && !(list || []).some(x => String(x.id) === String(val)) ? `<option value="${esc(val)}" selected hidden></option>` : ''}</select>`;
  const row = (lab, star, inner) => `<div class="dc-row"><label>${star ? '<b class="req">*</b>' : ''}${esc(K(lab))}</label><div>${inner}</div></div>`;
  const ro = (id, val) => `<input id="${id}" class="ro" readonly value="${esc(v(val))}">`;

  function render(f) {
    const { rec, ui, st } = f, A = ui.accs || {};
    f.m.querySelector('#dcBody').innerHTML = `<h3 title="${esc(ui.caption)}">${esc(st.mode === 'InsertContract' ? K('c_caption_new') : K('c_caption_edit', { no: st.selected_no || '' }))}</h3>
      <div class="dc-cols"><div class="dc-form">
        ${row('c_type', true, sel('dcType', ui.types, 'id', 'type', rec.CONTRACTTYPE))}
        ${row('c_period2', true, `<span class="dc-pair">${sel('dcPeriod', ui.periods, 'id', 'description', rec.PERIODID)}<em>${esc(K('c_capper_short'))}</em>${sel('dcCap', ui.capperiods, 'id', 'description', rec.CAPITALPERID)}</span>`)}
        ${row('c_currency', true, sel('dcCur', ui.valutes, 'valute', 'valu_name', rec.CURRENCY))}
        ${row('c_opendate', true, `<input type="date" id="dcOpen" class="ro" readonly value="${esc(v(rec.OPENDATE))}">`)}
        ${row('c_closedate2', true, `<input type="date" id="dcClose" class="ro" readonly value="${esc(v(rec.CLOSEDATE))}" ${st.close_enabled ? '' : 'disabled'}>`)}
        ${row('c_interest', true, ro('dcInt', rec.INTEREST))}
        ${row('c_overdue', false, ro('dcDue', rec.DUEINTEREST))}
        ${row('c_due', false, ro('dcOver', rec.OVERDUEINTEREST))}
        ${row('c_custtype2', true, sel('dcCat', ui.categories, 'id', 'category', rec.CLIENTTYPE))}
        ${row('c_category2', true, sel('dcPers', ui.persons, 'id', 'name', rec.PERSONALTYPE))}
        ${row('c_amount', true, `<input id="dcAmount" inputmode="decimal" value="${esc(v(rec.AMOUNT))}">`)}
      </div><div class="dc-form">
        <fieldset class="dgrp"><legend>${esc(K('c_customer'))}</legend>
          ${row('c_id', false, `<input id="dcCustNo" inputmode="numeric" value="${esc(v(rec.CUSTOMERID))}">`)}
          ${row('c_name', false, `<input id="dcCustName" list="dcCustList" autocomplete="off" value="${esc(ui.cust_name)}"><datalist id="dcCustList"></datalist>`)}</fieldset>
        <fieldset class="dgrp"><legend>${esc(K('c_accounts'))}</legend>
          ${row('c_acc_dep', true, accSel('dcAccDep', A.dep, rec.CONTRACTACCID))}
          ${row('c_acc_client', false, accSel('dcAccCl', A.client, rec.CLIENTACCID))}
          ${row('c_acc_int', false, accSel('dcAccInt', A.interest, rec.INTERESTACCID))}
          ${row('c_acc_bor', false, accSel('dcAccBor', A.boorower, rec.BOOROWERACCID))}
          ${row('c_acc_befo', false, accSel('dcAccBefo', A.befo, rec.BEFO_INTERESTPEYTACCID))}</fieldset>
        ${row('c_firstpay', true, `<span class="dc-pair"><input type="date" id="dcFirstPay" value="${esc(v(rec.FIRSTINTERESTPAYDAT))}"><label style="white-space:nowrap"><input type="checkbox" id="dcAutopr" ${st.autopr ? 'checked' : ''}> ${esc(K('c_autopr'))}</label></span>`)}
        ${row('c_filial', true, sel('dcFil', ui.filials, 'id', 'name', rec.BRANCHID))}
        ${row('c_contractno', true, `<input id="dcNo" value="${esc(v(rec.CONTRACTNO))}">`)}
      </div></div>
      ${f.hint ? `<div class="alert error" id="dcHint">${f.hint}</div>` : ''}
      <div class="actions" style="justify-content:space-between;align-items:center">
        <span class="muted"><a href="#" id="dcF5">${esc(K('c_f5'))}</a>${ui.user != null ? ` &nbsp; ${esc(K('c_user'))} <b id="dcUser">${esc(ui.user)}</b>` : ''}</span>
        <span style="display:flex;gap:8px"><button class="btn" id="dcSave">${esc(K('c_save'))}</button><button class="btn secondary" id="dcCancel">${esc(K('c_cancel'))}</button>
        <button class="btn secondary" id="dcCloseBtn">${esc(K('c_close'))}</button></span></div>`;
    bind(f);
  }
  const body = (f) => ({ state: f.st, rec: { ...f.rec, _ui: f.ui } });
  async function ev(f, event, extra = {}) {
    if (f.st.browse) return;
    const focus = document.activeElement?.id;
    try {
      const r = await api('/api/deposits/contract/event', { method: 'POST', body: { ...body(f), event, ...extra } });
      f.st = r.state; f.rec = r.rec; f.ui = { ...f.ui, ...r.ui }; f.modified = true; f.hint = ''; render(f);
    } catch (e) { f.hint = D().errHtmlInner(e); render(f); }
    if (focus) f.m.querySelector('#' + focus)?.focus();
  }
  const num = (s) => s === '' ? null : (isNaN(+String(s).replace(',', '.')) ? s : +String(s).replace(',', '.'));
  function bind(f) {
    const q = (s) => f.m.querySelector(s);
    const on = (s, fn) => { const x = q(s); if (x) x.onchange = () => { f.modified = true; fn(x.value); }; };
    on('#dcType', (x) => { f.rec.CONTRACTTYPE = num(x); ev(f, 'type'); });            // ContractTypesKeyValueChanged (+ OnChange cascade)
    on('#dcPeriod', (x) => { f.rec.PERIODID = num(x); ev(f, 'period'); });             // LCBPeriodsKeyValueChanged + LCBPeriodsChange
    on('#dcCap', (x) => { f.rec.CAPITALPERID = num(x); ev(f, 'capper'); });            // LCBCapPerChange
    on('#dcCur', (x) => { f.rec.CURRENCY = num(x); ev(f, 'currency'); });              // valutes cursor -> detail account lists
    on('#dcCat', (x) => { f.rec.CLIENTTYPE = num(x); });
    on('#dcPers', (x) => { f.rec.PERSONALTYPE = num(x); });
    on('#dcFil', (x) => { f.rec.BRANCHID = num(x); });
    on('#dcFirstPay', (x) => { f.rec.FIRSTINTERESTPAYDAT = x || null; });
    [['#dcAccDep', 'CONTRACTACCID'], ['#dcAccCl', 'CLIENTACCID'], ['#dcAccInt', 'INTERESTACCID'], ['#dcAccBor', 'BOOROWERACCID'], ['#dcAccBefo', 'BEFO_INTERESTPEYTACCID']]
      .forEach(([s, k]) => on(s, (x) => { f.rec[k] = num(x); }));                       // OnKeyValueChanged -> UpdateData
    const ap = q('#dcAutopr'); ap.onchange = () => { f.st.autopr = ap.checked; f.modified = true; };
    const amt = q('#dcAmount'); amt.onchange = () => { f.rec.AMOUNT = num(amt.value); f.modified = true; };   // TDBNumberEditEh posts on exit
    const no = q('#dcNo'); no.onchange = () => { f.rec.CONTRACTNO = no.value === '' ? null : no.value; f.modified = true; };
    const cust = q('#dcCustNo');                                                        // DBEdit1: field set on exit -> CUSTOMERIDChange
    cust.onchange = () => { f.rec.CUSTOMERID = num(cust.value.trim()); f.modified = true; ev(f, 'customer'); };
    const cn = q('#dcCustName'); let tm;                                                // DBLookupComboboxEh8 (Customers list)
    cn.oninput = () => {
      const hit = [...q('#dcCustList').options].find(o => o.value === cn.value);
      if (hit) { f.rec.CUSTOMERID = +hit.dataset.id; f.modified = true; ev(f, 'customer'); return; }
      clearTimeout(tm); tm = setTimeout(async () => {
        try { const r = await api('/api/deposits/contract/customers?q=' + encodeURIComponent(cn.value)); q('#dcCustList').innerHTML = r.rows.map(x => `<option data-id="${esc(x.id)}" value="${esc(x.name)}">${esc(x.id)}</option>`).join(''); } catch (e) { /* list only */ }
      }, 250);
    };
    q('#dcF5').onclick = (e) => { e.preventDefault(); refreshLists(f); };
    q('#dcSave').onclick = () => save(f);
    q('#dcCancel').onclick = () => cancel(f);
    q('#dcCloseBtn').onclick = () => tryClose(f);
  }
  function bindKeys(f) {
    f.m.addEventListener('keydown', (e) => {
      if (e.key === 'Escape') { e.preventDefault(); e.stopPropagation(); tryClose(f); }      // FormKeyPress VK_ESCAPE
      else if (e.key === 'F5') { e.preventDefault(); refreshLists(f); }                     // FormKeyDown VK_F5
      else if (e.key === 'Enter' && e.target.matches('input,select')) {                      // VK_RETURN: (GenAnnualInt) + SelectNext
        e.preventDefault();
        const id = e.target.id;
        const next = () => { const all = [...f.m.querySelectorAll('input:not([readonly]):not([disabled]),select:not([disabled]),button')]; const el = f.m.querySelector('#' + id); all[all.indexOf(el) + 1]?.focus(); };
        e.target.dispatchEvent(new Event('change'));
        if (GENINT.has(id)) setTimeout(() => ev(f, 'genint', { amount_text: f.m.querySelector('#dcAmount').value }).then(() => { if (!f.hint) next(); }), 0);
        else next();
      }
    });
  }
  async function refreshLists(f) {
    try { const r = await api('/api/deposits/contract/refresh', { method: 'POST', body: body(f) }); f.ui = { ...f.ui, ...r.ui }; f.hint = ''; render(f); }
    catch (e) { f.hint = D().errHtmlInner(e); render(f); }
  }
  async function save(f) {                          // BitBtnOkClick
    if (f.busy) return; f.busy = true;
    try {
      const r = await api('/api/deposits/contract/save', { method: 'POST', body: body(f) });
      f.st = r.state; f.hint = '';
      if (r.closed) { f.modified = false; finish(f); return; }      // Edit: SaveState -> Self.Close
      f.rec = r.rec; f.ui.cust_name = ''; f.modified = true; render(f);   // AddContract: next blank record
      toast(K('c_saved_new'), 'success');
      f.m.querySelector('#dcFil')?.focus();                         // DBLCBFilial.SetFocus
    } catch (e) { f.hint = D().errHtmlInner(e); render(f); }
    finally { f.busy = false; }
  }
  function cancel(f) {                              // BitBtnCancelClick -> SaveState(False)
    if (!f.st.inserted) { f.modified = false; finish(f); return; }
    f.st.browse = true; f.modified = false;         // Cancel twice: the empty dataset stays in browse state
    Object.keys(f.rec).forEach(k => { f.rec[k] = null; }); f.ui.cust_name = '';
    render(f); f.m.querySelector('#dcFil')?.focus();
  }
  function tryClose(f) {                            // FormCloseQuery: Modified -> 'Dəyişiklər qeyd olunmayacaq !'#13'Əminsiniz?'
    if (f.modified && !confirm(K('c_close_confirm'))) return;
    finish(f);
  }
  function finish(f) {                              // FormClose: if FCommited then RefreshWithSavely(True)
    f.close();
    if (f.st.commited) D().reloadMain(true);
  }

  window.SB.depForms = window.SB.depForms || {};
  window.SB.depForms.contract_insert = () => open('InsertContract');
  window.SB.depForms.contract_edit = (sel) => { if (!sel) { toast(K('err_no_deposit'), 'error'); return; } open('EditContract', sel); };
})();

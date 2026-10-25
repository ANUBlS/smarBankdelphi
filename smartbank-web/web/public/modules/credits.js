/* Credits manager – port of Delphi Packages/SB_Credit (Sm_creditsmgr TCreditsmgr_sb, CM_Conclusion card, CM_Schedule,
   CM_Filter, CM_coefficient, CM_DECA, plus all 37 BPL/OCX sub-packages: CM_Tranche, CM_Payment, CM_Prolongation,
   CM_Expire, CM_Activate, CM_InterestCalculation, CM_Corrector, CM_Statement, Cm_NewGuarantee, CM_AdvencedInfo,
   CM_BUSINESS_PLAN, CM_Protokol, cm_notes, CM_FolderPlace, CM_ADM, CM_Setup, CM_Customer, FormCreateCMAccounts, LogOutput). */
(function () {
  const { api, t, esc, toast, fmtDate } = window.SB;
  const money = (v) => v === null || v === undefined || v === '' ? '' : Number(v).toLocaleString(window.I18N.lang, { minimumFractionDigits: 2, maximumFractionDigits: 2 });
  function modal(html, onMount, wide) {
    const d = document.createElement('div'); d.className = 'backdrop stacked';
    d.innerHTML = `<div class="modal ${wide ? 'wide' : ''}" role="dialog">${html}</div>`; document.body.appendChild(d);
    const close = () => d.remove(); onMount && onMount(d.querySelector('.modal'), close); return close;
  }
  const errText = (e) => e.field ? t(e.key, { field: t('credits.f_' + e.field) }) : t(e.key, e);
  const errHtml = (e) => `<div class="alert error">${esc(errText(e))}${e.ora ? `<span class="ora">${esc(e.ora)}</span>` : ''}</div>`;
  const opt = (list, key, label, val, empty = true) => (empty ? '<option value=""></option>' : '') + (list || []).map(x => `<option value="${esc(x[key])}" ${String(x[key]) === String(val ?? '') ? 'selected' : ''}>${esc(label(x))}</option>`).join('');
  const STATUS = { 1: ['✔', 'teal', 'credits.st_1'], 2: ['⏳', 'amber', 'credits.st_2'], 3: ['✖', 'red', 'credits.st_3'] };
  const MONEY = new Set(['REST', 'INTERESTREST', 'DUEREST', 'DUEINTERESTREST', 'CREDITLINEAMOUNT', 'INITIALAMOUNT', 'OBLIGATION', 'PLEDGEPRICE', 'BOOROWERREST', 'PENALTYREST', 'IPREST', 'IPINTERESTREST']);
  const DATES = new Set(['DATEOFCONCLUSION', 'DUEDATEFIRSTCONTRACT', 'DUEDATELASTCONTRACT', 'STOPCALCDATE']);
  const st = { init: null, rows: [], total: 0, cur: null, order: 'ID', desc: false, filter: {}, lk: null, logs: [] };
  const addLog = (msg) => st.logs.unshift({ time: new Date().toLocaleTimeString(), msg });

  async function refresh(el) {
    try {
      const r = await api('/api/credits/list', { method: 'POST', body: { order: st.order, desc: st.desc, filter: st.filter } });
      st.rows = r.rows; st.total = r.total; if (!st.rows.some(x => x.id === st.cur)) st.cur = st.rows.length ? st.rows[0].id : null; render(el);
    } catch (e) { el.querySelector('#crGrid').innerHTML = errHtml(e); }
  }
  function render(el) {
    let cols = (st.init?.layout?.columns || []).filter(c => c.visible);
    if (!cols.length) {
      cols = ['ID', 'NUMBEROFCREDIT', 'CONTRACTACCNO', 'VAL_NAME', 'STATUS', 'NAME', 'ANNUALYINTERESTRATE', 'REST', 'INTERESTREST', 'DUEREST', 'DUEINTERESTREST', 'CREDITLINEAMOUNT', 'DATEOFCONCLUSION', 'DUEDATEFIRSTCONTRACT', 'FILIAL'].map(f => ({ field: f, visible: true }));
    }
    el.querySelector('#crGrid').innerHTML = `<div class="tablewrap" style="max-height:55vh"><table class="grid acc-grid"><thead><tr>
      ${cols.map(c => `<th class="sortable" data-f="${c.field}" style="${MONEY.has(c.field) ? 'text-align:right' : ''}">${esc(t('credits.f_' + c.field))}${st.order === c.field ? (st.desc ? ' ▼' : ' ▲') : ''}</th>`).join('')}</tr></thead><tbody>
      ${st.rows.map(r => `<tr data-id="${r.id}" class="${r.id === st.cur ? 'sel' : ''}">${cols.map(c => {
        const v = r[c.field.toLowerCase()];
        if (c.field === 'STATUS') { const s = STATUS[v] || ['', '', '']; return `<td><span class="badge ${s[1]}" title="${esc(s[2] ? t(s[2]) : '')}">${s[0]}</span></td>`; }
        return `<td style="${MONEY.has(c.field) ? 'text-align:right;font-variant-numeric:tabular-nums' : ''}">${esc(MONEY.has(c.field) ? money(v) : DATES.has(c.field) ? fmtDate(v) : v ?? '')}</td>`; }).join('')}</tr>`).join('')
      || `<tr><td colspan="${cols.length}" class="muted">${esc(t('credits.empty'))}</td></tr>`}</tbody></table></div>
      <div class="gridfoot"><span class="muted">${esc(t('credits.shown', { n: st.rows.length, total: st.total }))}</span></div>`;
    el.querySelectorAll('#crGrid th[data-f]').forEach(th => th.onclick = () => { const f = th.dataset.f; st.desc = st.order === f ? !st.desc : false; st.order = f; refresh(el); });
    el.querySelectorAll('#crGrid tr[data-id]').forEach(tr => {
      tr.onclick = () => { st.cur = +tr.dataset.id; el.querySelectorAll('#crGrid tr.sel').forEach(x => x.classList.remove('sel')); tr.classList.add('sel'); };
      tr.ondblclick = () => card(el, 'look', +tr.dataset.id);
    });
  }

  const CARD = [['NUMBEROFCREDIT', 'text'], ['BOOROWERID', 'customers'], ['CURRENCY', 'currencies'], ['BRANCHID', 'branches'], ['CREDITTYPE', 'credit_types'],
    ['PERSONALTYPE', 'person_types'], ['USRGROUP', 'usr_groups'], ['ACTIVITIES_TYPE', 'estate_types'], ['AIM_ID', 'aims'], ['CREDITLINEAMOUNT', 'num'],
    ['ANNUALYINTERESTRATE', 'num'], ['ANNUALYOVERDUERATE', 'num'], ['ANNUALYPENALTYRATE', 'num'], ['DATEOFCONCLUSION', 'date'], ['DUEDATEFIRSTCONTRACT', 'date'],
    ['INTCALCMETHOD', 'calc_methods'], ['AUTOPAYMENT', 'automation'], ['RESERVEID', 'reserves'], ['PLEDGEID_P', 'pledges'], ['EXPERTID', 'experts'],
    ['MEHSULID', 'mehsul'], ['PAYINTDAY', 'num'], ['PINCODE', 'text'], ['BOORID', 'text'], ['COUNTRYCODE', 'countries'], ['ADDRESS', 'text'], ['SALARY', 'text'],
    ['PHONENUMBER', 'text'], ['PURPOSEOFCREDIT', 'text'], ['KOMISION', 'num']];
  const LK = { customers: ['id', x => x.name], currencies: ['currid', x => x.val_name + ' – ' + x.currname], branches: ['id', x => x.name], credit_types: ['id', x => x.description],
    person_types: ['id', x => x.descripion], usr_groups: ['id', x => x.description], estate_types: ['id', x => x.kodu + ' ' + x.name], aims: ['id', x => x.name],
    calc_methods: ['id', x => x.description], automation: ['id', x => x.description], reserves: ['id', x => x.fulldesc], pledges: ['id', x => x.typecode + ' ' + x.description],
    experts: ['id', x => x.name], mehsul: ['id', x => x.nam], countries: ['code', x => x.name] };

  async function card(el, mode, id) {
    try {
      if (!st.lk) st.lk = await api('/api/credits/lookups');
      const r = mode === 'insert' ? await api('/api/credits/card/new') : await api(`/api/credits/card/${id}?mode=${mode}`);
      const rec = r.rec, ro = mode === 'look' || mode === 'post';
      modal(`<h2>${esc(t('credits.card_' + mode))}${id ? ' #' + id : ''}</h2><div id="cerr"></div>
        ${!ro ? `<div class="toolbar" style="gap:6px;margin-bottom:8px">
          <button type="button" class="btn secondary" id="cQuickCust">＋ Yeni Müştəri (CM_Customer)</button>
          <button type="button" class="btn secondary" id="cAutoAcc">⚡ Kredit hesablarını yarat (AddCreditAccounts)</button>
        </div>` : ''}
        <form id="cf" class="formgrid" style="display:grid;grid-template-columns:repeat(3,1fr);gap:8px 14px;max-height:62vh;overflow:auto">${CARD.map(([f, k]) => {
          const v = rec[f]; const lab = `<label class="field"><span>${esc(t('credits.f_' + f))}</span>`;
          if (LK[k]) return lab + `<select name="${f}" ${ro ? 'disabled' : ''}>${opt(st.lk[k], LK[k][0], LK[k][1], v)}</select></label>`;
          return lab + `<input name="${f}" type="${k === 'date' ? 'date' : k === 'num' ? 'number' : 'text'}" step="any" value="${esc(v ?? '')}" ${ro ? 'readonly' : ''}></label>`; }).join('')}</form>
        <div class="actions"><button class="btn secondary" id="cx">${esc(t('password.cancel'))}</button>
        ${mode === 'post' ? `<button class="btn secondary" id="crej">${esc(t('credits.reject'))}</button><button class="btn" id="capp">${esc(t('credits.approve'))}</button>` : ''}
        ${!ro ? `<button class="btn" id="csave">${esc(t('credits.save'))}</button>` : ''}</div>`, (m, close) => {
        m.querySelector('#cx').onclick = close;
        const qc = m.querySelector('#cQuickCust');
        if (qc) qc.onclick = () => quickCustModal(m);
        const aa = m.querySelector('#cAutoAcc');
        if (aa) aa.onclick = async () => {
          const custId = +m.querySelector('[name="BOOROWERID"]').value;
          const curr = +m.querySelector('[name="CURRENCY"]').value || 0;
          const ctype = +m.querySelector('[name="CREDITTYPE"]').value || 1;
          try {
            const res = await api('/api/credits/accounts/auto-create', { method: 'POST', body: { cust_id: custId, currency: curr, credit_type: ctype } });
            Object.assign(rec, {
              BOOROWERACCID: res.created.ClientAccs || rec.BOOROWERACCID,
              LOANACCID: res.created.LoanAccs || rec.LOANACCID,
              DUELOANACCID: res.created.DueLoanAccs || rec.DUELOANACCID,
              INTERESTACCID: res.created.InterestAccs || rec.INTERESTACCID,
              PRIMARYRESERVEACCID: res.created.PReserveAccs || rec.PRIMARYRESERVEACCID,
              OUTGUARANTEEACCID: res.created.ObligationAccs || rec.OUTGUARANTEEACCID,
              OUTINTERESTACCID: res.created.OutInterestAccs || rec.OUTINTERESTACCID,
            });
            addLog(`AddCreditAccounts: Müştəri #${custId} üçün kredit hesabları yaradıldı`);
            toast('Kredit hesabları avtomatik yaradıldı');
          } catch (e) { m.querySelector('#cerr').innerHTML = errHtml(e); }
        };
        const sv = m.querySelector('#csave');
        if (sv) sv.onclick = async () => {
          const out = { ...rec }; new FormData(m.querySelector('#cf')).forEach((v, k) => { out[k] = v === '' ? null : v; });
          try { const x = await api('/api/credits/card', { method: 'POST', body: { mode, rec: out } }); addLog(`Müqavilə yadda saxlanıldı #${x.id}`); toast(t('credits.saved', { id: x.id })); close(); st.cur = x.id; refresh(el); }
          catch (e) { m.querySelector('#cerr').innerHTML = errHtml(e); }
        };
        const post = (approve) => async () => { try { await api(`/api/credits/card/${id}/post`, { method: 'POST', body: { approve } }); addLog(`Müqavilə #${id} təsdiq statusu: ${approve}`); close(); refresh(el); } catch (e) { m.querySelector('#cerr').innerHTML = errHtml(e); } };
        if (mode === 'post') { m.querySelector('#capp').onclick = post(true); m.querySelector('#crej').onclick = post(false); }
      }, true);
    } catch (e) { toast(errText(e), 'error'); }
  }

  function quickCustModal(parentModal) {
    modal(`<h2>Yeni Müştəri (CM_Customer.bpl)</h2><div id="qcerr"></div>
      <div class="formgrid" style="display:grid;grid-template-columns:1fr 1fr;gap:8px">
        <label class="field"><span>Adı (NAME)</span><input id="qcn"></label>
        <label class="field"><span>Qısa adı</span><input id="qcs"></label>
        <label class="field"><span>VÖEN (İNN)</span><input id="qci"></label>
        <label class="field"><span>Şəxsiyyət vəsiqəsi</span><input id="qcp"></label>
        <label class="field"><span>Telefon</span><input id="qct"></label>
        <label class="field"><span>Ünvan</span><input id="qca"></label>
      </div>
      <div class="actions"><button class="btn secondary" id="qcx">${esc(t('common.close'))}</button><button class="btn" id="qcsave">${esc(t('credits.save'))}</button></div>`, (m, close) => {
      m.querySelector('#qcx').onclick = close;
      m.querySelector('#qcsave').onclick = async () => {
        try {
          const r = await api('/api/credits/customers/quick-add', { method: 'POST', body: {
            name: m.querySelector('#qcn').value, short_name: m.querySelector('#qcs').value,
            inn: m.querySelector('#qci').value, pasport: m.querySelector('#qcp').value,
            phone: m.querySelector('#qct').value, address: m.querySelector('#qca').value, open_dat: st.init.date
          } });
          st.lk.customers = r.customers;
          const sel = parentModal.querySelector('[name="BOOROWERID"]');
          if (sel) sel.innerHTML = opt(st.lk.customers, 'id', x => x.name, r.id);
          toast('Yeni müştəri əlavə edildi #' + r.id);
          close();
        } catch (e) { m.querySelector('#qcerr').innerHTML = errHtml(e); }
      };
    });
  }

  async function schedule(el, id) {
    if (!id) return;
    const load = () => api(`/api/credits/${id}/schedule`);
    let rows = (await load()).rows; let sel = new Set();
    modal(`<h2>${esc(t('credits.schedule'))} #${id}</h2><div id="serr"></div><div id="sbar" class="toolbar" style="gap:8px;flex-wrap:wrap"></div><div id="sg"></div>
      <div class="actions">
        <button class="btn secondary" id="sshift">📅 Tarixləri sürüşdür</button>
        <button class="btn secondary" id="strsch">📋 Tranş Qrafiki</button>
        <button class="btn secondary" id="sdel">${esc(t('credits.sch_delete'))}</button>
        <button class="btn secondary" id="sclose">${esc(t('credits.sch_close'))}</button>
        <button class="btn" id="ssave">${esc(t('credits.sch_save'))}</button>
      </div>`, async (m, close) => {
      const draw = () => { m.querySelector('#sg').innerHTML = `<div class="tablewrap" style="max-height:46vh"><table class="grid"><thead><tr><th></th><th>${esc(t('credits.sch_date'))}</th><th style="text-align:right">${esc(t('credits.sch_principal'))}</th><th style="text-align:right">${esc(t('credits.sch_interest'))}</th><th style="text-align:right">${esc(t('credits.sch_rest'))}</th></tr></thead><tbody>
        ${rows.map(r => `<tr><td><input type="checkbox" data-r="${esc(r.rowid)}" ${sel.has(r.rowid) ? 'checked' : ''}></td><td>${esc(fmtDate(r.paymentdate))}</td><td style="text-align:right">${money(r.principal)}</td><td style="text-align:right">${money(r.interest)}</td><td style="text-align:right">${money(r.rest)}</td></tr>`).join('') || `<tr><td colspan="5" class="muted">${esc(t('credits.sch_empty'))}</td></tr>`}</tbody></table></div>`;
        m.querySelectorAll('[data-r]').forEach(c => c.onchange = () => c.checked ? sel.add(c.dataset.r) : sel.delete(c.dataset.r)); };
      const fail = (e) => { m.querySelector('#serr').innerHTML = errHtml(e); };
      try {
        const d = await api(`/api/credits/${id}/schedule/annuty-defaults`);
        m.querySelector('#sbar').innerHTML = `<label class="field"><span>${esc(t('credits.sch_first'))}</span><input id="sfp" type="date" value="${esc(d.first_pay_date)}"></label>
          <label class="field"><span>${esc(t('credits.sch_amount'))}</span><input id="sam" type="number" step="any" value="${esc(d.amount)}" ${d.amount_readonly ? 'readonly' : ''}></label>
          <label class="field"><span>${esc(t('credits.sch_periods'))}</span><input id="snp" type="number" value="${esc(d.n_periods)}"></label>
          <label class="field"><span>${esc(t('credits.sch_dovr'))}</span><input id="sdv" type="number" value="0"></label>
          <label class="field"><span>${esc(t('credits.sch_kind'))}</span><select id="skd"><option value="1">${esc(t('credits.sch_annuity'))}</option><option value="0">${esc(t('credits.sch_equal'))}</option></select></label>
          <button class="btn" id="sgen" style="align-self:end">${esc(t('credits.sch_generate'))}</button>`;
        m.querySelector('#sgen').onclick = async () => { try { await api(`/api/credits/${id}/schedule/annuty`, { method: 'POST', body: { first_pay_date: m.querySelector('#sfp').value, amount: +m.querySelector('#sam').value, n_periods: +m.querySelector('#snp').value, dovr: +m.querySelector('#sdv').value, annuity: m.querySelector('#skd').value === '1' } }); rows = (await load()).rows; m.querySelector('#serr').innerHTML = ''; draw(); } catch (e) { fail(e); } };
      } catch (e) { fail(e); }
      draw();
      m.querySelector('#sshift').onclick = async () => {
        try {
          const r = await api(`/api/credits/${id}/schedule/shift-dates`, { method: 'POST', body: { months: 1, days: 0 } });
          rows = r.rows; draw(); toast('Qrafik tarixləri 1 ay sürüşdürüldü');
        } catch (e) { fail(e); }
      };
      m.querySelector('#strsch').onclick = () => trancheScheduleModal(id);
      m.querySelector('#sdel').onclick = async () => { try { await api(`/api/credits/${id}/schedule/delete`, { method: 'POST', body: { rowids: [...sel] } }); sel.clear(); rows = (await load()).rows; draw(); } catch (e) { fail(e); } };
      m.querySelector('#ssave').onclick = async () => { try { await api(`/api/credits/${id}/schedule/save`, { method: 'POST' }); toast(t('credits.sch_saved')); } catch (e) { fail(e); } };
      m.querySelector('#sclose').onclick = async () => { try { await api(`/api/credits/${id}/schedule/close`, { method: 'POST' }); } finally { close(); } };
    }, true);
  }

  async function trancheScheduleModal(id) {
    const r = await api(`/api/credits/${id}/tranche-schedule`);
    modal(`<h2>Tranş Qrafiki (CM_TRANCHE_SCHEDULE) #${id}</h2>
      <div class="toolbar" style="gap:8px"><input id="tsd" type="date" value="${st.init.date}"><input id="tsa" type="number" placeholder="Məbləğ"><input id="tsn" placeholder="Qeyd"><button class="btn" id="tsadd">＋ Əlavə et</button></div>
      <div id="tsg" style="margin-top:8px"></div>
      <div class="actions"><button class="btn secondary" id="tsx">${esc(t('common.close'))}</button></div>`, (m, close) => {
      const draw = (rows) => {
        m.querySelector('#tsg').innerHTML = `<table class="grid"><thead><tr><th>Tarix</th><th style="text-align:right">Məbləğ</th><th>Qeyd</th></tr></thead><tbody>${rows.map(x => `<tr><td>${esc(fmtDate(x.tranchedate))}</td><td style="text-align:right">${money(x.amount)}</td><td>${esc(x.notes || '')}</td></tr>`).join('') || '<tr><td colspan="3" class="muted">Boşdur</td></tr>'}</tbody></table>`;
      };
      draw(r.rows);
      m.querySelector('#tsx').onclick = close;
      m.querySelector('#tsadd').onclick = async () => {
        const res = await api(`/api/credits/${id}/tranche-schedule`, { method: 'POST', body: { tranchedate: m.querySelector('#tsd').value, amount: +m.querySelector('#tsa').value, notes: m.querySelector('#tsn').value } });
        draw(res.rows);
      };
    });
  }

  // ---- CM_Tranche.bpl ----
  async function tranchesModal(el, id) {
    if (!id) return;
    const r = await api(`/api/credits/${id}/tranches`);
    modal(`<h2>Tranşların Verilməsi (CM_Tranche.bpl) #${id}</h2><div id="terr"></div>
      ${r.debit_arrested ? `<div class="alert error">Diqqət: Müştəri hesabında həbs (DebitArested) var!</div>` : ''}
      <div class="toolbar" style="gap:8px;flex-wrap:wrap">
        <label class="field"><span>Tarix</span><input id="trd" type="date" value="${st.init.date}"></label>
        <label class="field"><span>Məbləğ</span><input id="tra" type="number" step="any" value="${esc(r.credit.creditlineamount || 1000)}"></label>
        <label class="field"><span>Təyinat</span><input id="trp" value="Müqavilə üzrə tranş verilişi"></label>
        <label style="align-self:end"><input type="checkbox" id="trc"> Nağd (Kassa)</label>
        <button class="btn" id="tradd" style="align-self:end">＋ Tranş ver & Təsdiqlə</button>
      </div>
      <div id="trg" style="margin-top:8px"></div>
      <div class="actions"><button class="btn secondary" id="trx">${esc(t('common.close'))}</button></div>`, (m, close) => {
      const draw = (rows) => {
        m.querySelector('#trg').innerHTML = `<table class="grid"><thead><tr><th>ID</th><th>Tarix</th><th style="text-align:right">Məbləğ</th><th>Təyinat</th><th>Status</th><th></th></tr></thead><tbody>
          ${rows.map(x => `<tr><td>${x.id}</td><td>${esc(fmtDate(x.tranchedate))}</td><td style="text-align:right">${money(x.amount)}</td><td>${esc(x.purpose || '')}</td><td>${x.status ? '✔ Təsdiqlənib' : '⏳ Gözləyir'}</td><td><button class="btn secondary btn-sm" data-del="${x.id}">Sil</button></td></tr>`).join('') || '<tr><td colspan="6" class="muted">Tranş yoxdur</td></tr>'}</tbody></table>`;
        m.querySelectorAll('[data-del]').forEach(b => b.onclick = async () => {
          const res = await api(`/api/credits/${id}/tranches/${b.dataset.del}`, { method: 'DELETE' });
          draw(res.rows); refresh(el);
        });
      };
      draw(r.rows);
      m.querySelector('#trx').onclick = close;
      m.querySelector('#tradd').onclick = async () => {
        try {
          const res = await api(`/api/credits/${id}/tranches`, { method: 'POST', body: {
            tranchedate: m.querySelector('#trd').value, amount: +m.querySelector('#tra').value,
            purpose: m.querySelector('#trp').value, is_cash: m.querySelector('#trc').checked ? 1 : 0, commit: true
          } });
          addLog(`Kredit #${id}: ${m.querySelector('#tra').value} məbləğində tranş verildi`);
          draw(res.rows); refresh(el); toast('Tranş uğurla verildi');
        } catch (e) { m.querySelector('#terr').innerHTML = errHtml(e); }
      };
    }, true);
  }

  // ---- CM_Payment.bpl ----
  async function paymentsModal(el, id) {
    if (!id) return;
    const r = await api(`/api/credits/${id}/payments`);
    const s = r.state || {}, p = r.plan || {};
    modal(`<h2>Kredit Ödənişləri (CM_Payment.bpl) #${id}</h2><div id="perr"></div>
      <div class="toolbar" style="gap:12px;flex-wrap:wrap;background:#f8fafc;padding:8px;border-radius:6px">
        <span>Əsas borc: <b>${money(s.rest)}</b></span>
        <span>Faiz: <b>${money(s.interestrest)}</b></span>
        <span>Vaxtı keçmiş əsas: <b>${money(s.duerest)}</b></span>
        <span>Vaxtı keçmiş faiz: <b>${money(s.dueinterestrest)}</b></span>
        <span>Cərimə: <b>${money(s.penaltyrest)}</b></span>
      </div>
      <div class="formgrid" style="display:grid;grid-template-columns:repeat(4,1fr);gap:8px;margin-top:8px">
        <label class="field"><span>Tarix</span><input id="pyd" type="date" value="${st.init.date}"></label>
        <label class="field"><span>Əsas borc ödənişi</span><input id="pym" type="number" step="any" value="${esc(p.main_plan || 0)}"></label>
        <label class="field"><span>Faiz ödənişi</span><input id="pyi" type="number" step="any" value="${esc(p.interest_plan || 0)}"></label>
        <label class="field"><span>Vaxtı keçmiş əsas</span><input id="pydm" type="number" step="any" value="${esc(p.duemain_plan || 0)}"></label>
        <label class="field"><span>Vaxtı keçmiş faiz</span><input id="pydi" type="number" step="any" value="${esc(p.dueinterest_plan || 0)}"></label>
        <label class="field"><span>Cərimə ( Dəbbə )</span><input id="pyp" type="number" step="any" value="${esc(p.penalty_plan || 0)}"></label>
        <label class="field"><span>Qeyd</span><input id="pyn" value="Kredit üzrə növbəti ödəniş"></label>
        <label style="align-self:end"><input type="checkbox" id="pyfull"> Tam bağlama (CBFullPay)</label>
      </div>
      <div class="actions" style="justify-content:flex-start"><button class="btn" id="pyadd">＋ Ödənişi qəbul et (PaymentAdd & Commit)</button></div>
      <div id="pyg" style="margin-top:8px"></div>
      <div class="actions"><button class="btn secondary" id="pyx">${esc(t('common.close'))}</button></div>`, (m, close) => {
      const draw = (rows) => {
        m.querySelector('#pyg').innerHTML = `<div class="tablewrap" style="max-height:36vh"><table class="grid"><thead><tr><th>ID</th><th>Tarix</th><th style="text-align:right">Cəmi</th><th style="text-align:right">Əsas</th><th style="text-align:right">Faiz</th><th style="text-align:right">V.K. Əsas</th><th style="text-align:right">Cərimə</th><th>Qeyd</th><th></th></tr></thead><tbody>
          ${rows.map(x => `<tr><td>${x.id}</td><td>${esc(fmtDate(x.paydate))}</td><td style="text-align:right">${money(x.total)}</td><td style="text-align:right">${money(x.main_amount)}</td><td style="text-align:right">${money(x.interest_amount)}</td><td style="text-align:right">${money(x.duemain_amount)}</td><td style="text-align:right">${money(x.penalty_amount)}</td><td>${esc(x.notes || '')}</td><td><button class="btn secondary btn-sm" data-del="${x.id}">Sil</button></td></tr>`).join('') || '<tr><td colspan="9" class="muted">Ödəniş yoxdur</td></tr>'}</tbody></table></div>`;
        m.querySelectorAll('[data-del]').forEach(b => b.onclick = async () => {
          const res = await api(`/api/credits/${id}/payments/${b.dataset.del}`, { method: 'DELETE' });
          draw(res.rows); refresh(el);
        });
      };
      draw(r.rows);
      m.querySelector('#pyfull').onchange = (e) => {
        if (e.target.checked) {
          m.querySelector('#pym').value = s.rest || 0;
          m.querySelector('#pyi').value = s.interestrest || 0;
          m.querySelector('#pydm').value = s.duerest || 0;
          m.querySelector('#pydi').value = s.dueinterestrest || 0;
          m.querySelector('#pyp').value = s.penaltyrest || 0;
        }
      };
      m.querySelector('#pyx').onclick = close;
      m.querySelector('#pyadd').onclick = async () => {
        const main_amount = +m.querySelector('#pym').value || 0;
        const interest_amount = +m.querySelector('#pyi').value || 0;
        const duemain_amount = +m.querySelector('#pydm').value || 0;
        const dueinterest_amount = +m.querySelector('#pydi').value || 0;
        const penalty_amount = +m.querySelector('#pyp').value || 0;
        const total = main_amount + interest_amount + duemain_amount + dueinterest_amount + penalty_amount;
        try {
          const res = await api(`/api/credits/${id}/payments`, { method: 'POST', body: {
            paydate: m.querySelector('#pyd').value, total, main_amount, interest_amount, duemain_amount, dueinterest_amount, penalty_amount,
            full_pay: m.querySelector('#pyfull').checked, notes: m.querySelector('#pyn').value, commit: true
          } });
          addLog(`Kredit #${id}: ${money(total)} məbləğində ödəniş qəbul edildi`);
          draw(res.rows); refresh(el); toast('Ödəniş uğurla icra olundu');
        } catch (e) { m.querySelector('#perr').innerHTML = errHtml(e); }
      };
    }, true);
  }

  // ---- CM_Prolongation.bpl & CM_Expire.bpl & CM_Activate.bpl ----
  async function operationsModal(el, id) {
    if (!id) return;
    const [pr, ex] = await Promise.all([api(`/api/credits/${id}/prolongations`), api(`/api/credits/${id}/expires`)]);
    modal(`<h2>Müddət Uzatma / Vaxtı Keçmişə Köçürmə / Aktivləşdirmə #${id}</h2><div id="operr"></div>
      <h3>1. Müddətin Uzadılması (CM_Prolongation.bpl)</h3>
      <div class="toolbar" style="gap:8px;flex-wrap:wrap">
        <label class="field"><span>Tarix</span><input id="prd" type="date" value="${st.init.date}"></label>
        <label class="field"><span>Yeni bitmə tarixi</span><input id="prnd" type="date" value="2027-12-31"></label>
        <label class="field"><span>Yeni %</span><input id="prr" type="number" step="any" value="18"></label>
        <label class="field"><span>Məbləğ</span><input id="pra" type="number" step="any" value="5000"></label>
        <button class="btn" id="pradd" style="align-self:end">＋ Uzat (Prolongation_Add)</button>
        <button class="btn secondary" id="prdel" style="align-self:end">Son uzatmanı sil</button>
      </div>
      <div id="prg" style="margin-top:6px"></div>
      <h3 style="margin-top:14px">2. Vaxtı Keçmiş Hesaba Köçürmə (CM_Expire.bpl)</h3>
      <div class="toolbar" style="gap:8px;flex-wrap:wrap">
        <label class="field"><span>Tarix</span><input id="exd" type="date" value="${st.init.date}"></label>
        <label class="field"><span>Əsas borc</span><input id="exm" type="number" step="any" value="500"></label>
        <label class="field"><span>Faiz borcu</span><input id="exi" type="number" step="any" value="50"></label>
        <button class="btn" id="exadd" style="align-self:end">＋ Vaxtı keçmişə köçür (Expire_Add)</button>
        <button class="btn secondary" id="actbtn" style="align-self:end">✔ Krediti Aktivləşdir (CM_Activate)</button>
      </div>
      <div id="exg" style="margin-top:6px"></div>
      <div class="actions"><button class="btn secondary" id="opx">${esc(t('common.close'))}</button></div>`, (m, close) => {
      const drawPr = (rows) => {
        m.querySelector('#prg').innerHTML = `<table class="grid"><thead><tr><th>ID</th><th>Tarix</th><th>Köhnə tarix</th><th>Yeni tarix</th><th>Yeni %</th><th style="text-align:right">Məbləğ</th></tr></thead><tbody>${rows.map(x => `<tr><td>${x.id}</td><td>${esc(fmtDate(x.prolongdate))}</td><td>${esc(fmtDate(x.oldduedate))}</td><td>${esc(fmtDate(x.newduedate))}</td><td>${esc(x.newrate)}</td><td style="text-align:right">${money(x.amount)}</td></tr>`).join('') || '<tr><td colspan="6" class="muted">Uzatma yoxdur</td></tr>'}</tbody></table>`;
      };
      const drawEx = (rows) => {
        m.querySelector('#exg').innerHTML = `<table class="grid"><thead><tr><th>ID</th><th>Tarix</th><th style="text-align:right">Əsas</th><th style="text-align:right">Faiz</th><th>Qeyd</th></tr></thead><tbody>${rows.map(x => `<tr><td>${x.id}</td><td>${esc(fmtDate(x.expiredate))}</td><td style="text-align:right">${money(x.main_amount)}</td><td style="text-align:right">${money(x.interest_amount)}</td><td>${esc(x.notes || '')}</td></tr>`).join('') || '<tr><td colspan="5" class="muted">Vaxtı keçmiş köçürmə yoxdur</td></tr>'}</tbody></table>`;
      };
      drawPr(pr.rows); drawEx(ex.rows);
      m.querySelector('#opx').onclick = close;
      m.querySelector('#pradd').onclick = async () => {
        const res = await api(`/api/credits/${id}/prolongations`, { method: 'POST', body: { prolongdate: m.querySelector('#prd').value, newduedate: m.querySelector('#prnd').value, newrate: +m.querySelector('#prr').value, amount: +m.querySelector('#pra').value } });
        drawPr(res.rows); refresh(el); toast('Müddət uzadıldı');
      };
      m.querySelector('#prdel').onclick = async () => {
        const res = await api(`/api/credits/${id}/prolongations/last`, { method: 'DELETE' });
        drawPr(res.rows); refresh(el);
      };
      m.querySelector('#exadd').onclick = async () => {
        const res = await api(`/api/credits/${id}/expires`, { method: 'POST', body: { expiredate: m.querySelector('#exd').value, main_amount: +m.querySelector('#exm').value, interest_amount: +m.querySelector('#exi').value, commit: true } });
        drawEx(res.rows); refresh(el); toast('Vaxtı keçmiş hesaba köçürüldü');
      };
      m.querySelector('#actbtn').onclick = async () => {
        await api(`/api/credits/${id}/activate`, { method: 'POST', body: { actdate: st.init.date, commit: true } });
        refresh(el); toast('Kredit aktivləşdirildi');
      };
    }, true);
  }

  // ---- CM_InterestCalculation.bpl ----
  async function intCalcModal(el) {
    const r = await api('/api/credits/interest-calc');
    modal(`<h2>Faizlərin Hesablanması (CM_InterestCalculation.bpl)</h2>
      <div class="toolbar" style="gap:8px;flex-wrap:wrap">
        <label class="field"><span>Hesablama tarixi</span><input id="icd" type="date" value="${st.init.date}"></label>
        <button class="btn" id="icrun" style="align-self:end">▶ Faizləri hesabla (CalcPercents)</button>
        <button class="btn secondary" id="icacc" style="align-self:end">✔ Müxabirləşdir (AcceptCalcedPercents)</button>
        <button class="btn secondary" id="iccan" style="align-self:end">✖ Ləğv et (CancelCalculation)</button>
        ${st.cur ? `<button class="btn secondary" id="icstop" style="align-self:end">⏸ Seçilmiş kredit üzrə faizi dayandır (#${st.cur})</button>` : ''}
      </div>
      <h3>Cari Hesablanmış Faiz Keşi (CM_INTCACHE)</h3>
      <div id="icg"></div>
      <div class="actions"><button class="btn secondary" id="icx">${esc(t('common.close'))}</button></div>`, (m, close) => {
      const draw = (rows) => {
        m.querySelector('#icg').innerHTML = `<div class="tablewrap" style="max-height:40vh"><table class="grid"><thead><tr><th>Kredit ID</th><th>Müqavilə №</th><th>Borcalan</th><th>Tarix</th><th style="text-align:right">Əsas Faiz</th><th style="text-align:right">V.K. Faiz</th><th style="text-align:right">Cərimə</th></tr></thead><tbody>${rows.map(x => `<tr><td>${x.creditid}</td><td>${esc(x.numberofcredit)}</td><td>${esc(x.name)}</td><td>${esc(fmtDate(x.calcdate))}</td><td style="text-align:right">${money(x.mainint)}</td><td style="text-align:right">${money(x.overdueint)}</td><td style="text-align:right">${money(x.penalty)}</td></tr>`).join('')}</tbody></table></div>`;
      };
      draw(r.cache);
      m.querySelector('#icx').onclick = close;
      const act = (action) => async () => {
        const res = await api('/api/credits/interest-calc', { method: 'POST', body: { action, calcdate: m.querySelector('#icd').value, credit_id: st.cur } });
        addLog(`CM_CALCULATOR.${action} icra olundu (${m.querySelector('#icd').value})`);
        draw(res.cache); refresh(el); toast('Əməliyyat tamamlandı: ' + action);
      };
      m.querySelector('#icrun').onclick = act('calc');
      m.querySelector('#icacc').onclick = act('accept');
      m.querySelector('#iccan').onclick = act('cancel');
      if (m.querySelector('#icstop')) m.querySelector('#icstop').onclick = act('stop');
    }, true);
  }

  // ---- CM_Corrector.bpl ----
  async function correctorModal(el, id) {
    if (!id) return;
    const r = await api(`/api/credits/${id}/corrector`);
    const s = r.state || {};
    modal(`<h2>Qalıqların Korrektoru (CM_Corrector.bpl) #${id}</h2>
      <div class="formgrid" style="display:grid;grid-template-columns:repeat(3,1fr);gap:8px">
        <label class="field"><span>Əsas borc qalığı (REST)</span><input id="cor_rest" type="number" step="any" value="${esc(s.rest ?? 0)}"></label>
        <label class="field"><span>Faiz qalığı (INTERESTREST)</span><input id="cor_int" type="number" step="any" value="${esc(s.interestrest ?? 0)}"></label>
        <label class="field"><span>V.K. Əsas borc (DUEREST)</span><input id="cor_due" type="number" step="any" value="${esc(s.duerest ?? 0)}"></label>
        <label class="field"><span>V.K. Faiz (DUEINTERESTREST)</span><input id="cor_duei" type="number" step="any" value="${esc(s.dueinterestrest ?? 0)}"></label>
        <label class="field"><span>Cərimə qalığı (PENALTYREST)</span><input id="cor_pen" type="number" step="any" value="${esc(s.penaltyrest ?? 0)}"></label>
        <label class="field"><span>Girov dəyəri (PLEDGEPRICE)</span><input id="cor_pl" type="number" step="any" value="${esc(s.pledgeprice ?? 0)}"></label>
        <label class="field"><span>Öhdəlik (OBLIGATION)</span><input id="cor_ob" type="number" step="any" value="${esc(s.obligation ?? 0)}"></label>
        <label class="field" style="grid-column:span 2"><span>Düzəliş səbəbi</span><input id="cor_rs" value="Korrektor vasitəsilə qalıq düzəlişi"></label>
      </div>
      <div class="actions"><button class="btn secondary" id="corx">${esc(t('common.close'))}</button><button class="btn" id="corsave">${esc(t('credits.save'))}</button></div>`, (m, close) => {
      m.querySelector('#corx').onclick = close;
      m.querySelector('#corsave').onclick = async () => {
        await api(`/api/credits/${id}/corrector`, { method: 'POST', body: {
          rest: +m.querySelector('#cor_rest').value, interestrest: +m.querySelector('#cor_int').value,
          duerest: +m.querySelector('#cor_due').value, dueinterestrest: +m.querySelector('#cor_duei').value,
          penaltyrest: +m.querySelector('#cor_pen').value, pledgeprice: +m.querySelector('#cor_pl').value,
          obligation: +m.querySelector('#cor_ob').value, reason: m.querySelector('#cor_rs').value
        } });
        addLog(`Kredit #${id}: Korrektor vasitəsilə qalıqlar yeniləndi`);
        refresh(el); toast('Qalıqlar yeniləndi'); close();
      };
    }, true);
  }

  // ---- CM_Statement.bpl ----
  async function statementModal(id) {
    if (!id) return;
    const r = await api(`/api/credits/${id}/statement`);
    const rec = r.card.rec || {}, s = r.state || {};
    modal(`<h2>Kredit Çıxarışı və Tam Bağlama Hesablayıcısı (CM_Statement.bpl) #${id}</h2>
      <div class="toolbar" style="gap:14px;flex-wrap:wrap;background:#f0fdf4;padding:10px;border-radius:6px">
        <span>Müqavilə: <b>${esc(rec.NUMBEROFCREDIT)}</b></span>
        <span>Borcalan: <b>${esc(rec.NAME)}</b></span>
        <span>Əsas qalıq: <b>${money(s.rest)}</b></span>
        <span>Faiz qalığı: <b>${money(s.interestrest)}</b></span>
        <span>Tam bağlama məbləği: <b style="color:#0f766e">${money(r.full_payoff)} ${esc(rec.VAL_NAME || '')}</b></span>
      </div>
      <h4>Tranşlar (${r.tranches.length}) & Ödənişlər (${r.payments.length})</h4>
      <div class="tablewrap" style="max-height:38vh"><table class="grid"><thead><tr><th>Növ</th><th>Tarix</th><th style="text-align:right">Məbləğ</th><th>Təfərrüat</th></tr></thead><tbody>
        ${r.tranches.map(t => `<tr><td><span class="badge amber">Tranş</span></td><td>${esc(fmtDate(t.tranchedate))}</td><td style="text-align:right">${money(t.amount)}</td><td>${esc(t.purpose || '')}</td></tr>`).join('')}
        ${r.payments.map(p => `<tr><td><span class="badge teal">Ödəniş</span></td><td>${esc(fmtDate(p.paydate))}</td><td style="text-align:right">${money(p.total)}</td><td>Əsas: ${money(p.main_amount)}, Faiz: ${money(p.interest_amount)}</td></tr>`).join('')}
      </tbody></table></div>
      <div class="actions"><button class="btn secondary" id="stmx">${esc(t('common.close'))}</button></div>`, (m, close) => {
      m.querySelector('#stmx').onclick = close;
    }, true);
  }

  // ---- Cm_NewGuarantee.bpl & CM_AdvencedInfo.bpl & CM_BUSINESS_PLAN.bpl & CM_Protokol.bpl & cm_notes.bpl & CM_FolderPlace.bpl ----
  async function dossierModal(el, id) {
    if (!id) return;
    const [guar, adv, bp, pr, nt, fp] = await Promise.all([
      api(`/api/credits/${id}/guarantees`),
      api(`/api/credits/${id}/advanced-info`),
      api(`/api/credits/${id}/business-plan`),
      api(`/api/credits/${id}/protokol`),
      api(`/api/credits/${id}/notes`),
      api(`/api/credits/${id}/folder-place`),
    ]);
    modal(`<h2>Kredit Dosyesi: Girov, Zamin, Protokol, Biznes Plan, Qeydlər, Qovluq #${id}</h2>
      <div style="max-height:66vh;overflow:auto;display:grid;gap:12px">
        <section class="card"><h3>1. Girov & Zamin Kartları (Cm_NewGuarantee.bpl)</h3>
          <div class="toolbar" style="gap:6px">
            <input id="g_desc" placeholder="Girov təsviri / Zamin adı"><input id="g_amt" type="number" placeholder="Dəyəri / Maaşı"><input id="g_reg" placeholder="Reyestr № / FİN">
            <button class="btn secondary" id="g_add_col">＋ Girov Kartı</button><button class="btn secondary" id="g_add_guar">＋ Zamin Kartı</button>
          </div>
          <div id="gg_list" style="margin-top:6px"></div>
        </section>
        <section class="card"><h3>2. Kredit Komitəsi Protokolu (CM_Protokol.bpl)</h3>
          <div class="formgrid" style="display:grid;grid-template-columns:repeat(3,1fr);gap:8px">
            <label class="field"><span>Protokol №</span><input id="pr_no" value="${esc(pr.protokol.protokol_no || '')}"></label>
            <label class="field"><span>Sədr</span><input id="pr_ch" value="${esc(pr.protokol.chairman || '')}"></label>
            <label class="field"><span>Qərar</span><input id="pr_dec" value="${esc(pr.protokol.decision || '')}"></label>
          </div>
          <button class="btn secondary" id="pr_save" style="margin-top:6px">Protokolu yadda saxla</button>
        </section>
        <section class="card"><h3>3. Qeydlər (cm_notes.bpl) & Qovluq Yeri / Məhkəmə / İcra (CM_FolderPlace.bpl)</h3>
          <div class="toolbar" style="gap:6px">
            <input id="nt_txt" placeholder="Yeni qeyd mətni..." style="flex:1"><button class="btn secondary" id="nt_add">＋ Qeyd əlavə et</button>
          </div>
          <div id="nt_list" style="margin-top:6px"></div>
          <div class="toolbar" style="gap:6px;margin-top:8px">
            <input id="fp_loc" placeholder="Qovluğun yeri" value="${esc((fp.rows[0] || {}).location || 'Arxiv')}">
            <input id="fp_st" placeholder="Mərhələ (Normal/Məhkəmə/İcra)" value="${esc((fp.rows[0] || {}).stage || 'Normal')}">
            <input id="fp_ct" placeholder="Məhkəmə / İcraçı" value="${esc((fp.rows[0] || {}).court_name || '')}">
            <button class="btn secondary" id="fp_save">Qovluq yerini yenilə</button>
          </div>
        </section>
      </div>
      <div class="actions"><button class="btn secondary" id="dosx">${esc(t('common.close'))}</button></div>`, (m, close) => {
      const drawGuar = (g) => {
        m.querySelector('#gg_list').innerHTML = `<table class="grid"><thead><tr><th>Növ</th><th>Kart #</th><th>Ad / Təsvir</th><th style="text-align:right">Məbləğ / Maaş</th><th>Reyestr / FİN</th></tr></thead><tbody>
          ${g.collaterals.map(c => `<tr><td>Girov</td><td>${c.cardid}</td><td>${esc(c.anyinfotodisting || '')}</td><td style="text-align:right">${money(c.pledgeprice)}</td><td>${esc(c.registryno || '')}</td></tr>`).join('')}
          ${g.guarantors.map(z => `<tr><td>Zamin</td><td>${z.cardid}</td><td>${esc(z.guarantorname || '')}</td><td style="text-align:right">${esc(z.guarantorsalary || '')}</td><td>${esc(z.pincode || '')}</td></tr>`).join('')}
        </tbody></table>`;
      };
      const drawNotes = (rows) => {
        m.querySelector('#nt_list').innerHTML = rows.map(n => `<div style="padding:4px 0;border-bottom:1px solid #eee"><b>${esc(fmtDate(n.notedate))} (${esc(n.username)}):</b> ${esc(n.note)}</div>`).join('');
      };
      drawGuar(guar); drawNotes(nt.rows);
      m.querySelector('#dosx').onclick = close;
      m.querySelector('#g_add_col').onclick = async () => {
        const res = await api(`/api/credits/${id}/guarantees`, { method: 'POST', body: { kind: 'collateral', anyinfotodisting: m.querySelector('#g_desc').value, pledgeprice: +m.querySelector('#g_amt').value, registryno: m.querySelector('#g_reg').value } });
        drawGuar(res);
      };
      m.querySelector('#g_add_guar').onclick = async () => {
        const res = await api(`/api/credits/${id}/guarantees`, { method: 'POST', body: { kind: 'guarantor', guarantorname: m.querySelector('#g_desc').value, guarantorsalary: m.querySelector('#g_amt').value, pincode: m.querySelector('#g_reg').value } });
        drawGuar(res);
      };
      m.querySelector('#pr_save').onclick = async () => {
        await api(`/api/credits/${id}/protokol`, { method: 'POST', body: { protokol_no: m.querySelector('#pr_no').value, chairman: m.querySelector('#pr_ch').value, decision: m.querySelector('#pr_dec').value } });
        toast('Protokol saxlanıldı');
      };
      m.querySelector('#nt_add').onclick = async () => {
        const res = await api(`/api/credits/${id}/notes`, { method: 'POST', body: { note: m.querySelector('#nt_txt').value, notedate: st.init.date } });
        m.querySelector('#nt_txt').value = ''; drawNotes(res.rows);
      };
      m.querySelector('#fp_save').onclick = async () => {
        await api(`/api/credits/${id}/folder-place`, { method: 'POST', body: { location: m.querySelector('#fp_loc').value, stage: m.querySelector('#fp_st').value, court_name: m.querySelector('#fp_ct').value } });
        toast('Qovluq yeri yeniləndi');
      };
    }, true);
  }

  // ---- CM_ADM.bpl & CM_Setup.bpl & LogOutput ----
  async function admSetupModal() {
    const [adm, setup] = await Promise.all([api('/api/credits/adm'), api('/api/credits/setup/account_groups')]);
    modal(`<h2>Kredit İdarəetmə (CM_ADM) & Sazlamalar (CM_Setup) & LogOutput</h2>
      <div class="toolbar" style="gap:8px">
        <select id="set_sec">
          <option value="account_groups">Hesab Qrupları (CM_ACCOUNTGROUPS)</option>
          <option value="ie_tuning">Müxabirləşmə Sazlamaları (CM_IETUNING)</option>
          <option value="tr_descriptions">Ödəniş Təyinatları (CM_TRDESCRIPTIONS)</option>
          <option value="visible_fields">Görünən Sütunlar (CM_VISIBLE_FIELDS)</option>
          <option value="credit_types">Kredit Növləri (CM_CREDIT_TYPES)</option>
          <option value="reserves">Ehtiyat Dərəcələri (CM_RESERVE)</option>
          <option value="pledges">Girov Növləri (CM_PLEDGE)</option>
        </select>
      </div>
      <div id="set_grid" style="margin-top:8px"></div>
      <h3>İstifadəçi Səlahiyyətləri (CM_ADM.bpl — ${adm.plugins.length} BPL/OCX Plagin)</h3>
      <div class="tablewrap" style="max-height:22vh"><table class="grid"><thead><tr><th>İstifadəçi</th><th>Qrup</th><th>Əlavə Hüquqlar (AdmAdditions)</th></tr></thead><tbody>
        ${adm.users.map(u => `<tr><td>${esc(u.username)}</td><td>${esc(u.groupname)}</td><td>${esc(u.additions)}</td></tr>`).join('')}
      </tbody></table></div>
      <h3>Əməliyyat Jurnalı (LogOutput.bpl)</h3>
      <div style="max-height:14vh;overflow:auto;background:#0f172a;color:#e2e8f0;padding:8px;border-radius:6px;font-family:monospace;font-size:12px">
        ${st.logs.map(l => `<div>[${esc(l.time)}] ${esc(l.msg)}</div>`).join('') || '<div>Jurnal boşdur</div>'}
      </div>
      <div class="actions"><button class="btn secondary" id="admx">${esc(t('common.close'))}</button></div>`, (m, close) => {
      const drawSec = (rows) => {
        const ks = rows.length ? Object.keys(rows[0]).filter(k => k !== 'rowid') : [];
        m.querySelector('#set_grid').innerHTML = `<div class="tablewrap" style="max-height:24vh"><table class="grid"><thead><tr>${ks.map(k => `<th>${esc(k)}</th>`).join('')}</tr></thead><tbody>${rows.map(r => `<tr>${ks.map(k => `<td>${esc(r[k] ?? '')}</td>`).join('')}</tr>`).join('')}</tbody></table></div>`;
      };
      drawSec(setup.rows);
      m.querySelector('#set_sec').onchange = async (e) => {
        const r = await api(`/api/credits/setup/${e.target.value}`);
        drawSec(r.rows);
      };
      m.querySelector('#admx').onclick = close;
    }, true);
  }

  async function download(url, body, name, m) {
    const res = await fetch(url, { method: 'POST', headers: { 'Content-Type': 'application/json', 'X-CSRF': window.SB.csrf || '' }, credentials: 'same-origin', body: JSON.stringify(body) });
    if (!res.ok) { const j = await res.json().catch(() => ({})); m.querySelector('#rerr').innerHTML = errHtml(j.detail || { key: 'error.generic' }); return; }
    const a = document.createElement('a'); a.href = URL.createObjectURL(await res.blob()); a.download = name; a.click();
  }
  function reports() {
    const c = st.init.coef;
    modal(`<h2>${esc(t('credits.reports'))}</h2><div id="rerr"></div>
      <h3>${esc(t('credits.coef'))}</h3><div style="display:flex;gap:10px;flex-wrap:wrap">
      <label class="field"><span>${esc(t('credits.rep_date'))}</span><input id="rd" type="date" value="${st.init.date}"></label>
      <label class="field"><span>${esc(t('credits.rep_kind'))}</span><select id="rk"><option value="main">${esc(t('credits.coef_main'))}</option><option value="interest">${esc(t('credits.coef_interest'))}</option></select></label>
      <label class="field"><span>${esc(t('credits.rep_branches'))}</span><select id="rb" multiple size="3">${opt(c.branches, 'id', x => x.name, null, false).replace(/<option /g, '<option selected ')}</select></label>
      <label class="field"><span>${esc(t('credits.rep_categories'))}</span><select id="rc" multiple size="3">${(c.categories || []).map(x => `<option selected value="${esc(x.id)}">${esc(x.description || x.name || x.id)}</option>`).join('')}</select></label></div>
      <div class="actions" style="justify-content:flex-start">
        <button class="btn secondary" id="rshow">${esc(t('credits.rep_show'))}</button>
        <button class="btn" id="rx">${esc(t('credits.rep_excel'))}</button>
        <button class="btn secondary" id="rresinf">Ehtiyat Hesabatı (CM_ReserveInf)</button>
        <button class="btn secondary" id="rplg">Girov/Zamin Hesabatı</button>
      </div><div id="rres"></div>
      <h3>${esc(t('credits.deca'))}</h3><div style="display:flex;gap:10px;flex-wrap:wrap">
      <label class="field"><span>${esc(t('credits.rep_date'))}</span><input id="dd" type="date" value="${st.init.date}"></label>
      <label class="field"><span>${esc(t('credits.deca_from'))}</span><input id="dh" type="date" value="${st.init.date}"></label>
      <label class="field"><span>${esc(t('credits.deca_to'))}</span><input id="de" type="date" value="${st.init.date}"></label>
      <label class="field"><span>${esc(t('credits.deca_number'))}</span><input id="dn"></label></div>
      <div class="actions"><button class="btn secondary" id="rcl">${esc(t('common.close'))}</button><button class="btn" id="dx">${esc(t('credits.deca_export'))}</button></div>`, (m, close) => {
      const vals = (id) => [...m.querySelector(id).selectedOptions].map(o => +o.value);
      const body = () => ({ kind: m.querySelector('#rk').value, date: m.querySelector('#rd').value, branches: vals('#rb'), categories: vals('#rc') });
      m.querySelector('#rcl').onclick = close;
      const showTable = (rows, errors) => {
        const ks = rows.length ? Object.keys(rows[0]) : [];
        m.querySelector('#rres').innerHTML = `<div class="tablewrap" style="max-height:30vh"><table class="grid"><thead><tr>${ks.map(k => `<th>${esc(k)}</th>`).join('')}</tr></thead><tbody>${rows.map(x => `<tr>${ks.map(k => `<td>${esc(x[k] ?? '')}</td>`).join('')}</tr>`).join('')}</tbody></table></div>${(errors || []).map(e => `<div class="alert error">#${e.id}: ${esc(e.message)}</div>`).join('')}`;
      };
      m.querySelector('#rshow').onclick = async () => { try { const r = await api('/api/credits/reports/coefficient', { method: 'POST', body: body() }); m.querySelector('#rerr').innerHTML = ''; showTable(r.rows, r.errors); } catch (e) { m.querySelector('#rerr').innerHTML = errHtml(e); } };
      m.querySelector('#rresinf').onclick = async () => { const r = await api('/api/credits/reports/extra/reserve_inf', { method: 'POST', body: {} }); showTable(r.rows); };
      m.querySelector('#rplg').onclick = async () => { const r = await api('/api/credits/reports/extra/pledge_guarantor', { method: 'POST', body: {} }); showTable(r.rows); };
      m.querySelector('#rx').onclick = () => download('/api/credits/reports/coefficient.xlsx', body(), 'coefficient.xlsx', m);
      m.querySelector('#dx').onclick = () => download('/api/credits/reports/deca.xml', { rep_date: m.querySelector('#dd').value, hdate: m.querySelector('#dh').value, edate: m.querySelector('#de').value, number: m.querySelector('#dn').value || null }, 'deca.xml', m);
    }, true);
  }

  function page(el) {
    const f = st.init.filter;
    el.innerHTML = `<div class="card"><div class="toolbar" style="gap:8px;flex-wrap:wrap">
      <h2 style="margin:0 12px 0 0">${esc(t('credits.title'))}</h2>
      <button class="btn" id="bnew">＋ ${esc(t('credits.new'))}</button><button class="btn secondary" id="bedit">${esc(t('credits.edit'))}</button>
      <button class="btn secondary" id="blook">${esc(t('credits.look'))}</button><button class="btn secondary" id="bpost">${esc(t('credits.post'))}</button>
      <button class="btn secondary" id="bsch">${esc(t('credits.schedule'))}</button><button class="btn secondary" id="brep">${esc(t('credits.reports'))}</button>
      <button class="btn secondary" id="bref">⟳ ${esc(t('credits.refresh'))}</button></div>
      <div class="toolbar" style="gap:6px;flex-wrap:wrap;margin-top:6px">
        <button class="btn secondary" id="btranche">💸 Tranş</button>
        <button class="btn secondary" id="bpay">💰 Ödəniş</button>
        <button class="btn secondary" id="bops">⏳ Uzatma / V.Keçmiş / Aktiv</button>
        <button class="btn secondary" id="bint">％ Faiz Hesablama</button>
        <button class="btn secondary" id="bcor">🛠 Korrektor</button>
        <button class="btn secondary" id="bstm">📄 Çıxarış</button>
        <button class="btn secondary" id="bdos">🗂 Girov / Zamin / Protokol / Qeyd</button>
        <button class="btn secondary" id="badm">⚙ İdarəetmə & Sazlama</button>
      </div>
      <div class="toolbar" style="gap:8px;flex-wrap:wrap;margin-top:8px">
      <select id="fcur" aria-label="${esc(t('credits.f_CURRENCY'))}"><option value="">${esc(t('credits.f_CURRENCY'))}: *</option>${opt(f.CURRENCY, 'valute', x => x.valu_name, st.filter.CURRENCY, false)}</select>
      <select id="fbr" aria-label="${esc(t('credits.f_BRANCHID'))}"><option value="">${esc(t('credits.f_BRANCHID'))}: *</option>${opt(f.BRANCHID, 'id', x => x.name, st.filter.BRANCHID, false)}</select>
      <select id="fst" aria-label="${esc(t('credits.f_KR_STATUS'))}"><option value="">${esc(t('credits.f_KR_STATUS'))}: *</option>${opt(f.KR_STATUS, 'id', x => x.name, st.filter.KR_STATUS, false)}</select>
      <label><input type="checkbox" id="ftp" ${st.filter.TODAY_PAYMENTS ? 'checked' : ''}> ${esc(t('credits.today_payments'))}</label></div>
      <div id="crGrid" style="margin-top:10px"><div class="spinner"></div></div></div>`;
    const fv = (id, k) => el.querySelector(id).onchange = (e) => { const v = e.target.type === 'checkbox' ? e.target.checked : e.target.value; if (v === '' || v === false) delete st.filter[k]; else st.filter[k] = v === true ? true : +v; refresh(el); };
    fv('#fcur', 'CURRENCY'); fv('#fbr', 'BRANCHID'); fv('#fst', 'KR_STATUS'); fv('#ftp', 'TODAY_PAYMENTS');
    el.querySelector('#bnew').onclick = () => card(el, 'insert');
    el.querySelector('#bedit').onclick = () => st.cur && card(el, 'edit', st.cur);
    el.querySelector('#blook').onclick = () => st.cur && card(el, 'look', st.cur);
    el.querySelector('#bpost').onclick = () => st.cur && card(el, 'post', st.cur);
    el.querySelector('#bsch').onclick = () => schedule(el, st.cur);
    el.querySelector('#brep').onclick = reports;
    el.querySelector('#bref').onclick = () => refresh(el);
    el.querySelector('#btranche').onclick = () => tranchesModal(el, st.cur);
    el.querySelector('#bpay').onclick = () => paymentsModal(el, st.cur);
    el.querySelector('#bops').onclick = () => operationsModal(el, st.cur);
    el.querySelector('#bint').onclick = () => intCalcModal(el);
    el.querySelector('#bcor').onclick = () => correctorModal(el, st.cur);
    el.querySelector('#bstm').onclick = () => statementModal(st.cur);
    el.querySelector('#bdos').onclick = () => dossierModal(el, st.cur);
    el.querySelector('#badm').onclick = () => admSetupModal();
    refresh(el);
  }

  const mountCredits = async (el) => {
    el.innerHTML = '<div class="spinner"></div>';
    try { st.init = await api('/api/credits/init'); } catch (e) { el.innerHTML = `<div class="card">${errHtml(e)}</div>`; return; }
    page(el);
  };
  window.SB.pages['/m/creditsmgr'] = mountCredits;
  window.SB.pages['/m/creditmanager'] = mountCredits;
  window.SB.pages['/m/creditsmanagment'] = mountCredits;
  window.SB.pages['/m/creditmanagerconstructions'] = mountCredits;
})();

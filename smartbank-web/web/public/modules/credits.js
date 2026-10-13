/* Credits manager – port of Delphi Packages/SB_Credit (Sm_creditsmgr TCreditsmgr_sb, CM_Conclusion card, CM_Schedule,
   CM_Filter, CM_coefficient, CM_DECA). All rules run in the API (api/app/credits.py, cr_logic.py). */
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
  const st = { init: null, rows: [], total: 0, cur: null, order: 'ID', desc: false, filter: {}, lk: null };

  async function refresh(el) {
    try {
      const r = await api('/api/credits/list', { method: 'POST', body: { order: st.order, desc: st.desc, filter: st.filter } });
      st.rows = r.rows; st.total = r.total; if (!st.rows.some(x => x.id === st.cur)) st.cur = st.rows.length ? st.rows[0].id : null; render(el);
    } catch (e) { el.querySelector('#crGrid').innerHTML = errHtml(e); }
  }
  function render(el) {
    const cols = st.init.layout.columns.filter(c => c.visible);
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
        <form id="cf" class="formgrid" style="display:grid;grid-template-columns:repeat(3,1fr);gap:8px 14px;max-height:62vh;overflow:auto">${CARD.map(([f, k]) => {
          const v = rec[f]; const lab = `<label class="field"><span>${esc(t('credits.f_' + f))}</span>`;
          if (LK[k]) return lab + `<select name="${f}" ${ro ? 'disabled' : ''}>${opt(st.lk[k], LK[k][0], LK[k][1], v)}</select></label>`;
          return lab + `<input name="${f}" type="${k === 'date' ? 'date' : k === 'num' ? 'number' : 'text'}" step="any" value="${esc(v ?? '')}" ${ro ? 'readonly' : ''}></label>`; }).join('')}</form>
        <div class="actions"><button class="btn secondary" id="cx">${esc(t('password.cancel'))}</button>
        ${mode === 'post' ? `<button class="btn secondary" id="crej">${esc(t('credits.reject'))}</button><button class="btn" id="capp">${esc(t('credits.approve'))}</button>` : ''}
        ${!ro ? `<button class="btn" id="csave">${esc(t('credits.save'))}</button>` : ''}</div>`, (m, close) => {
        m.querySelector('#cx').onclick = close;
        const sv = m.querySelector('#csave');
        if (sv) sv.onclick = async () => {
          const out = { ...rec }; new FormData(m.querySelector('#cf')).forEach((v, k) => { out[k] = v === '' ? null : v; });
          try { const x = await api('/api/credits/card', { method: 'POST', body: { mode, rec: out } }); toast(t('credits.saved', { id: x.id })); close(); st.cur = x.id; refresh(el); }
          catch (e) { m.querySelector('#cerr').innerHTML = errHtml(e); }
        };
        const post = (approve) => async () => { try { await api(`/api/credits/card/${id}/post`, { method: 'POST', body: { approve } }); close(); refresh(el); } catch (e) { m.querySelector('#cerr').innerHTML = errHtml(e); } };
        if (mode === 'post') { m.querySelector('#capp').onclick = post(true); m.querySelector('#crej').onclick = post(false); }
      }, true);
    } catch (e) { toast(errText(e), 'error'); }
  }

  async function schedule(el, id) {
    if (!id) return;
    const load = () => api(`/api/credits/${id}/schedule`);
    let rows = (await load()).rows; let sel = new Set();
    modal(`<h2>${esc(t('credits.schedule'))} #${id}</h2><div id="serr"></div><div id="sbar" class="toolbar" style="gap:8px;flex-wrap:wrap"></div><div id="sg"></div>
      <div class="actions"><button class="btn secondary" id="sdel">${esc(t('credits.sch_delete'))}</button><button class="btn secondary" id="sclose">${esc(t('credits.sch_close'))}</button><button class="btn" id="ssave">${esc(t('credits.sch_save'))}</button></div>`, async (m, close) => {
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
      m.querySelector('#sdel').onclick = async () => { try { await api(`/api/credits/${id}/schedule/delete`, { method: 'POST', body: { rowids: [...sel] } }); sel.clear(); rows = (await load()).rows; draw(); } catch (e) { fail(e); } };
      m.querySelector('#ssave').onclick = async () => { try { await api(`/api/credits/${id}/schedule/save`, { method: 'POST' }); toast(t('credits.sch_saved')); } catch (e) { fail(e); } };
      m.querySelector('#sclose').onclick = async () => { try { await api(`/api/credits/${id}/schedule/close`, { method: 'POST' }); } finally { close(); } };
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
      <div class="actions" style="justify-content:flex-start"><button class="btn secondary" id="rshow">${esc(t('credits.rep_show'))}</button><button class="btn" id="rx">${esc(t('credits.rep_excel'))}</button></div><div id="rres"></div>
      <h3>${esc(t('credits.deca'))}</h3><div style="display:flex;gap:10px;flex-wrap:wrap">
      <label class="field"><span>${esc(t('credits.rep_date'))}</span><input id="dd" type="date" value="${st.init.date}"></label>
      <label class="field"><span>${esc(t('credits.deca_from'))}</span><input id="dh" type="date" value="${st.init.date}"></label>
      <label class="field"><span>${esc(t('credits.deca_to'))}</span><input id="de" type="date" value="${st.init.date}"></label>
      <label class="field"><span>${esc(t('credits.deca_number'))}</span><input id="dn"></label></div>
      <div class="actions"><button class="btn secondary" id="rcl">${esc(t('common.close'))}</button><button class="btn" id="dx">${esc(t('credits.deca_export'))}</button></div>`, (m, close) => {
      const vals = (id) => [...m.querySelector(id).selectedOptions].map(o => +o.value);
      const body = () => ({ kind: m.querySelector('#rk').value, date: m.querySelector('#rd').value, branches: vals('#rb'), categories: vals('#rc') });
      m.querySelector('#rcl').onclick = close;
      m.querySelector('#rshow').onclick = async () => { try { const r = await api('/api/credits/reports/coefficient', { method: 'POST', body: body() }); m.querySelector('#rerr').innerHTML = '';
        const ks = r.rows.length ? Object.keys(r.rows[0]) : [];
        m.querySelector('#rres').innerHTML = `<div class="tablewrap" style="max-height:30vh"><table class="grid"><thead><tr>${ks.map(k => `<th>${esc(k)}</th>`).join('')}</tr></thead><tbody>${r.rows.map(x => `<tr>${ks.map(k => `<td>${esc(x[k] ?? '')}</td>`).join('')}</tr>`).join('')}</tbody></table></div>${(r.errors || []).map(e => `<div class="alert error">#${e.id}: ${esc(e.message)}</div>`).join('')}`;
      } catch (e) { m.querySelector('#rerr').innerHTML = errHtml(e); } };
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
    refresh(el);
  }

  window.SB.pages['/m/creditsmgr'] = async (el) => {
    el.innerHTML = '<div class="spinner"></div>';
    try { st.init = await api('/api/credits/init'); } catch (e) { el.innerHTML = `<div class="card">${errHtml(e)}</div>`; return; }
    page(el);
  };
})();

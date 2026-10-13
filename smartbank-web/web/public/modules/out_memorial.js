/* Off-balance memorial orders – port of Packages/out_memorial (Tmemorial_project, memorialimpl_COPY.pas). OUT_SB_MEMORIAL calls,
   SQL and report rules run in the API (api/app/out_memorial.py). Operator filter and the Locate edits act on the loaded rows,
   like the Delphi dataset Filter / Locate. QuickReport Preview = on-screen report + PDF; Print = PDF download. */
(function () {
  const { api, t, esc, toast, modal } = window.SB;
  const P = '/api/out-memorial', T = (k, p) => t('out_memorial.' + k, p);
  const COLS = ['VAL_ACC', 'DEBITOR', 'CURRENCYID_C', 'KREDITOR', 'AMMOUNT', 'AMMOUNT_C', 'LAMMOUNT'];
  const MONEY = new Set(['AMMOUNT', 'AMMOUNT_C', 'LAMMOUNT', 'MEM_AMOUNT', 'LAMMOUNT_R']);
  const LOC = ['VAL_ACC', 'DEBITOR', 'CURRENCYID_C', 'KREDITOR', 'AMMOUNT', 'AMMOUNT_C'];
  const money = (v) => v === null || v === undefined ? '' : Number(v).toLocaleString(window.I18N.lang, { minimumFractionDigits: 2, maximumFractionDigits: 2 });
  const errT = (e) => t(e.key || 'error.generic', e) + (e.ora ? ' ' + e.ora : '');
  const field = (k, inner) => `<label class="field"><span>${esc(T(k))}</span>${inner}</label>`;
  async function page(el) {
    el.innerHTML = '<div class="spinner"></div>';
    let I; try { I = await api(P + '/init'); } catch (e) { el.innerHTML = `<div class="card"><div class="alert error">${esc(errT(e))}</div></div>`; return; }
    const st = { rows: [], i: 0, sel: new Set(), order: 0, signer: 'run', filter: { debt: true, kred: false, balance: false, plan: 0, bal_list: '' } };
    const opt = (l, all) => `<option value="0">${esc(all)}</option>` + l.map(x => `<option value="${x.index}">${esc(x.name)}</option>`).join('');
    el.innerHTML = `<div class="card"><div class="toolbar"><h2 style="margin:0">${esc(T('title'))}</h2></div>
      <div style="display:grid;grid-template-columns:repeat(auto-fill,minmax(200px,1fr));gap:10px 14px;align-items:end;margin-top:8px">
      ${field('beg', `<input type="date" id="mb" value="${I.date}">`)}${field('end', `<input type="date" id="me" value="${I.date}">`)}
      ${field('currency', `<select id="mr">${I.rates.map(x => `<option value="${x.index}">${esc(x.index === 0 ? T('all_cur') : x.name)}</option>`).join('')}</select>`)}
      ${field('form', `<select id="mf">${[0, 1, 2, 3].map(i => `<option value="${i}">${esc(T('form_' + i))}</option>`).join('')}</select>`)}
      ${field('print_mode', `<select id="mp"><option value="0">${esc(T('preview'))}</option><option value="1">${esc(T('print'))}</option></select>`)}
      ${field('branch', `<select id="mbr">${opt(I.branches, T('all_br'))}</select>`)}
      ${field('trans_mode', `<select id="mt"><option value="0">${esc(T('tm_0'))}</option><option value="1">${esc(T('tm_1'))}</option></select>`)}
      ${field('user', `<select id="mu">${opt(I.users, T('all_users'))}</select>`)}
      <fieldset style="border:1px solid var(--line,#ddd);border-radius:8px;padding:6px 10px"><legend>${esc(T('customers'))}</legend>
        <label><input type="checkbox" id="mc"> ${esc(T('blank'))}</label><br>
        <select id="mbl" disabled><option value="0">${esc(T('blank_0'))}</option><option value="1" selected>${esc(T('blank_1'))}</option></select>
        <label><input type="checkbox" id="mo" checked> ${esc(T('ordercount'))}</label></fieldset>
      <div><label><input type="checkbox" id="md" checked> ${esc(T('ratediff'))}</label><br>
        <label><input type="checkbox" id="mub" checked> ${esc(T('use_balance'))}</label><br>
        <label><input type="checkbox" id="mrep"> ${esc(T('with_report'))}</label></div></div>
      <div class="toolbar" style="gap:8px;flex-wrap:wrap;margin-top:8px">
        <button class="btn" id="m_run">${esc(T('run'))}</button><button class="btn secondary" id="m_rep">${esc(T('report'))}</button>
        <button class="btn secondary" id="m_sel">${esc(T('print_selected'))}</button><button class="btn secondary" id="m_xls">${esc(T('excel'))}</button>
        <button class="btn secondary" id="m_ref">${esc(T('settings'))}</button></div>
      <div style="display:flex;gap:6px;flex-wrap:wrap;margin-top:8px;align-items:end">${LOC.map(c => `<input id="l_${c}" placeholder="${esc(T('c_' + c))}" style="width:130px">`).join('')}
        ${field('order', `<select id="mor">${Array.from({ length: I.orders }, (_, i) => `<option value="${i}">${esc(T('order_' + i))}</option>`).join('')}</select>`)}</div>
      <div id="mg" style="margin-top:8px"></div><div class="muted" id="mname" style="margin-top:4px"></div><div id="mrp" style="margin-top:10px"></div></div>`;
    const v = (id) => el.querySelector('#' + id);
    const visible = () => { const u = +v('mu').value; if (!u) return st.rows; const id = I.users[u - 1].id; return st.rows.filter(r => r.op_id === id); };
    function grid() {
      const rs = visible();
      const body = rs.map((r, i) => `<tr data-i="${i}" class="${i === st.i ? 'sel' : ''}${st.sel.has(r.id) ? ' msel' : ''}">
        <td><input type="checkbox" data-id="${r.id}" ${st.sel.has(r.id) ? 'checked' : ''}></td>${COLS.map(c => `<td style="${MONEY.has(c) ? 'text-align:right' : ''}">${esc(MONEY.has(c) ? money(r[c.toLowerCase()]) : r[c.toLowerCase()] ?? '')}</td>`).join('')}</tr>`).join('');
      v('mg').innerHTML = `<div class="tablewrap" style="max-height:46vh"><table class="grid"><thead><tr><th></th>${COLS.map(c => `<th>${esc(T('c_' + c))}</th>`).join('')}</tr></thead>
        <tbody>${body || `<tr><td colspan="8" class="muted">${esc(T('empty'))}</td></tr>`}</tbody></table></div>`;
      v('mname').textContent = rs[st.i] ? (rs[st.i].name || '') : '';                                // DBEditSetting (NAME)
      v('mg').querySelectorAll('tr[data-i]').forEach(tr => tr.onclick = (ev) => { if (ev.target.type === 'checkbox') return; st.i = +tr.dataset.i; grid(); });
      v('mg').querySelectorAll('input[data-id]').forEach(c => c.onchange = () => { const id = +c.dataset.id; c.checked ? st.sel.add(id) : st.sel.delete(id); });
    }
    const body = () => ({ beg: v('mb').value, end: v('me').value, rate: +v('mr').value, form: +v('mf').value, trans_mode: +v('mt').value,
      diff: v('md').checked, use_balance: v('mub').checked, branch: +v('mbr').value, order: st.order, filter: st.filter });
    const repBody = (ids) => ({ beg: v('mb').value, end: v('me').value, rate: +v('mr').value, form: +v('mf').value, order: st.order, ids: ids || [],
      count: v('mc').checked, blanck: +v('mbl').value, ordercount: v('mo').checked, signer: st.signer, op_id: +v('mu').value ? I.users[+v('mu').value - 1].id : null });
    function showReport(r) {
      const cols = r.cols.map(c => c.toUpperCase());
      const rows = r.rows.map(x => `<tr>${cols.map(c => `<td style="${MONEY.has(c) ? 'text-align:right' : ''}">${esc(MONEY.has(c) ? money(x[c.toLowerCase()]) : x[c.toLowerCase()] ?? '')}</td>`).join('')}</tr>`).join('');
      const tot = Object.keys(r.totals).length ? `<tr class="total">${cols.map((c, i) => `<td style="text-align:right"><b>${c.toLowerCase() in r.totals ? esc(money(r.totals[c.toLowerCase()])) : (i === 0 ? esc(T('total')) : '')}</b></td>`).join('')}</tr>` : '';
      v('mrp').innerHTML = `<div class="rephead"><b>${esc(T('rep_' + r.report))}</b> · ${esc(r.header.filter(Boolean).join(' · '))}</div>
        ${r.bank_ok ? '' : `<div class="alert error">No Actual Parametr"s</div>`}
        <div class="tablewrap" style="max-height:50vh"><table class="grid"><thead><tr>${cols.map(c => `<th>${esc(T('c_' + c))}</th>`).join('')}</tr></thead><tbody>${rows}${tot}</tbody></table></div>
        <div class="muted" style="margin-top:6px">${r.signatures.map(s => esc(s.join(' '))).join(' &nbsp; ')}</div>
        <button class="btn secondary sm" id="m_pdf" style="margin-top:6px">${esc(T('pdf'))}</button>`;
      v('m_pdf').onclick = () => file('report', 'pdf', r._ids);
    }
    async function file(kind, fmt, ids) {
      const cols = kind === 'export' ? COLS : (st.lastRep ? st.lastRep.cols.map(c => c.toUpperCase()) : COLS);
      const labels = { title: T('title'), total: T('total'), group_total: T('total'), sheet: 'Transactions',
        cols: Object.fromEntries(cols.map(c => [c.toLowerCase(), T('c_' + c)])) };
      const res = await fetch(`${P}/${kind}.${fmt}`, { method: 'POST', headers: { 'Content-Type': 'application/json', 'X-CSRF': window.SB.csrf || '' }, credentials: 'same-origin', body: JSON.stringify({ ...repBody(ids), labels }) });
      if (!res.ok) { const j = await res.json().catch(() => ({})); toast(errT(j.detail || {}), 'error'); return; }
      const a = document.createElement('a'); a.href = URL.createObjectURL(await res.blob()); a.download = `out-memorial-${kind}.${fmt}`; a.click();
    }
    async function report(ids) {                                      // InitalizeRpt
      if (+v('mp').value === 1) return file('report', 'pdf', ids);   // ComboBoxPrintMode 1 = Print
      try { const r = await api(P + '/report', { method: 'POST', body: repBody(ids) }); r._ids = ids; st.lastRep = r; showReport(r); } catch (e) { toast(errT(e), 'error'); }
    }
    async function run() {
      try { const r = await api(P + '/run', { method: 'POST', body: body() });
        if (r.rows !== null) { st.rows = r.rows; st.i = 0; st.sel.clear(); grid(); } } catch (e) { toast(errT(e), 'error'); return; }
      if (v('mrep').checked) report();
    }
    function filterDialog() {                                          // unitfilter (ShowModal)
      const f = st.filter;
      modal(`<h3>${esc(T('f_title'))}</h3><label><input type="checkbox" id="fd" ${f.debt ? 'checked' : ''}> ${esc(T('f_debt'))}</label>
        <label style="margin-left:12px"><input type="checkbox" id="fk" ${f.kred ? 'checked' : ''}> ${esc(T('f_kred'))}</label>
        <label class="field"><span>${esc(T('f_acc'))}</span><input id="fl" value="${esc(f.bal_list)}"></label>
        <select id="fp" ${f.balance ? '' : 'disabled'}>${[0, 1, 2, 3].map(i => `<option value="${i}" ${f.plan === i ? 'selected' : ''}>${i + 1} ${esc(T('f_plan'))}</option>`).join('')}</select>
        <label><input type="checkbox" id="fb" ${f.balance ? 'checked' : ''}> ${esc(T('f_balance'))}</label>
        <div class="actions"><button class="btn" id="fok">${esc(T('ok'))}</button><button class="btn secondary" id="fc">${esc(T('cancel'))}</button></div>`, (m, close) => {
        const q = (id) => m.querySelector('#' + id);
        q('fb').onchange = () => { q('fp').disabled = !q('fb').checked; if (q('fb').checked) q('fp').value = '0'; };   // CheckBoxBalanceClick
        q('fc').onclick = close;                                       // mrCancel -> Abort
        q('fok').onclick = () => { st.filter = { debt: q('fd').checked, kred: q('fk').checked, balance: q('fb').checked, plan: +q('fp').value, bal_list: q('fl').value }; close(); run(); };
      });
    }
    async function referDialog() {                                     // formreference (DBNavigator on ReferDataSet)
      let rows = []; try { rows = (await api(P + '/refer')).rows; } catch (e) { toast(errT(e), 'error'); return; }
      modal(`<h3>${esc(T('ref_title'))}</h3><div id="rg"></div><div class="actions"><input id="rn" placeholder="${esc(T('c_BALANCE'))}" style="width:120px">
        <button class="btn sm" id="ra">${esc(T('insert'))}</button><button class="btn secondary" id="rx">${esc(T('close'))}</button></div>`, (m, close) => {
        const draw = () => { m.querySelector('#rg').innerHTML = `<table class="grid"><thead><tr><th>${esc(T('c_BALANCE'))}</th><th></th></tr></thead><tbody>${rows.map(r =>
          `<tr><td><input data-r="${esc(r.rowid)}" value="${esc(r.balance)}" style="width:110px"></td><td><button class="btn sm" data-p="${esc(r.rowid)}">${esc(T('post'))}</button>
           <button class="btn secondary sm" data-d="${esc(r.rowid)}">${esc(T('delete'))}</button></td></tr>`).join('')}</tbody></table>`;
          m.querySelectorAll('[data-p]').forEach(b => b.onclick = () => save(m.querySelector(`input[data-r="${b.dataset.p}"]`).value, b.dataset.p));
          m.querySelectorAll('[data-d]').forEach(b => b.onclick = async () => { if (!confirm(T('confirm_delete'))) return;
            try { rows = (await api(`${P}/refer?rowid=${encodeURIComponent(b.dataset.d)}`, { method: 'DELETE' })).rows; draw(); } catch (e) { toast(errT(e), 'error'); } }); };
        const save = async (val, rid) => { try { rows = (await api(`${P}/refer${rid ? '?rowid=' + encodeURIComponent(rid) : ''}`, { method: 'POST', body: { balance: +val } })).rows; draw(); } catch (e) { toast(errT(e), 'error'); } };
        m.querySelector('#ra').onclick = () => save(m.querySelector('#rn').value);
        m.querySelector('#rx').onclick = close; draw();
      });
    }
    v('mc').onchange = () => { v('mbl').disabled = !v('mc').checked; v('mo').checked = true; };   // CBCountClick
    v('mu').onchange = () => { st.i = 0; grid(); };                                                 // SearchCombo1Change
    v('mor').onchange = async () => { st.order = +v('mor').value;                                   // CmbBoxOrderChange
      try { st.rows = (await api(P + '/open', { method: 'POST', body: { order: st.order } })).rows; st.i = 0; grid(); } catch (e) { toast(errT(e), 'error'); } };
    LOC.forEach(c => { const inp = v('l_' + c), go = () => {                                       // Locate(Name, Text, [loPartialKey])
      const rs = visible(), j = rs.findIndex(r => String(r[c.toLowerCase()] ?? '').startsWith(inp.value));
      if (j < 0) { toast(T('not_found'), 'error'); return; } st.i = j; grid(); };
      inp.oninput = go; inp.onkeydown = (e) => { if (e.key === 'Enter') go(); }; });
    v('m_run').onclick = () => (+v('mf').value === 1 ? filterDialog() : run());
    v('m_rep').onclick = () => { st.signer = 'button'; report(); };                                // BtnReportClick
    v('m_sel').onclick = () => { st.signer = 'selected'; report([...st.sel]); };                   // miPrintSelectedClick
    v('m_xls').onclick = () => file('export', 'xlsx');                                             // miExcelExportClick
    v('m_ref').onclick = referDialog;                                                               // BtnReferClick
    grid();                                                                                         // ActiveFormCreate does not run (commented out .pas:607-610)
  }
  window.SB.pages['/m/out-memorial'] = page;
})();

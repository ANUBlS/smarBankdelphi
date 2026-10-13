/* Cards – port of Packages/Cards_New/cards_azericard (production build) (CARDS.dpr, TMAINFORM). Step 1: the main menu
   (MAINFORMImpl1.dfm toolbar + PopupMenu1 / PopupMenu2) and the card-holder list 'Müştərilər' (customers.pas Tclients,
   api/app/cards.py). Screens not yet ported show a notice; the Delphi right check runs on the server when they are. */
(function () {
  const { api, t, esc, toast } = window.SB;
  const P = '/api/cards', K = (k) => t('cards.' + k);
  const errT = (e) => t(e.key || 'error.generic', e) + (e.ora ? ' ' + e.ora : '');
  // isertbtn.DropdownMenu = PopupMenu1, ToolButton1.DropdownMenu = PopupMenu2 (cards_azericard MAINFORMImpl1.dfm; Dilling1 Visible = False).
  // cards_azericard adds 'Exchange file' (E1) and 'RbsTax' (T1) and captions R1 'RbsDoFile' (Turan: 'RBS DO').
  const MENU1 = ['clients', 'balance', 'payment', 'application', 'newcards', 'verif', 'online', 'k1'];
  const MENU2 = ['cfile', 'dxxx', 'sms', 'intretail', 'rvisa', 'dfile', 'exchange', 'rbsdo', 'rbstax', 'kliring', 'excel', 'cardnumber', 'rez', 'limits', 'poscomm'];
  const DATECOLS = new Set(['DATEOPEN', 'EXPIRY', 'DAT', 'CRDAT']);
  const fmtD = (v) => v ? String(v).slice(0, 10).split('-').reverse().join('.') : '';
  const EDITS = ['CARDNUMBER', 'RBSNUMBER', 'FNAME', 'LNAME', 'CARDHOLDER', 'CREDIT_LIM', 'OLD_ACC_NO'];   // Panel4 (customers.dfm:534-602)
  async function page(el) {
    el.innerHTML = `<div class="card"><div class="toolbar" style="gap:8px;flex-wrap:wrap"><h2 style="margin:0">${esc(K('title'))}</h2>
      ${dd('m1', K('m_proc'), MENU1)}${dd('m2', K('m_oper'), MENU2)}
      <button class="btn secondary" data-ni="sett">${esc(K('m_sett'))}</button><button class="btn secondary" data-ni="rep">${esc(K('m_rep'))}</button></div>
      <div id="cbody"><p class="muted">${esc(K('mi_clients'))} …</p></div></div>`;
    el.querySelectorAll('details.dd [data-mi]').forEach(b => b.onclick = (ev) => { ev.target.closest('details').open = false; item(b.dataset.mi); });
    el.querySelectorAll('[data-ni]').forEach(b => b.onclick = () => toast(K('not_ported')));
    function dd(id, title, items) {
      return `<details class="dd" id="${id}" style="position:relative;display:inline-block"><summary class="btn secondary">${esc(title)} ▾</summary>
        <div class="card" style="position:absolute;z-index:20;min-width:240px;padding:4px">${items.map(i => `<button class="btn ghost sm" style="display:block;width:100%;text-align:left" data-mi="${i}">${esc(K('mi_' + i))}</button>`).join('')}</div></details>`;
    }
    function item(i) {
      if (i === 'clients') return clients(el.querySelector('#cbody'));
      toast(K('not_ported'));
    }
    clients(el.querySelector('#cbody'));                 // the web opens straight on the list (Delphi shows an empty form + logo)
  }

  async function clients(box) {
    const st = { d: null, cur: 0 };
    const call = async (path, body) => { try { return await api(P + path, { method: 'POST', body }); } catch (e) { toast(errT(e), 'error'); return null; } };
    const d = await call('/clients/open');
    if (!d) { box.innerHTML = ''; return; }
    st.d = d;
    document.querySelectorAll('[data-mi=verif]').forEach(b => b.style.display = d.dord === 1 ? '' : 'none');
    const today = new Date(d.today + 'T00:00:00');
    const opt = (a) => `<option value=""></option>` + a.map(x => `<option>${esc(x)}</option>`).join('');
    box.innerHTML = `<h3 style="margin:8px 0">${esc(K('mi_clients'))}</h3>
      <div class="toolbar" style="gap:6px;flex-wrap:wrap">
        <button class="btn" id="c_add">${esc(K('b_add'))}</button><button class="btn" id="c_edit">${esc(K('b_edit'))}</button>
        <button class="btn secondary" id="c_del">${esc(K('b_delete'))}</button><button class="btn secondary" id="c_xls">${esc(K('b_excel'))}</button>
        <button class="btn secondary" id="c_ref">${esc(K('b_refresh'))}</button><button class="btn secondary" id="c_flt">${esc(K('b_filter'))}</button>
        <button class="btn secondary" id="c_srch">${esc(K('b_search'))}</button>
        <span class="muted" style="margin-left:auto"><span style="background:#7fffff;padding:0 6px">&nbsp;</span> ${esc(K('legend_soon'))}
        &nbsp;<span style="background:#ff00ff;padding:0 6px">&nbsp;</span> ${esc(K('legend_exp'))} &nbsp; ${esc(K('count'))}: <b id="c_cnt"></b></span></div>
      <div id="c_p5" class="card" style="display:none;margin:6px 0;padding:8px;gap:10px;flex-wrap:wrap">
        <label><input type="checkbox" data-c="0"> ${esc(K('f_dates'))}</label> <input type="date" id="c_d1" disabled> <input type="date" id="c_d2" disabled>
        <label><input type="checkbox" data-c="1"> ${esc(K('f_filial'))}</label> <select id="c_l1" disabled>${opt(d.lookups.filial)}</select>
        <label><input type="checkbox" data-c="2"> ${esc(K('f_valuta'))}</label> <select id="c_l2" disabled>${opt(d.lookups.valuta)}</select>
        <label><input type="checkbox" data-c="3"> ${esc(K('f_type'))}</label> <select id="c_l3" disabled>${opt(d.lookups.cardtype)}</select>
        <label><input type="checkbox" data-c="4"> ${esc(K('f_status'))}</label> <select id="c_l4" disabled>${opt(d.lookups.cardstatus)}</select>
        <label><input type="checkbox" data-c="5"> ${esc(K('f_company'))}</label> <select id="c_l5" disabled>${opt(d.lookups.company)}</select>
        <button class="btn" id="c_apply">${esc(K('b_apply'))}</button> <code id="c_memo"></code></div>
      <div class="tablewrap" style="max-height:62vh" id="c_grid"></div>
      <div id="c_p4" class="card" style="display:none;margin:6px 0;padding:8px;gap:8px;flex-wrap:wrap">
        ${EDITS.map(f => `<label>${esc(K('c_' + f))}<br><input data-e="${f}" style="width:150px"></label>`).join('')}</div>
      <p class="muted" id="c_ftxt"></p>`;
    const v = (id) => box.querySelector('#' + id);
    const cols = d.cols.filter(c => !d.hidden.includes(c));
    function colour(r) {   // dbGrid2DrawColumnCell :542 - expiry - settings.dateclose < Date -> clAqua, expiry < Date -> clFuchsia
      if (!r.expiry) return (new Date(1899, 11, 30) < today) ? '#ff00ff' : '';
      const e = new Date(String(r.expiry).slice(0, 10) + 'T00:00:00');
      if (e < today) return '#ff00ff';
      if (new Date(e.getTime() - d.dateclose * 86400000) < today) return '#7fffff';
      return '';
    }
    function draw(res) {
      if (res) Object.assign(st.d, res);
      const rows = st.d.rows;
      if (st.cur >= rows.length) st.cur = 0;
      v('c_cnt').textContent = rows.length;
      v('c_ftxt').textContent = st.d.filter ? K('filter_text') + ' ' + st.d.filter : '';
      if (st.d.filter_error) toast(st.d.filter_error, 'error');
      v('c_grid').innerHTML = `<table class="grid acc-grid" id="g_c"><thead><tr>${cols.map(c => `<th data-f="${c}" style="cursor:pointer">${esc(K('c_' + c))}</th>`).join('')}</tr></thead>
        <tbody>${rows.map((r, i) => `<tr data-i="${i}" class="${i === st.cur ? 'sel' : ''}" style="${colour(r) ? 'background:' + colour(r) : ''}">${cols.map(c =>
          `<td>${esc(DATECOLS.has(c) ? fmtD(r[c.toLowerCase()]) : (r[c.toLowerCase()] ?? ''))}</td>`).join('')}</tr>`).join('')
        || `<tr><td colspan="${cols.length}" class="muted">${esc(K('empty'))}</td></tr>`}</tbody></table>`;
      v('c_grid').querySelectorAll('tbody tr[data-i]').forEach(tr => tr.onclick = () => { st.cur = +tr.dataset.i; v('c_grid').querySelectorAll('tr.sel').forEach(x => x.classList.remove('sel')); tr.classList.add('sel'); });
      v('c_grid').querySelectorAll('th[data-f]').forEach(th => th.onclick = async () => { const r = await call('/clients/sort', { field: th.dataset.f }); if (r) draw(r); });
    }
    draw();
    const toggle = (id) => { const p = v(id); p.style.display = p.style.display === 'none' ? 'flex' : 'none'; };
    v('c_flt').onclick = () => toggle('c_p5');           // ToolButton13Click: Panel5.Visible toggle
    v('c_srch').onclick = () => toggle('c_p4');          // ToolButton21Click: Panel4.Visible toggle
    v('c_ref').onclick = async () => { const r = await call('/clients/refresh'); if (r) { box.querySelectorAll('[data-e]').forEach(i => i.value = ''); draw(r); } };
    v('c_add').onclick = v('c_edit').onclick = () => toast(K('not_ported'));
    v('c_xls').onclick = async () => {   // ToolButton7Click :778 -> toexcelExecute :672 (cliexcel) - .xlsx download instead of live Excel
      const res = await fetch(P + '/clients/excel', { method: 'POST', headers: { 'Content-Type': 'application/json', 'X-CSRF': window.SB.csrf || '' }, credentials: 'same-origin', body: '{}' });
      if (!res.ok) { const j = await res.json().catch(() => ({})); toast(errT(j.detail || {}), 'error'); return; }
      const a = document.createElement('a'); a.href = URL.createObjectURL(await res.blob()); a.download = 'CARDS.xlsx'; a.click();
      toast(K('excel_done'));
    };
    v('c_del').onclick = async () => {
      const r = st.d.rows[st.cur]; if (!r) return;
      const ok = confirm(K('confirm_delete'));
      const res = await call('/clients/delete', { id: r.id, confirmed: ok }); if (res) draw(res);
    };
    // CheckBox1..6Click enable their pickers
    const ctl = [['c_d1', 'c_d2'], ['c_l1'], ['c_l2'], ['c_l3'], ['c_l4'], ['c_l5']];
    box.querySelectorAll('#c_p5 [data-c]').forEach(c => c.onchange = () => ctl[+c.dataset.c].forEach(id => v(id).disabled = !c.checked));
    v('c_d1').value = v('c_d2').value = '2011-04-20';     // DateTimePicker Date = 40654 (dfm)
    v('c_apply').onclick = async () => {
      const checks = [...box.querySelectorAll('#c_p5 [data-c]')].map(c => c.checked);
      const r = await call('/clients/filter', { checks, d1: v('c_d1').value, d2: v('c_d2').value, filial: v('c_l1').value, valuta: v('c_l2').value,
        cardtype: v('c_l3').value, cardstatus: v('c_l4').value, company: v('c_l5').value });
      if (r) { v('c_memo').textContent = r.filter; draw(r); }
    };
    // Panel4: OnChange -> Filter; Enter -> SearchRecord(field, text, [srIgnoreCase, srPartialMatch, srFromCurrent, srForward])
    box.querySelectorAll('[data-e]').forEach(inp => {
      inp.oninput = async () => { const r = await call('/clients/edit-filter', { field: inp.dataset.e, text: inp.value }); if (r) draw(r); };
      inp.onkeydown = (ev) => {
        if (ev.key !== 'Enter') return;
        const f = inp.dataset.e.toLowerCase(), q = inp.value.toLowerCase(), rows = st.d.rows;
        const hit = (r) => String(r[f] ?? '').toLowerCase().startsWith(q);   // srPartialMatch = prefix, srFromCurrent includes the current row
        let i = rows.findIndex((r, j) => j >= st.cur && hit(r));
        if (i < 0 && confirm(K('search_wrap'))) { i = rows.findIndex(hit); if (i < 0) alert(K('not_found')); }
        if (i >= 0) { st.cur = i; draw(); v('c_grid').querySelector(`tr[data-i="${i}"]`)?.scrollIntoView({ block: 'nearest' }); }
      };
    });
  }
  window.SB.pages['/m/cards'] = page;
})();

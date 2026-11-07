/* Payments 'Köçürmələr' – port of Packages/Payments (TPaymentsForm, PaymentsImpl1.pas/.dfm + Unit4 TDM).
   Layout as the Delphi form: tabs 'Köçürmələr' / '...' (empty); Panel1 (Yenilə | Filter | Excel Export | Statusları yoxla);
   filtergroup on the left (dates, Filial check + lookup, 'Köçürmə növü' check boxes + all-check, 'Əməliyyat növü'
   group at the bottom), DBGridPayments (status image in the Status column), Panel3 search edits at the bottom.
   ActionFilterExecute is the client-side DataSet.Filter; popup Adoc / Pdf open files on a Windows share (on hold);
   Print (invisible) is a QuickReport (on hold). API in api/app/payments.py. */
(function () {
  const { api, t, esc, toast } = window.SB;
  const P = '/api/payments', T = (k, p) => t('pay.' + k, p);
  const errT = (e) => t(e.key || 'error.generic', e) + (e.ora ? ' ' + e.ora : '');
  const COLS = [['ID', 'id', 64], ['STATUS', 'status', 54], ['TRANS_ID', 'trans_id', 140], ['TR_TYPE', 'tr_type', 64], ['SUSDAT', 'susdat', 90],
    ['GONDEREN_NAME', 'gonderen_name', 150], ['GONDEREN_ACC', 'gonderen_acc', 220], ['GONDEREN_INN', 'gonderen_inn', 100],
    ['AMOUNT', 'amount', 64], ['CURRENCY', 'currency', 40], ['ALAN_NAME', 'alan_name', 150], ['ALAN_ACC', 'alan_acc', 220],
    ['ALAN_INN', 'alan_inn', 100], ['DESCREPTION', 'descreption', 300]];
  // 'Köçürmə növü' check boxes with their Tag (= transaction_type), dfm order top to bottom
  const TYPES = [['CheckBox6', 1, 'bank_internal'], ['CHECKAZIPS', 2, 'azips'], ['CHECKXOKS', 4, 'xohks'], ['CHECKBD', 5, 'xohks_budget'],
    ['CheckBox4', 3, 'conversion'], ['CheckBox5', 7, 'between_accs'], ['CheckBox7', 8, 'salary'], ['CheckBox8', 9, 'foreign']];
  const STATS = [['checkplan', 1, 'st_planned'], ['Checkcommit', 2, 'st_confirmed'], ['Checkdel', 3, 'st_cancelled']];
  // DBGridPaymentsDrawColumnCell: Status 1 -> image 1, 2 -> 0, 4 -> 5, 3 / 9 / 10 -> 2 (ImageList)
  const IMG = { 0: ['✔', '#0a7a2f'], 1: ['⏲', '#b07800'], 2: ['✖', '#c00000'], 5: ['⚑', '#1f4e9c'] };
  const STATUS_IMG = { 1: 1, 2: 0, 4: 5, 3: 2, 9: 2, 10: 2 };
  const fD = (s) => (s ? s.slice(0, 10).split('-').reverse().join('.') : '');
  const fF = (v) => v === null || v === undefined ? '' : String(v).replace('.', ',');   // TFloatField AsString

  async function page(el) {
    el.innerHTML = '<div class="spinner"></div>';
    let I; try { I = await api(P + '/init'); } catch (e) { el.innerHTML = `<div class="card"><div class="alert error">${esc(errT(e))}</div></div>`; return; }
    const S = { all: I.rows, rows: I.rows, i: 0, sort: '1', filial: null, filtered: false, d1: I.tek_dat, d2: I.tek_dat };
    const cb = (id, cap, checked, extra = '') => `<label style="display:block;font-size:12px;white-space:nowrap"><input type="checkbox" id="${id}" ${checked ? 'checked' : ''} ${extra}> ${esc(cap)}</label>`;
    el.innerHTML = `<div class="card payments"><div class="toolbar"><h2 style="margin:0">${esc(T('title'))}</h2></div>
      <div class="tabs" style="margin-top:6px"><button class="tab active">${esc(T('tab'))}</button><button class="tab" disabled>...</button></div>
      <div class="toolbar" style="gap:6px;margin-top:6px;align-items:center">
        <button class="btn secondary" id="pRefresh" style="min-width:69px">${esc(T('refresh'))}</button>
        <button class="btn secondary" id="pFilter" style="min-width:97px">Filter</button>
        <button class="btn secondary" id="pXls" style="min-width:97px;white-space:nowrap">Excel Export</button>
        <button class="btn secondary" id="pCheck" style="min-width:129px;white-space:nowrap">${esc(T('check_status'))}</button></div>
      <div style="display:flex;gap:4px;min-height:560px">
        <fieldset id="pFG" class="cd-g pay-f" style="width:192px;flex:0 0 192px;margin:0;display:flex;flex-direction:column">
          <input type="date" id="pD1" value="${esc(S.d1 || '')}"><input type="date" id="pD2" value="${esc(S.d2 || '')}" style="margin-top:8px">
          <div style="display:flex;justify-content:space-between;margin-top:6px;font-size:12px"><span>Filial</span><input type="checkbox" id="pCB1"></div>
          <select id="pFil" disabled><option value=""></option>${I.filials.map(f => `<option value="${f.id}">${esc(f.name ?? '')}</option>`).join('')}</select>
          <div style="display:flex;justify-content:space-between;margin-top:8px;font-size:12px"><b>${esc(T('pay_kind'))}</b><input type="checkbox" id="pAll" checked></div>
          ${TYPES.map(([id, , k]) => cb('p' + id, T(k), true)).join('')}
          <span style="flex:1"></span>
          <fieldset class="cd-g" style="margin:0"><legend>${esc(T('op_kind'))}</legend>${STATS.map(([id, , k]) => cb('p' + id, T(k), true)).join('')}</fieldset>
        </fieldset>
        <div style="flex:1;display:flex;flex-direction:column;min-width:0;border:1px solid var(--border)">
          <div class="tablewrap" style="flex:1;min-height:420px"><table class="grid" id="pGrid"></table></div>
          <div id="pSearch" style="display:flex;gap:6px;padding:4px;border-top:1px solid var(--border);font-size:12px">
            ${[['id', 'ID', 45], ['GONDEREN_NAME', T('s_sender_name'), 145], ['GONDEREN_ACC', T('s_sender_acc'), 215], ['ALAN_NAME', T('s_receiver_name'), 145],
              ['ALAN_ACC', T('s_receiver_acc'), 215], ['AMOUNT', T('s_amount'), 100]].map(([f, cap, w]) =>
              `<label style="display:flex;flex-direction:column;width:${w}px">${esc(cap)}<input id="search${f}" data-f="${f.toLowerCase()}"></label>`).join('')}</div>
        </div></div></div>`;
    const css = document.createElement('style');
    css.textContent = '.pay-f input[type=date],.pay-f select{box-sizing:border-box;width:100%} #pGrid td{white-space:nowrap;overflow:hidden;text-overflow:ellipsis;max-width:300px}';
    el.querySelector('.payments').appendChild(css);
    const v = (id) => el.querySelector('#' + id);

    function draw() {
      const sel = S.rows[S.i];
      v('pGrid').innerHTML = `<thead><tr><th style="width:12px"></th>${COLS.map(([f, k, w]) => `<th data-f="${f}" style="min-width:${w}px;cursor:pointer">${esc(T('c_' + k))}</th>`).join('')}</tr></thead>
        <tbody>${S.rows.map((r, i) => `<tr data-i="${i}" class="${r === sel ? 'sel' : ''}"><td>${r === sel ? '▶' : ''}</td>${COLS.map(([, k]) => {
          if (k === 'status') { const im = IMG[STATUS_IMG[+r.status]]; return `<td title="${esc(r.status ?? '')}">${im ? `<span style="color:${im[1]}">${im[0]}</span>` : esc(r.status ?? '')}</td>`; }
          const x = r[k]; return `<td>${esc(k === 'susdat' ? fD(x) : k === 'amount' || k === 'id' ? fF(x) : (x ?? ''))}</td>`; }).join('')}</tr>`).join('')}</tbody>`;
      v('pGrid').querySelectorAll('tbody tr').forEach(tr => {
        tr.onclick = () => { S.i = +tr.dataset.i; draw(); };
        tr.ondblclick = () => { S.i = +tr.dataset.i; draw(); doc('pdf'); };                 // DBGridPaymentsDblClick -> P1.Click
        tr.oncontextmenu = (ev) => { S.i = +tr.dataset.i; draw(); SB.contextMenu(ev, [{ label: 'Adoc', onClick: () => doc('adoc') }, { label: 'Pdf', onClick: () => doc('pdf') }]); };
      });
      v('pGrid').querySelectorAll('th[data-f]').forEach(th => { th.onclick = () => { S.sort = th.dataset.f || 'STATUS'; reopen(false); }; });
      const tr = v('pGrid').querySelector('tr.sel'); if (tr) tr.scrollIntoView({ block: 'nearest' });
    }
    // ActionFilterExecute: Filter := OperationStatus AND OperationType (Word(Checked)*Tag -> unchecked gives 0); Filtered := True
    function filterState() {
      return { types: TYPES.map(([id, tag]) => v('p' + id).checked ? tag : 0), statuses: STATS.map(([id, tag]) => v('p' + id).checked ? tag : 0) };
    }
    function applyFilter() {
      const cur = S.rows[S.i];
      if (S.filtered) { const f = filterState(); S.rows = S.all.filter(r => f.statuses.includes(+r.status) && f.types.includes(+r.transaction_type)); }
      else S.rows = S.all;
      const j = S.rows.indexOf(cur); S.i = j >= 0 ? j : 0; draw();
    }
    const actionFilter = () => { S.filtered = true; applyFilter(); };
    const openBody = () => ({ dat1: S.d1, dat2: S.d2, sort: S.sort, filial: S.filial });
    async function reopen(withCheck) {
      try { const j = await api(P + '/open', { method: 'POST', body: openBody() }); S.all = j.rows; S.i = 0; applyFilter(); }
      catch (e) { toast(errT(e), 'error'); return; }
      if (withCheck) await checkStatus();
    }
    async function checkStatus() {                                                         // SpeedButton3Click
      if (!S.rows.length) return;
      try { await api(P + '/check_status', { method: 'POST', body: { trans_ids: S.rows.map(r => r.trans_id ?? null) } }); S.i = S.rows.length - 1; draw(); }
      catch (e) { toast(errT(e), 'error'); }
    }
    async function doc(ext) {                                                              // A1Click / P1Click: ShellExecute on a share
      const r = S.rows[S.i]; if (!r) return;
      try { const j = await api(P + '/doc_path', { method: 'POST', body: { id: Math.trunc(+r.id), ext } }); toast(T('doc_on_hold', { path: j.path }), 'info'); }
      catch (e) { toast(errT(e), 'error'); }
    }
    v('pRefresh').onclick = () => { S.d1 = v('pD1').value; S.d2 = v('pD2').value; S.sort = '1'; reopen(true); };   // BtnRefreshClick
    v('pFilter').onclick = () => {                                                         // SpeedButton1Click
      const fg = v('pFG'), show = fg.style.display === 'none'; fg.style.display = show ? 'flex' : 'none';
      if (show) { v('pD1').value = I.tek_dat; v('pD2').value = I.tek_dat; }
    };
    v('pCheck').onclick = checkStatus;
    v('pXls').onclick = async () => {                                                      // SpeedButton2Click
      const body = { ...openBody(), filter: S.filtered ? filterState() : {} };
      const res = await fetch(P + '/excel', { method: 'POST', headers: { 'Content-Type': 'application/json', 'X-CSRF': window.SB.csrf || '' }, credentials: 'same-origin', body: JSON.stringify(body) });
      if (!res.ok) { const j = await res.json().catch(() => ({})); toast(errT(j.detail || {}), 'error'); return; }
      const a = document.createElement('a'); a.href = URL.createObjectURL(await res.blob()); a.download = 'Transactions.xlsx'; a.click();
    };
    [...TYPES, ...STATS].forEach(([id]) => { v('p' + id).onchange = actionFilter; });
    v('pAll').onchange = () => {                                                           // allcheckClick: sets all eight (each OnClick filters)
      const c = v('pAll').checked; let changed = false;
      TYPES.forEach(([id]) => { if (v('p' + id).checked !== c) { v('p' + id).checked = c; changed = true; } });
      if (changed) actionFilter();
    };
    v('pCB1').onchange = () => {                                                           // CheckBox1Click
      v('pFil').value = ''; v('pFil').disabled = !v('pCB1').checked;                       // KeyValue := 0 (no such ID -> blank)
      if (!v('pCB1').checked) { S.filial = null; v('pRefresh').onclick(); }                // SQL[39] := ''; BtnRefresh.Click
    };
    v('pFil').onchange = () => {                                                           // DBLookupComboBox1CloseUp
      S.filial = v('pFil').value === '' ? 0 : +v('pFil').value; v('pRefresh').onclick();   // KeyValue stays 0 if nothing picked
    };
    // Panel3 search edits: OnChange Locate (partial, case-insensitive), OnExit clear, Enter = SearchRecord forward
    el.querySelectorAll('#pSearch input').forEach(inp => {
      const f = inp.dataset.f, val = (r) => String(r[f] ?? '').toLowerCase();
      inp.oninput = () => { if (inp.value === '') return; const q = inp.value.toLowerCase(); const j = S.rows.findIndex(r => val(r).startsWith(q)); if (j >= 0) S.i = j; draw(); };
      inp.onblur = () => { inp.value = ''; };
      inp.onkeydown = (e) => {
        if (e.key !== 'Enter') return; e.preventDefault();
        const q = inp.value.toLowerCase(); let j = S.rows.findIndex((r, k) => k >= S.i && val(r).startsWith(q));   // srFromCurrent, srForward
        if (j < 0) { if (confirm(T('search_end'))) { j = S.rows.findIndex(r => val(r).startsWith(q)); if (j < 0) alert(T('not_found')); } }
        if (j >= 0) { S.i = j; draw(); }
      };
    });
    draw();
  }
  window.SB.pages['/m/payments'] = page;
})();

/* BB payings – port of Packages/BBPayings (TBBPayingsForm, BBPayingsImpl.pas/.dfm + UnitDataModBBPayings + UnitBBPayingAdd).
   Layout as the Delphi form: ToolBar1 (Əlavə etmək | Redaktə | Ləğv | Təsdiq | Yenilə | Filter paneli | Excel),
   PanelSettings (Visible = False at start: Tarix, Xidmət növü, Təsdiq group), DBGridContracts (multi-select, status image
   in column 1), 'Paying' dialog for add / edit. API in api/app/bbpayings.py. */
(function () {
  const { api, t, esc, toast, modal } = window.SB;
  const P = '/api/bbpayings', T = (k, p) => t('bb.' + k, p);
  const errT = (e) => t(e.key || 'error.generic', e) + (e.ora ? ' ' + e.ora : '');
  const COLS = [['ID', 'id', 'ID'], ['ABN_NAME', 'abn_name', 'c_name'], ['CONTRACT_NUM', 'contract_num', 'CONTRACT_NUM'], ['SYS_DATE', 'sys_date', 'c_sys_date'],
    ['SERVICE', 'service', 'c_service'], ['AMOUNT', 'amount', 'AMOUNT'], ['DONE_TIME', 'done_time', 'c_done_time']];
  const IMG = { 0: ['○', '#b07800'], 1: ['✔', '#0a7a2f'] };     // DrawColumnCell: Status 0 -> image 3, 1 -> image 6
  const fD = (s) => (s ? s.slice(0, 10).split('-').reverse().join('.') : '');
  const fF = (v) => v === null || v === undefined ? '' : String(v).replace('.', ',');

  async function page(el) {
    el.innerHTML = '<div class="spinner"></div>';
    let I; try { I = await api(P + '/init'); } catch (e) { el.innerHTML = `<div class="card"><div class="alert error">${esc(errT(e))}</div></div>`; return; }
    const S = { all: I.rows, rows: I.rows, i: 0, sel: new Set(), st: I.date, end: I.date, filter: null };
    const B = (id, k) => `<button class="btn secondary" id="${id}">${esc(T(k))}</button>`;
    el.innerHTML = `<div class="card bbpayings"><div class="toolbar"><h2 style="margin:0">${esc(T('title'))}</h2></div>
      <div class="toolbar" style="gap:4px;margin-top:6px">${B('bAdd', 'add')}${B('bEdit', 'edit')}${B('bDel', 'del')}${B('bConf', 'confirm')}${B('bRef', 'refresh')}${B('bFP', 'filter_panel')}
        <button class="btn secondary" id="bXls">Excel</button></div>
      <div id="bPanel" style="display:none;gap:8px;margin-top:6px;flex-wrap:wrap">
        <fieldset class="cd-g"><legend>Tarix</legend><input type="date" id="bSt" value="${esc(I.date)}"> <input type="date" id="bEnd" value="${esc(I.date)}"></fieldset>
        <fieldset class="cd-g"><legend>${esc(T('c_service'))}</legend><input type="checkbox" id="bChSrv">
          <select id="bSrv"><option value=""></option>${I.services.map(s => `<option value="${s.id}">${esc(s.name ?? '')}</option>`).join('')}</select></fieldset>
        <fieldset class="cd-g"><legend>${esc(T('confirm'))}</legend><label><input type="checkbox" id="bChC" checked> ${esc(T('confirmed'))}</label>
          <label><input type="checkbox" id="bChN" checked> ${esc(T('not_confirmed'))}</label></fieldset></div>
      <div class="tablewrap" style="margin-top:6px;min-height:460px;border:1px solid var(--border)"><table class="grid" id="bGrid"></table></div></div>`;
    const v = (id) => el.querySelector('#' + id);
    function draw() {
      const cur = S.rows[S.i];
      v('bGrid').innerHTML = `<thead><tr><th style="width:12px"></th>${COLS.map(([f, , c]) => `<th data-f="${f}" style="cursor:pointer">${esc(/^[A-Z_]+$/.test(c) ? c : T(c))}</th>`).join('')}</tr></thead>
        <tbody>${S.rows.map((r, i) => `<tr data-i="${i}" class="${r === cur || S.sel.has(r.id) ? 'sel' : ''}"><td>${r === cur ? '▶' : ''}</td>${COLS.map(([, k], ci) => {
          if (ci === 1 && IMG[r.status]) return `<td><span style="color:${IMG[r.status][1]}">${IMG[r.status][0]}</span></td>`;
          const x = r[k]; return `<td>${esc(k === 'sys_date' || k === 'done_time' ? fD(x) : k === 'amount' || k === 'id' ? fF(x) : (x ?? ''))}</td>`; }).join('')}</tr>`).join('')}</tbody>`;
      v('bGrid').querySelectorAll('tbody tr').forEach(tr => {
        tr.onclick = (ev) => {                                                  // dgMultiSelect: Ctrl toggles, plain click = this row
          const r = S.rows[+tr.dataset.i]; S.i = +tr.dataset.i;
          if (ev.ctrlKey || ev.metaKey) { S.sel.has(r.id) ? S.sel.delete(r.id) : S.sel.add(r.id); } else S.sel = new Set([r.id]);
          draw();
        };
        tr.ondblclick = () => { S.i = +tr.dataset.i; edit(); };                // DBGridContractsDblClick -> BtnEdit.Click
      });
      v('bGrid').querySelectorAll('th[data-f]').forEach(th => { th.onclick = () => reopen(th.dataset.f); });
    }
    // BtnRefreshClick filter: '1=1' [and (srv_id=K)] [and (status=1)|(status=0)]
    function applyFilter() {
      const f = S.filter; S.rows = !f ? S.all : S.all.filter(r => (f.srv_id === null || r.srv_id === f.srv_id) && (f.status === null || r.status === f.status));
      S.i = 0; S.sel = new Set(S.rows[0] ? [S.rows[0].id] : []); draw();
    }
    async function reopen(order) {
      try { const j = await api(P + '/open', { method: 'POST', body: { st: S.st, end: S.end, order: order || null } }); S.all = j.rows; applyFilter(); }
      catch (e) { toast(errT(e), 'error'); }
    }
    v('bRef').onclick = () => {
      if (v('bChSrv').checked && v('bSrv').value === '') { toast(T('err_null_variant'), 'error'); return; }   // string(Null KeyValue)
      S.st = v('bSt').value; S.end = v('bEnd').value;
      const c = v('bChC').checked, n = v('bChN').checked;
      S.filter = { srv_id: v('bChSrv').checked ? +v('bSrv').value : null, status: c && !n ? 1 : !c && n ? 0 : null };
      reopen(null);
    };
    v('bFP').onclick = () => { const p = v('bPanel'); p.style.display = p.style.display === 'none' ? 'flex' : 'none'; };
    v('bXls').onclick = async () => {
      const res = await fetch(P + '/excel', { method: 'POST', headers: { 'Content-Type': 'application/json', 'X-CSRF': window.SB.csrf || '' }, credentials: 'same-origin',
        body: JSON.stringify({ st: S.st, end: S.end, filter: S.filter || {} }) });
      if (!res.ok) { const j = await res.json().catch(() => ({})); toast(errT(j.detail || {}), 'error'); return; }
      const a = document.createElement('a'); a.href = URL.createObjectURL(await res.blob()); a.download = 'Services.xlsx'; a.click();
    };
    // FormBBPayingAdd 'Paying'
    function dialog(init, onOk) {
      modal(`<div class="cap-head"><h3>Paying</h3></div>
        <div style="display:grid;grid-template-columns:120px 220px;gap:6px;align-items:center">
          <span>Tarix</span><input type="date" id="dDT" value="${esc(init.date || '')}">
          <span>${esc(T('contract_no'))}</span><select id="dCon"><option value=""></option>${I.contracts.map(c => `<option value="${c.id}" ${c.id === init.contract_id ? 'selected' : ''}>${esc(c.contract_num ?? '')}</option>`).join('')}</select>
          <span></span><input id="dAbn" readonly>
          <span>${esc(T('c_service'))}</span><select id="dSrv"><option value=""></option>${I.services.map(s => `<option value="${s.id}" ${s.id === init.srv_id ? 'selected' : ''}>${esc(s.name ?? '')}</option>`).join('')}</select>
          <span>${esc(T('amount'))}</span><input id="dAmt" value="${esc(init.amount ?? '')}">
          <span>${esc(T('method'))}</span><select id="dM"><option value="0">${esc(T('m_cash'))}</option><option value="1">${esc(T('m_bank'))}</option></select></div>
        <div class="toolbar" style="justify-content:flex-end;gap:6px;margin-top:10px"><button class="btn" id="dOk">${esc(T('ok'))}</button><button class="btn secondary" id="dCancel">${esc(T('cancel'))}</button></div>`, (m, close) => {
        const q = (id) => m.querySelector('#' + id);
        q('dM').value = String(init.paymethod ?? 0);
        const abn = () => { const c = I.contracts.find(x => String(x.id) === q('dCon').value); q('dAbn').value = c ? (c.name ?? '') : init.abn_name || ''; };
        abn(); q('dCon').onchange = () => { init.abn_name = ''; abn(); };
        q('dCancel').onclick = () => { close(); onOk(null); };
        q('dOk').onclick = () => { const val = { contract_id: q('dCon').value === '' ? null : +q('dCon').value, srv_id: q('dSrv').value === '' ? null : +q('dSrv').value,
          amount: q('dAmt').value, paymethod: +q('dM').value }; close(); onOk(val); };
      });
    }
    v('bAdd').onclick = async () => {                                            // BtnAddClick
      let d; try { d = (await api(P + '/sysdate')).date; } catch (e) { toast(errT(e), 'error'); return; }
      dialog({ date: d, contract_id: null, srv_id: null, amount: '', paymethod: 0, abn_name: '' }, async (val) => {
        if (val) { try { await api(P + '/add', { method: 'POST', body: val }); } catch (e) { toast(errT(e), 'error'); } }
        reopen(null);                                                            // ODS_ABNServices.Refresh (also after Cancel)
      });
    };
    function edit() {                                                            // BtnEditClick
      const r = S.rows[S.i]; if (!r) { toast(T('err_empty'), 'error'); return; }
      dialog({ date: (r.done_time || '').slice(0, 10), contract_id: r.contract_id, srv_id: r.srv_id, amount: fF(r.amount), paymethod: r.paymethod, abn_name: r.abn_name }, async (val) => {
        if (val) { try { await api(P + '/update', { method: 'POST', body: { ...val, id: r.id, done_time: r.done_time } }); } catch (e) { toast(errT(e), 'error'); } }
        reopen(null);
      });
    }
    v('bEdit').onclick = edit;
    v('bDel').onclick = () => {                                                  // BtnDelClick: MessageDlg Yes / No / Cancel
      const r = S.rows[S.i]; if (!r) { toast(T('err_empty'), 'error'); return; }
      modal(`<p>${esc(T('del_q'))}</p><div class="toolbar" style="justify-content:flex-end;gap:6px">
        <button class="btn" data-a="yes">${esc(T('yes'))}</button><button class="btn secondary" data-a="no">${esc(T('no'))}</button><button class="btn secondary" data-a="cancel">${esc(T('cancel'))}</button></div>`, (m, close) => {
        m.querySelectorAll('button[data-a]').forEach(b => { b.onclick = async () => {
          close(); try { await api(P + '/delete', { method: 'POST', body: { id: r.id, answer: b.dataset.a } }); } catch (e) { toast(errT(e), 'error'); }
          reopen(null); }; });
      });
    };
    v('bConf').onclick = async () => {                                           // BtnConfirmClick: selected rows with STATUS = 0
      const ids = S.rows.filter(r => S.sel.has(r.id) && r.status === 0).map(r => r.id);
      try { await api(P + '/confirm', { method: 'POST', body: { ids } }); } catch (e) { toast(errT(e), 'error'); }
      reopen(null);
    };
    draw();
  }
  window.SB.pages['/m/bbpayings'] = page;
})();

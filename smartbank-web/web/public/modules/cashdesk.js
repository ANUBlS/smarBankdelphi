/* Cash desk – port of Packages/CashDeskLast (TFrmCashDesk, CashDeskImpl.pas). Rules and SQL run in the API
   (api/app/cashdesk.py). Layout as the Delphi form: toolbar, filter panel (Panel7) on top, DBGrid1, bottom panel
   (Kassa simvolu / Sürətli axtarış / Sənəd № / Excel, check boxes, ASSIGNMENT). QuickReport prints are on hold. */
(function () {
  const { api, t, esc, toast, modal } = window.SB;
  const P = '/api/cashdesk', T = (k, p) => t('cashdesk.' + k, p);
  const LOC = ['DEBITACC', 'CREDITACC', 'AMMOUNT', 'AMMOUNT_C', 'LAMMOUNT'];          // GroupBox5 edits (Name = field name)
  const NUM = new Set(['rown', 'ID', 'AMMOUNT', 'AMMOUNT_C', 'LAMMOUNT', 'debtostat', 'kredostat']);
  const errT = (e) => t(e.key || 'error.generic', e) + (e.ora ? ' ' + e.ora : '');
  // TFloatField without DisplayFormat: FloatToStr (decimal separator ',')
  const fG = (v) => v === null || v === undefined || v === '' ? '' : String(v).replace('.', ',');
  const cell = (r, c) => c === 'DAT' ? SB.fmtD(r.dat) : (NUM.has(c) ? fG(r[c.toLowerCase()]) : (r[c.toLowerCase()] ?? ''));
  const held = (key) => toast(T('on_hold', { what: T(key) }), 'info');

  async function page(el) {
    el.innerHTML = '<div class="spinner"></div>';
    let I; try { I = await api(P + '/init'); } catch (e) { el.innerHTML = `<div class="card"><div class="alert error">${esc(errT(e))}</div></div>`; return; }
    const st = { rows: [], i: 0, open: false, last: null, flags: { ...I.flags } };
    const opt = (l) => l.map(x => `<option value="${x.index}">${esc(x.name)}</option>`).join('');
    const ops = (l) => l.map(x => `<option value="${esc(x.name)}">${esc(x.name)}</option>`).join('');
    const tb = (id, key, cls = 'secondary', arrow = false) => `<button class="btn ${cls}" id="${id}">${esc(T(key))}${arrow ? ' ▾' : ''}</button>`;
    el.innerHTML = `<div class="card cashdesk"><div class="toolbar"><h2 style="margin:0">${esc(T('title'))}</h2></div>
      <div class="toolbar" style="gap:6px;flex-wrap:wrap;margin-top:6px">
        ${tb('cRefresh', 'refresh', '')}${tb('cBook', 'cashbook')}${tb('cPreview', 'symbol_report')}${tb('cCommon', 'symbol_report', 'secondary', true)}
        ${tb('cIncome', 'income')}${tb('cOutlay', 'outlay')}${tb('cOrder', 'order')}${tb('cCheck', 'check')}${tb('cTotal', 'total', 'secondary', true)}
        ${tb('cExtra', 'extra')}${tb('cSett', 'settings')}</div>
      <div class="cd-filters" style="display:flex;gap:8px;flex-wrap:wrap;align-items:stretch;margin-top:8px">
        <fieldset class="cd-g"><legend>${esc(T('g_dates'))}</legend><input type="date" id="cBeg" value="${I.date}"><br><input type="date" id="cEnd" value="${I.date}"></fieldset>
        <fieldset class="cd-g"><legend>${esc(T('g_currency'))}</legend><select id="cCur">${opt(I.currencies)}</select><br>
          <small>${esc(T('plan'))}</small><br><select id="cRef">${[0, 1, 2, 3].map(i => `<option value="${i}">${esc(T('plan_' + i))}</option>`).join('')}</select></fieldset>
        <fieldset class="cd-g"><legend>${esc(T('g_branch'))}</legend>
          <div><span class="cd-lab">${esc(T('debit'))}</span><select id="cDBr">${opt(I.filials)}</select></div>
          <div style="margin-top:4px"><span class="cd-lab">${esc(T('credit'))}</span><select id="cCBr">${opt(I.filials)}</select></div></fieldset>
        <fieldset class="cd-g"><legend>${esc(T('g_symbol'))}</legend><select id="cSym">${I.cash_symbols.map(s => `<option>${esc(s)}</option>`).join('')}</select><br>
          <small>${esc(T('transtype'))}</small><br>
          <label><input type="radio" name="cTT" value="2"> ${esc(T('tt_2'))}</label><br><label><input type="radio" name="cTT" value="1" checked> ${esc(T('tt_1'))}</label></fieldset>
        <fieldset class="cd-g"><legend>${esc(T('g_order'))}</legend>${[1, 2, 3].map(n => `<label><input type="radio" name="cOrd" value="${n - 1}" ${n === 3 ? 'checked' : ''}> ${n}</label><br>`).join('')}</fieldset>
        <fieldset class="cd-g"><legend>${esc(T('g_operator'))}</legend><small>${esc(T('userinsert'))}</small><br><select id="cOp">${ops(I.operators)}</select><br>
          <small>${esc(T('usercommit'))}</small><br><select id="cCm">${ops(I.committers)}</select></fieldset>
        <span class="muted" style="align-self:flex-start;font-size:11px">23-01-2025</span></div>
      <div id="cErr"></div><div id="cGrid" style="margin-top:8px"></div>
      <div class="cd-bottom" style="display:flex;gap:8px;flex-wrap:wrap;margin-top:8px;align-items:stretch">
        <fieldset class="cd-g cd-cream" style="flex:1"><legend>${esc(T('g_search'))}</legend>
          ${LOC.map(c => `<input id="l_${c}" placeholder="${esc(T('c_' + c))}" style="width:${c === 'LAMMOUNT' ? 200 : 140}px">`).join(' ')}</fieldset>
        <fieldset class="cd-g cd-cream"><legend>${esc(T('g_bsymbol'))}</legend><select id="cBSym"><option value=""></option>${I.bsymbols.map(s => `<option>${esc(s)}</option>`).join('')}</select>
          <button class="btn secondary" id="cBSymGo" title="${esc(T('bsymbol_hint'))}">✓</button></fieldset>
        <fieldset class="cd-g cd-cream"><legend>${esc(T('g_packno'))}</legend><input id="cPack" style="width:70px"> <button class="btn secondary" id="cPackGo">✓</button></fieldset>
        <fieldset class="cd-g cd-cream"><legend>Excel</legend><button class="btn secondary" id="cXls">⇩</button></fieldset></div>
      <div style="display:flex;gap:14px;flex-wrap:wrap;align-items:center;margin-top:6px">
        <label><input type="checkbox" id="cConfirm"> ${esc(T('no_confirm'))}</label>
        <label><input type="checkbox" id="cDoRefresh" checked> ${esc(T('do_refresh'))}</label>
        <input id="cAssign" readonly style="flex:1;min-width:280px" title="${esc(T('assignment'))}"></div></div>`;
    const v = (id) => el.querySelector('#' + id);
    const filt = () => ({ beg: v('cBeg').value, end: v('cEnd').value, currency: +v('cCur').value, cash_symbol: v('cSym').value,
      operator: v('cOp').value, committer: v('cCm').value, debit_branch: +v('cDBr').value, credit_branch: +v('cCBr').value,
      transtype: +el.querySelector('input[name=cTT]:checked').value, balance: +v('cRef').value });
    const cur = () => st.rows[st.i] || null;
    function scrolled() {                                   // ODSTransactionsViewerAfterScroll: EPackNo := NO_PROV; ASSIGNMENT = NAME
      const r = cur(); v('cPack').value = r ? (r.no_prov ?? '') : ''; v('cAssign').value = r ? (r.name ?? '') : '';
    }
    function grid() {
      const cols = I.grid_cols;
      const body = st.rows.map((r, i) => `<tr data-i="${i}" class="${i === st.i ? 'sel' : ''}">${cols.map(c => `<td style="${NUM.has(c) ? 'text-align:right;font-variant-numeric:tabular-nums' : ''}">${esc(cell(r, c))}</td>`).join('')}</tr>`).join('');
      v('cGrid').innerHTML = `<div class="tablewrap" tabindex="0" style="max-height:48vh"><table class="grid"><thead><tr>${cols.map(c => `<th data-c="${c}" style="cursor:pointer">${esc(T('c_' + c))}</th>`).join('')}</tr></thead>
        <tbody>${body || `<tr><td colspan="${cols.length}" class="muted">${esc(st.open ? T('empty') : T('not_loaded'))}</td></tr>`}</tbody></table></div>`;
      v('cGrid').querySelectorAll('tr[data-i]').forEach(tr => {
        tr.onclick = () => { st.i = +tr.dataset.i; grid(); };
        tr.oncontextmenu = (ev) => { st.i = +tr.dataset.i; grid(); popup2(ev); };
      });
      v('cGrid').querySelectorAll('th[data-c]').forEach(th => th.onclick = () => titleClick(th.dataset.c));
      const w = v('cGrid').querySelector('.tablewrap');
      w.onkeydown = (e) => { if (e.key === 'ArrowDown' && st.i < st.rows.length - 1) { st.i++; grid(); v('cGrid').querySelector('.tablewrap').focus(); e.preventDefault(); }
        if (e.key === 'ArrowUp' && st.i > 0) { st.i--; grid(); v('cGrid').querySelector('.tablewrap').focus(); e.preventDefault(); } };
      const s = w.querySelector('tr.sel'); if (s) s.scrollIntoView({ block: 'nearest' });
      scrolled();
    }
    async function load(f, keepId) {
      try {
        const r = await api(P + '/refresh', { method: 'POST', body: f });
        st.rows = r.rows; st.open = true; st.last = f; v('cErr').innerHTML = '';
        const j = keepId != null ? st.rows.findIndex(x => x.id === keepId) : -1;
        st.i = j >= 0 ? j : 0; grid();
      } catch (e) { v('cErr').innerHTML = `<div class="alert error">${esc(errT(e))}</div>`; }
    }
    const refreshAgain = (keepId) => st.last ? load(st.last, keepId) : Promise.resolve();      // ODSTransactionsViewer2.Refresh
    v('cRefresh').onclick = () => load(filt());                                                  // TBRefreshClick
    function titleClick(c) {                                                                     // DBGrid1TitleClick
      if (!st.last) return;
      st.last = { ...st.last, orderby: c }; refreshAgain(cur() ? cur().id : null);
    }
    // Sürətli axtarış: Locate(Name, Text, [loPartialKey]) from the first record; no match keeps the current record
    LOC.forEach(c => v('l_' + c).oninput = () => {
      const s = v('l_' + c).value; if (s === '') return;
      const j = st.rows.findIndex(r => String(NUM.has(c) ? fG(r[c.toLowerCase()]) : (r[c.toLowerCase()] ?? '')).startsWith(s));
      if (j >= 0) { st.i = j; grid(); }
    });
    // SpeedButton1Click: ChooseCashSymbol
    v('cBSymGo').onclick = async () => {
      const sym = v('cBSym').value; if (sym === '') return;
      if (!v('cConfirm').checked && !(await confirmYNC(T('change_q')))) return;
      const id = cur() ? cur().id : 0;
      try { await api(P + '/symbol', { method: 'POST', body: { id, symbol: sym } }); }
      catch (e) { toast(T('wrong_args'), 'error'); return; }
      if (v('cDoRefresh').checked) { await refreshAgain(id); v('cBSym').value = ''; }
    };
    // SpeedButton2Click: UpdatePackNo (table from the radio button at the click)
    v('cPackGo').onclick = async () => {
      const id = cur() ? cur().id : 0;
      try { await api(P + '/packno', { method: 'POST', body: { id, packno: v('cPack').value, transtype: +el.querySelector('input[name=cTT]:checked').value } }); await refreshAgain(id); }
      catch (e) { toast(errT(e), 'error'); }
    };
    // SpeedButton3Click: Excel
    v('cXls').onclick = async () => {
      const res = await fetch(P + '/excel', { method: 'POST', headers: { 'Content-Type': 'application/json', 'X-CSRF': window.SB.csrf || '' }, credentials: 'same-origin', body: JSON.stringify(filt()) });
      if (!res.ok) { const j = await res.json().catch(() => ({})); toast(errT(j.detail || {}), 'error'); return; }
      const a = document.createElement('a'); a.href = URL.createObjectURL(await res.blob()); a.download = 'Cashdesk.xlsx'; a.click();
    };
    // TransCommitClick
    async function transCommit() {
      const r = cur();
      if (r && r.d1 !== null && r.d1 !== undefined) { toast(T('not_checked'), 'error'); return; }
      try { await api(P + '/commit', { method: 'POST', body: { id: r ? r.id : 0, d1: null } }); await refreshAgain(r ? r.id : null); toast(T('committed'), 'ok'); }
      catch (e) { toast(errT(e), 'error'); }
    }
    const popup2 = (ev) => SB.contextMenu(ev, [{ label: T('cashbook'), onClick: () => held('cashbook') }, { label: T('trans_commit'), onClick: transCommit }]);
    // prints on hold
    v('cBook').onclick = () => held('cashbook'); v('cPreview').onclick = () => held('symbol_report');
    v('cCommon').onclick = (ev) => { const b = v('cCommon').getBoundingClientRect(); if (ev.clientX > b.right - 22) popup2(ev); else held('symbol_report_names'); };
    v('cIncome').onclick = () => held('income'); v('cOutlay').onclick = () => held('outlay'); v('cOrder').onclick = () => held('order'); v('cCheck').onclick = () => held('check');
    v('cTotal').onclick = (ev) => SB.contextMenu(ev, [{ label: T('analysis1'), onClick: () => held('analysis1') }, { label: T('analysis2'), onClick: () => held('analysis2') }]);
    v('cExtra').onclick = () => extraForm(cur());
    v('cSett').onclick = () => settingsForm(st);
    grid();
  }

  const wideModal = (m) => { m.classList.add('wide'); m.style.maxHeight = '92vh'; m.style.overflow = 'auto'; };
  function confirmYNC(msg) {                              // MessageDlg(mtConfirmation, mbYesNoCancel) -> True only for Yes
    return new Promise(res => modal(`<h3>${esc(T('confirm'))}</h3><p>${esc(msg)}</p><div class="actions">
      <button class="btn" id="y">${esc(t('common.yes'))}</button><button class="btn secondary" id="n">${esc(t('common.no'))}</button>
      <button class="btn secondary" id="c">${esc(T('cancel'))}</button></div>`, (m, close) => {
      m.querySelector('#y').onclick = () => { close(); res(true); };
      m.querySelector('#n').onclick = () => { close(); res(false); };
      m.querySelector('#c').onclick = () => { close(); res(false); };
    }));
  }

  // ------------------------------------------------------------------ TFrmInfo 'Əlavə' (UntFrmInfo.pas)
  async function extraForm(r) {
    const id = r ? r.id : 0;                              // ODSTransactionsViewer2.FieldByName('ID').AsInteger
    let d; try { d = await api(`${P}/cashinfo/${id}`); } catch (e) { toast(errT(e), 'error'); return; }
    const ci = d.info || {}, empty = !d.info;
    const F = [['issuedby', 'i_issuedby'], ['person_doc', 'i_person_doc'], ['fromwhen', 'i_fromwhen'], ['seria', 'i_seria'], ['docnumber', 'i_docnumber']];
    modal(`<h3>${esc(T('extra_title'))}</h3><div class="muted" style="margin-bottom:6px">${esc(T('extra_head'))}</div>
      <label class="field"><span>${esc(T('i_browse'))}</span><select id="iBrowse"><option value=""></option>${d.browse.map((b, i) => `<option value="${i}">${esc(b.issuedby ?? '')}</option>`).join('')}</select></label>
      ${F.map(([k, l]) => `<label class="field"><span>${esc(T(l))}</span><input id="i_${k}" value="${esc(ci[k] ?? '')}"></label>`).join('')}
      <div id="iErr"></div><div class="actions"><button class="btn" id="iIns" ${empty ? '' : 'disabled'}>${esc(T('i_insert'))}</button>
      <button class="btn secondary" id="iUpd" ${empty ? 'disabled' : ''}>${esc(T('i_update'))}</button>
      <button class="btn secondary" id="iDel" ${empty ? 'disabled' : ''}>${esc(T('i_delete'))}</button>
      <button class="btn secondary" id="iClose">${esc(t('common.close'))}</button></div>`, (m, close) => {
      const q = (s) => m.querySelector(s);
      q('#iBrowse').onchange = () => {                     // DBLookupCashInfoClick
        const b = d.browse[+q('#iBrowse').value]; if (!b) return;
        F.forEach(([k]) => { q('#i_' + k).value = b[k] ?? ''; });
      };
      const act = (action) => async () => {
        const body = { action }; F.forEach(([k]) => { body[k] = q('#i_' + k).value; });
        try { await api(`${P}/cashinfo/${id}`, { method: 'POST', body }); close(); }
        catch (e) { q('#iErr').innerHTML = `<div class="alert error">${esc(errT(e))}</div>`; }
      };
      q('#iIns').onclick = act('insert'); q('#iUpd').onclick = act('update'); q('#iDel').onclick = act('delete'); q('#iClose').onclick = close;
      m.onkeydown = (e) => { if (e.key === 'Escape') close(); };
    });
  }

  // ------------------------------------------------------------------ TFormCashSettings 'Sazlama' (UntCashSettings.pas)
  const IN = [['handover', 's_handover'], ['cashier', 's_cashier'], ['chief', 's_chief'], ['p_operator', 's_operator'], ['controller', 's_controller']];
  const OUT = [['amount', 's_amount'], ['cashier_', 's_cashier'], ['chief_', 's_chief'], ['controller_', 's_controller'], ['operator_', 's_operator'], ['accountant', 's_accountant']];
  async function settingsForm(st) {
    let s; try { s = (await api(P + '/settings')).settings || {}; } catch (e) { toast(errT(e), 'error'); return; }
    const val = (k) => esc(s[k] ?? '');
    const box = (list) => list.map(([k, l]) => `<label style="display:block"><input type="checkbox" data-f="${k}" ${st.flags[k] === '1' ? 'checked' : ''}> ${esc(T(l))}</label>`).join('');
    const fld = (id, key, v) => `<label class="field"><span>${esc(T(key))}</span><input id="${id}" value="${v}"></label>`;
    modal(`<h3>${esc(T('sett_title'))}</h3><div class="grid2">
      <fieldset class="cd-g"><legend>${esc(T('s_cash_bal'))}</legend>${fld('sNat', 's_national_cur', val('cashbalancenational'))}${fld('sFor', 's_foreign_cur', val('cashbalanceenglish'))}</fieldset>
      <fieldset class="cd-g"><legend>${esc(T('s_bank_desc'))}</legend>${fld('sDAz', 's_national', val('description_az'))}${fld('sDEn', 's_foreign', val('description_eng'))}</fieldset>
      <fieldset class="cd-g"><legend>${esc(T('s_journal'))}</legend>${fld('sSig', 's_signature', val('signatyre'))}${fld('sResp', 's_responsible', val('responsible_person'))}</fieldset>
      <fieldset class="cd-g"><legend>${esc(T('cashbook'))}</legend>${fld('sOpT', 's_operator_title', val('operatortitle'))}${fld('sAccT', 's_accountant_title', val('accountanttitle'))}</fieldset></div>
      <div style="display:flex;gap:10px;margin-top:6px"><fieldset class="cd-g" style="flex:1"><legend>${esc(T('s_in_order'))}</legend>${box(IN)}</fieldset>
      <fieldset class="cd-g" style="flex:1"><legend>${esc(T('s_out_order'))}</legend>${box(OUT)}</fieldset></div>
      <div id="sErr"></div><div class="actions"><button class="btn secondary" id="sPhoto">${esc(T('s_photo'))}</button>
      <button class="btn" id="sOk">${esc(T('s_ok'))}</button><button class="btn secondary" id="sCancel">${esc(T('s_cancel'))}</button></div>`, (m, close) => {
      const q = (x) => m.querySelector(x); wideModal(m);
      // Chck..Click: hidden edit := '1' / '0'. The form object lives for the whole module: the state survives Cancel.
      m.querySelectorAll('input[data-f]').forEach(c => c.onchange = () => { st.flags[c.dataset.f] = c.checked ? '1' : '0'; });
      q('#sOk').onclick = async () => {
        const body = { natbalance: q('#sNat').value, forbalance: q('#sFor').value, description_az: q('#sDAz').value, description_eng: q('#sDEn').value,
          signatyre: q('#sSig').value, responsible_person: q('#sResp').value, operator_title: q('#sOpT').value, accountant_title: q('#sAccT').value, ...st.flags };
        try { await api(P + '/settings', { method: 'POST', body }); close(); }
        catch (e) { q('#sErr').innerHTML = `<div class="alert error">${esc(errT(e))}</div>`; }
      };
      q('#sCancel').onclick = close;
      q('#sPhoto').onclick = () => { close(); photoForm(() => settingsForm(st)); };
      m.onkeydown = (e) => { if (e.key === 'Escape') close(); };
    });
  }

  // ------------------------------------------------------------------ TFormPhoto (..\payment_rep\PhotoImpl.pas)
  async function photoForm(back) {
    let s; try { s = (await api(P + '/settings')).settings || {}; } catch (e) { toast(errT(e), 'error'); return; }
    const img = () => s.has_photo ? `<img alt="" src="${P}/settings/photo?ts=${Date.now()}" style="max-width:100%;max-height:300px">` : `<div class="muted">${esc(T('no_photo'))}</div>`;
    modal(`<h3>${esc(T('photo_title'))}</h3><div id="pImg" style="min-height:120px;border:1px solid var(--border);border-radius:8px;padding:6px;margin-bottom:8px">${img()}</div>
      <input type="file" id="pFile" style="display:none"><div id="pErr"></div>
      <div class="actions"><button class="btn" id="pLoad">${esc(T('p_load'))}</button><button class="btn secondary" id="pDel">${esc(T('p_delete'))}</button>
      <button class="btn secondary" id="pClose">${esc(t('common.close'))}</button></div>`, (m, close) => {
      const q = (x) => m.querySelector(x);
      const done = (r) => { s = r.settings || {}; q('#pImg').innerHTML = img(); };
      const fail = (e) => { q('#pErr').innerHTML = `<div class="alert error">${esc(errT(e))}</div>`; };
      const send = async (name, data) => { try { done(await api(P + '/settings/photo', { method: 'POST', body: { name, data } })); } catch (e) { fail(e); } };
      q('#pLoad').onclick = () => { q('#pFile').value = ''; q('#pFile').click(); };
      q('#pFile').addEventListener('cancel', () => send('', ''));            // dialog not executed -> empty picture -> PHOTO cleared
      q('#pFile').onchange = () => {
        const f = q('#pFile').files[0]; if (!f) return send('', '');
        const rd = new FileReader(); rd.onload = () => send(f.name, String(rd.result).split(',')[1] || ''); rd.readAsDataURL(f);
      };
      q('#pDel').onclick = async () => { try { done(await api(P + '/settings/photo/clear', { method: 'POST', body: {} })); } catch (e) { fail(e); } };
      q('#pClose').onclick = () => { close(); back && back(); };
    });
  }

  window.SB.pages['/m/cashdesk'] = page;
})();

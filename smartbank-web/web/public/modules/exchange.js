/* Exchange & Convertation Reports – port of Packages/Exchange (TFrmExchange, UntExchangeImpl.pas). Rules and SQL run in
   the API (api/app/exchange.py). Layout as the Delphi form: PageControl with 'Məlumat' (VDM grid + its accounts),
   'V.D.M' (Panel7: dates, toolbar, file name; ExchangeViewer) and 'Konvertasiya' (Panel8, ConvertationViewer, Təyinat).
   QuickReport prints are on hold. */
(function () {
  const { api, t, esc, toast, modal } = window.SB;
  const P = '/api/exchange', T = (k, p) => t('exchange.' + k, p);
  const errT = (e) => t(e.key || 'error.generic', e) + (e.ora ? ' ' + e.ora : '');
  const held = (key) => toast(T('on_hold', { what: T(key) }), 'info');
  // DisplayFormat '#,####0.0000' / '#,##0.00'; plain TFloatField = FloatToStr (',' decimal separator)
  const fF = (v, d) => { if (v === null || v === undefined || v === '') return ''; const n = Number(v); if (isNaN(n)) return String(v);
    const s = Math.abs(n).toFixed(d).split('.'); return (n < 0 ? '-' : '') + s[0].replace(/\B(?=(\d{3})+(?!\d))/g, ' ') + (d ? ',' + s[1] : ''); };
  const fG = (v) => v === null || v === undefined || v === '' ? '' : String(v).replace('.', ',');
  const EXF = { BUYRATE: 4, MINBUYRATE: 4, MAXBUYRATE: 4, SELLRATE: 4, MINSELLRATE: 4, MAXSELLRATE: 4,
    BUYAMMOUNT: 2, BUYEQUIVALENT: 2, SELLAMMOUNT: 2, SELLEQUIVALENT: 2 };
  const STR = new Set(['CURRENCYNAME', 'INTERCODE', 'DACC_NO', 'KACC_NO', 'FULLPATH', 'DOFFICAL', 'KCURRENCY']);
  const exCell = (r, c) => c === 'DAT' ? SB.fmtD(r.dat) : STR.has(c) ? (r[c.toLowerCase()] ?? '') : (c in EXF ? fF(r[c.toLowerCase()], EXF[c]) : fG(r[c.toLowerCase()]));
  const cvCell = (r, c) => c === 'DAT' ? SB.fmtD(r.dat) : STR.has(c) ? (r[c.toLowerCase()] ?? '') : fG(r[c.toLowerCase()]);

  async function download(path, body, name) {
    const res = await fetch(P + path, { method: 'POST', headers: { 'Content-Type': 'application/json', 'X-CSRF': window.SB.csrf || '' }, credentials: 'same-origin', body: JSON.stringify(body) });
    if (res.status === 204) return false;                                  // CMExcel: nothing when the dataset is empty
    if (!res.ok) { const j = await res.json().catch(() => ({})); throw (j.detail || {}); }
    const a = document.createElement('a'); a.href = URL.createObjectURL(await res.blob()); a.download = name; a.click();
    return true;
  }
  const baseName = (p) => String(p || '').split(/[\\/]/).pop();

  async function page(el) {
    el.innerHTML = '<div class="spinner"></div>';
    let I; try { I = await api(P + '/init'); } catch (e) { el.innerHTML = `<div class="card"><div class="alert error">${esc(errT(e))}</div></div>`; return; }
    const st = { tab: 0, ex: I.exchanges, acc: I.accounts, i1: 0, i2: 0, vdm: [], iv: 0, vLast: null, cv: [], ic: 0, cLast: null,
      exEdit: { exnum: '', name: '' }, accCur: -1, accList: [], convName: I.conv_file };
    const tb = (id, key, cls = 'secondary') => `<button class="btn ${cls}" id="${id}">${esc(T(key))}</button>`;
    el.innerHTML = `<div class="card exchange"><div class="toolbar"><h2 style="margin:0">${esc(T('title'))}</h2></div>
      <div class="tabs" style="margin-top:6px">${['tab_info', 'tab_vdm', 'tab_convert'].map((k, i) => `<button class="${i ? '' : 'on'}" data-tab="${i}">${esc(T(k))}</button>`).join('')}</div>
      <div data-page="0" style="margin-top:8px">
        <div class="toolbar" style="gap:6px">${tb('xNew', 'new')}${tb('xEdit', 'edit')}${tb('xDel', 'delete')}</div>
        <div id="xG1" style="margin-top:6px"></div>
        <div class="toolbar" style="gap:6px;margin-top:8px">${tb('aNew', 'new')}${tb('aEdit', 'edit')}${tb('aDel', 'delete')}</div>
        <div id="xG2" style="margin-top:6px"></div></div>
      <div data-page="1" style="display:none;margin-top:8px">
        <div style="display:flex;gap:8px;flex-wrap:wrap;align-items:stretch">
          <fieldset class="cd-g"><legend>${esc(T('g_date'))}</legend><label>${esc(T('begin'))} <input type="date" id="vBeg" value="${I.date || ''}"></label><br>
            <label>${esc(T('end'))} <input type="date" id="vEnd" value="${I.date || ''}"></label></fieldset>
          <div class="toolbar" style="gap:6px;align-items:center">${tb('vRefresh', 'refresh', '')}${tb('vPrint', 'print')}${tb('vFile', 'file')}${tb('vSett', 'settings')}</div>
          <div style="display:flex;gap:4px;align-items:center"><input id="vPath" readonly value="C:\\${esc(I.exch_file)}" style="width:220px;background:#eee">
            <button class="btn secondary" id="vBrowse" title="${esc(T('save_as'))}">…</button></div></div>
        <div id="vErr"></div><div id="vGrid" style="margin-top:8px"></div></div>
      <div data-page="2" style="display:none;margin-top:8px">
        <div style="display:flex;gap:8px;flex-wrap:wrap;align-items:stretch">
          <fieldset class="cd-g"><legend>${esc(T('g_date'))}</legend><label>${esc(T('begin'))} <input type="date" id="cBeg" value="${I.date || ''}"></label><br>
            <label>${esc(T('end'))} <input type="date" id="cEnd" value="${I.date || ''}"></label></fieldset>
          <div class="toolbar" style="gap:6px;align-items:center;flex-wrap:wrap">${tb('cRefresh', 'refresh', '')}${tb('cBuy', 'buys')}${tb('cSell', 'sells')}${tb('cFile', 'file')}
            <button class="btn secondary" id="cXls">Excel</button><button class="btn secondary" id="cXlsBuy">Excel alislar</button><button class="btn secondary" id="cXlsSell">Excel satislar</button></div>
          <div style="display:flex;gap:4px;align-items:center"><input id="cPath" readonly value="C:\\${esc(I.conv_file)}" style="width:220px;background:#eee">
            <button class="btn secondary" id="cBrowse" title="${esc(T('save_as'))}">…</button></div></div>
        <div id="cErr"></div><div id="cGrid" style="margin-top:8px"></div>
        <div style="display:flex;gap:6px;align-items:center;margin-top:6px"><b>${esc(T('assignment'))}:</b><input id="cAssign" readonly style="flex:1;background:#c0c0c0"></div></div></div>`;
    const v = (id) => el.querySelector('#' + id);
    const showErr = (box, e) => { v(box).innerHTML = e ? `<div class="alert error">${esc(errT(e))}</div>` : ''; };

    // ---------------------------------------------------------------- PageControl
    function setTab(i) {
      st.tab = i;
      el.querySelectorAll('[data-tab]').forEach(b => b.classList.toggle('on', +b.dataset.tab === i));
      el.querySelectorAll('[data-page]').forEach(p => p.style.display = +p.dataset.page === i ? '' : 'none');
    }
    el.querySelectorAll('[data-tab]').forEach(b => b.onclick = () => setTab(+b.dataset.tab));

    // ---------------------------------------------------------------- 'Məlumat'
    const ex = () => st.ex[st.i1] || null;
    const accRows = () => { const e = ex(); return e ? st.acc.filter(a => a.id === e.id) : []; };   // ViewGridAfterScroll: Filter 'ID=..'
    const accCur = () => accRows()[st.i2] || null;
    function grids() {
      const g1 = st.ex.map((r, i) => `<tr data-i="${i}" class="${i === st.i1 ? 'sel' : ''}"><td>${esc(fG(r.exnum))}</td><td>${esc(r.name ?? '')}</td></tr>`).join('');
      v('xG1').innerHTML = `<div class="tablewrap" style="max-height:24vh"><table class="grid acc-grid"><thead><tr><th>${esc(T('c_exnum'))}</th><th style="width:320px">${esc(T('c_exname'))}</th></tr></thead><tbody>${g1}</tbody></table></div>`;
      v('xG1').querySelectorAll('tr[data-i]').forEach(tr => tr.onclick = () => { st.i1 = +tr.dataset.i; st.i2 = 0; grids(); });
      const g2 = accRows().map((r, i) => `<tr data-i="${i}" class="${i === st.i2 ? 'sel' : ''}"><td>${esc(fG(r.exnum))}</td><td>${esc(r.val_name ?? '')}</td><td>${esc(r.acc_no ?? '')}</td></tr>`).join('');
      v('xG2').innerHTML = `<div class="tablewrap" style="max-height:30vh"><table class="grid acc-grid"><thead><tr><th>${esc(T('c_exnum'))}</th><th>${esc(T('c_currency'))}</th><th>${esc(T('c_accno'))}</th></tr></thead><tbody>${g2}</tbody></table></div>`;
      v('xG2').querySelectorAll('tr[data-i]').forEach(tr => tr.onclick = () => { st.i2 = +tr.dataset.i; grids(); });
    }
    const setGrids = (r) => { st.ex = r.exchanges; st.acc = r.accounts; st.i1 = Math.min(st.i1, Math.max(st.ex.length - 1, 0)); st.i2 = Math.min(st.i2, Math.max(accRows().length - 1, 0)); grids(); };
    const access = async (action) => { try { await api(P + '/access', { method: 'POST', body: { action } }); return true; } catch (e) { toast(errT(e), 'error'); return false; } };

    function exDialog(mode) {                                // TFrmAddExchange (FrmExchange.i 1 = Yeni, 2 = Redaktə)
      if (mode === 2) { const e = ex(); st.exEdit = { exnum: e ? fG(e.exnum) : '', name: e ? (e.name ?? '') : '' }; }   // FormShow
      modal(`<h3>VDM</h3><div class="field"><span>${esc(T('c_exnum'))}</span><input id="e1" value="${esc(st.exEdit.exnum)}"></div>
        <div class="field"><span>${esc(T('c_exname'))}</span><input id="e2" value="${esc(st.exEdit.name)}"></div><div id="eErr"></div>
        <div class="actions"><button class="btn secondary" id="eCancel">${esc(T('cancel'))}</button><button class="btn" id="eOk">${esc(T('ok'))}</button></div>`, (m, close) => {
        const keep = () => { st.exEdit = { exnum: m.querySelector('#e1').value, name: m.querySelector('#e2').value }; };
        m.querySelector('#e1').oninput = keep; m.querySelector('#e2').oninput = keep;
        m.querySelector('#eCancel').onclick = () => { close(); st.exEdit = { exnum: '', name: '' }; };     // Button1Click
        m.onkeydown = (ev) => { if (ev.key === 'Escape') close(); };                                     // FormKeyDown: Close only
        m.querySelector('#eOk').onclick = async () => {                                                 // Button2Click
          keep();
          try {
            setGrids(await api(P + '/exchanges/save', { method: 'POST', body: { mode, id: ex() ? ex().id : 0, ...st.exEdit } }));
            st.exEdit = { exnum: '', name: '' }; close();
          } catch (e) { m.querySelector('#eErr').innerHTML = `<div class="alert error">${esc(errT(e))}</div>`; }
        };
      });
    }
    function accDialog(mode) {                               // TFrmAddAccount (3 = Yeni, 4 = Redaktə)
      const curOpts = I.currencies.map(c => `<option value="${c.index}" ${c.index === st.accCur ? 'selected' : ''}>${esc(c.name)}</option>`).join('');
      const accOpts = () => st.accList.map(a => `<option>${esc(a)}</option>`).join('');
      modal(`<h3>${esc(T('account'))}</h3><div class="field"><span>${esc(T('c_currency'))}</span><select id="a1"><option value="-1" ${st.accCur < 0 ? 'selected' : ''} hidden></option>${curOpts}</select></div>
        <div class="field"><span>${esc(T('acc_number'))}</span><select id="a2">${accOpts()}</select></div><div id="aErr"></div>
        <div class="actions"><button class="btn secondary" id="aCancel">${esc(T('cancel'))}</button><button class="btn" id="aOk">${esc(T('ok'))}</button></div>`, (m, close) => {
        m.querySelector('#a1').onchange = async () => {                                                 // ComboBox1Click
          st.accCur = +m.querySelector('#a1').value;
          try { st.accList = (await api(P + '/exaccounts/' + st.accCur)).acc_no; } catch (e) { st.accList = []; m.querySelector('#aErr').innerHTML = `<div class="alert error">${esc(errT(e))}</div>`; }
          m.querySelector('#a2').innerHTML = accOpts();
        };
        m.querySelector('#aCancel').onclick = close;
        m.onkeydown = (ev) => { if (ev.key === 'Escape') close(); };
        m.querySelector('#aOk').onclick = async () => {                                                 // Button2Click
          const a = accCur();
          try {
            setGrids(await api(P + '/exaccounts/save', { method: 'POST', body: { mode, exchange_id: ex() ? ex().id : 0, acc_no: m.querySelector('#a2').value || '', last_account_id: a ? a.accountid : 0 } }));
            close();
          } catch (e) { m.querySelector('#aErr').innerHTML = `<div class="alert error">${esc(errT(e))}</div>`; }
        };
      });
    }
    v('xNew').onclick = async () => { if (await access('Insert')) exDialog(1); };                       // ToolButton6Click
    v('xEdit').onclick = async () => { if (await access('Update')) exDialog(2); };                      // ToolButton10Click
    v('xDel').onclick = async () => {                                                                   // ToolButton8Click
      if (!(await access('Delete'))) return;
      if (!(await yes(T('delete_vdm_q')))) return;
      try { setGrids(await api(P + '/exchanges/delete', { method: 'POST', body: { id: ex() ? ex().id : 0 } })); } catch (e) { toast(errT(e), 'error'); }
    };
    v('aNew').onclick = async () => { if (await access('Insert')) accDialog(3); };                      // ToolButton1Click
    v('aEdit').onclick = async () => { if (await access('Update')) accDialog(4); };                     // ToolButton5Click
    v('aDel').onclick = async () => {                                                                   // ToolButton3Click (no confirmation)
      if (!(await access('Delete'))) return;
      const a = accCur();
      try { setGrids(await api(P + '/exaccounts/delete', { method: 'POST', body: { exchange_id: ex() ? ex().id : 0, account_id: a ? a.accountid : 0 } })); } catch (e) { toast(errT(e), 'error'); }
    };

    // ---------------------------------------------------------------- 'V.D.M'
    const vEmpty = () => !st.vdm.length;                     // ActionPrintUpdate: Enabled := not IsEmpty
    function vGrid() {
      const cols = I.exchange_cols;
      const body = st.vdm.map((r, i) => `<tr data-i="${i}" class="${i === st.iv ? 'sel' : ''}">${cols.map(c => `<td style="${c === 'CURRENCYNAME' ? 'text-align:center;background:#c0c0c0' : c === 'DAT' ? '' : 'text-align:right;font-variant-numeric:tabular-nums'}">${esc(exCell(r, c))}</td>`).join('')}</tr>`).join('');
      v('vGrid').innerHTML = `<div class="tablewrap" tabindex="0" style="max-height:58vh"><table class="grid acc-grid"><thead><tr>${cols.map(c => `<th data-c="${c}" style="cursor:pointer">${esc(T('v_' + c))}</th>`).join('')}</tr></thead>
        <tbody>${body || `<tr><td colspan="${cols.length}" class="muted">${esc(T('empty'))}</td></tr>`}</tbody></table></div>`;
      v('vGrid').querySelectorAll('tr[data-i]').forEach(tr => { tr.onclick = () => { st.iv = +tr.dataset.i; vGrid(); }; tr.oncontextmenu = (ev) => { st.iv = +tr.dataset.i; vGrid(); vPopup(ev); }; });
      v('vGrid').querySelector('.tablewrap').oncontextmenu = (ev) => { if (!ev.target.closest('tr[data-i]')) vPopup(ev); };
      v('vGrid').querySelectorAll('th[data-c]').forEach(th => th.onclick = () => {                     // ExchangeViewerTitleClick
        if (vEmpty() || !st.vLast) return; vLoad({ ...st.vLast, title: th.dataset.c });
      });
      ['vPrint', 'vFile'].forEach(id => v(id).disabled = vEmpty());
      const s = v('vGrid').querySelector('tr.sel'); if (s) s.scrollIntoView({ block: 'nearest' });
    }
    async function vLoad(p) {
      try { st.vdm = (await api(P + '/vdm/refresh', { method: 'POST', body: p })).rows; st.vLast = p; st.iv = 0; showErr('vErr'); vGrid(); }
      catch (e) { showErr('vErr', e); }
    }
    const vRefresh = () => vLoad({ beg: v('vBeg').value, end: v('vEnd').value });                     // ActionRefreshExecute
    const vPrint = () => {                                                                              // ActionPrintExecute -> FrmPrint
      if (vEmpty()) return;
      const pr = { beg: v('vBeg').value, end: v('vEnd').value };
      modal(`<h3>${esc(T('report'))}</h3><fieldset class="cd-g"><legend>${esc(T('print_form'))}</legend>
        <label><input type="radio" name="pRB" value="1" checked> ${esc(T('rb_total'))}</label><br><label><input type="radio" name="pRB" value="2"> ${esc(T('rb_expand'))}</label></fieldset>
        <div class="actions"><button class="btn" id="pPrint">${esc(T('print'))}</button><button class="btn secondary" id="pCancel">${esc(T('cancel'))}</button><button class="btn secondary" id="pXls">Excel</button></div>`, (m, close) => {
        const total = () => m.querySelector('input[name=pRB]:checked').value === '1';
        m.querySelector('#pPrint').onclick = () => held(total() ? 'rep_total' : 'rep_expand');          // BPrintClick Tag 1: QuickReport
        m.querySelector('#pCancel').onclick = close;
        m.querySelector('#pXls').onclick = async () => {                                                // BPrintClick Tag 2: ExcelExporter.Report
          try { if (total()) await download('/vdm/total-excel', pr, 'TotalExchange.xlsx'); else await download('/vdm/excel', st.vLast, 'Exchange.xlsx'); }
          catch (e) { toast(errT(e), 'error'); }
        };
      });
    };
    const vFile = async () => {                                                                         // ActionFileExecute
      if (vEmpty()) return;
      try { await download('/vdm/file', { ...st.vLast, filename: v('vPath').value }, baseName(v('vPath').value) || I.exch_file); toast(T('file_ok_vdm'), 'success'); }
      catch (e) { toast(errT(e), 'error'); }
    };
    const vSett = async () => {                                                                         // ActionSettingsExecute -> TFrmTool
      let rec; try { rec = (await api(P + '/tooling')).row; } catch (e) { toast(errT(e), 'error'); return; }
      modal(`<h3>Exchange Balances</h3><fieldset class="cd-g"><legend>${esc(T('balance_accounts'))}</legend>
        <div class="field"><span>${esc(T('nat_balance'))}</span><input id="t1" value="${esc(rec ? rec.nat_balance ?? '' : '')}"></div>
        <div class="field"><span>${esc(T('for_balance'))}</span><input id="t2" value="${esc(rec ? rec.for_balance ?? '' : '')}"></div></fieldset><div id="tErr"></div>
        <div class="actions dbnav"><button class="btn secondary" id="tDel" title="${esc(T('nav_delete'))}">−</button><button class="btn secondary" id="tEdit" title="${esc(T('nav_edit'))}">▲</button>
          <button class="btn secondary" id="tPost" title="${esc(T('nav_post'))}">✓</button><button class="btn secondary" id="tCancel" title="${esc(T('nav_cancel'))}">✕</button></div>`, (m, close) => {
        let editing = false;
        const q = (id) => m.querySelector('#' + id);
        const state = () => { q('tPost').disabled = !editing; q('tCancel').disabled = !editing; q('tEdit').disabled = editing; q('tDel').disabled = editing || !rec; };
        const fill = () => { q('t1').value = rec ? rec.nat_balance ?? '' : ''; q('t2').value = rec ? rec.for_balance ?? '' : ''; };
        ['t1', 't2'].forEach(id => q(id).oninput = () => { editing = true; state(); });                 // DataSource.AutoEdit
        q('tEdit').onclick = () => { editing = true; state(); };
        q('tCancel').onclick = () => { editing = false; fill(); state(); };
        q('tPost').onclick = async () => {
          try { rec = (await api(P + '/tooling', { method: 'POST', body: { nat_balance: q('t1').value, for_balance: q('t2').value } })).row; editing = false; fill(); state(); q('tErr').innerHTML = ''; }
          catch (e) { q('tErr').innerHTML = `<div class="alert error">${esc(errT(e))}</div>`; }
        };
        q('tDel').onclick = async () => {
          if (!window.confirm(T('delete_record_q'))) return;                                            // DBNavigator ConfirmDelete
          try { rec = (await api(P + '/tooling/delete', { method: 'POST' })).row; fill(); state(); } catch (e) { q('tErr').innerHTML = `<div class="alert error">${esc(errT(e))}</div>`; }
        };
        m.onkeydown = (ev) => { if (ev.key === 'Escape') close(); };
        state();
      });
    };
    const vFirst = () => { if (!vEmpty()) { st.iv = 0; vGrid(); } };
    const vLast = () => { if (!vEmpty()) { st.iv = st.vdm.length - 1; vGrid(); } };
    const vPopup = (ev) => SB.contextMenu(ev, [{ label: T('refresh'), onClick: vRefresh }, '-', { label: T('print'), onClick: vPrint, disabled: vEmpty() },
      { label: T('file'), onClick: vFile, disabled: vEmpty() }, '-', { label: T('settings'), onClick: vSett }, '-',
      { label: T('first'), onClick: vFirst, disabled: vEmpty() }, { label: T('last'), onClick: vLast, disabled: vEmpty() }]);
    v('vRefresh').onclick = vRefresh; v('vPrint').onclick = vPrint; v('vFile').onclick = vFile; v('vSett').onclick = vSett;
    v('vBrowse').onclick = () => saveAs(baseName(v('vPath').value) || I.exch_file, (fn) => v('vPath').value = fn);   // SpeedButton1Click
    // ActionList shortcuts F5 / F4 / F3 / F2 - their OnExecute exits unless the active page is TabSheetExchange
    el.tabIndex = -1;
    const keys = (ev) => {
      if (!document.body.contains(el)) { document.removeEventListener('keydown', keys); return; }
      const f = { F5: vRefresh, F4: vPrint, F3: vFile, F2: vSett }[ev.key];
      if (!f || document.querySelector('.modal')) return;
      ev.preventDefault(); if (st.tab === 1) f();
    };
    document.addEventListener('keydown', keys);

    // ---------------------------------------------------------------- 'Konvertasiya'
    function cGrid() {
      const cols = I.convert_cols;
      const body = st.cv.map((r, i) => `<tr data-i="${i}" class="${i === st.ic ? 'sel' : ''}">${cols.map(c => `<td style="${STR.has(c) || c === 'DAT' ? '' : 'text-align:right;font-variant-numeric:tabular-nums'}">${esc(cvCell(r, c))}</td>`).join('')}</tr>`).join('');
      v('cGrid').innerHTML = `<div class="tablewrap" tabindex="0" style="max-height:52vh"><table class="grid acc-grid"><thead><tr>${cols.map(c => `<th data-c="${c}" style="cursor:pointer">${esc(T('k_' + c))}</th>`).join('')}</tr></thead>
        <tbody>${body || `<tr><td colspan="${cols.length}" class="muted">${esc(T('empty'))}</td></tr>`}</tbody></table></div>`;
      v('cGrid').querySelectorAll('tr[data-i]').forEach(tr => tr.onclick = () => { st.ic = +tr.dataset.i; cGrid(); });
      v('cGrid').querySelectorAll('th[data-c]').forEach(th => th.onclick = () => {                     // ConvertationViewerTitleClick
        if (!st.cv.length || !st.cLast) return; cLoad({ ...st.cLast, title: th.dataset.c });
      });
      const r = st.cv[st.ic]; v('cAssign').value = r ? (r.fullpath ?? '') : '';                         // ODSConvertationAfterScroll
    }
    async function cLoad(p) {
      try { st.cv = (await api(P + '/convert/refresh', { method: 'POST', body: p })).rows; st.cLast = p; st.ic = 0; showErr('cErr'); cGrid(); }
      catch (e) { showErr('cErr', e); }
    }
    v('cRefresh').onclick = () => cLoad({ beg: v('cBeg').value, end: v('cEnd').value });                // ToolButton18Click
    v('cBuy').onclick = () => held('buys');                                                             // ToolButtonBuyClick Tag 1
    v('cSell').onclick = () => held('sells');                                                           // Tag 2
    v('cFile').onclick = async () => {                                                                  // ToolButton24Click
      try { await download('/convert/file', { ...(st.cLast || {}), filename: v('cPath').value }, baseName(v('cPath').value) || I.conv_file); toast(T('file_ok_conv'), 'success'); }
      catch (e) { toast(errT(e), 'error'); }
    };
    v('cXls').onclick = async () => { if (!st.cLast) return; try { await download('/convert/excel', st.cLast, 'List1.xlsx'); } catch (e) { toast(errT(e), 'error'); } };   // ToolButton20Click
    const xs = (status) => async () => { try { await download('/convert/excel-status', { beg: v('cBeg').value, end: v('cEnd').value, status }, `List1_${status}.xlsx`); } catch (e) { toast(errT(e), 'error'); } };
    v('cXlsBuy').onclick = xs('BUY'); v('cXlsSell').onclick = xs('SELL');                              // ToolButton26Click / ToolButton30Click
    v('cEnd').onchange = async () => {                                                                  // DTPCEndDateChange -> SaveConvert.FileName
      const d = +String(v('cEnd').value).slice(8, 10); if (!d) return;
      try { st.convName = (await api(P + '/convert/filename/' + d)).filename; } catch (e) { toast(errT(e), 'error'); }
    };
    v('cBrowse').onclick = () => saveAs(st.convName, (fn) => v('cPath').value = fn);                    // SpeedButton2Click

    grids(); vGrid(); cGrid();
  }
  function saveAs(def, done) {                               // TSaveDialog (Filter '*.dbf|*.dbf'): Execute -> Edit.Text := FileName
    modal(`<h3>${esc(T('save_as'))}</h3><div class="field"><span>${esc(T('file_name'))}</span><input id="fn" value="${esc(def)}"></div>
      <div class="actions"><button class="btn" id="fOk">${esc(T('ok'))}</button><button class="btn secondary" id="fCancel">${esc(T('cancel'))}</button></div>`, (m, close) => {
      m.querySelector('#fOk').onclick = () => { const f = m.querySelector('#fn').value.trim(); close(); if (f) done(f); };
      m.querySelector('#fCancel').onclick = close;
    });
  }
  function yes(msg) {                                        // MessageDlg(mtConfirmation, mbYesNoCancel) = mrYes
    return new Promise(res => modal(`<h3>${esc(T('confirm'))}</h3><p>${esc(msg)}</p><div class="actions">
      <button class="btn" id="y">${esc(t('common.yes'))}</button><button class="btn secondary" id="n">${esc(t('common.no'))}</button>
      <button class="btn secondary" id="c">${esc(T('cancel'))}</button></div>`, (m, close) => {
      m.querySelector('#y').onclick = () => { close(); res(true); };
      m.querySelector('#n').onclick = () => { close(); res(false); };
      m.querySelector('#c').onclick = () => { close(); res(false); };
    }));
  }
  window.SB.pages['/m/exchange'] = page;
})();

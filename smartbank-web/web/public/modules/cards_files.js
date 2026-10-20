/* Cards ▸ Əməliyyat file operations (cards_azericard PopupMenu2), api/app/cards_cfile.py ...
   C File (cfilepas.pas Tcfile): ToolButton3 'Yenilə' (RichEdit preview of the uploaded C file), isertbtn 'Bazaya Göndər',
   ToolButton1 'Təsdiq Et' (Yes / No / Cancel / Yes to all per selected row), ToolButton7 'Excel', ToolButton2 'XML Göndər'.
   Incoming files are uploaded by hand, one at a time (the only file of C:\AZCARD\IN). */
(function () {
  const { api, t, esc, toast, modal } = window.SB;
  const K = (k) => t('cards.' + k);
  const errT = (e) => t(e.key || 'error.generic', e) + (e.ora ? ' ' + e.ora : '');
  const COLS = ['CARDNUMBER', 'RBSNUMBER', 'FEEAMOUNT', 'TRANDATE', 'TRANTIME', 'CURRENCY', 'BALAN_SIGN', 'FEE_CUR', 'TRANAMOUNT', 'FILE_NAME', 'TRAN_NUM',
    'REG_NUM', 'TRAN_TYPE', 'CONTRACT_T', 'ORG_NUM', 'CONT_EN12', 'ORG_CON', 'TRAN_DIR', 'TRAN_CUR', 'SETT_CUR', 'ACC_CUR', 'SETT_AM', 'ACC_AMOUNT', 'FEE_DIR',
    'ACC_TYPE', 'EXPRY_DATE', 'MERCH_ID', 'TRANCOUTRY', 'TRAN_CITY', 'TRAN_DETAL', 'VALUE_DATE', 'SETT_DATE', 'MERCH_CODE', 'REC_CUR', 'REC_AMOUNT', 'CONT_EN13',
    'SEND', 'COUNTRY', 'ROWNUMS', 'RESERVED1', 'RESERVED2', 'RESERVED3', 'RESERVED4', 'REGISTR_NUMBER', 'AVTORIZASION_NUMBER', 'AVTORIZASION_AMOUNT',
    'CONTRA_ENTRY', 'REFERENCE_NUMBER', 'ISUED_REFERENCE_NUMBER', 'RETRIVAL_REFERENC_NUMBER', 'TRANSACTION_CONDITION', 'CUSTOM_FEE_DIRECTION',
    'CUSTOM_FEE_AMOUNT', 'GLDATE', 'DEVICE_FINANCIAL_NUMBER', 'RSERVED_5_1', 'RSERVED_5_2', 'RSERVED_5_3', 'RSERVED_5_4', 'ID'];   // cfilepas.dfm DBGrid1 / DBGrid2
  const ICON = { 1: 25, 2: 3, 3: 26, 4: 13 };                           // DBGrid1DrawColumnCell :698 (STATUS -> ImageList1 index)
  const fmt = (c, v) => v == null ? '' : (c === 'TRANDATE' ? String(v).slice(0, 10).split('-').reverse().join('.') : String(v));
  const COLOR = { clRed: '#c00000', clBlue: '#0000c0' };
  function rich(lines) {                                              // CTInboxRich with the SelAttributes.Color ranges
    return lines.map(l => { let h = '', p = 0; const ms = [...l.marks].sort((a, b) => a[0] - b[0]);
      for (const [s, n, c] of ms) { if (s < p) continue; h += esc(l.text.slice(p, s)) + `<span style="color:${COLOR[c] || 'inherit'}">${esc(l.text.slice(s, s + n))}</span>`; p = s + n; }
      return h + esc(l.text.slice(p)); }).join('\n');
  }
  const ask = (text, buttons) => new Promise(res => modal(`<p style="white-space:pre-wrap">${esc(text)}</p><div class="actions">${buttons.map(([v, l]) => `<button class="btn ${v === buttons[0][0] ? '' : 'secondary'}" data-a="${v}">${esc(l)}</button>`).join('')}</div>`,
    (m, close) => m.querySelectorAll('[data-a]').forEach(b => b.onclick = () => { close(); res(b.dataset.a); })));
  const say = (msgs) => (msgs || []).forEach(x => toast(x));


  // ------------------------------------------------------------------ shared helpers of the file-operation screens
  const caller = (P) => async (path, body) => { try { return await api(P + path, { method: 'POST', body: body || {} }); } catch (e) { toast(errT(e), 'error'); return null; } };
  const readB64 = (f) => new Promise(res => { const r = new FileReader(); r.onload = () => res(String(r.result).split(',')[1] || ''); r.readAsDataURL(f); });
  function saveFiles(files) {                                          // generated files download in the browser
    (files || []).forEach(f => { const bin = atob(f.b64), u = new Uint8Array(bin.length); for (let i = 0; i < bin.length; i++) u[i] = bin.charCodeAt(i);
      const a = document.createElement('a'); a.href = URL.createObjectURL(new Blob([u])); a.download = f.name; a.click(); });
  }
  async function download(url, name, body) {
    const res = await fetch(url, { method: 'POST', headers: { 'Content-Type': 'application/json' }, credentials: 'same-origin', body: JSON.stringify(body || {}) });
    if (!res.ok) { const j = await res.json().catch(() => ({})); return toast(errT(j.detail || {}), 'error'); }
    const a = document.createElement('a'); a.href = URL.createObjectURL(await res.blob()); a.download = name; a.click();
  }
  // rows: dicts with lower-case keys; cols: [FIELD | [FIELD, title] | null (no FieldName column)]; opts.icon(r) for the null column
  function gridHtml(id, cols, rows, opts = {}) {
    const sel = opts.sel || new Set(), key = opts.key || 'id';
    const C = cols.map(c => c == null ? [null, ''] : Array.isArray(c) ? c : [c, c]);
    const cell = (r, f) => { const v = r[f.toLowerCase()]; return v == null ? '' : (opts.fmt ? opts.fmt(f, v) : /^\d{4}-\d\d-\d\d/.test(String(v)) ? String(v).slice(0, 10).split('-').reverse().join('.') : String(v)); };
    if (rows == null) rows = [];
    return `<div class="tablewrap" style="max-height:${opts.h || '32vh'}"><table class="grid" id="${id}" tabindex="0"><thead><tr>${C.map(([f, t]) => `<th data-f="${esc(f || '')}" style="${f && opts.sortable ? 'cursor:pointer' : ''}">${esc(t)}</th>`).join('')}</tr></thead><tbody>
      ${rows.map((r, i) => `<tr data-id="${esc(r[key] ?? i)}" data-i="${i}" class="${sel.has(r[key]) ? 'sel' : ''}">${C.map(([f], ix) => f == null ? `<td>${opts.icon ? opts.icon(r) : ''}</td>` : (opts.iconAt === ix && ICON[r.status] != null) ? `<td>${icon(r.status)}</td>` : `<td>${esc(cell(r, f))}</td>`).join('')}</tr>`).join('') || `<tr><td colspan="${C.length}" class="muted">${esc(K('empty'))}</td></tr>`}</tbody></table></div>`;
  }
  const icon = (st) => ICON[st] != null ? `<img src="/img/cards/app_status_${ICON[st]}.png" alt="">` : '';
  // multi-select wiring (dgMultiSelect): click = one row, Ctrl/Shift-click toggles; right-click -> SELECT ALL popup
  function wireSel(tbl, rows, sel, setCur, redraw, opts = {}) {
    if (!tbl) return;
    const key = opts.key || 'id';
    tbl.querySelectorAll('tbody tr[data-id]').forEach(tr => tr.onclick = (e) => { const r = rows[+tr.dataset.i]; if (!r) return; const id = r[key]; setCur(id);
      if (opts.single) { sel.clear(); sel.add(id); } else if (e.ctrlKey || e.metaKey || e.shiftKey) { sel.has(id) ? sel.delete(id) : sel.add(id); } else { sel.clear(); sel.add(id); } redraw(); });
    if (opts.popup !== false) tbl.oncontextmenu = (e) => { e.preventDefault(); document.querySelectorAll('.cf_pop').forEach(x => x.remove());
      const pm = document.createElement('div'); pm.className = 'cf_pop'; pm.style.cssText = `position:fixed;left:${e.clientX}px;top:${e.clientY}px;z-index:1200;background:#fff;border:1px solid #888`;
      pm.innerHTML = (opts.items || [['all', opts.allCaption || 'SELECT ALL']]).map(([k, l]) => `<button class="btn secondary" style="display:block;width:100%" data-k="${k}">${esc(l)}</button>`).join(''); document.body.appendChild(pm);
      const off = () => { pm.remove(); document.removeEventListener('click', off); }; setTimeout(() => document.addEventListener('click', off), 0);
      pm.querySelectorAll('[data-k]').forEach(b => b.onclick = () => { off(); if (b.dataset.k === 'all') { rows.forEach(r => sel.add(r[key])); redraw(); } else opts.onItem && opts.onItem(b.dataset.k); }); };
  }
  // Yes / No / Cancel / Yes to all per selected row (the Delphi confirm loops), returns the answers list
  async function askLoop(n, text, allText) {
    const answers = [];
    for (let i = 0; i < n; i++) {
      let a = await ask(text, [['yes', K('yes')], ['no', K('no')], ['cancel', K('cancel')], ['all', K('yes_all')]]);
      if (a === 'all') { const b = await ask(allText.replace('%d', n - i), [['yes', K('yes')], ['cancel', K('cancel')]]); a = b === 'yes' ? 'all' : 'all_no'; }
      answers.push(a); if (a === 'cancel' || a === 'all') break;
    }
    return answers;
  }
  const H = { caller, readB64, saveFiles, download, gridHtml, icon, wireSel, askLoop, ask, say, errT, K };

  // TAdditional_cfile (cfile_addi.pas): Yenile :426, Bazaya Göndər :233 (= Button1Click :76, the uploaded XML), Təsdiq Et :338,
  // DBGrid1TitleClick :168 (ORDER BY lines accumulate), DBGrid1KeyPress :163 (any key = Select All), Ctrl+A / PopupMenu1 'Select All'.
  async function caddi(box, back) {
    const call = caller('/api/cards/caddi');
    let d = await call('/open'); if (!d) return;
    const sel = new Set(); let cur = null;
    const C1 = ['ID', null, 'AMMOUNT', 'ACCNO', 'CURRENCYNAME', 'DOCID'], C2 = [...C1, 'TRANID'];
    function draw() {
      box.innerHTML = `<h3 style="margin:8px 0">${esc(K('cf_xml'))}</h3>
        <div class="toolbar" style="gap:6px;flex-wrap:wrap">
          <button class="btn secondary" id="ca_back">← ${esc(K('close'))}</button>
          <label class="btn secondary" style="cursor:pointer">${esc(K('cf_upload'))} (XML)<input type="file" id="ca_f" accept=".xml,text/xml" style="display:none"></label>
          <span class="muted" id="ca_fn">${d.file ? esc(d.file.name + ' (' + d.file.size + ' B)') : esc(K('cf_nofile'))}</span>
          <button class="btn" id="ca_r">${esc(K('cf_refresh'))}</button><button class="btn" id="ca_b">${esc(K('cf_tobase'))}</button>
          <button class="btn" id="ca_c">${esc(K('cf_confirm'))}</button></div>
        ${gridHtml('ca_g1', C1, d.grid1, { sel, sortable: true, icon: r => icon(r.status) })}
        <h4 style="margin:8px 0 4px">${esc(K('cf_posted'))}</h4>${gridHtml('ca_g2', C2, d.grid2, { icon: r => icon(r.status) })}`;
      const q = (id) => box.querySelector('#' + id);
      q('ca_back').onclick = back;
      q('ca_f').onchange = async () => { const f = q('ca_f').files[0]; if (!f) return; const r = await call('/upload', { name: f.name, b64: await readB64(f) }); if (r) { d = r; draw(); } };
      q('ca_r').onclick = async () => { const r = await call('/refresh'); if (r) { d = r; draw(); } };
      q('ca_b').onclick = async () => { const r = await call('/load'); if (r) { d = r; sel.clear(); draw(); if (r.error) toast(r.error, 'error'); } };
      q('ca_c').onclick = async () => {
        const order = (d.grid1 || []).map(r => r.id); let ids = order.filter(i => sel.has(i)); if (!ids.length && cur != null) ids = [cur];
        const answers = await askLoop(ids.length, K('cf_ask'), K('cf_ask_all'));
        const r = await call('/confirm', { ids, current: cur, answers }); if (r) { d = r; sel.clear(); draw(); say(r.messages); if (r.error) toast(r.error, 'error'); } };
      const g1 = q('ca_g1');
      g1.querySelectorAll('th[data-f]').forEach(th => th.onclick = async () => { if (!th.dataset.f) return; const r = await call('/sort', { field: th.dataset.f }); if (r) { d = r; draw(); if (r.error) toast(r.error, 'error'); } });
      wireSel(g1, d.grid1 || [], sel, (id) => { cur = id; }, draw, { allCaption: 'Select All' });
      g1.onkeydown = (e) => { if (e.key.length === 1 || (e.ctrlKey && e.key.toLowerCase() === 'a')) { e.preventDefault(); (d.grid1 || []).forEach(r => sel.add(r.id)); draw(); } };   // DBGrid1KeyPress -> S1.Click
    }
    draw();
  }

  // Forms run by api/app/cards_fileops.py (same toolbar as Tcfile). Columns = the .dfm DBGrid Columns (null = the status icon column).
  const FO = {
    dxxx: { title: 'Dxxx Files', grid1: ['ID', null, 'INSTITUTION', 'BANK_KODE', 'CURRENCY', 'TRANDATE', 'MERCHANT', 'AMOUNT', 'FEE', 'TERMINAL', 'TR_TYPE', 'TYPES', 'MERCH_NAME', 'AUTH_CODE', 'FILENAME', 'INFO'],
      grid2: ['ID', null, 'INSTITUTION', 'CURRENCY', 'TRANDATE', 'MERCHANT', 'AMOUNT', 'FEE', 'TERMINAL', 'TR_TYPE', 'TYPES', 'FILENAME', 'INFO'], confirm: true, excel: true, sort: [] },
    sms: { title: 'SMS', grid1: ['ID', null, 'TERMINALNAME', 'CARDNUMBER', 'TERMINAL', 'AUTH_CODE', 'AMOUNT_TR', 'TRANDATE', 'CURRENCY', 'POST_DATE', 'AMOUNTSET', 'INFO'],
      grid2: ['ID', null, 'TERMINALNAME', 'CARDNUMBER', 'TERMINAL', 'AUTH_CODE', 'AMOUNT_TR', 'TRANDATE', 'CURRENCY', 'POST_DATE', 'AMOUNTSET'], confirm: true, excel: true, sort: ['grid1', 'grid2'] },
    intretail: { title: 'Int.Retail', grid1: ['ID', null, 'CHANELL', 'TR_TYPE', 'OUTWORDSTATUS', 'TR_CURRENCY', 'ACC_CURRENCY', 'MERCHANT', 'CARDNUMBER', 'TR_DATE', 'AUTH', 'TR_AMOUNT', 'ACC_AMOUNT', 'FEE', 'CLEAR_AMOUNT', 'TERMINAL', 'INFO'],
      grid2: ['ID', null, 'CHANELL', 'TR_TYPE', 'OUTWORDSTATUS', 'TR_CURRENCY', 'ACC_CURRENCY', 'MERCHANT', 'CARDNUMBER', 'TR_DATE', 'AUTH', 'TR_AMOUNT', 'ACC_AMOUNT', 'FEE', 'CLEAR_AMOUNT', 'TERMINAL'], confirm: true, excel: true, sort: ['grid1', 'grid2'] },
    rvisa: { title: 'R.Visa', grid1: ['REPORTING_FOR', 'REPORTING_CODE', 'REPORTING_DATE', 'ROLLUP_TO', 'ROLLUP_TO_CODE', 'PROC_DATE', 'FUNDS_XFER_ENTITY', 'FUNDS_XFER_CODE', 'SETTLEMENT_CURRENCY',
      'INTERCHANGE_TOTAL_AMMOUNT', 'INTERCHANGE_ISDEBET', 'REIMBURSEMENT_FEES_AMOUNT', 'REIMBURSEMENT_FEES_ISDEBET', 'VISA_CHARGES_AMMOUNT', 'VISA_CHARGES_ISDEBET', 'SETTLEMENT_AMOUNT', 'SETTLEMENT_AMOUNT_ISDEBET'],
      confirm: false, excel: true, sort: ['grid1'], noSel: true },
    dfile: { title: 'D File', grid1: [null, 'BANKNAME', 'LOROACCOUNT', 'PAYMENTORDERAMMOUNT', 'PAYMENTDIRECTION', 'SOURCECONTRACT', 'TRANSACTIONDATE', 'TRANSACTIONTIME', 'FILENAME', 'INFO'],
      grid2: [null, 'BANKNAME', 'LOROACCOUNT', 'PAYMENTORDERAMMOUNT', 'PAYMENTDIRECTION', 'SOURCECONTRACT', 'TRANSACTIONDATE', 'TRANSACTIONTIME', 'FILENAME'], confirm: 'single', excel: true, sort: ['grid1', 'grid2'] },
    exchange: { title: 'Exchange file', grid1: ['CONTRACT_NUMBER', 'STATUS', 'DEVICE_NO', 'DEVICE_NAME', 'TRANS_DATE', 'DAT', 'TRANS_AMNT', 'TRANS_CURR', 'RATE', 'RECVD_AMNT', 'RECVD_CURR', 'ROUND_AMNT', 'ROUND_CURR', 'RRN'],
      grid2: ['CONTRACT_NUMBER', 'STATUS', 'DEVICE_NO', 'DEVICE_NAME', 'TRANS_DATE', 'DAT', 'TRANS_AMNT', 'TRANS_CURR', 'RATE', 'RECVD_AMNT', 'RECVD_CURR', 'ROUND_AMNT', 'ROUND_CURR', 'RRN'],
      confirm: true, excel: true, sort: [], iconAt: 1 },                                       // DrawColumnCell DataCol 1 = the STATUS column
    rbsdo: { title: 'RbsDoFile', grid1: ['ID', 'CARDNUMBER', 'TRANTIME', 'TRAN_AMOUNT', 'A_CODE', 'MERCHANT_CONTRACT', 'MERCHANT_NAME', 'MCC', 'DEVICE', 'CYCLEN', 'REFERENCE', 'MEMBERS', 'TRANS_CONDITION',
      'ACQREFNUMBER', 'ACCOUTCURR', 'ACCOUNTAMOUNT', 'ACCOUNTFEE', 'AC_FEE', 'DUE_DATE', 'BRANCH', 'COUNTRY', 'FILENAME', 'SYSTEMDATE', 'PAY_SYSTEM_TYPE', 'TARGET_CONTRACT', 'TRANSACTION_TYPE',
      'TRANSACTION_CURR', 'OUTWARD_STATUS', 'REQUEST_CATEGORY', 'BATCH_AMOUNT', 'BATCH_COUNT'], confirm: false, excel: true, sort: [] },
    rbstax: { title: 'RbsTax', grid1: ['ID', null, 'RBSNUM', 'CARDHOLDER', 'SYSTEM_DATE', 'ACCOUNT_AMOUNT', 'FEE', 'MCC', 'MERCHANT', 'TRAN_CURR', 'TRAN_AMOUNT', 'TRAN_TYPE', 'TRAN_DATE', 'RRN', 'TAX_FEE',
      'SEP_FEE', 'SETTL_CURR', 'SETTL_AMOUNT', 'PAYMENT_SYSTEM', 'SOURCE_CHANNEL', 'TRANSACTION_TYPE', 'REQUEST_CATEGORY', 'ACCOUNT_CURRENCY', 'TOTAL_AMOUNT', 'TOTAL_FEE', 'TOTAL_TAX_FEE', 'TOTAL_SEP_FEE', 'TRANS_COUNT'],
      grid2: ['ID', null, 'RBSNUM', 'CARDHOLDER', 'SYSTEM_DATE', 'ACCOUNT_AMOUNT', 'FEE', 'MCC', 'MERCHANT', 'TRAN_CURR', 'TRAN_AMOUNT', 'TRAN_TYPE', 'TRAN_DATE', 'RRN', 'TAX_FEE', 'SEP_FEE', 'SETTL_CURR', 'SETTL_AMOUNT'],
      confirm: true, excel: true, sort: [] },
  };
  async function fileop(box, form) {
    const S = FO[form], call = caller('/api/cards/fo/' + form);
    let d = await call('/open'); if (!d) return;
    const sel = new Set(); let cur = null;
    function draw() {
      box.innerHTML = `<h3 style="margin:8px 0">${esc(S.title)}</h3>
        <div class="toolbar" style="gap:6px;flex-wrap:wrap">
          <label class="btn secondary" style="cursor:pointer">${esc(K('cf_upload'))}<input type="file" id="fo_f" style="display:none"></label>
          <span class="muted" id="fo_fn">${d.file ? esc(d.file.name + ' (' + d.file.size + ' B)') : esc(K('cf_nofile'))}</span>
          ${S.noPreview ? '' : `<button class="btn" id="fo_r">${esc(K('cf_refresh'))}</button>`}<button class="btn" id="fo_b">${esc(K('cf_tobase'))}</button>
          ${S.confirm ? `<button class="btn" id="fo_c">${esc(K('cf_confirm'))}</button>` : ''}${S.excel ? '<button class="btn secondary" id="fo_x">Excel</button>' : ''}</div>
        ${S.noPreview ? '' : `<pre id="fo_rich" style="max-height:28vh;overflow:auto;background:#fff;border:1px solid #ccd;padding:6px;font:12px/1.35 monospace;margin:6px 0">${rich(d.rich)}</pre>`}
        ${gridHtml('fo_g1', S.grid1, d.grid1, { sel, sortable: S.sort.includes('grid1'), icon: r => icon(r.status), iconAt: S.iconAt })}
        ${S.grid2 ? `<h4 style="margin:8px 0 4px">${esc(K('cf_posted'))}</h4>${gridHtml('fo_g2', S.grid2, d.grid2, { sortable: S.sort.includes('grid2'), icon: r => icon(r.status), iconAt: S.iconAt })}` : ''}`;
      const q = (id) => box.querySelector('#' + id);
      q('fo_f').onchange = async () => { const f = q('fo_f').files[0]; if (!f) return; const r = await call('/upload', { name: f.name, b64: await readB64(f) }); if (r) { d = r; draw(); } };
      const done = (r) => { d = r; draw(); say(r.messages); saveFiles(r.files); if (r.error) toast(r.error, 'error'); };
      if (q('fo_r')) q('fo_r').onclick = async () => { const r = await call('/refresh'); if (r) done(r); };
      q('fo_b').onclick = async () => {
        const answers = [];
        for (;;) {
          const r = await call('/tobase', { answers }); if (!r) return;
          if (r.ask) { const bs = (r.buttons || [6, 7]).map(b => ({ 6: ['mryes', K('yes')], 7: ['mrno', K('no')], 2: ['mrcancel', K('cancel')], 1: ['mrok', 'OK'] })[b]).filter(Boolean);
            answers.push(await ask(r.ask, bs.length ? bs : [['mryes', K('yes')], ['mrno', K('no')]])); continue; }
          sel.clear(); return done(r);
        }
      };
      if (q('fo_c') && S.confirm === 'single') q('fo_c').onclick = async () => {      // TDfile.ToolButton1Click :600: one question for all rows
        const a = await ask(K('fo_ask_all_rows'), [['yes', K('yes')], ['no', K('no')]]);
        const r = await call('/confirm', { answers: [a] }); if (r) done(r); };
      else if (q('fo_c')) q('fo_c').onclick = async () => {
        const order = (d.grid1 || []).map(r => r.id); let ids = order.filter(i => sel.has(i)); if (!ids.length && cur != null) ids = [cur];
        const answers = await askLoop(ids.length, K('cf_ask'), K('cf_ask_all'));
        const r = await call('/confirm', { ids, current: cur, answers }); if (r) { sel.clear(); done(r); } };
      if (q('fo_x')) q('fo_x').onclick = () => download('/api/cards/fo/' + form + '/excel', form.toUpperCase() + '.xlsx');
      ['grid1', 'grid2'].forEach(g => { const t = q(g === 'grid1' ? 'fo_g1' : 'fo_g2'); if (!t || !S.sort.includes(g)) return;
        t.querySelectorAll('th[data-f]').forEach(th => th.onclick = async () => { if (!th.dataset.f) return; const r = await call('/sort', { grid: g, field: th.dataset.f }); if (r) done(r); }); });
      wireSel(q('fo_g1'), d.grid1 || [], sel, (id) => { cur = id; }, draw);
    }
    draw();
  }

  // TKlirinq_form (klirinqUnit.pas): Bazaya Göndər :71, Təsdiq Et :61 (one question), Sil :169, Excel dropdown N11 / N12, TitleClick, FormClose :176
  async function kliring(box) {
    const call = caller('/api/cards/kliring');
    let d = await call('/open'); if (!d) return;
    const sel = new Set(); const C = ['BANKID', null, 'BANKNAME', 'HESAB1', 'KLIRING1', 'MEBLEQ', 'INFO'];
    function draw() {
      box.innerHTML = `<h3 style="margin:8px 0">${esc(K('mi_kliring'))}</h3><div class="toolbar" style="gap:6px;flex-wrap:wrap">
        <button class="btn secondary" id="kl_close">${esc(K('close'))}</button><button class="btn" id="kl_b">${esc(K('cf_tobase'))}</button>
        <button class="btn" id="kl_c">${esc(K('cf_confirm'))}</button><button class="btn secondary" id="kl_x1">Excel 1</button><button class="btn secondary" id="kl_x2">Excel 2</button>
        <button class="btn secondary" id="kl_d">${esc(K('kl_delete'))}</button></div>
        ${gridHtml('kl_g1', C, d.grid1, { sel, sortable: true, key: 'id', icon: r => icon(r.status) })}${gridHtml('kl_g2', C, d.grid2, { sortable: true, icon: r => icon(r.status) })}`;
      const q = (id) => box.querySelector('#' + id), set = (r) => { if (r) { d = r; draw(); if (r.error) toast(r.error, 'error'); } };
      q('kl_close').onclick = async () => { await call('/close'); box.innerHTML = ''; };     // FormClose :176: kliring_delete
      q('kl_b').onclick = async () => set(await call('/tobase'));
      q('kl_c').onclick = async () => { const a = await ask(K('kl_ask'), [['yes', K('yes')], ['no', K('no')]]); set(await call('/confirm', { yes: a === 'yes' })); };
      q('kl_d').onclick = async () => set(await call('/delete'));
      q('kl_x1').onclick = () => download('/api/cards/kliring/excel', 'kliring.xlsx', { grid: 'grid1', field: '' });
      q('kl_x2').onclick = () => download('/api/cards/kliring/excel', 'kliring.xlsx', { grid: 'grid2', field: '' });
      [['kl_g1', 'grid1'], ['kl_g2', 'grid2']].forEach(([id, g]) => q(id).querySelectorAll('th[data-f]').forEach(th => th.onclick = async () => { if (th.dataset.f) set(await call('/sort', { grid: g, field: th.dataset.f })); }));
      wireSel(q('kl_g1'), d.grid1, sel, () => {}, draw, { items: [['all', 'SELECT ALL'], ['x', 'EXCEL']], onItem: () => q('kl_x1').click() });
    }
    draw();
  }
  // Tlim (limittur.pas): Təsdiq et :61 (card_main.limits), Yenilə; grids without Columns show every field
  async function limits(box) {
    const call = caller('/api/cards/limits');
    let d = await call('/open'); if (!d) return;
    const cols = (rows) => rows && rows.length ? Object.keys(rows[0]).map(k => [k.toUpperCase(), k.toUpperCase()]) : [];
    function draw() {
      box.innerHTML = `<h3 style="margin:8px 0">Limits</h3><div class="toolbar" style="gap:6px"><button class="btn" id="li_c">${esc(K('cf_confirm'))}</button>
        <button class="btn secondary" id="li_r">${esc(K('cf_refresh'))}</button></div>${gridHtml('li_g1', cols(d.grid1), d.grid1)}${gridHtml('li_g2', cols(d.grid2), d.grid2)}`;
      box.querySelector('#li_c').onclick = async () => { const r = await call('/confirm'); if (r) { d = r; draw(); say(r.messages); } };
      box.querySelector('#li_r').onclick = async () => { const r = await call('/refresh'); if (r) { d = r; draw(); } };
    }
    draw();
  }
  // TEXCELform (Unitexcel.pas): card_excelform list, 'Aç' / double click -> the sub form of the row's Id
  async function excelforms(box) {
    const call = caller('/api/cards/excelforms');
    const d = await call('/open'); if (!d) return; let cur = d.grid.length ? d.grid[0].id : null;
    function draw() {
      box.innerHTML = `<h3 style="margin:8px 0">${esc(K('mi_excel'))}</h3><div class="toolbar"><button class="btn" id="ex_o">${esc(K('ex_open'))}</button></div>
        ${gridHtml('ex_g', ['ID', ['NAME', 'name']], d.grid, { sel: new Set([cur]) })}`;
      const go = async () => { const r = await call('/pick', { id: cur }); if (r && r.form) xlsform(box, r.form, () => excelforms(box)); };
      box.querySelector('#ex_o').onclick = go;
      box.querySelectorAll('#ex_g tbody tr[data-id]').forEach(tr => { tr.onclick = () => { cur = +tr.dataset.id; draw(); }; tr.ondblclick = () => { cur = +tr.dataset.id; go(); }; });
    }
    draw();
  }
  // Excel yükləmələr sub forms (api/app/cards_xls.py): TSalary Unitsalary.pas, TNEWCARDEX EXCELNEWCARD.pas, TPROLONGATIONXLS PROLONGATIONUNIT.pas,
  // Taccountclose accountcloseunit.pas. Toolbar isertbtn 'Bazaya Göndər' (OpenDialogCards -> one workbook uploaded by hand, sheet 'CARDS'),
  // ToolButton1 'Təsdiq Et', ToolButton7 'Excel' (N11 '1-ci pəncərə' / N12 '2-ci pəncərə'), ToolButton2 'Sil'; grid popups EXCEL (+ SELECT ALL).
  const XTITLE = { salary: 'Salary', newcard: 'NEW CARD', prolong: 'PROLONGATION', accclose: 'Account_close' };
  async function xlsform(box, form, back) {
    const call = caller('/api/cards/xls/' + form);
    let d = await call('/open'); if (!d) return;
    const sel = new Set();
    const pick = () => new Promise(res => { const i = document.createElement('input'); i.type = 'file'; i.accept = '.xls,.xlsx';
      i.onchange = async () => { const f = i.files[0]; res(f ? { name: f.name, b64: await readB64(f) } : null); }; i.click(); });
    function draw() {
      const C = d.cols.map(c => c == null ? null : [c, c]);
      box.innerHTML = `<h3 style="margin:8px 0">${esc(XTITLE[form])}</h3><div class="toolbar" style="gap:6px;flex-wrap:wrap">
        <button class="btn secondary" id="xs_close">${esc(K('close'))}</button>
        ${form === 'newcard' ? `<label>${esc(K('xs_date'))} <input type="date" id="xs_dt" value="${esc(d.date || '')}"></label>` : ''}
        <button class="btn" id="xs_b">${esc(K('cf_tobase'))}</button><button class="btn" id="xs_c">${esc(K('cf_confirm'))}</button>
        <button class="btn secondary" id="xs_x1">${esc(K('xs_win1'))}</button><button class="btn secondary" id="xs_x2">${esc(K('xs_win2'))}</button>
        <button class="btn secondary" id="xs_d">${esc(K('kl_delete'))}</button></div>
        ${gridHtml('xs_g1', C, d.grid1, { sel, sortable: d.sortable, icon: r => icon(r.status) })}${gridHtml('xs_g2', C, d.grid2, { sortable: d.sortable, icon: r => icon(r.status) })}`;
      const q = (id) => box.querySelector('#' + id), set = (r) => { if (r) { d = r; draw(); say(r.messages); if (r.error) toast(r.error, 'error'); } };
      q('xs_close').onclick = async () => { if (form === 'salary') await call('/close'); back(); };      // TSalary FormClose :274: delete_salary
      q('xs_b').onclick = async () => {                                         // isertbtnClick: OpenDialogCards.Execute (cancel -> no file)
        const body = (await pick()) || {}; if (form === 'newcard') body.date = q('xs_dt').value || null; set(await call('/tobase', body)); };
      q('xs_c').onclick = async () => {                                         // Unitsalary ToolButton1Click :286 asks first; the others do not
        let yes = true; if (form === 'salary') yes = (await ask(K('xs_ask_sal'), [['yes', K('yes')], ['no', K('no')]])) === 'yes';
        set(await call('/confirm', { yes })); };
      q('xs_d').onclick = async () => set(await call('/delete'));
      const ex = (g) => download('/api/cards/xls/' + form + '/excel', form + '.xlsx', { grid: g, field: '' });
      q('xs_x1').onclick = () => ex('grid1'); q('xs_x2').onclick = () => ex('grid2');
      if (d.sortable) [['xs_g1', 'grid1'], ['xs_g2', 'grid2']].forEach(([id, g]) => q(id).querySelectorAll('th[data-f]').forEach(th => th.onclick = async () => { if (th.dataset.f) set(await call('/sort', { grid: g, field: th.dataset.f })); }));
      // grid popups: DBGrid1 PopupMenu2 EXCEL1 -> N11 (+ SELECT ALL on Account_close); DBGrid2 PopupMenu3 EXCEL2 -> N12 (NEW CARD: both grids use PopupMenu2 -> N11)
      wireSel(q('xs_g1'), d.grid1 || [], sel, () => {}, draw, { items: form === 'accclose' ? [['x', 'EXCEL'], ['all', 'SELECT ALL']] : [['x', 'EXCEL']], onItem: () => ex('grid1') });
      const g2 = q('xs_g2'); if (g2) g2.oncontextmenu = (e) => { e.preventDefault(); ex(form === 'newcard' ? 'grid1' : 'grid2'); };
    }
    draw();
  }
  // yes / no / cancel / yes-to-all loop questions (the Delphi SelectedRows loop; the server replays it with the answers)
  async function askLoop(n, q1, qAll) {
    const answers = []; let wait = true;
    for (let i = 0; i < n && wait; i++) {
      let a = await ask(q1, [['yes', K('yes')], ['no', K('no')], ['cancel', K('cancel')], ['all', K('yes_all')]]);
      if (a === 'all') { const b = await ask(qAll.replace('%d', n - i), [['yes', K('yes')], ['cancel', K('cancel')]]); a = b === 'yes' ? 'all' : 'all_no'; if (a === 'all') wait = false; }
      answers.push(a); if (a === 'cancel') break;
    }
    return answers;
  }
  // TCARDNUMBER (cardnumbersource.pas, api/app/cards_cardnum.py): TabSheet1 'Auto' (file -> editcardnumber, Təsdiq Et / Sil loops, Excel),
  // TabSheet2 'Manual' (Edit1 reference + Enter -> client2, Edit2 new card number, Save / Clear)
  const CN_LBL = [['Edit4', 'RBS NUMBER'], ['Edit6', 'CLIENT NUMBER'], ['ComboBox10', 'TITLE'], ['ComboBox11', 'VIP'], ['ComboBox12', 'STATUS'],
    ['Edit15', 'FIRST NAME'], ['Edit16', 'LAST NAME'], ['Edit17', 'HOME PHONE'], ['Edit27', 'WORK PHONE'], ['Edit18', 'PASSPORT N'], ['DateTimePicker7', 'BIRTH DAY'],
    ['Edit20', 'COUNTRY'], ['Edit19', 'CITY'], ['Edit21', 'LANG'], ['Edit22', 'ADDRESS'], ['ComboBox1', 'CARD TYPE'], ['DateTimePicker8', 'EXP. DATE'],
    ['ComboBox4', 'RESIDENT'], ['Edit26', 'REFERENCE'], ['Edit25', 'SECURITY WORD'], ['Edit24', 'CARD NUMBER'], ['Edit23', 'EMBOSS NAME'], ['ComboBox2', 'COMPANY']];
  async function cardnumber(box) {
    const call = caller('/api/cards/cardnum');
    let d = await call('/open'); if (!d) return;
    const sel = new Set(); let cur = null;
    const today = new Date().toISOString().slice(0, 10);
    function draw() {
      const C = d.cols.map(c => c == null ? null : [c, c]);
      const tabs = `<div class="toolbar" style="gap:4px"><button class="btn ${d.page === 'auto' ? '' : 'secondary'}" id="cn_ta">Auto</button><button class="btn ${d.page === 'manual' ? '' : 'secondary'}" id="cn_tm">Manual</button>
        <button class="btn secondary" id="cn_close">${esc(K('close'))}</button></div>`;
      const auto = `<div class="toolbar" style="gap:6px;flex-wrap:wrap;margin-top:6px">
          <label class="btn secondary" style="cursor:pointer">${esc(K('cf_upload'))}<input type="file" id="cn_f" style="display:none"></label>
          <span class="muted" id="cn_fn">${d.file ? esc(d.file.name) : esc(K('cf_nofile'))}</span>
          <button class="btn" id="cn_b">${esc(K('cf_tobase'))}</button><button class="btn" id="cn_c">${esc(K('cf_confirm'))}</button>
          <button class="btn secondary" id="cn_x1">${esc(K('xs_win1'))}</button><button class="btn secondary" id="cn_x2">${esc(K('xs_win2'))}</button>
          <button class="btn secondary" id="cn_d">${esc(K('kl_delete'))}</button></div>
        ${gridHtml('cn_g1', C, d.grid1, { sel, icon: r => icon(r.status) })}${gridHtml('cn_g2', C, d.grid2, { icon: r => icon(r.status) })}`;
      const val = (k) => { const v = d.boxes[k] || ''; return v === 'TODAY' ? today : v; };
      const manual = `<div style="display:grid;grid-template-columns:repeat(auto-fill,minmax(230px,1fr));gap:6px 12px;margin-top:8px">
          <label>REFERANCE<input id="cn_e1" style="text-transform:uppercase" value="${esc(d.edit1)}"></label><label>CARD NUMBER<input id="cn_e2" value="${esc(d.edit2)}"></label>
          ${CN_LBL.map(([k, l]) => `<label>${esc(l)}<input ${k.startsWith('DateTime') ? 'type="date"' : ''} disabled value="${esc(val(k))}"></label>`).join('')}</div>
        <div class="toolbar" style="gap:6px;margin-top:8px"><button class="btn" id="cn_s">Save</button><button class="btn secondary" id="cn_cl">Clear</button></div>`;
      box.innerHTML = `<h3 style="margin:8px 0">CARDNUMBER</h3>${tabs}${d.page === 'auto' ? auto : manual}`;
      const q = (id) => box.querySelector('#' + id), set = (r) => { if (r) { d = r; draw(); say(r.messages); if (r.error) toast(r.error, 'error'); } };
      q('cn_ta').onclick = async () => set(await call('/tab', { page: 'auto' }));
      q('cn_tm').onclick = async () => set(await call('/tab', { page: 'manual' }));
      q('cn_close').onclick = () => { box.innerHTML = ''; };
      if (d.page === 'auto') {
        q('cn_f').onchange = async () => { const f = q('cn_f').files[0]; if (f) set(await call('/upload', { name: f.name, b64: await readB64(f) })); };
        q('cn_b').onclick = async () => set(await call('/tobase'));
        const ids = () => { const o = d.grid1.map(r => r.id).filter(i => sel.has(i)); return o.length ? o : (cur != null ? [cur] : []); };
        q('cn_c').onclick = async () => { const a = await askLoop(ids().length, K('cn_ask_change'), K('cn_ask_change_all')); const r = await call('/change', { ids: [...sel], current: cur, answers: a }); sel.clear(); set(r); };
        q('cn_d').onclick = async () => { const a = await askLoop(ids().length, K('cn_ask_del'), K('cn_ask_del_all')); const r = await call('/delete', { ids: [...sel], current: cur, answers: a }); sel.clear(); set(r); };
        const ex = (g) => download('/api/cards/cardnum/excel/' + g, 'KART_NOMRELERI.xlsx');
        q('cn_x1').onclick = () => ex('grid1'); q('cn_x2').onclick = () => ex('grid2');
        const items = [['x', 'EXCEL'], ['all', 'SELECT ALL']];                  // PopupMenu2 on both grids: EXCEL1 (cardnumber1), SELECTALL1 (DBGrid1)
        wireSel(q('cn_g1'), d.grid1, sel, (id) => { cur = id; }, draw, { items, onItem: () => ex('grid1') });
        q('cn_g2').oncontextmenu = (e) => { e.preventDefault(); ex('grid1'); };
        box.onkeydown = (e) => { if (e.ctrlKey && e.key.toLowerCase() === 'a' && d.page === 'auto') { e.preventDefault(); d.grid1.forEach(r => sel.add(r.id)); draw(); } };
      } else {
        const e1 = q('cn_e1');
        e1.onkeydown = async (e) => { if (e.key === 'Enter') set(await call('/edit1', { edit1: e1.value.toUpperCase() })); };
        e1.oninput = async () => { if (e1.value === '') set(await call('/clear')); };   // any key with Edit1 empty clears the boxes
        q('cn_cl').onclick = async () => set(await call('/clear'));
        q('cn_s').onclick = async () => {
          const e1v = q('cn_e1').value.toUpperCase(), e2v = q('cn_e2').value;
          let yes = false; if (e1v && e2v) yes = (await ask(K('cn_ask_save'), [['yes', K('yes')], ['no', K('no')]])) === 'yes';
          set(await call('/save', { edit1: e1v, edit2: e2v, yes })); };
      }
    }
    draw();
  }
  // TPostCommisionOnus (PostCommisionOnusImpl.pas, api/app/cards_posonus.py): Oxu, Təsdiq et, date + Yeniləmək, grid popups Sil / Hamısını seçmək
  async function poscomm(box) {
    const call = caller('/api/cards/posonus');
    let d = await call('/open'); if (!d) return;
    const sel = { grid1: new Set(), grid2: new Set() }, cur = { grid1: null, grid2: null };
    const askN = async (n, text) => { const a = []; for (let i = 0; i < n; i++) { const x = await ask(text.replace('%d', n - i), [['yes', K('yes')], ['cancel', K('cancel')]]); a.push(x); if (x === 'yes') break; } return a; };
    const pickIds = (g) => { const o = d[g].map(r => r.id).filter(i => sel[g].has(i)); return o.length ? o : (cur[g] != null ? [cur[g]] : []); };
    function draw() {
      box.innerHTML = `<h3 style="margin:8px 0">Commission Our POS-ONUS</h3><div class="toolbar" style="gap:6px;flex-wrap:wrap">
        <button class="btn secondary" id="po_close">${esc(K('close'))}</button><button class="btn" id="po_r">${esc(K('po_read'))}</button><button class="btn" id="po_c">${esc(K('cf_confirm'))}</button>
        <input type="date" id="po_dt" value="${esc(d.date)}"><button class="btn secondary" id="po_y">${esc(K('cf_refresh'))}</button></div>
        ${gridHtml('po_g1', d.cols1, d.grid1, { sel: sel.grid1 })}${gridHtml('po_g2', d.cols2, d.grid2, { sel: sel.grid2 })}`;
      const q = (id) => box.querySelector('#' + id), set = (r) => { if (r) { d = r; sel.grid1.clear(); sel.grid2.clear(); draw(); say(r.messages); if (r.error) toast(r.error, 'error'); } };
      q('po_close').onclick = () => { box.innerHTML = ''; };
      q('po_r').onclick = async () => set(await call('/read'));
      q('po_y').onclick = async () => set(await call('/refresh', { date: q('po_dt').value }));
      q('po_c').onclick = async () => { const n = d.grid1.length ? pickIds('grid1').length : 0;
        set(await call('/confirm', { ids: [...sel.grid1], current: cur.grid1, answers: await askN(n, K('po_ask_conf')) })); };
      const del = async (g) => set(await call('/delete', { grid: g, ids: [...sel[g]], current: cur[g], answers: await askN(pickIds(g).length, K('po_ask_del')) }));
      ['grid1', 'grid2'].forEach((g, i) => wireSel(q('po_g' + (i + 1)), d[g], sel[g], (id) => { cur[g] = id; }, draw,
        { items: [['del', 'Sil'], ['all', K('po_all')]], onItem: () => del(g) }));
      box.onkeydown = (e) => { if (e.key === 'Escape') box.innerHTML = '';                 // FormKeyPress: Esc -> Close
        if (e.ctrlKey && e.key.toLowerCase() === 'a') { const g = document.activeElement && document.activeElement.id === 'po_g2' ? 'grid2' : 'grid1'; e.preventDefault(); d[g].forEach(r => sel[g].add(r.id)); draw(); } };
    }
    draw();
  }
  const OTHER = { kliring, limits, excel: excelforms, cardnumber, poscomm };

  async function cfile(box) {
    const P = '/api/cards/cfile';
    const call = async (path, body) => { try { return await api(P + path, { method: 'POST', body: body || {} }); } catch (e) { toast(errT(e), 'error'); return null; } };
    let d = await call('/open'); if (!d) return;
    const sel = new Set(); let cur = null;
    function grid(id, rows, icons) {
      return `<div class="tablewrap" style="max-height:30vh"><table class="grid" id="${id}"><thead><tr>${icons ? '<th></th>' : ''}${COLS.map(c => `<th>${esc(c)}</th>`).join('')}${id === 'cf_g1' ? '<th>INFO</th>' : ''}</tr></thead><tbody>
        ${rows.map(r => `<tr data-id="${r.id}" class="${icons && sel.has(r.id) ? 'sel' : ''}">${icons ? `<td>${ICON[r.status] != null ? `<img src="/img/cards/app_status_${ICON[r.status]}.png" alt="">` : ''}</td>` : ''}${COLS.map(c => `<td>${esc(fmt(c, r[c.toLowerCase()]))}</td>`).join('')}${id === 'cf_g1' ? `<td>${esc(r.info ?? '')}</td>` : ''}</tr>`).join('') || `<tr><td colspan="${COLS.length + 2}" class="muted">${esc(K('empty'))}</td></tr>`}</tbody></table></div>`;
    }
    function draw() {
      box.innerHTML = `<h3 style="margin:8px 0">C File</h3>
        <div class="toolbar" style="gap:6px;flex-wrap:wrap">
          <label class="btn secondary" style="cursor:pointer">${esc(K('cf_upload'))}<input type="file" id="cf_f" style="display:none"></label>
          <span class="muted" id="cf_fn">${d.file ? esc(d.file.name + ' (' + d.file.size + ' B)') : esc(K('cf_nofile'))}</span>
          <button class="btn" id="cf_r">${esc(K('cf_refresh'))}</button><button class="btn" id="cf_b">${esc(K('cf_tobase'))}</button>
          <button class="btn" id="cf_c">${esc(K('cf_confirm'))}</button><button class="btn secondary" id="cf_x">Excel</button>
          <button class="btn secondary" id="cf_m">${esc(K('cf_xml'))}</button></div>
        <pre id="cf_rich" style="max-height:28vh;overflow:auto;background:#fff;border:1px solid #ccd;padding:6px;font:12px/1.35 monospace;margin:6px 0">${rich(d.rich)}</pre>
        ${grid('cf_g1', d.grid1, true)}<h4 style="margin:8px 0 4px">${esc(K('cf_posted'))}</h4>${grid('cf_g2', d.grid2, false)}`;
      const q = (id) => box.querySelector('#' + id);
      q('cf_f').onchange = async () => { const f = q('cf_f').files[0]; if (!f) return;
        const b64 = await new Promise(res => { const r = new FileReader(); r.onload = () => res(String(r.result).split(',')[1] || ''); r.readAsDataURL(f); });
        const r = await call('/upload', { name: f.name, b64 }); if (r) { d = r; draw(); } };
      q('cf_r').onclick = async () => { const r = await call('/refresh'); if (r) { d = r; draw(); if (r.error) toast(r.error, 'error'); } };
      q('cf_b').onclick = async () => {                                         // isertbtnClick: the replace question when the file is loaded already
        const answers = [];
        for (;;) {
          const r = await call('/tobase', { answers }); if (!r) return;
          if (r.ask) { answers.push(await ask(r.ask, [['mryes', K('yes')], ['mrno', K('no')]])); continue; }
          d = r; draw(); say(r.messages); if (r.error) toast(r.error, 'error'); return;
        }
      };
      q('cf_c').onclick = async () => {                                         // ToolButton1Click: per selected row (Count = 0 -> current row)
        const order = d.grid1.map(r => r.id); let ids = order.filter(i => sel.has(i)); if (!ids.length && cur != null) ids = [cur];
        const answers = []; let wait = true;
        for (let i = 0; i < ids.length && wait; i++) {
          let a = await ask(K('cf_ask'), [['yes', K('yes')], ['no', K('no')], ['cancel', K('cancel')], ['all', K('yes_all')]]);
          if (a === 'all') { const b = await ask(K('cf_ask_all').replace('%d', ids.length - i), [['yes', K('yes')], ['cancel', K('cancel')]]); a = b === 'yes' ? 'all' : 'all_no'; if (a === 'all') wait = false; }
          answers.push(a); if (a === 'cancel') break;
        }
        const r = await call('/confirm', { ids, current: cur, answers }); if (r) { d = r; sel.clear(); draw(); say(r.messages); if (r.error) toast(r.error, 'error'); } };
      q('cf_x').onclick = async () => { const res = await fetch(P + '/excel', { method: 'POST', headers: { 'Content-Type': 'application/json' }, credentials: 'same-origin', body: '{}' });
        if (!res.ok) { const j = await res.json().catch(() => ({})); return toast(errT(j.detail || {}), 'error'); }
        const a = document.createElement('a'); a.href = URL.createObjectURL(await res.blob()); a.download = 'CFILES.xlsx'; a.click(); };
      q('cf_m').onclick = () => caddi(box, () => cfile(box));                   // ToolButton2Click :643 -> TAdditional_cfile (cfile_addi.pas)
      const g1 = q('cf_g1');
      g1.querySelectorAll('tbody tr[data-id]').forEach(tr => tr.onclick = (e) => { const id = +tr.dataset.id; cur = id;
        if (e.ctrlKey || e.metaKey || e.shiftKey) { sel.has(id) ? sel.delete(id) : sel.add(id); } else { sel.clear(); sel.add(id); } draw(); });
      g1.oncontextmenu = (e) => { e.preventDefault(); document.querySelectorAll('.cf_pop').forEach(x => x.remove());   // PopupMenu1 selectall1 :736
        const pm = document.createElement('div'); pm.className = 'cf_pop'; pm.style.cssText = `position:fixed;left:${e.clientX}px;top:${e.clientY}px;z-index:1200;background:#fff;border:1px solid #888`;
        pm.innerHTML = `<button class="btn secondary" id="cf_all">SELECT ALL</button>`; document.body.appendChild(pm);
        const off = () => { pm.remove(); document.removeEventListener('click', off); }; setTimeout(() => document.addEventListener('click', off), 0);
        pm.querySelector('#cf_all').onclick = () => { off(); d.grid1.forEach(r => sel.add(r.id)); draw(); }; };
    }
    draw();
  }
  window.SBCardsFiles = { cfile, fileop, FO, OTHER, H };
})();

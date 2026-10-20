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
  window.SBCardsFiles = { cfile, fileop, FO, H };
})();

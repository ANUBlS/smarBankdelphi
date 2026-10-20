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
      q('cf_m').onclick = () => toast(K('not_ported'));                          // ToolButton2Click -> TAdditional_cfile (cfile_addi.pas)
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
  window.SBCardsFiles = { cfile };
})();

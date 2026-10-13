/* Off-balance Excel import – port of Delphi Packages/OutExcelImport (TOutExcelImp). The .xlsx is read on the server with
   openpyxl (rows 2..last, columns 1..68 -> F1..F68), excelpkg calls run in the API (api/app/out_excel_import.py). */
(function () {
  const { api, t, esc, toast } = window.SB;
  const P = '/api/out-excel-import', T = (k, p) => t('out_excel_import.' + k, p);
  const errT = (e) => t(e.key || 'error.generic', e) + (e.ora ? ' ' + e.ora : '');
  function modal(html, onMount) {
    const d = document.createElement('div'); d.className = 'backdrop stacked';
    d.innerHTML = `<div class="modal" role="dialog">${html}</div>`; document.body.appendChild(d);
    const close = () => d.remove(); onMount && onMount(d.querySelector('.modal'), close); return close;
  }
  const ask = (msg) => new Promise(res => modal(`<div>${esc(msg)}</div><div class="actions"><button class="btn secondary" id="qn">${esc(t('common.no'))}</button><button class="btn" id="qy">${esc(t('common.yes'))}</button></div>`,
    (m, c) => { m.querySelector('#qy').onclick = () => { c(); res(true); }; m.querySelector('#qn').onclick = () => { c(); res(false); }; }));
  const info = (msg) => new Promise(res => modal(`<div>${esc(msg)}</div><div class="actions"><button class="btn" id="ok">OK</button></div>`, (m, c) => { m.querySelector('#ok').onclick = () => { c(); res(); }; }));

  async function page(el) {
    el.innerHTML = '<div class="spinner"></div>';
    let I; try { I = await api(P + '/init'); } catch (e) { el.innerHTML = `<div class="card"><div class="alert error">${esc(errT(e))}</div></div>`; return; }   // ActiveFormCreate
    const st = { rows: I.rows, i: 0 };
    el.innerHTML = `<div class="card"><div class="toolbar" style="gap:8px;flex-wrap:wrap"><h2 style="margin:0">${esc(T('title'))}</h2>
        <label class="btn" style="cursor:pointer">${esc(T('load'))}<input type="file" id="xf" accept=".xlsx,.xlsm" style="display:none"></label>
        <button class="btn secondary" id="xsend">${esc(T('send'))}</button><button class="btn secondary" id="xref">${esc(T('refresh'))}</button>
        <button class="btn secondary" id="xdel">${esc(T('delete'))}</button><span class="muted" id="xcnt"></span></div>
      <div id="xg" style="margin-top:8px"></div></div>`;
    const v = (id) => el.querySelector('#' + id);
    function grid() {
      v('xcnt').textContent = T('count', { n: st.rows.length });
      const body = st.rows.map((r, i) => `<tr data-i="${i}" class="${i === st.i ? 'sel' : ''}">${I.cols.map(c => `<td data-c="${c}" ${c !== 'USERID' ? 'contenteditable="true"' : ''}>${esc(r[c.toLowerCase()] ?? '')}</td>`).join('')}</tr>`).join('');
      v('xg').innerHTML = `<div class="tablewrap" style="max-height:66vh"><table class="grid"><thead><tr>${I.cols.map(c => `<th>${esc(c)}</th>`).join('')}</tr></thead>
        <tbody>${body || `<tr><td colspan="${I.cols.length}" class="muted">${esc(T('empty'))}</td></tr>`}</tbody></table></div>`;
      v('xg').querySelectorAll('tr[data-i]').forEach(tr => {
        tr.onclick = () => { if (st.i !== +tr.dataset.i) { st.i = +tr.dataset.i; v('xg').querySelectorAll('tr.sel').forEach(x => x.classList.remove('sel')); tr.classList.add('sel'); } };
        tr.onkeydown = async (e) => { if (e.key === 'Delete' && e.ctrlKey) { e.preventDefault(); const r = st.rows[+tr.dataset.i];            // dgConfirmDelete
          if (await ask(T('del_row'))) { try { st.rows = (await api(P + '/delete-row', { method: 'POST', body: { rowid: r.rowid } })).rows; grid(); } catch (er) { toast(errT(er), 'error'); } } } };
        tr.querySelectorAll('td[contenteditable]').forEach(td => td.onblur = async () => {                                                   // dgEditing -> Post
          const r = st.rows[+tr.dataset.i], c = td.dataset.c, val = td.textContent;
          if (String(r[c.toLowerCase()] ?? '') === val) return;
          try { st.rows = (await api(P + '/edit', { method: 'POST', body: { rowid: r.rowid, col: c, value: val === '' ? null : val } })).rows; grid(); } catch (er) { toast(errT(er), 'error'); grid(); }
        });
      });
    }
    v('xf').onchange = async () => {                                                                                  // ToolButton1Click
      const f = v('xf').files[0]; if (!f) return;
      try {
        const res = await fetch(P + '/upload', { method: 'POST', headers: { 'Content-Type': 'application/octet-stream' }, body: f, credentials: 'same-origin' });
        const j = await res.json(); if (!res.ok) throw (j.detail || {});
        st.rows = j.rows; st.i = 0; grid(); toast(T('imported', { n: j.imported }));
      } catch (e) { toast(errT(e), 'error'); }
      v('xf').value = '';
    };
    v('xsend').onclick = async () => {                                                                                // ToolButton3Click
      try {
        if (await ask(T('send_ask'))) { st.rows = (await api(P + '/send', { method: 'POST' })).rows; await info(T('sent')); }
        else st.rows = (await api(P + '/send-cancelled', { method: 'POST' })).rows;
        grid();
      } catch (e) { toast(errT(e), 'error'); }
    };
    v('xref').onclick = async () => { try { st.rows = (await api(P + '/rows')).rows; grid(); } catch (e) { toast(errT(e), 'error'); } };   // ToolButton5Click
    v('xdel').onclick = async () => {                                                                                 // ToolButton7Click (no question in Delphi)
      try { const r = await api(P + '/delete-payments', { method: 'POST' }); await info(T('deleted')); st.rows = r.rows; grid(); } catch (e) { toast(errT(e), 'error'); }
    };
    grid();
  }
  window.SB.pages['/m/out-excel-import'] = page;
})();

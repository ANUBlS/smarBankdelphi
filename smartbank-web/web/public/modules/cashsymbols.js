/* Cash symbols – port of Packages/CashSymbols (TCashSymbolX, CashSymbolImpl.pas). DBGrid1 (Simvol / Adı / Təyinatı),
   grid popup Add / Update / Delete, PanelAdd (Simvol, Adı, Təyinatı, 'Qəbul'). SB_CashReport calls in api/app/cashsymbols.py. */
(function () {
  const { api, t, esc, toast, modal } = window.SB;
  const P = '/api/cashsymbols', T = (k, p) => t('cashsymbols.' + k, p);
  const errT = (e) => t(e.key || 'error.generic', e) + (e.ora ? ' ' + e.ora : '');
  async function page(el) {
    el.innerHTML = '<div class="spinner"></div>';
    const st = { rows: [], i: 0, mode: null };
    try { st.rows = (await api(P)).rows; } catch (e) { el.innerHTML = `<div class="card"><div class="alert error">${esc(errT(e))}</div></div>`; return; }
    el.innerHTML = `<div class="card"><div class="toolbar"><h2 style="margin:0">${esc(T('title'))}</h2></div>
      <div id="yPanel" style="display:none;margin-top:8px;padding:8px;border:1px solid var(--border);border-radius:8px">
        <div style="display:flex;gap:10px;flex-wrap:wrap;align-items:end">
        <label class="field"><span>${esc(T('symbol'))}:</span><input id="ySym" style="width:90px"></label>
        <label class="field" style="flex:1"><span>${esc(T('name'))}:</span><input id="yName"></label>
        <label class="field"><span>${esc(T('assignment'))}</span><select id="yAs"><option value="0">Mədaxil</option><option value="1">Məxaric</option></select></label>
        <button class="btn" id="yOk">${esc(T('ok'))}</button></div></div>
      <div id="yErr"></div><div id="yGrid" style="margin-top:8px"></div></div>`;
    const v = (id) => el.querySelector('#' + id);
    const cur = () => st.rows[st.i] || null;
    function scrolled() {                                // ODSCashSymbolsAfterScroll fills the panel edits
      const r = cur(); if (!r) return;
      v('ySym').value = r.symbol ?? ''; v('yName').value = r.name ?? ''; v('yAs').value = String(r.mediocrity ?? 0);
    }
    function grid() {
      const body = st.rows.map((r, i) => `<tr data-i="${i}" class="${i === st.i ? 'sel' : ''}"><td>${esc(r.symbol ?? '')}</td><td>${esc(r.name ?? '')}</td><td>${esc(r.assignment ?? '')}</td></tr>`).join('');
      v('yGrid').innerHTML = `<div class="tablewrap" style="max-height:62vh"><table class="grid"><thead><tr><th>${esc(T('symbol'))}</th><th>${esc(T('name'))}</th><th>${esc(T('assignment'))}</th></tr></thead>
        <tbody>${body || `<tr><td colspan="3" class="muted">${esc(T('empty'))}</td></tr>`}</tbody></table></div>`;
      v('yGrid').querySelector('.tablewrap').oncontextmenu = (ev) => { if (!ev.target.closest('tr[data-i]')) menu(ev); };   // PopupMenu on the empty grid too
      v('yGrid').querySelectorAll('tr[data-i]').forEach(tr => {
        tr.onclick = () => { st.i = +tr.dataset.i; grid(); };
        tr.oncontextmenu = (ev) => { st.i = +tr.dataset.i; grid(); menu(ev); };
      });
      scrolled();
    }
    const keep = (rows, sym) => { st.rows = rows; const j = rows.findIndex(r => r.symbol === sym); st.i = j >= 0 ? j : Math.min(st.i, Math.max(rows.length - 1, 0)); grid(); };
    const add = () => { st.mode = 'add'; v('yPanel').style.display = ''; v('yName').value = ''; v('ySym').value = ''; v('yAs').value = '0'; };   // ActionAddExecute
    const upd = () => { st.mode = 'edit'; v('yPanel').style.display = ''; scrolled(); };                                                       // ActionUpdateExecute
    const del = async () => {                                                                                                                  // ActionDeleteExecute
      const r = cur(); if (!r) return;
      if (!(await yes(T('delete_q')))) return;
      try { keep((await api(P + '/delete', { method: 'POST', body: { symbol: r.symbol } })).rows, null); v('yErr').innerHTML = ''; }
      catch (e) { v('yErr').innerHTML = `<div class="alert error">${esc(errT(e))}</div>`; }
    };
    const menu = (ev) => SB.contextMenu(ev, [{ label: T('add'), onClick: add }, '-', { label: T('update'), onClick: upd }, '-', { label: T('delete'), onClick: del }]);
    v('yOk').onclick = async () => {                                                                                                          // Button1Click
      const body = { symbol: v('ySym').value, name: v('yName').value, mediocrity: +v('yAs').value };
      try {
        let r;
        if (st.mode === 'add') r = await api(P + '/add', { method: 'POST', body });
        else if (st.mode === 'edit') r = await api(P + '/update', { method: 'POST', body: { ...body, old_symbol: cur() ? cur().symbol : null } });
        else return;
        keep(r.rows, body.symbol); v('yPanel').style.display = 'none'; v('yErr').innerHTML = '';
      } catch (e) { v('yErr').innerHTML = `<div class="alert error">${esc(errT(e))}</div>`; }
    };
    grid();
  }
  function yes(msg) {                                   // MessageDlg(mtConfirmation, mbYesNoCancel) = mrYes
    return new Promise(res => modal(`<h3>${esc(T('confirm'))}</h3><p>${esc(msg)}</p><div class="actions">
      <button class="btn" id="y">${esc(t('common.yes'))}</button><button class="btn secondary" id="n">${esc(t('common.no'))}</button>
      <button class="btn secondary" id="c">${esc(T('cancel'))}</button></div>`, (m, close) => {
      m.querySelector('#y').onclick = () => { close(); res(true); };
      m.querySelector('#n').onclick = () => { close(); res(false); };
      m.querySelector('#c').onclick = () => { close(); res(false); };
    }));
  }
  window.SB.pages['/m/cashsymbols'] = page;
})();

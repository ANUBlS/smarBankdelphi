/* XÖHKS – port of Packages/LVPCSSManager_Turan (TLVPCSSForm). Step 1: the four tabs' lists and archives (api/app/xohks.py).
   Step 2: OUT add / edit / delete of batches and beneficiaries, TTransForm / TPaymentDetalsForm dialogs and templates
   (api/app/xohks_edit.py; the dialog state lives on the server like the Delphi form variables). */
(function () {
  const { api, t, esc, toast } = window.SB;
  const P = '/api/xohks', K = (k) => t('xohks.' + k);
  const errT = (e) => t(e.key || 'error.generic', e) + (e.ora ? ' ' + e.ora : '');
  // Visible columns of LVPCSSImpl.dfm (FieldName, Title.Caption). '' = status image column, 'F' = filial image column.
  const C = {
    batchs: [['ID', '№'], ['FILIAL', 'F'], ['STATUS', ''], ['TRANSDATE', 'Tarix'], ['ACC_NO', 'Debet'], ['VAL_NAME', '$'], ['AMOUNT', 'Debet Məbləğ'],
      ['TRANS_REF', 'Qeydiyyat №'], ['USERNAME', 'Modifikator'], ['VUSERID', 'Verifikator'], ['AUSERID', 'Avtorizator'], ['FORMAT', 'Format'], ['SDATE', 'Verifikasiya tarixi']],
    benef: [['ID', '№'], ['STATUS', ''], ['VAL_DATE', 'Tarix'], ['CLIENT_ACC_NO', 'Kredit'], ['VAL_NAME', '$'], ['AMOUNT', 'Kredit Məbləğ'], ['MESS_REFERENCE', 'Qeydiyyat №']],
    inc: [['ID', '№'], ['FILIAL', 'F'], ['STATUS', ''], ['TRANS_DATE', 'Tarix'], ['REFERENCE', 'Qeydiyyat №'], ['SEN_ACC', 'Debet'], ['VAL_NAME', '$'],
      ['REC_CLIENT_ACC', 'Kredit'], ['AMOUNT', 'Debet Məbləğ'], ['DESCRPTIONCORRECT', 'Qeyd']],
  };
  const ST = ['msDefault', 'msCommit', 'msReject', 'msFileCreated', 'msVerifikator', 'msFVerifikator', 'msAvtorizator', 'msReturnBack', 'msReturn'];
  const cell = (r, f) => { const v = r[f.toLowerCase()]; return f === 'STATUS' ? (ST[v] ? K('st_' + ST[v]) : (v ?? '')) : (v ?? ''); };
  // GridBatchsDrawColumnCell :1928 - the OnDrawColumnCell of ALL six grids (LVPCSSImpl.dfm:340/542/1820/2252/3191/3930;
  // GridIncomingDrawColumnCell :2868 is not assigned). ImageList index by Status (img/xohks/status_N.png, extracted from
  // LVPCSSImpl.dfm:4299) drawn instead of DataCol 2 - on the beneficiary grids that is the 'Tarix' column (kept: their own
  // status column shows the number). Filial: ImageListFilial[0] over DataCol 1 when FILIAL <> MsHeadOffice (0), only on
  // GridBatchs / GridIncoming / DBGridOUTArchBatchs / GridIncomingArchive and only when a status image exists.
  const IMG = { 0: 3, 1: 10, 2: 4, 3: 5, 4: 18, 5: 17, 6: 19, 7: 16, 8: 4 };
  function td(r, f, i, benefGrid) {
    const ii = IMG[+r.status], txt = esc(f === 'STATUS' && benefGrid ? (r.status ?? '') : cell(r, f));
    if (i === 2 && ii !== undefined && r.status != null)
      return `<td class="st st${esc(r.status)}"><img src="/img/xohks/status_${ii}.png" width="16" height="16" alt="${esc(cell(r, 'STATUS'))}" title="${esc(cell(r, 'STATUS'))}"></td>`;
    if (i === 1 && !benefGrid && ii !== undefined && +(r.filial ?? 0) !== 0)
      return `<td><img src="/img/xohks/filial_0.png" width="16" height="16" alt="" style="vertical-align:middle"> ${txt}</td>`;
    return `<td>${txt}</td>`;
  }
  function table(id, cols, rows, sortable) {
    return `<table class="grid acc-grid" id="${id}"><thead><tr>${cols.map(([f, c]) => `<th data-c="${esc(c)}" ${sortable ? 'style="cursor:pointer"' : ''}>${esc(c === '' ? K('c_status') : c)}</th>`).join('')}</tr></thead>
      <tbody>${rows.map((r, i) => `<tr data-i="${i}">${cols.map(([f], ci) => td(r, f, ci, cols === C.benef)).join('')}</tr>`).join('')
      || `<tr><td colspan="${cols.length}" class="muted">${esc(K('empty'))}</td></tr>`}</tbody></table>`;
  }
  const box = (title, inner, h) => `<fieldset class="card" style="margin:8px 0;padding:8px 12px;min-width:0"><legend>${esc(title)}</legend><div class="tablewrap" style="max-height:${h || 30}vh">${inner}</div></fieldset>`;
  async function page(el) {
    const st = { tab: 'out', d: null };
    el.innerHTML = `<div class="card"><div class="toolbar" style="gap:8px"><h2 style="margin:0">${esc(K('title'))}</h2></div>
      <div class="tabs"><button data-tab="out" class="on">${esc(K('tab_out'))}</button><button data-tab="in">${esc(K('tab_in'))}</button>
      <button data-tab="oarch">${esc(K('tab_oarch'))}</button><button data-tab="iarch">${esc(K('tab_iarch'))}</button></div><div id="xbody"></div></div>`;
    const v = (id) => el.querySelector('#' + id);
    el.querySelectorAll('.tabs button').forEach(b => b.onclick = () => {
      st.tab = b.dataset.tab; el.querySelectorAll('.tabs button').forEach(x => x.classList.toggle('on', x === b)); draw();
    });
    const call = async (path, body, m) => { try { return await api(P + path, { method: m || 'POST', body }); } catch (e) { toast(errT(e), 'error'); return null; } };
    function selectable(tb, rows, onSel) {
      tb.querySelectorAll('tbody tr[data-i]').forEach(tr => tr.addEventListener('click', (ev) => {
        if (ev.ctrlKey || ev.metaKey) tr.classList.toggle('msel'); else tb.querySelectorAll('tr.msel').forEach(x => x.classList.remove('msel'));  // dgMultiSelect
        tb.querySelectorAll('tr.sel').forEach(x => x.classList.remove('sel')); tr.classList.add('sel'); onSel(rows[+tr.dataset.i]);
      }));
      const f = tb.querySelector('tbody tr[data-i]'); if (f) { f.classList.add('sel'); onSel(rows[0]); } else onSel(null);  // first record current (AfterScroll)
    }
    async function benef(target, r, archive) {
      if (!r) { v(target).innerHTML = table('g_' + target, C.benef, []); return; }
      const res = await call('/beneficiary', { id: r.id, archive, filial: archive ? r.filial : undefined });
      if (!res) return;
      v(target).innerHTML = table('g_' + target, C.benef, res.rows);
      if (archive) v('x_fil').value = res.filial_name || '';
      else { st.brows = res.rows; selectable(v('g_' + target), res.rows, (b) => { st.curb = b; if (st.en) st.en(); }); }
    }
    function drawOut() {
      const d = st.d;
      v('xbody').innerHTML = `<div class="toolbar" style="gap:8px;align-items:center">
        <label>${esc(K('from'))} <input type="date" class="input" id="x_beg" value="${st.beg}"></label>
        <label>${esc(K('to'))} <input type="date" class="input" id="x_end" value="${st.end}"></label>
        <button class="btn secondary" id="x_ref">${esc(K('refresh'))}</button>
        <input class="input" readonly id="x_e1" value="${esc(d.edit1)}"><input class="input" readonly id="x_e2" value="${esc(d.edit2)}"><input class="input" readonly id="x_e3" value="${esc(d.edit3)}">
        <span>${esc(K('sum'))}: <b id="x_sum">${esc(d.batchs_sum_text)}</b></span></div>
        <div class="toolbar" style="gap:6px">
          <button class="btn" id="x_bnew">${esc(K('b_new'))}</button><button class="btn secondary" id="x_bedit">${esc(K('b_edit'))}</button>
          <button class="btn secondary" id="x_bdel">${esc(K('b_del'))}</button>
          ${st.benef_visible ? `<span style="width:16px"></span><button class="btn secondary" id="x_mnew">${esc(K('m_new'))}</button>
          <button class="btn secondary" id="x_medit">${esc(K('m_edit'))}</button><button class="btn secondary" id="x_mdel">${esc(K('m_del'))}</button>` : ''}
          ${st.benef_visible ? `<button class="btn secondary" id="x_macc">${esc(K('m_accept'))}</button>` : ''}
          <span class="muted">${esc(K('multi_hint'))}</span></div>
        <div class="toolbar" style="gap:6px">
          <button class="btn" id="x_bacc">Modifikator</button><button class="btn secondary" id="x_ver">Verifikator</button>
          <button class="btn secondary" id="x_avt">Avtorizator</button><button class="btn secondary" id="x_ret">${esc(K('b_return'))}</button>
          <button class="btn secondary" id="x_arch">${esc(K('b_archive'))}</button>
          <span style="width:16px"></span><button class="btn secondary" id="x_pf"><img src="/img/xohks/status_5.png" width="16" height="16" alt=""> Faylı Hazırla</button>
          <button class="btn secondary" id="x_sent"><img src="/img/xohks/status_11.png" width="16" height="16" alt=""> Gedən fayl</button></div>
        ${box(K('box_batchs'), table('g_b', C.batchs, d.batchs, true))}
        ${st.benef_visible ? box(K('box_benef'), '<div id="xb"></div>') : ''}`;
      v('x_ref').onclick = async () => { st.beg = v('x_beg').value; st.end = v('x_end').value;
        const r = await call('/out/refresh', { beg: st.beg, end: st.end }); if (r) { Object.assign(st.d, r); draw(); } };
      v('g_b').querySelectorAll('th').forEach(h => h.onclick = async () => {
        const r = await call('/out/sort', { caption: h.dataset.c }); if (r) { Object.assign(st.d, r); draw(); } });
      // XS_BATCHSAfterScroll / XS_BENEFICIARYAfterScroll (Data_Unit.pas:299/326): enabled only for status msDefault
      const en = () => { const bs = st.cur ? +st.cur.status : -1, ns = st.curb ? +st.curb.status : -1;
        v('x_bacc').disabled = bs !== 0; v('x_bdel').disabled = bs !== 0; v('x_bedit').disabled = !st.cur;
        if (st.benef_visible) { v('x_mdel').disabled = ns !== 0; v('x_macc').disabled = !(st.curb && bs === 0); v('x_mnew').disabled = bs !== 0; } };
      st.en = en;
      selectable(v('g_b'), d.batchs, (r) => { st.cur = r; st.curb = null; en(); if (st.benef_visible) benef('xb', r, false); });
      const after = (r) => { if (!r) return; if (r.warning) toast(K(r.warning.replace('xohks.', '')), 'error');
        Object.assign(st.d, r); draw(); };
      v('x_bacc').onclick = async () => { if (!st.cur) return; const r = await call('/batch/accept', { id: st.cur.id });
        if (r && r.accept_form) acceptForm(r.accept_form); else after(r); };
      v('x_ver').onclick = async () => { if (!st.cur) return; const r = await call('/batch/verify', { id: st.cur.id });
        if (r && r.verify) verifyForm(r.verify); else after(r); };
      v('x_avt').onclick = async () => { if (st.cur) after(await call('/batch/authorize', { id: st.cur.id })); };
      v('x_ret').onclick = async () => { if (st.cur) after(await call('/batch/return', { id: st.cur.id, benef_id: st.curb ? st.curb.id : null })); };
      v('x_arch').onclick = async () => { const r = await call('/archive/send'); if (r) toast(K('msg_archived')); };
      v('x_pf').onclick = async () => { const r = await call('/pf/open'); if (r) pfForm(r); };            // ToolButton11Click
      v('x_sent').onclick = () => sentForm();                                                             // ToolButton5Click
      if (st.benef_visible) v('x_macc').onclick = async () => {   // MessagesOutAccept: SelectedRows + current
        if (!st.cur || !st.curb) return;
        const g = v('g_xb'); const ids = [...g.querySelectorAll('tbody tr.msel')].map(tr => (st.brows[+tr.dataset.i] || {}).id).filter(x => x != null);
        after(await call('/benef/accept', { batch_id: st.cur.id, ids: [...ids.filter(i => i !== st.curb.id), st.curb.id] })); };
      v('x_bnew').onclick = async () => { const r = await call('/tx/new'); if (r) transForm(r); };
      v('x_bedit').onclick = async () => { if (!st.cur) return; const r = await call('/tx/edit', { id: st.cur.id }); if (r) transForm(r); };
      v('x_bdel').onclick = () => delLoop('g_b', d.batchs, st.cur, 'q_del_batch', (ids) => call('/batch/delete', { ids }));
      if (st.benef_visible) {
        v('x_mnew').onclick = async () => { if (!st.cur) return; const r = await call('/pd/open-add', { id: st.cur.id }); if (r) payForm(r); };
        v('x_medit').onclick = async () => { if (!st.cur || !st.curb) return; const r = await call('/pd/open-edit', { batch_id: st.cur.id, id: st.curb.id }); if (r) payForm(r); };
        v('x_mdel').onclick = () => delLoop('g_xb', st.brows || [], st.curb, 'q_del_benef', (ids) => call('/benef/delete', { batch_id: st.cur.id, ids }));
      }
    }
    // ---------------------------------------------------------------- dialogs (stacked: TTransForm under TPaymentDetalsForm)
    function layer(html, z) {
      const w = document.createElement('div'); w.className = 'backdrop'; w.style.zIndex = 1000 + z;
      w.innerHTML = `<div class="modal" role="dialog" style="max-width:980px;width:96%;max-height:92vh;overflow:auto">${html}</div>`;
      document.body.appendChild(w); return w;
    }
    const ask = (text, buttons) => new Promise(res => {      // MessageDlg with [mbyes, mbno, mbcancel, mball]
      const w = layer(`<p>${esc(text)}</p><div class="actions">${buttons.map(b => `<button class="btn ${b === 'yes' ? '' : 'secondary'}" data-b="${b}">${esc(K('mb_' + b))}</button>`).join('')}</div>`, 9);
      w.querySelectorAll('[data-b]').forEach(b => b.onclick = () => { w.remove(); res(b.dataset.b); });
    });
    async function delLoop(gid, rows, cur, q, send) {
      // MT102DeleteExecute / MessOutDeleteExecute: SelectedRows + current row; Yes / No (exit) / Cancel (break) / All
      const g = v(gid); if (!g || !cur) return;
      const sel = [...g.querySelectorAll('tbody tr.msel,tbody tr.sel')].map(tr => rows[+tr.dataset.i]).filter(Boolean);
      const uniq = [...new Map(sel.map(r => [r.id, r])).values()];
      let changed = null;
      for (const r of uniq) {
        const a = await ask(K(q).replace('{id}', r.id), ['yes', 'no', 'cancel', 'all']);
        if (a === 'yes') { changed = await send([r.id]) || changed; continue; }
        if (a === 'no' || a === 'cancel') break;      // mrno: exit / mrcancel: Break
        if (a === 'all') { if (await ask(K('q_del_all').replace('{n}', uniq.length), ['yes', 'no']) === 'yes') changed = await send(uniq.map(x => x.id)) || changed; break; }
      }
      if (changed) { Object.assign(st.d, changed); draw(); }
    }
    function acceptForm(f) {   // AcceptTransUnit.pas TFormAcceptTransaction 'ReAccept'
      const w = layer(`<h3>ReAccept</h3><label><input type="checkbox" id="a_c1" ${f.CheckBox1 ? 'checked' : ''}> Əməliyyat aparılsın</label><br>
        <label><input type="checkbox" id="a_c2" ${f.CheckBox2 ? 'checked' : ''}> Qeydiyyat № : (dəyişdirilsin)</label>
        <div class="toolbar" style="gap:6px"><input class="input" id="a_ref" value="${esc(f.Edit_Referens)}"><button class="btn secondary" id="a_new">...</button></div>
        <div class="actions"><button class="btn" id="a_ok">Qəbul</button><button class="btn secondary" id="a_no">Imtina</button></div>`, 5);
      const q = (id) => w.querySelector('#' + id);
      q('a_ref').oninput = () => { q('a_ref').value = q('a_ref').value.replace(/[^a-zA-Z0-9]/g, ''); };
      const grp = () => { q('a_ref').disabled = q('a_new').disabled = !q('a_c2').checked; }; q('a_c2').onchange = grp; grp();
      q('a_new').onclick = async () => { const r = await call('/batch/accept-form/ref'); if (r) q('a_ref').value = r.Edit_Referens; };
      q('a_no').onclick = async () => { w.remove(); const r = await call('/batch/accept-form', { ok: false }); if (r) { Object.assign(st.d, r); draw(); } };
      q('a_ok').onclick = async () => { const r = await call('/batch/accept-form', { ok: true, CheckBox1: q('a_c1').checked, CheckBox2: q('a_c2').checked, Edit_Referens: q('a_ref').value });
        if (!r) return; w.remove(); if (r.warning) toast(K(r.warning.replace('xohks.', '')), 'error'); Object.assign(st.d, r); draw(); };
    }
    function verifyForm(f) {   // Verifying.pas Tverify 'Verification'
      const w = layer(`<h3>Verification</h3><p>№ <b>${esc(f.DBEdit4)}</b></p><label>${esc(K('ver_amount'))} <input class="input" id="vf_e1"></label>
        <div class="actions"><button class="btn" id="vf_ok">Təsdiq et</button><button class="btn secondary" id="vf_x">Çıx</button></div>`, 5);
      const q = (id) => w.querySelector('#' + id);
      const fin = async (edit1) => { const r = await call('/batch/verify/confirm', { edit1 }); w.remove();
        if (r) { if (r.verified === false) toast(K('ver_mismatch'), 'error'); Object.assign(st.d, r); draw(); } };
      q('vf_ok').onclick = () => fin(q('vf_e1').value); q('vf_x').onclick = () => fin(null);
    }
    const fld = (id, label, val, ro, w) => `<label style="display:flex;flex-direction:column;font-size:12px;min-width:${w || 140}px">${esc(label)}<input class="input" id="${id}" value="${esc(val ?? '')}" ${ro ? 'readonly' : ''}></label>`;
    function transForm(t0) {
      let t = t0;
      const w = layer('<div id="tf"></div>', 1);
      const close = async () => { const r = await call('/tx/close'); w.remove(); if (r) { Object.assign(st.d, r); draw(); } };
      const fields = () => ({ client_name: w.querySelector('#tf_name').value, client_code: w.querySelector('#tf_code').value,
        client_voen: w.querySelector('#tf_voen').value, ref: w.querySelector('#tf_ref').value, valute: +w.querySelector('#tf_val').value,
        radio: (w.querySelector('input[name=tf_rb]:checked') || {}).value });
      function render() {
        w.querySelector('#tf').innerHTML = `<h3>${esc(K(t.batchs_edit ? 'tf_title_edit' : 'tf_title'))} #${esc(t.new_id)}</h3>
          <div style="display:flex;gap:12px;margin-bottom:6px">${['RB_102', 'RB_102T', 'MT205'].map(r => `<label><input type="radio" name="tf_rb" value="${r}" ${t.radio === r ? 'checked' : ''}> ${esc(K('rb_' + r))}</label>`).join('')}
            <span class="muted">${esc(t.edit8)}</span></div>
          <fieldset class="card"><legend>${esc(K('tf_sender'))}</legend><div style="display:flex;flex-wrap:wrap;gap:8px">
            ${fld('tf_kli', K('tf_kli'), t.kli_id, false, 100)}
            <label style="display:flex;flex-direction:column;font-size:12px">${esc(K('tf_acc'))}<select class="input" id="tf_acc"><option value=""></option>${t.accounts.map(a => `<option value="${a.id}" ${t.acc_id === a.id || t.acc_no === a.acc_no ? 'selected' : ''}>${esc(a.acc_no)}</option>`).join('')}</select></label>
            ${fld('tf_name', K('tf_name'), t.client_name, false, 260)}${fld('tf_code', K('tf_code'), t.client_code, false, 80)}${fld('tf_voen', K('tf_voen'), t.client_voen, false, 120)}
            <label style="display:flex;flex-direction:column;font-size:12px">${esc(K('tf_val'))}<select class="input" id="tf_val">${t.valutes.map(x => `<option value="${x.valute}" ${+t.valute === +x.valute ? 'selected' : ''}>${esc(x.valu_name)}</option>`).join('')}</select></label>
            <span class="muted" id="tf_fil" style="align-self:end">${esc(t.filial_label)}</span></div></fieldset>
          <fieldset class="card"><legend>${esc(K('tf_bank'))}</legend><div style="display:flex;flex-wrap:wrap;gap:8px">
            ${fld('tf_bc', K('bank_code'), t.bank.bank_code, true, 90)}${fld('tf_bv', K('tf_voen'), t.bank.voen, true, 110)}${fld('tf_snd', K('tf_snd'), t.bank.sender, true, 120)}
            ${fld('tf_bik', 'BIK', t.bank.bik, true, 100)}${fld('tf_ba', K('bank_acc'), t.bank.account, true, 240)}${fld('tf_bs', K('bank_sub'), t.bank.account_sub, true, 240)}</div></fieldset>
          <div style="display:flex;flex-wrap:wrap;gap:8px;align-items:end;margin-top:6px">
            ${fld('tf_ref', K('ref'), t.ref, false, 160)}<button class="btn secondary" id="tf_newref" ${t.ref_enabled ? '' : 'disabled'}>${esc(K('new_ref'))}</button>
            ${fld('tf_amt', K('amount'), t.amount_text, true, 120)}${fld('tf_bnf', 'BNF', t.bnf, true, 90)}${fld('tf_date', K('date'), t.date || st.d.use_date || '', true, 110)}</div>
          <div class="actions"><button class="btn secondary" id="tf_add" ${t.add_enabled ? '' : 'disabled'}>${esc(K('tf_add'))}</button>
            <button class="btn" id="tf_post" ${t.post_enabled ? '' : 'disabled'}>${esc(K('tf_post'))}</button><button class="btn secondary" id="tf_cancel">${esc(K('cancel'))}</button></div>`;
        const q = (id) => w.querySelector('#' + id);
        q('tf_kli').onkeydown = async (e) => { if (e.key !== 'Enter') return; const r = await call('/tx/customer', { kli_id: q('tf_kli').value }); if (r) { t = r; render(); } };
        q('tf_acc').onchange = async () => { if (!q('tf_acc').value) return; const r = await call('/tx/account', { acc_id: +q('tf_acc').value }); if (r) { t = r; render(); } };
        q('tf_newref').onclick = async () => { const r = await call('/tx/ref', { fields: fields() }); if (r) { t = r; render(); } };
        q('tf_add').onclick = async () => { const r = await call('/pd/open-tx', { fields: fields() }); if (r) payForm(r, (nt) => { if (nt) { t = nt; render(); } else w.remove(); }); };
        q('tf_post').onclick = async () => { const r = await call('/tx/post', { fields: fields() }); if (r) { w.remove(); Object.assign(st.d, r); draw(); toast(K('saved'), 'success'); } };
        q('tf_cancel').onclick = close;
      }
      render();
    }
    function payForm(p0, back) {
      let p = p0, lk = null;
      const w = layer('<div id="pf"></div>', 2);
      const fields = () => { const q = (id) => w.querySelector('#' + id); const f = {
        bank_id: q('pf_bank').value === '' ? null : +q('pf_bank').value, account_sub: q('pf_sub').value, client_acc_no: q('pf_acc').value,
        client_name: q('pf_name').value, client_code: q('pf_code').value, client_voen: q('pf_voen').value,
        tey: [1, 2, 3, 4].map(i => q('pf_t' + i).value), inf: [1, 2, 3].map(i => q('pf_i' + i).value),
        trans_code: q('pf_tc').value, valute: +q('pf_val').value, ref: q('pf_ref').value, amount: q('pf_amt').value };
        if (p.radio === 'RB_102T') { ['institution', 'budgetlevel', 'destination'].forEach(k => { const e = q('pf_' + k); if (e && e.value !== '') f[k] = e.value; }); delete f.bank_id; }
        return f; };
      const done = (r) => { w.remove(); if (back) back(r && r.tx_closed ? null : r && r.tx); if (r && r.batchs) { Object.assign(st.d, r); draw(); } else if (!back && st.cur) draw(); };
      async function render() {
        if (p.radio === 'RB_102T' && !lk) lk = await call('/pd/lookups-102t', undefined, 'GET');
        const ro = p.locked;
        const sel = (id, list, val, key, lab) => `<select class="input" id="${id}"><option value=""></option>${(list || []).map(o => `<option value="${esc(o[key])}" ${String(val) === String(o[key]) ? 'selected' : ''}>${esc(o[lab])}</option>`).join('')}</select>`;
        w.querySelector('#pf').innerHTML = `<h3>${esc(K('pf_title_' + (p.mode || 'tx')))}</h3>
          <fieldset class="card"><legend>${esc(K('pf_self'))}</legend><div style="display:flex;flex-wrap:wrap;gap:8px">
            ${fld('pf_sb', K('bank'), p.self.bank, true, 200)}${fld('pf_sbik', 'BIK', p.self.bik, true, 100)}${fld('pf_sc', K('bank_code'), p.self.code, true, 90)}
            ${fld('pf_sa', K('bank_acc'), p.self.account, true, 240)}${fld('pf_sv', K('tf_voen'), p.self.voen, true, 110)}</div></fieldset>
          <fieldset class="card"><legend>${esc(K('pf_rec_bank'))}</legend><div style="display:flex;flex-wrap:wrap;gap:8px;align-items:end">
            <label style="display:flex;flex-direction:column;font-size:12px">${esc(K('bank'))}<select class="input" id="pf_bank" ${ro || p.radio === 'RB_102T' ? 'disabled' : ''}><option value=""></option>${p.banks.map(b => `<option value="${b.id}" ${String(p.bank_id) === String(b.id) ? 'selected' : ''}>${esc(b.name)}</option>`).join('')}</select></label>
            ${fld('pf_bc', K('bank_code'), p.bank_code, true, 90)}${fld('pf_bik', 'BIK', p.bik, true, 100)}${fld('pf_ba', K('bank_acc'), p.bank_account, true, 240)}
            ${fld('pf_bv', K('tf_voen'), p.bank_voen, true, 110)}${fld('pf_sub', K('bank_sub'), p.account_sub, ro, 240)}</div></fieldset>
          <fieldset class="card"><legend>${esc(K('pf_rec'))}</legend><div style="display:flex;flex-wrap:wrap;gap:8px">
            ${p.radio === 'RB_102T' && lk ? `<label style="display:flex;flex-direction:column;font-size:12px">${esc(K('pf_inst'))}${sel('pf_institution', lk.institution, '', 'id', 'description')}</label>
              <label style="display:flex;flex-direction:column;font-size:12px">${esc(K('pf_blevel'))}${sel('pf_budgetlevel', lk.budgetlevel, '', 'id', 'description')}</label>
              <label style="display:flex;flex-direction:column;font-size:12px">${esc(K('pf_dest'))}${sel('pf_destination', lk.destination, '', 'id', 'description')}</label>` : ''}
            ${fld('pf_acc', K('pf_acc'), p.client_acc_no, ro || p.radio === 'RB_102T', 260)}${fld('pf_name', K('tf_name'), p.client_name, ro || p.radio === 'RB_102T', 260)}
            ${fld('pf_code', K('tf_code'), p.client_code, ro || p.radio === 'RB_102T', 80)}${fld('pf_voen', K('tf_voen'), p.client_voen, ro || p.radio === 'RB_102T', 120)}</div></fieldset>
          <fieldset class="card"><legend>${esc(K('pf_purpose'))}</legend><div style="display:flex;flex-wrap:wrap;gap:8px">
            ${[0, 1, 2, 3].map(i => fld('pf_t' + (i + 1), K('pf_tey') + ' ' + (i + 1), p.tey[i], ro, 220)).join('')}
            ${[0, 1, 2].map(i => fld('pf_i' + (i + 1), K('pf_inf') + ' ' + (i + 1), p.inf[i], ro, 220)).join('')}</div></fieldset>
          <div style="display:flex;flex-wrap:wrap;gap:8px;align-items:end;margin-top:6px">
            ${fld('pf_ref', K('ref'), p.ref, ro, 140)}<button class="btn secondary" id="pf_newref" ${ro ? 'disabled' : ''}>${esc(K('new_ref'))}</button>
            ${fld('pf_amt', K('amount'), p.amount, ro, 110)}${fld('pf_tc', K('pf_tc'), p.trans_code, ro, 70)}<button class="btn secondary" id="pf_tcb" ${ro ? 'disabled' : ''} title="TTransCodeForm">...</button>
            <label style="display:flex;flex-direction:column;font-size:12px">${esc(K('tf_val'))}<select class="input" id="pf_val" ${ro ? 'disabled' : ''}>${p.valutes.map(x => `<option value="${x.valute}" ${+p.valute === +x.valute ? 'selected' : ''}>${esc(x.val_name)}</option>`).join('')}</select></label></div>
          <div class="actions">
            ${p.radio !== 'RB_102T' ? `<button class="btn secondary" id="pf_tpl" ${ro ? 'disabled' : ''}>${esc(K('pf_tpl_load'))}</button><button class="btn secondary" id="pf_tsave" ${p.template_saved_enabled && !ro ? '' : 'disabled'}>${esc(K('pf_tpl_save'))}</button>` : ''}
            ${p.add_visible ? `<button class="btn secondary" id="pf_add" ${ro ? 'disabled' : ''}>${esc(K('pf_add'))}</button>` : ''}
            <button class="btn" id="pf_fin" ${p.finish_enabled ? '' : 'disabled'}>${esc(K(p.mode === 'edit' ? 'pf_save' : 'pf_finish'))}</button>
            <button class="btn secondary" id="pf_close">${esc(K('close'))}</button></div>`;
        const q = (id) => w.querySelector('#' + id);
        if (q('pf_bank')) q('pf_bank').onchange = async () => { if (q('pf_bank').value === '') return; const r = await call('/pd/bank', { bank_id: +q('pf_bank').value }); if (r) { p = r; render(); } };
        q('pf_newref').onclick = async () => { const r = await call('/pd/ref'); if (r) { p = r; render(); } };
        q('pf_tcb').onclick = () => treeForm((code) => { q('pf_tc').value = code; });       // SpeedButton1Click
        if (q('pf_add')) q('pf_add').onclick = async () => { const r = await call('/pd/add', { fields: fields() }); if (r) { p = r; render(); toast(K('added'), 'success'); } };
        q('pf_fin').onclick = async () => { const r = await call('/pd/finish', { fields: fields() }); if (r && r.closed) done(r); else if (r) { p = r; render(); } };
        q('pf_close').onclick = async () => { const r = await call('/pd/close'); done(r); };
        if (q('pf_tsave')) q('pf_tsave').onclick = async () => { const r = await call('/shablon/save', { fields: fields() }); if (r) { p = r; render(); toast(K('tpl_saved'), 'success'); } };
        if (q('pf_tpl')) q('pf_tpl').onclick = () => tplForm((r) => { p = r; render(); });
        w.querySelectorAll('input:not([readonly])').forEach(i => i.addEventListener('input', () => {
          if (p.mode === 'edit' && i.id !== 'pf_acc' && !p.locked) { p.finish_enabled = true; q('pf_fin').disabled = false; } }));   // OnChange -> ButtonFinish enabled
      }
      render();
    }
    async function tplForm(onPick) {
      // TForm_get_to_shablon: ODS_shablon grid, title click = order by FieldName, double click / 'Seç' = pick, 'Sil' = delete
      const cols = ['MEBLEG', 'ODENISH_KOD', 'BANKIN_KODU', 'HESAB_NO', 'ADI', 'VOEN', 'OD_TEY1', 'SHABLONUN_ADI', 'ODENISH'];
      let rows = (await call('/shablon/list', {}) || {}).rows || [], cur = rows[0];
      const w = layer('<div id="tp"></div>', 3);
      function render() {
        w.querySelector('#tp').innerHTML = `<h3>${esc(K('tpl_title'))}</h3><div class="tablewrap" style="max-height:50vh"><table class="grid acc-grid" id="g_tp"><thead><tr>${cols.map(c => `<th data-f="${c}" style="cursor:pointer">${esc(c)}</th>`).join('')}</tr></thead>
          <tbody>${rows.map((r, i) => `<tr data-i="${i}" class="${r === cur ? 'sel' : ''}">${cols.map(c => `<td>${esc(r[c.toLowerCase()] ?? '')}</td>`).join('')}</tr>`).join('') || `<tr><td colspan="${cols.length}" class="muted">${esc(K('empty'))}</td></tr>`}</tbody></table></div>
          <div class="actions"><button class="btn" id="tp_pick">${esc(K('tpl_pick'))}</button><button class="btn secondary" id="tp_del">${esc(K('tpl_del'))}</button><button class="btn secondary" id="tp_close">${esc(K('close'))}</button></div>`;
        const q = (id) => w.querySelector('#' + id);
        w.querySelectorAll('th[data-f]').forEach(h => h.onclick = async () => { const r = await call('/shablon/list', { field: h.dataset.f }); if (r) { rows = r.rows; cur = rows[0]; render(); } });
        const pick = async () => { if (!cur) return; const r = await call('/shablon/pick', { name: cur.shablonun_adi }); if (r) { w.remove(); onPick(r); } };
        w.querySelectorAll('tbody tr[data-i]').forEach(tr => { tr.onclick = () => { cur = rows[+tr.dataset.i]; render(); }; tr.ondblclick = pick; });
        q('tp_pick').onclick = pick;
        q('tp_del').onclick = async () => { if (!cur) return; const r = await call('/shablon/delete', { name: cur.shablonun_adi }); if (r) { rows = r.rows; cur = rows[0]; render(); } };
        q('tp_close').onclick = () => w.remove();
      }
      render();
    }
    async function treeForm(onOk) {
      // TransTypeUnit.pas TTransCodeForm: tree of XS_transtype_name / xs_transtype_code built by createTransCodeTree (Mt102Insert),
      // all nodes collapsed; OK / double click only accept a child node (ImageIndex 2) -> Edit_TransCode := StateIndex
      const r = await call('/transcode/tree', undefined, 'GET'); if (!r) return;
      let sel = null;
      const w = layer(`<h3>${esc(K('tc_title'))}</h3><div class="tablewrap" style="max-height:55vh;min-width:360px" id="tc_t">
        ${r.tree.length ? r.tree.map((n, i) => `<details data-i="${i}"><summary class="tc-n" data-p="${i}">${esc(n.text)}</summary>
          ${n.children.map((c, j) => `<div class="tc-n" data-p="${i}" data-c="${j}" style="padding-left:24px;cursor:pointer">${esc(c.text)}</div>`).join('')}</details>`).join('')
          : `<p class="muted">${esc(K('empty'))}</p>`}</div>
        <div class="actions"><button class="btn" id="tc_ok">OK</button><button class="btn secondary" id="tc_x">${esc(K('cancel'))}</button></div>`, 6);
      const ok = async () => { const res = await call('/transcode/ok', { node: sel }); if (res && res.closed) { w.remove(); onOk(res.trans_code); } };
      w.querySelectorAll('.tc-n').forEach(e => { e.addEventListener('click', () => {
        w.querySelectorAll('.tc-n').forEach(x => x.classList.remove('sel')); e.classList.add('sel');
        const n = r.tree[+e.dataset.p]; sel = e.dataset.c != null ? n.children[+e.dataset.c] : { text: n.text, image: n.image }; });
        e.addEventListener('dblclick', ok); });
      w.querySelector('#tc_ok').onclick = ok; w.querySelector('#tc_x').onclick = () => w.remove();
    }
    const dl = (f) => { const b = Uint8Array.from(atob(f.b64), c => c.charCodeAt(0)); const a = document.createElement('a');
      a.href = URL.createObjectURL(new Blob([b], { type: 'application/xml' })); a.download = f.name; document.body.appendChild(a); a.click(); a.remove(); };
    const PFC = [['ID', '№'], ['TRANSDATE', 'Tarix'], ['ACC_NO', 'Debet'], ['VAL_NAME', '$'], ['AMOUNT', 'Debet Məbləğ'], ['TRANS_REF', 'Qeydiyyat №']];
    function pfForm(d0) {
      // PrepareFile_Unit.pas TPrepareFile_Form 'Faylın yaradılması'
      let d = d0, curR = null, curS = null;
      const w = layer('<div id="pf_"></div>', 4);
      const grid = (id, rows) => `<table class="grid acc-grid" id="${id}"><thead><tr>${PFC.map(([f, c]) => `<th data-c="${esc(c)}" style="cursor:pointer">${esc(c)}</th>`).join('')}</tr></thead><tbody>
        ${rows.map((r, i) => `<tr data-i="${i}">${PFC.map(([f]) => `<td>${esc(r[f.toLowerCase()] ?? '')}</td>`).join('')}</tr>`).join('') || `<tr><td colspan="${PFC.length}" class="muted">${esc(K('empty'))}</td></tr>`}</tbody></table>`;
      const take = (r) => { if (!r) return; if (r.warning) toast(t(r.warning, r), 'error'); d = Object.assign({}, d, r, { pf: Object.assign({}, d.pf, r.pf || {}) }); render(); };
      function render() {
        const f = d.pf;
        w.querySelector('#pf_').innerHTML = `<h3>Faylın yaradılması</h3>
          <div style="display:flex;flex-wrap:wrap;gap:8px">${fld('pf_snd', 'Göndərən İştrakçı:', f.Edit_sender, true, 160)}${fld('pf_rcv', 'Alan İştrakçı:', f.Edit_receiver, true, 160)}
            <label style="display:flex;flex-direction:column;font-size:12px;min-width:200px">Ümumi faylın qeydiyyat №:<span style="display:flex;gap:4px"><input class="input" id="pf_ref" value="${esc(f.Edit_reference)}"><button class="btn secondary" id="pf_newr">...</button></span></label>
            ${fld('pf_typ', 'Faylın Tipi:', f.Edit1, true, 80)}${fld('pf_cnt', 'Paket ödənişlərin sayı:', f.Edit_count, true, 120)}${fld('pf_amt', 'Məbləğ:', String(f.CurrencyEdit1 ?? 0), true, 120)}</div>
          <div style="display:grid;grid-template-columns:1fr auto 1fr;gap:8px;align-items:center;margin-top:8px">
            <div class="tablewrap" style="max-height:40vh">${grid('pf_ready', d.ready)}</div>
            <div style="display:flex;flex-direction:column;gap:6px"><button class="btn secondary" id="pf_to" title="But_tosend">&gt;</button><button class="btn secondary" id="pf_all" title="All_to_send">&gt;&gt;</button>
              <button class="btn secondary" id="pf_no" title="But_noSend">&lt;</button><button class="btn secondary" id="pf_noall" title="All_to_Nosend">&lt;&lt;</button></div>
            <div class="tablewrap" style="max-height:40vh">${grid('pf_send', d.sending)}</div></div>
          <div class="actions"><button class="btn" id="pf_mk">XML Faylını yarat</button><button class="btn secondary" id="pf_x">Çıxış</button></div>`;
        const q = (id) => w.querySelector('#' + id);
        const pick = (gid, rows, set) => { const tb = q(gid); tb.querySelectorAll('tbody tr[data-i]').forEach(tr => tr.onclick = () => {
          tb.querySelectorAll('tr.sel').forEach(x => x.classList.remove('sel')); tr.classList.add('sel'); set(rows[+tr.dataset.i]); });
          const i = Math.max(0, rows.findIndex(r => r === (gid === 'pf_ready' ? curR : curS))); const tr = tb.querySelector(`tbody tr[data-i="${i}"]`);
          if (tr) { tr.classList.add('sel'); set(rows[i]); } else set(null); };
        pick('pf_ready', d.ready, (r) => { curR = r; }); pick('pf_send', d.sending, (r) => { curS = r; });
        q('pf_ready').querySelectorAll('th').forEach(h => h.onclick = async () => take(await call('/pf/sort', { caption: h.dataset.c })));
        q('pf_ref').oninput = async () => { const r = await call('/pf/set-ref', { ref: q('pf_ref').value }); if (r) { d.pf.Edit_reference = r.Edit_reference; q('pf_ref').value = r.Edit_reference; } };
        q('pf_newr').onclick = async () => { const r = await call('/pf/ref'); if (r) { d.pf.Edit_reference = r.Edit_reference; render(); } };
        q('pf_to').onclick = async () => take(await call('/pf/tosend', { id: curR ? curR.id : null }));
        q('pf_all').onclick = async () => take(await call('/pf/tosend', { id: curR ? curR.id : null, all: true }));
        q('pf_no').onclick = async () => take(await call('/pf/nosend', { id: curS ? curS.id : null }));
        q('pf_noall').onclick = async () => take(await call('/pf/nosend', { all: true }));
        q('pf_mk').onclick = async () => { const r = await call('/pf/create'); if (!r) return;
          if (r.file) { dl(r.file); toast(K('pf_created').replace('{name}', r.file.name), 'success'); if (r.batchs) { st.d.batchs = r.batchs; } } take(r); };
        q('pf_x').onclick = async () => { await call('/pf/close'); w.remove(); draw(); };
      }
      render();
    }
    async function sentForm() {
      // FileSend_Unit.pas TSendFileForm 'Sent File': both pickers = today, RefDate; DblClick opens the file
      const today = new Date().toISOString().slice(0, 10);   // DateTimePicker1/2.Date := date
      let beg = today, end = today, rows = [];
      const w = layer('<div id="sf"></div>', 4);
      async function load() { const r = await call('/sent/list', { beg, end }); rows = r ? r.rows : []; render(); }
      function render() {
        w.querySelector('#sf').innerHTML = `<h3>Sent File</h3><div class="toolbar" style="gap:8px;align-items:center">
            <input type="date" class="input" id="sf_b" value="${beg}"> -dən <input type="date" class="input" id="sf_e" value="${end}"> -dək
            <button class="btn secondary" id="sf_r">Yenilə</button></div>
          <div class="tablewrap" style="max-height:50vh"><table class="grid acc-grid" id="g_sf"><thead><tr><th>№</th><th></th><th>Qeydiyyat №</th><th>Tip(MT150)</th><th>Tarix</th></tr></thead><tbody>
          ${rows.map((r, i) => `<tr data-i="${i}" style="cursor:pointer"><td>${esc(r.id)}</td><td>${+r.batchfile === 0 ? '<img src="/img/xohks/status_5.png" width="16" height="16" alt="">' : esc(r.user_reference ?? '')}</td>
            <td>${esc(r.user_reference ?? '')}</td><td>${esc(r.type ?? '')}</td><td>${esc(r.create_date ?? '')}</td></tr>`).join('') || `<tr><td colspan="5" class="muted">${esc(K('empty'))}</td></tr>`}</tbody></table></div>
          <div class="actions"><button class="btn secondary" id="sf_x">Çıxış</button></div>`;
        const q = (id) => w.querySelector('#' + id);
        q('sf_r').onclick = () => { beg = q('sf_b').value; end = q('sf_e').value; load(); };
        q('sf_x').onclick = () => w.remove();
        q('g_sf').querySelectorAll('tbody tr[data-i]').forEach(tr => tr.ondblclick = async () => {
          const r = await call('/sent/open', { rec: rows[+tr.dataset.i] }); if (!r) return;
          if (r.file) dl(r.file); else if (r.warning) toast(K('err_file_not_found').replace('{name}', r.file_name), 'error'); });
      }
      load();
    }
    function drawIn() {
      // Step 4 (api/app/xohks_in.py): Faylı yüklə (one uploaded file = the only FileListIncoming item), Convert / Convert All
      // (popup of the file list), Konvert, Konvert+təsdiq, Yoxlanıb (Form20 'Verification' first), Ləğv et.
      const files = st.inFiles || [];
      v('xbody').innerHTML = `<div class="toolbar" style="gap:8px;flex-wrap:wrap">
        <label class="btn secondary" style="cursor:pointer">${esc(K('in_load'))}<input type="file" id="x_ifile" style="display:none"></label>
        <button class="btn" id="x_iconv">${esc(K('in_convert'))}</button><button class="btn secondary" id="x_iconvacc">${esc(K('in_convert_accept'))}</button>
        <button class="btn secondary" id="x_iacc">${esc(K('in_accept'))}</button><button class="btn secondary" id="x_idel">${esc(K('in_delete'))}</button>
        <button class="btn secondary" id="x_iref">${esc(K('refresh'))}</button></div>
        <div style="display:flex;gap:12px;align-items:flex-start">
        <fieldset class="card" style="margin:8px 0;padding:8px 12px;min-width:220px"><legend>${esc(K('in_files'))}</legend>
          <div id="x_flist">${files.map(f => `<div class="sel" data-f="${esc(f)}">${esc(f)}</div>`).join('') || `<span class="muted">${esc(K('empty'))}</span>`}</div>
          <div class="toolbar" style="gap:6px;margin-top:6px"><button class="btn secondary" id="x_c1" ${files.length ? '' : 'disabled'}>Convert</button>
          <button class="btn secondary" id="x_call" ${files.length ? '' : 'disabled'}>Convert All</button>
          <button class="btn secondary" id="x_fclr" ${files.length ? '' : 'disabled'}>${esc(K('in_clear'))}</button></div></fieldset>
        <div style="flex:1;min-width:0">${st.inInfo ? `<div class="card" id="x_info" style="padding:6px 10px">${st.inInfo.map(x => `<div>${esc(x)}</div>`).join('')}</div>` : ''}
        ${box(K('box_in'), table('g_i', C.inc, st.d.incoming, true), 60)}</div></div>`;
      const set = (r) => { if (r) { st.d.incoming = r.rows; draw(); } return r; };
      const go = async (body) => set(await call('/in/list', body || { caption: '\u0000' }));
      v('x_iref').onclick = () => go(null);
      v('g_i').querySelectorAll('th').forEach(h => h.onclick = () => go({ caption: h.dataset.c }));
      let cur = null;
      selectable(v('g_i'), st.d.incoming, (r) => { cur = r; });
      const selIds = () => [...v('g_i').querySelectorAll('tbody tr.msel')].map(tr => st.d.incoming[+tr.dataset.i]).filter(Boolean).map(r => r.id);
      v('x_ifile').onchange = async (ev) => {
        const f = ev.target.files[0]; if (!f) return;
        const b64 = await new Promise(res => { const fr = new FileReader(); fr.onload = () => res(String(fr.result).split(',')[1] || ''); fr.readAsDataURL(f); });
        const r = await call('/in/load', { name: f.name, b64 }); if (r) { st.inFiles = r.files; st.inInfo = null; draw(); }
      };
      v('x_fclr').onclick = async () => { const r = await call('/in/clear', {}); if (r) { st.inFiles = r.files; draw(); } };
      const conv = async (all) => {
        const r = await call('/in/convert', { all }); if (!r) return null;
        st.inInfo = r.warnings.length ? r.warnings : null;            // Panel_info / Info_ListBox
        if (r.error) toast(r.error, 'error');
        set(r); return r;
      };
      const accept = async (all) => {
        const p = await call('/in/accept/prepare', { current: cur ? cur.id : null }); if (!p) return;
        await new Promise(res => {                                     // Unit20.pas TForm20 'Verification' (Yoxla = Close)
          const w = layer(`<h3>Verification</h3><input class="input" readonly value="${esc(p.edit1)}"><br><input class="input" readonly value="${esc(p.edit2)}">
            <div class="actions"><button class="btn" data-b>Yoxla</button></div>`, 5);
          w.querySelector('[data-b]').onclick = () => { w.remove(); res(); };
        });
        const sel = all ? st.d.incoming.map(r => r.id) : selIds();
        set(await call('/in/accept', { current: cur ? cur.id : (st.d.incoming[0] || {}).id, selected: sel }));
      };
      v('x_c1').onclick = () => conv(false);
      v('x_call').onclick = v('x_iconv').onclick = () => conv(true);
      v('x_iconvacc').onclick = async () => { if (await conv(true)) { cur = st.d.incoming[0] || null; await accept(true); } };  // ConvertConfirmeClick: MessageInSelAll + Accept
      v('x_iacc').onclick = () => accept(false);
      v('x_idel').onclick = async () => {
        const pl = await call('/in/delete/plan', { current: cur ? cur.id : null, selected: selIds() }); if (!pl || !pl.ids.length) return;
        const a = await ask(K('q_in_del').replace('{id}', pl.ids[0]), ['yes', 'no', 'cancel', 'all']);
        let conf = false;
        if (a === 'all') conf = await ask(K('q_del_all').replace('{n}', pl.ids.length), ['yes', 'no']) === 'yes';
        const r = await call('/in/delete', { ids: pl.ids, answer: a, confirm_all: conf });
        if (r && r.error) toast(r.error, 'error');
        set(r);
      };
    }
    function drawOarch() {
      const a = st.oa || { batchs: [], sum_text: '' };
      v('xbody').innerHTML = `<div class="toolbar" style="gap:8px;align-items:center">
        <label>${esc(K('from'))} <input type="date" class="input" id="x_ab" value="${st.oab}"></label>
        <label>${esc(K('to'))} <input type="date" class="input" id="x_ae" value="${st.oae}"></label>
        <button class="btn secondary" id="x_aref">${esc(K('refresh'))}</button>
        <span>${esc(K('sum'))}: <b id="x_asum">${esc(a.sum_text)}</b></span>
        <label>${esc(K('filial'))} <input class="input" readonly id="x_fil"></label></div>
        ${box(K('box_batchs'), table('g_ab', C.batchs, a.batchs, true))}${box(K('box_benef'), '<div id="xab"></div>')}`;
      v('x_aref').onclick = async () => { st.oab = v('x_ab').value; st.oae = v('x_ae').value;
        const r = await call('/out-archive', { beg: st.oab, end: st.oae }); if (r) { st.oa = r; draw(); } };
      v('g_ab').querySelectorAll('th').forEach(h => h.onclick = async () => {
        if (!st.oa) return; const r = await call('/out-archive/sort', { caption: h.dataset.c }); if (r) { st.oa = r; draw(); } });
      selectable(v('g_ab'), a.batchs, (r) => benef('xab', r, true));
    }
    function drawIarch() {
      const a = st.ia || { rows: [], sum_text: '' }, f = st.iaf || {};
      v('xbody').innerHTML = `<div class="toolbar" style="gap:8px;align-items:center">
        <label>${esc(K('from'))} <input type="date" class="input" id="x_ib" value="${st.iab}"></label>
        <label>${esc(K('to'))} <input type="date" class="input" id="x_ie" value="${st.iae}"></label>
        <button class="btn secondary" id="x_iaref">${esc(K('refresh'))}</button>
        <button class="btn secondary" id="x_flt">${esc(K('filter'))}</button>
        <span>${esc(K('sum'))}: <b id="x_isum">${esc(a.sum_text)}</b></span></div>
        <div id="x_panel38" class="card" style="display:${st.p38 ? 'flex' : 'none'};gap:12px;align-items:center;padding:8px">
          <label><input type="checkbox" id="x_c2" ${f.check2 ? 'checked' : ''}> ${esc(K('mark'))}</label>
          <select class="input" id="x_l2">${(st.lk ? st.lk.filials : []).map(o => `<option value="${o.filial_id}" ${f.filial === o.filial_id ? 'selected' : ''}>${esc(o.filial_name)}</option>`).join('')}</select>
          <label><input type="checkbox" id="x_c3" ${f.check3 ? 'checked' : ''}> ${esc(K('mark'))}</label>
          <select class="input" id="x_l3">${(st.lk ? st.lk.codes : []).map(o => `<option value="${o.code}" ${f.code === o.code ? 'selected' : ''}>${esc(o.code)}</option>`).join('')}</select>
          <button class="btn" id="x_apply">${esc(K('apply'))}</button><button class="btn secondary" id="x_p38x">✕</button></div>
        ${box(K('box_in'), table('g_ia', C.inc, a.rows), 55)}`;
      v('x_iaref').onclick = async () => { st.iab = v('x_ib').value; st.iae = v('x_ie').value;
        const r = await call('/in-archive', { beg: st.iab, end: st.iae }); if (r) { st.ia = r; st.iaf = {}; draw(); } };   // CheckBox2/3 unchecked
      v('x_flt').onclick = async () => { st.p38 = !st.p38; if (st.p38 && !st.lk) st.lk = await call('/in-archive/lookups', undefined, 'GET'); draw(); };
      v('x_p38x').onclick = () => { st.p38 = false; draw(); };                                        // SpeedButton1Click
      v('x_apply').onclick = async () => {
        const b = { check2: v('x_c2').checked, filial: v('x_l2').value === '' ? null : +v('x_l2').value,
          check3: v('x_c3').checked, code: v('x_l3').value === '' ? null : +v('x_l3').value };
        const r = await call('/in-archive/filter', b); if (r) { st.ia = r; st.iaf = b; draw(); } };
      selectable(v('g_ia'), a.rows, () => {});
    }
    function draw() {
      if (!st.d) return;
      ({ out: drawOut, in: drawIn, oarch: drawOarch, iarch: drawIarch })[st.tab]();
    }
    const d = await call('/open');
    if (!d) return;
    st.d = d; st.benef_visible = d.beneficiary_visible;
    st.beg = st.end = st.oab = st.oae = st.iab = st.iae = d.use_date;     // StDate/EndDate = GetUseDate; archive pickers = StDate
    draw();
  }
  window.SB.pages['/m/xohks'] = page;
})();

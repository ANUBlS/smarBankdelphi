/* Off-balance chart of accounts editor – port of Packages/Out_balancerefeditx/Ocx (TBalanceRefEditX). DBNavigator + DBGrid +
   edit panel over BalanceDataSet ('select b.*, b.rowid from OUT_bal_sprN b'); DML runs in api/app/out_balrefedit.py. */
(function () {
  const { api, t, esc, toast } = window.SB;
  const P = '/api/out-balrefedit', K = (k) => t('out_balrefedit.' + k);
  // DBGrid1 columns (BalanceRefEditImpl1.dfm:262-392). QROUP / KLAS are not dataset fields -> always empty, as in Delphi.
  const COLS = ['BAL_CN', 'BALNAME', 'TYPEID_NAME', 'ADDITIONALTYPEID_NAME', 'SALDO_NAME', 'RATEDIFFERENCE_NAME', 'PART', 'QROUP', 'KLAS', 'CURRENCYPOSITION'];
  const TYPES = ['Aktiv', 'Passiv', 'Aktiv-Passiv'];                    // ComboBoxTYPEID_NAME / ADDITIONALTYPEID items
  const CURPOS = [0, 1, 2, 3];                                         // CmbBoxCurrPosition items (locale keys curpos_0..3)
  const errT = (e) => t(e.key || 'error.generic', e) + (e.field ? ' (' + e.field + ')' : '') + (e.ora ? ' ' + e.ora : '');
  async function page(el) {
    const st = { plan: 0, rows: [], i: 0, mode: 'browse' };
    el.innerHTML = `<div class="card"><div class="toolbar" style="gap:6px;flex-wrap:wrap">
      <h2 style="margin:0 12px 0 0">${esc(K('title'))}</h2>
      <span class="nav">${['first', 'prior', 'next', 'last', 'insert', 'delete', 'edit', 'post', 'cancel', 'refresh'].map(n =>
        `<button class="btn secondary sm" id="n_${n}" title="${esc(K('nav_' + n))}">${esc(K('nav_' + n))}</button>`).join('')}</span>
      <label class="field" style="margin-left:auto"><span>${esc(K('plans'))}</span><select id="bp">${[0, 1, 2, 3].map(i => `<option value="${i}">${esc(K('plan_' + i))}</option>`).join('')}</select></label>
      <label class="field"><span>${esc(K('search'))}</span><input id="bs" placeholder="BAL_CN"></label></div>
      <div style="display:grid;grid-template-columns:minmax(0,3fr) minmax(280px,1fr);gap:14px;margin-top:8px">
      <div class="tablewrap" style="max-height:66vh" id="bg"></div><form id="bf" class="card" style="margin:0" autocomplete="off"></form></div></div>`;
    const v = (id) => el.querySelector('#' + id);
    const cur = () => st.rows[st.i];
    function grid() {
      v('bg').innerHTML = `<table class="grid acc-grid"><thead><tr>${COLS.map(c => `<th>${esc(K("c_" + c))}</th>`).join('')}</tr></thead><tbody>${st.rows.map((r, i) =>
        `<tr data-i="${i}" class="${i === st.i ? 'sel' : ''}">${COLS.map(c => `<td>${esc(r[c.toLowerCase()] ?? '')}</td>`).join('')}</tr>`).join('')
        || `<tr><td colspan="${COLS.length}" class="muted">${esc(K('empty'))}</td></tr>`}</tbody></table>`;
      v('bg').querySelectorAll('tr[data-i]').forEach(tr => tr.onclick = () => { if (st.mode !== 'browse') return; st.i = +tr.dataset.i; render(); });
      const s = v('bg').querySelector('tr.sel'); s && s.scrollIntoView({ block: 'nearest' });
    }
    function form() {
      const r = st.mode === 'insert' ? {} : (cur() || {}), ro = st.mode === 'browse' ? 'disabled' : '';
      const opt = (sel, list, base) => `<option value=""></option>` + list.map((x, i) => `<option value="${i + base}" ${sel === i + base ? 'selected' : ''}>${esc(x)}</option>`).join('');
      v('bf').innerHTML = `<h3 style="margin-top:0">${esc(K('edit_box'))}${st.mode !== 'browse' ? ' · ' + esc(K('mode_' + st.mode)) : ''}</h3>
        <label class="field"><span>${esc(K('f_bal_cn'))}</span><input id="f_bal_cn" value="${esc(r.bal_cn ?? '')}" ${ro}></label>
        <label class="field"><span>${esc(K('f_typeid'))}</span><select id="f_typeid" ${ro}>${opt(r.typeid, TYPES, 1)}</select></label>
        <label class="field"><span>${esc(K('f_accgroup'))}</span><input id="f_accgroup" value="${esc(r.accgroup ?? '')}" ${ro}></label>
        <label class="field"><span>${esc(K('f_part'))}</span><input id="f_part" value="${esc(r.part ?? '')}" ${ro}></label>
        <label class="field"><span>${esc(K('f_balname'))}</span><input id="f_balname" maxlength="181" value="${esc(r.balname ?? '')}" ${ro}></label>
        <label class="field"><span>${esc(K('f_additionaltypeid'))}</span><select id="f_additionaltypeid" ${ro}>${opt(r.additionaltypeid, TYPES, 1)}</select></label>
        <label class="field"><span>${esc(K('f_currencyposition'))}</span><select id="f_currencyposition" ${ro}>${CURPOS.map(i =>
          `<option value="${i}" ${(+(r.currencyposition || 0)) === i ? 'selected' : ''}>${esc(K('curpos_' + i))}</option>`).join('')}</select></label>
        <label><input type="checkbox" id="f_saldo" ${+r.saldo === 1 ? 'checked' : ''} ${ro}> ${esc(K('f_saldo'))}</label><br>
        <label><input type="checkbox" id="f_ratedifference" ${+r.ratedifference === 1 ? 'checked' : ''} ${ro}> ${esc(K('f_ratedifference'))}</label>`;
    }
    function render() {
      grid(); form();
      const b = st.mode === 'browse', has = !!cur();
      for (const [n, on] of Object.entries({ first: b && st.i > 0, prior: b && st.i > 0, next: b && st.i < st.rows.length - 1, last: b && st.i < st.rows.length - 1,
        insert: b, delete: b && has, edit: b && has, post: !b, cancel: !b, refresh: b })) v('n_' + n).disabled = !on;
    }
    async function load(keepCn) {
      try { const r = await api(`${P}?plan=${st.plan}`); st.rows = r.rows; } catch (e) { st.rows = []; toast(errT(e), 'error'); }
      const j = keepCn != null ? st.rows.findIndex(x => String(x.bal_cn) === String(keepCn)) : -1;
      st.i = j >= 0 ? j : Math.min(st.i, Math.max(0, st.rows.length - 1)); st.mode = 'browse'; render();
    }
    const body = () => {
      const s = (id) => v(id).value, n = (id) => v(id).value === '' ? null : +v(id).value;
      return { bal_cn: s('f_bal_cn'), typeid: n('f_typeid'), additionaltypeid: n('f_additionaltypeid'), accgroup: s('f_accgroup'),
        part: s('f_part'), balname: s('f_balname'), currencyposition: n('f_currencyposition'),
        saldo: v('f_saldo').checked ? 1 : 0, ratedifference: v('f_ratedifference').checked ? 1 : 0 };
    };
    v('n_first').onclick = () => { st.i = 0; render(); };
    v('n_prior').onclick = () => { st.i = Math.max(0, st.i - 1); render(); };
    v('n_next').onclick = () => { st.i = Math.min(st.rows.length - 1, st.i + 1); render(); };
    v('n_last').onclick = () => { st.i = st.rows.length - 1; render(); };
    v('n_insert').onclick = () => { st.mode = 'insert'; render(); v('f_bal_cn').focus(); };
    v('n_edit').onclick = () => { st.mode = 'edit'; render(); };
    v('n_cancel').onclick = () => { st.mode = 'browse'; render(); };
    v('n_refresh').onclick = () => load(cur() && cur().bal_cn);
    v('n_delete').onclick = async () => {
      if (!confirm(K('confirm_delete'))) return;                       // DBNavigator ConfirmDelete 'Delete record?'
      try { await api(`${P}?plan=${st.plan}&rowid=${encodeURIComponent(cur().rowid)}`, { method: 'DELETE' }); load(); } catch (e) { toast(errT(e), 'error'); }
    };
    v('n_post').onclick = async () => {
      const b = body();
      try {
        if (st.mode === 'insert') await api(`${P}?plan=${st.plan}`, { method: 'POST', body: b });
        else await api(`${P}?plan=${st.plan}&rowid=${encodeURIComponent(cur().rowid)}`, { method: 'PUT', body: b });
        toast(K('saved')); load(b.bal_cn);
      } catch (e) { toast(errT(e), 'error'); }
    };
    v('bp').onchange = () => { st.plan = +v('bp').value; st.i = 0; load(); };          // ComboBoxPlanChange
    v('bs').oninput = () => {                                         // EditSearchChange: Locate('BAL_CN', text, [loCaseInsensitive, loPartialKey])
      const q = v('bs').value.toLowerCase(); if (st.mode !== 'browse') return;
      const j = st.rows.findIndex(r => String(r.bal_cn ?? '').toLowerCase().startsWith(q)); if (j >= 0) { st.i = j; render(); }
    };
    load();
  }
  window.SB.pages['/m/out-balancerefeditx'] = page;
})();

/* Off-balance currencies – port of Packages/out_Avalute (Tout_AvaluteForm). Grid DBGridAvalute_T (OrDS_Avalute_T,
   P_AVALUTE.add_avalute/upd_avalute) + 'Məzənnə fərqi hesabları' (ValuteSettings KREDIT/DEBET). Logic in api/app/out_avalute.py. */
(function () {
  const { api, t, esc, toast } = window.SB;
  const P = '/api/out-avalute', K = (k) => t('out_avalute.' + k);
  const COLS = [['VALUTE', 6, 70], ['VAL_NAME', 10, 80], ['VALU_NAME', 25, 220], ['VALU_SHORT', 10, 90], ['VALU_BALA', 25, 140], ['COUNTRY', 20, 160], ['USING', 4, 70]];
  const errT = (e) => t(e.key || 'error.generic', e) + (e.field ? ' (' + e.field + ')' : '') + (e.ora ? ' ' + e.ora : '');
  async function page(el) {
    const st = { rows: [], accounts: [], i: 0, edit: null, set: null };
    el.innerHTML = `<div class="card"><div class="toolbar" style="gap:8px"><h2 style="margin:0">${esc(K('title'))}</h2>
      <button class="btn secondary" id="a_new" style="margin-left:auto">${esc(K('new'))}</button></div>
      <p class="muted" style="margin:4px 0 8px">${esc(K('hint'))}</p><div class="tablewrap" style="max-height:52vh" id="ag"></div>
      <div style="display:flex;gap:16px;align-items:flex-end;flex-wrap:wrap;margin-top:12px">
        <fieldset class="card" style="margin:0;padding:10px 14px"><legend>${esc(K('rate_box'))}</legend>
          <label class="field"><span>${esc(K('income'))}</span><select id="s_kredit"></select></label>
          <label class="field"><span>${esc(K('expense'))}</span><select id="s_debet"></select></label></fieldset>
        <div style="display:flex;flex-direction:column;gap:6px"><button class="btn" id="a_ok">${esc(K('ok'))}</button>
          <button class="btn secondary" id="a_cancel">${esc(K('cancel'))}</button><button class="btn secondary" id="a_refresh">${esc(K('refresh'))}</button></div></div></div>`;
    const v = (id) => el.querySelector('#' + id), g = v('ag');
    const cur = () => st.rows[st.i];
    const inputs = (r) => COLS.map(([c, n, w]) => `<td><input data-c="${c}" maxlength="${n}" style="width:${w}px" value="${esc(r[c.toLowerCase()] ?? '')}"></td>`).join('');
    const acts = `<td style="white-space:nowrap"><button class="btn sm" data-a="post">${esc(K('post'))}</button></td>`;
    function grid() {
      const body = st.rows.map((r, i) => st.edit === i ? `<tr class="sel" data-e="1">${inputs(r)}${acts}</tr>`
        : `<tr data-i="${i}" class="${i === st.i ? 'sel' : ''}">${COLS.map(([c]) => `<td>${esc(r[c.toLowerCase()] ?? '')}</td>`).join('')}
           <td><button class="btn secondary sm" data-a="del" data-i="${i}">${esc(K('delete'))}</button></td></tr>`).join('')
        + (st.edit === 'new' ? `<tr class="sel" data-e="1">${inputs({})}${acts}</tr>` : '');
      g.innerHTML = `<table class="grid acc-grid"><thead><tr>${COLS.map(([c]) => `<th>${esc(K('c_' + c))}</th>`).join('')}<th></th></tr></thead>
        <tbody>${body || `<tr><td colspan="8" class="muted">${esc(K('empty'))}</td></tr>`}</tbody></table>`;
      g.querySelectorAll('tr[data-i] td:not(:last-child)').forEach(td => td.onclick = async () => {
        const i = +td.parentNode.dataset.i;
        if (st.edit !== null && !(await postPending())) return;           // leaving an edited row posts it
        if (i === st.i) { st.edit = i; grid(); return; }
        st.i = i; grid(); settings();                                    // AfterScroll -> reopen ValuteSettings
      });
      g.querySelectorAll('[data-a=post]').forEach(b => b.onclick = () => postPending());
      g.querySelectorAll('[data-a=del]').forEach(b => b.onclick = () => del(st.rows[+b.dataset.i]));
    }
    const pending = () => {
      const tr = g.querySelector('tr[data-e]'); if (!tr || st.edit === null) return null;
      const base = st.edit === 'new' ? {} : { ...cur() };
      tr.querySelectorAll('input').forEach(x => base[x.dataset.c.toLowerCase()] = x.value);
      return { rowid: st.edit === 'new' ? null : cur().rowid, rec: base };
    };
    async function postPending() {
      const p = pending(); if (!p) return true;
      try { await api(`${P}/row${p.rowid ? '?rowid=' + encodeURIComponent(p.rowid) : ''}`, { method: 'POST', body: { rec: p.rec } }); }
      catch (e) { toast(errT(e), 'error'); return false; }
      toast(K('saved')); await load(p.rec.valute); return true;
    }
    function fillSel() {
      const s = st.set || {}, opts = (val) => `<option value=""></option>` + st.accounts.map(a => `<option value="${a.id}" ${val != null && +val === a.id ? 'selected' : ''}>${esc(a.acc_no)}</option>`).join('');
      v('s_kredit').innerHTML = opts(s.kredit); v('s_debet').innerHTML = opts(s.debet);
    }
    async function settings() {
      st.set = null;
      if (cur()) { try { st.set = (await api(`${P}/settings?valute=${encodeURIComponent(cur().valute)}`)).settings; } catch (e) { toast(errT(e), 'error'); } }
      fillSel();
    }
    async function load(keep) {
      try { const r = await api(P); st.rows = r.rows; st.accounts = r.accounts; } catch (e) { toast(errT(e), 'error'); st.rows = []; }
      const j = keep != null ? st.rows.findIndex(x => String(x.valute) === String(keep)) : -1;
      st.i = j >= 0 ? j : Math.min(st.i, Math.max(0, st.rows.length - 1)); st.edit = null; grid(); await settings();
    }
    async function del(r) {
      if (!confirm(K('confirm_delete'))) return;
      try { await api(`${P}/row?rowid=${encodeURIComponent(r.rowid)}`, { method: 'DELETE' }); load(); } catch (e) { toast(errT(e), 'error'); }
    }
    v('a_new').onclick = () => { st.edit = 'new'; grid(); };
    v('a_ok').onclick = async () => {                                     // BtnOKClick
      const num = (id) => v(id).value === '' ? null : +v(id).value;
      try {
        const r = await api(`${P}/ok`, { method: 'POST', body: { valute: cur() ? cur().valute : null, kredit: num('s_kredit'), debet: num('s_debet'), grid: pending() } });
        if (r.grid_error) toast(K('grid_error') + ' ' + r.grid_error, 'error'); else toast(K('saved'));
        load(cur() && cur().valute);
      } catch (e) { toast(errT(e), 'error'); }
    };
    v('a_cancel').onclick = () => { st.edit = null; grid(); fillSel(); };  // BtnCancelClick: Cancel both datasets
    v('a_refresh').onclick = () => load(cur() && cur().valute);           // BtnRefreshClick
    load();
  }
  window.SB.pages['/m/out-avalute'] = page;
})();

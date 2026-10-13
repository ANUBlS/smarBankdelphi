/* Off-balance account types – port of Packages/Out_Tuningacctypes (TFlagsEditor). One editable DBGrid over
   'select AT.*, AT.RowID from Out_Account_Flags AT'; DOA-style DML in api/app/out_tuningacctypes.py. */
(function () {
  const { api, t, esc, toast } = window.SB;
  const P = '/api/out-tuningacctypes', K = (k) => t('out_tuningacctypes.' + k);
  const COLS = [['SYMBOL', 1, 70], ['NAME', 32, 260], ['DESCRIPTION', 128, 480]];   // DBGrid1 dfm:91-146, field sizes dfm:161-173
  const errT = (e) => t(e.key || 'error.generic', e) + (e.ora ? ' ' + e.ora : '');
  async function page(el) {
    const st = { rows: [], edit: null };   // edit: index being edited, or 'new'
    el.innerHTML = `<div class="card"><div class="toolbar" style="gap:8px"><h2 style="margin:0">${esc(K('title'))}</h2>
      <button class="btn" id="t_new" style="margin-left:auto">${esc(K('new'))}</button></div>
      <p class="muted" style="margin:4px 0 8px">${esc(K('hint'))}</p><div class="tablewrap" style="max-height:70vh" id="tg"></div></div>`;
    const g = el.querySelector('#tg');
    const inputs = (r) => COLS.map(([c, n, w]) => `<td><input data-c="${c}" maxlength="${n}" style="width:${w}px" value="${esc(r[c.toLowerCase()] ?? '')}"></td>`).join('');
    const acts = (i) => `<td style="white-space:nowrap"><button class="btn sm" data-a="post" data-i="${i}">${esc(K('post'))}</button>
      <button class="btn secondary sm" data-a="cancel">${esc(K('cancel'))}</button></td>`;
    function render() {
      const body = st.rows.map((r, i) => st.edit === i
        ? `<tr class="sel">${inputs(r)}${acts(i)}</tr>`
        : `<tr data-i="${i}">${COLS.map(([c]) => `<td>${esc(r[c.toLowerCase()] ?? '')}</td>`).join('')}
           <td><button class="btn secondary sm" data-a="del" data-i="${i}">${esc(K('delete'))}</button></td></tr>`).join('')
        + (st.edit === 'new' ? `<tr class="sel">${inputs({})}${acts('new')}</tr>` : '');
      g.innerHTML = `<table class="grid acc-grid"><thead><tr>${COLS.map(([c]) => `<th>${esc(K('c_' + c))}</th>`).join('')}<th></th></tr></thead>
        <tbody>${body || `<tr><td colspan="4" class="muted">${esc(K('empty'))}</td></tr>`}</tbody></table>`;
      g.querySelectorAll('tr[data-i] td:not(:last-child)').forEach(td => td.onclick = () => { st.edit = +td.parentNode.dataset.i; render(); });
      g.querySelectorAll('[data-a=cancel]').forEach(b => b.onclick = () => { st.edit = null; render(); });   // Esc = Cancel
      g.querySelectorAll('[data-a=post]').forEach(b => b.onclick = () => post(b.closest('tr'), b.dataset.i));
      g.querySelectorAll('[data-a=del]').forEach(b => b.onclick = () => del(st.rows[+b.dataset.i]));
      const f = g.querySelector('tr.sel input'); f && f.focus();
    }
    async function load() {
      try { st.rows = (await api(P)).rows; } catch (e) { toast(errT(e), 'error'); st.rows = []; }
      st.edit = null; render();
    }
    async function post(tr, i) {
      const b = Object.fromEntries([...tr.querySelectorAll('input')].map(x => [x.dataset.c.toLowerCase(), x.value]));
      if (!b.symbol) { toast(K('err_symbol'), 'error'); return; }           // SYMBOL Required = True
      try {
        if (i === 'new') await api(P, { method: 'POST', body: b });
        else await api(`${P}?rowid=${encodeURIComponent(st.rows[+i].rowid)}`, { method: 'PUT', body: b });
        toast(K('saved')); load();                                         // AfterPost: Refresh + GotoBookmark
      } catch (e) { toast(errT(e), 'error'); }
    }
    async function del(r) {
      if (!confirm(K('confirm_delete'))) return;                          // dgConfirmDelete
      try { await api(`${P}?rowid=${encodeURIComponent(r.rowid)}`, { method: 'DELETE' }); load(); } catch (e) { toast(errT(e), 'error'); }
    }
    el.querySelector('#t_new').onclick = () => { st.edit = 'new'; render(); };
    load();
  }
  window.SB.pages['/m/out-tuningacctypes'] = page;
})();

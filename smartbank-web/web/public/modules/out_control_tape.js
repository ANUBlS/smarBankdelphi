/* Off-balance control tape – port of Packages/Out_control_tape (TFrmControlTape). SQL and rules run in the API
   (api/app/out_control_tape.py). QuickReport previews (QR1, QR2, QTransactionView) are on-screen grids + PDF / Excel. */
(function () {
  const { api, t, esc } = window.SB;
  const P = '/api/out-control-tape', T = (k, p) => t('out_control_tape.' + k, p);
  const MONEY = new Set(['AMMOUNTS', 'LAMMOUNTS', 'AMMOUNT', 'LAMMOUNT', 'DEBITAMMOUNT', 'CREDITAMMOUNT', 'COMMONAMMOUNT']);
  const money = (v) => v === null || v === undefined ? '' : Number(v).toLocaleString(window.I18N.lang, { minimumFractionDigits: 2, maximumFractionDigits: 2 });
  const errHtml = (e) => `<div class="alert error">${esc(t(e.key || 'error.generic', e))}${e.ora ? `<span class="ora">${esc(e.ora)}</span>` : ''}</div>`;
  const field = (k, inner) => `<label class="field"><span>${esc(T(k))}</span>${inner}</label>`;
  function grid(r) {
    const cols = r.cols.map(c => c.toUpperCase());
    const td = (x, c) => `<td style="${MONEY.has(c) ? 'text-align:right;font-variant-numeric:tabular-nums' : ''}">${esc(MONEY.has(c) ? money(x[c.toLowerCase()]) : x[c.toLowerCase()] ?? '')}</td>`;
    const tot = (tt, label) => `<tr class="total"><td><b>${esc(label)}</b></td>${cols.slice(1).map(c => `<td style="text-align:right"><b>${c.toLowerCase() in tt ? esc(money(tt[c.toLowerCase()])) : ''}</b></td>`).join('')}</tr>`;
    let body = r.groups ? r.groups.map(g => `<tr class="grouphead"><td colspan="${cols.length}"><b>${esc(T('c_BAL_CN1'))}: ${esc(g.key)}</b></td></tr>`
      + g.rows.map(x => `<tr>${cols.map(c => td(x, c)).join('')}</tr>`).join('') + tot(g.totals, T('group_total'))).join('')
      : r.rows.map(x => `<tr>${cols.map(c => td(x, c)).join('')}</tr>`).join('');
    if (!r.rows.length) body = `<tr><td colspan="${cols.length}" class="muted">${esc(T('empty'))}</td></tr>`;
    return `<div class="tablewrap" style="max-height:56vh"><table class="grid"><thead><tr>${cols.map(c => `<th style="${MONEY.has(c) ? 'text-align:right' : ''}">${esc(T('c_' + c))}</th>`).join('')}</tr></thead>
      <tbody>${body}${tot(r.totals, T('total'))}</tbody></table></div>`;
  }
  async function page(el) {
    el.innerHTML = '<div class="spinner"></div>';
    let I; try { I = await api(P + '/init'); } catch (e) { el.innerHTML = `<div class="card">${errHtml(e)}</div>`; return; }
    const opts = (l, k, n) => l.map(x => `<option value="${esc(x[k])}">${esc(x[n])}</option>`).join('');
    el.innerHTML = `<div class="card"><div class="toolbar"><h2 style="margin:0">${esc(T('title'))}</h2></div>
      <div style="display:grid;grid-template-columns:repeat(auto-fill,minmax(210px,1fr));gap:10px 14px;align-items:end;margin-top:8px">
      ${field('date', `<input type="date" id="cd" value="${I.date}">`)}${field('currency', `<select id="cc">${opts(I.currencies, 'index', 'name')}</select>`)}
      ${field('branch', `<select id="cb">${opts(I.branches, 'id', 'name')}</select>`)}
      ${field('plan', `<select id="cp"><option value="0">${esc(T('plan_0'))}</option><option value="1">${esc(T('plan_1'))}</option></select>`)}
      ${field('balances', `<input id="cl" placeholder="9101,9201">`)}<label><input type="checkbox" id="ct"> ${esc(T('toggle'))}</label></div>
      <div class="toolbar" style="gap:8px;flex-wrap:wrap;margin-top:8px">
      <button class="btn" id="b_refresh">${esc(T('refresh'))}</button><button class="btn secondary" id="b_print">${esc(T('print'))}</button>
      <button class="btn secondary" id="b_summary">${esc(T('summary'))}</button><button class="btn secondary" id="b_report">${esc(T('report'))}</button>
      <button class="btn secondary" id="b_pdf">${esc(T('pdf'))}</button><button class="btn secondary" id="b_xlsx">${esc(T('excel'))}</button></div>
      <div id="cerr"></div><div id="cres" style="margin-top:10px"></div></div>`;
    const v = (id) => el.querySelector('#' + id);
    const body = () => ({ date: v('cd').value, currency: +v('cc').value, branch: +v('cb').value, balans: +v('cp').value, toggle: v('ct').checked, balances: v('cl').value });
    let kind = 'refresh', last = null;
    const run = (k) => async () => {
      try { last = await api(`${P}/${k}`, { method: 'POST', body: body() }); kind = k; v('cerr').innerHTML = '';
        v('cres').innerHTML = (last.bank ? `<div class="rephead">${esc(last.bank)} · ${esc(v('cd').value)} · ${esc(v('cc').selectedOptions[0].text)}</div>` : '') + grid(last);
      } catch (e) { v('cerr').innerHTML = errHtml(e); }
    };
    ['refresh', 'print', 'summary', 'report'].forEach(k => v('b_' + k).onclick = run(k));
    const file = (fmt) => async () => {
      const cols = (last ? last.cols : ['bal_cn1', 'ammounts', 'lammounts']);
      const labels = { title: T('title') + ' – ' + T(kind), header: [v('cd').value, v('cc').selectedOptions[0].text], total: T('total'), group_total: T('group_total'),
        cols: Object.fromEntries(cols.map(c => [c, T('c_' + c.toUpperCase())])), sheet: T(kind).slice(0, 31), signatures: [] };
      const res = await fetch(`${P}/${kind}.${fmt}`, { method: 'POST', headers: { 'Content-Type': 'application/json', 'X-CSRF': window.SB.csrf || '' }, credentials: 'same-origin', body: JSON.stringify({ ...body(), labels }) });
      if (!res.ok) { const j = await res.json().catch(() => ({})); v('cerr').innerHTML = errHtml(j.detail || {}); return; }
      const a = document.createElement('a'); a.href = URL.createObjectURL(await res.blob()); a.download = `control-tape-${kind}.${fmt}`; a.click();
    };
    v('b_pdf').onclick = file('pdf'); v('b_xlsx').onclick = file('xlsx');
    run('refresh')();
  }
  window.SB.pages['/m/out-control-tape'] = page;
})();

/* Off-balance turnovers for period – port of Packages/Out_turn_over_for_period (TTurnOvers_Form). SQL and rules run in the API
   (api/app/out_turnovers.py). RGReportType 0 (QuickReport TTurnOversRpt) = on-screen grid + PDF; 1 (CMExcelExport) = Excel. */
(function () {
  const { api, t, esc } = window.SB;
  const P = '/api/out-turnovers', T = (k, p) => t('out_turnovers.' + k, p);
  const TXT = new Set(['ACCOUNTID', 'ACCNO', 'ACC_NAME', 'CURRENCYID', 'BRANCHID', 'BALANCENO', 'CLIENTID', 'EXPERT']);
  const money = (v) => v === null || v === undefined ? '' : Number(v).toLocaleString(window.I18N.lang, { minimumFractionDigits: 2, maximumFractionDigits: 2 });
  const errHtml = (e) => `<div class="alert error">${esc(t(e.key || 'error.generic', e))}${e.ora ? `<span class="ora">${esc(e.ora)}</span>` : ''}</div>`;
  const field = (k, inner) => `<label class="field"><span>${esc(T(k))}</span>${inner}</label>`;
  function grid(r) {
    const cols = r.cols.map(c => c.toUpperCase()), M = (c) => !TXT.has(c);
    const td = (x, c) => `<td style="${M(c) ? 'text-align:right;font-variant-numeric:tabular-nums' : ''}">${esc(M(c) ? money(x[c.toLowerCase()]) : x[c.toLowerCase()] ?? '')}</td>`;
    let body = r.rows.map(x => `<tr>${cols.map(c => td(x, c)).join('')}</tr>`).join('');
    if (!r.rows.length) body = `<tr><td colspan="${cols.length}" class="muted">${esc(T('empty'))}</td></tr>`;
    const tot = Object.keys(r.totals).length ? `<tr class="total"><td><b>${esc(T('total'))}</b></td>${cols.slice(1).map(c => `<td style="text-align:right"><b>${c.toLowerCase() in r.totals ? esc(money(r.totals[c.toLowerCase()])) : ''}</b></td>`).join('')}</tr>` : '';
    return `<div class="tablewrap" style="max-height:56vh"><table class="grid"><thead><tr>${cols.map(c => `<th style="${M(c) ? 'text-align:right' : ''}">${esc(T('c_' + c))}</th>`).join('')}</tr></thead>
      <tbody>${body}${tot}</tbody></table></div>`;
  }
  async function page(el) {
    el.innerHTML = '<div class="spinner"></div>';
    let I; try { I = await api(P + '/init'); } catch (e) { el.innerHTML = `<div class="card">${errHtml(e)}</div>`; return; }
    const opts = (l) => l.map(x => `<option value="${x.index}">${esc(x.index === 0 ? T('all') : x.name)}</option>`).join('');
    el.innerHTML = `<div class="card"><div class="toolbar"><h2 style="margin:0">${esc(T('title'))}</h2></div>
      <div style="display:grid;grid-template-columns:repeat(auto-fill,minmax(210px,1fr));gap:10px 14px;align-items:end;margin-top:8px">
      ${field('beg', `<input type="date" id="tb" value="${I.date}">`)}${field('end', `<input type="date" id="te" value="${I.date}">`)}
      ${field('currency', `<select id="tc">${opts(I.currencies)}</select>`)}${field('branch', `<select id="tf">${opts(I.branches)}</select>`)}
      ${field('plan', `<select id="tp">${[0, 1, 2, 3].map(i => `<option value="${i}">${esc(T('plan_' + i))}</option>`).join('')}</select>`)}
      ${field('balances', `<input id="tl" placeholder="9101,9201">`)}
      ${field('amount_type', `<select id="ta"><option value="0">${esc(T('amount_0'))}</option><option value="1">${esc(T('amount_1'))}</option></select>`)}
      ${field('report_type', `<select id="tr"><option value="report">${esc(T('report'))}</option><option value="export">${esc(T('export'))}</option></select>`)}
      <label><input type="checkbox" id="tn"> ${esc(T('with_names'))}</label></div>
      <div class="toolbar" style="gap:8px;flex-wrap:wrap;margin-top:8px">
      <button class="btn" id="b_run">${esc(T('run'))}</button><button class="btn secondary" id="b_pdf">${esc(T('pdf'))}</button>
      <button class="btn secondary" id="b_xlsx">${esc(T('excel'))}</button></div>
      <div id="terr"></div><div id="tres" style="margin-top:10px"></div></div>`;
    const v = (id) => el.querySelector('#' + id);
    const body = () => ({ beg: v('tb').value, end: v('te').value, currency: +v('tc').value, branch: +v('tf').value, plan: +v('tp').value,
      amount_type: +v('ta').value, balances: v('tl').value, with_names: v('tn').checked });
    let last = null;
    const head = () => [`${v('tb').value} – ${v('te').value}`, v('tc').selectedOptions[0].text, v('tf').selectedOptions[0].text];
    v('b_run').onclick = async () => {
      const k = v('tr').value;
      try { last = await api(`${P}/${k}`, { method: 'POST', body: body() }); v('terr').innerHTML = '';
        const b = last.bank;
        v('tres').innerHTML = (b ? `<div class="rephead">${esc(b.bank)} · ${esc(T('inn'))} ${esc(b.inn)} · ${esc(head().join(' · '))}</div>` : '') + grid(last)
          + (b ? `<div class="muted" style="margin-top:6px">${esc(b.managertitle || T('manager'))}: ${esc(b.manager)} · ${esc(b.accountanttitle || T('accountant'))}: ${esc(b.accountant)}</div>` : '');
      } catch (e) { v('terr').innerHTML = errHtml(e); }
    };
    const file = (fmt) => async () => {
      const kind = v('tr').value, cols = last ? last.cols : ['accno'];
      const b = last && last.bank;
      const labels = { title: T('title'), header: head(), total: T('total'), group_total: T('total'),
        cols: Object.fromEntries(cols.map(c => [c, T('c_' + c.toUpperCase())])), sheet: 'TurnOvers',
        signatures: b ? [[b.managertitle || T('manager'), b.manager || ''], [b.accountanttitle || T('accountant'), b.accountant || '']] : [] };
      const res = await fetch(`${P}/${kind}.${fmt}`, { method: 'POST', headers: { 'Content-Type': 'application/json', 'X-CSRF': window.SB.csrf || '' }, credentials: 'same-origin', body: JSON.stringify({ ...body(), labels }) });
      if (!res.ok) { const j = await res.json().catch(() => ({})); v('terr').innerHTML = errHtml(j.detail || {}); return; }
      const a = document.createElement('a'); a.href = URL.createObjectURL(await res.blob()); a.download = `out-turnovers-${kind}.${fmt}`; a.click();
    };
    v('b_pdf').onclick = file('pdf'); v('b_xlsx').onclick = file('xlsx');
    v('b_run').onclick();
  }
  window.SB.pages['/m/out-turnovers'] = page;
})();

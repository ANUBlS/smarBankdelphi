/* Off-balance account statement – port of Packages/Out_Statement/Ocx (TOut_StatementForm). All SQL (OUT_SB_STATEMENT
   generated text) runs in the API (api/app/out_statement.py). BtnOk / CBoxExtractCheck: 0 preview (Out_RepR / Out_Rep → PDF),
   1 write to file (text), 2 Excel, 3 documents (FormTransView), 4 plastic card (ShowCardState: closes the form). */
(function () {
  const { api, t, esc } = window.SB;
  const P = '/api/out-statement', T = (k, p) => t('out_statement.' + k, p);
  const money = (v) => Number(v || 0).toLocaleString(window.I18N.lang, { minimumFractionDigits: 2, maximumFractionDigits: 2 });
  const rate4 = (v) => Number(v || 0).toLocaleString(window.I18N.lang, { minimumFractionDigits: 4, maximumFractionDigits: 4 });
  const d = (v) => v ? window.SB.fmtDate(v) : '';
  const errHtml = (e) => `<div class="alert error">${esc(t(e.key || 'error.generic', e))}${e.ora ? `<span class="ora">${esc(e.ora)}</span>` : ''}</div>`;
  const field = (k, inner) => `<label class="field"><span>${esc(T(k))}</span>${inner}</label>`;
  const LAB = { title: 'title', acc_no: 'acc_no_l', acc_name: 'acc_name', voen: 'voen', currency: 'currency_l', period: 'period', last_op: 'last_op',
    begin_rest: 'begin_rest', end_rest: 'end_rest', count: 'count_l', date: 'date', val: 'val', pair: 'pair', debit: 'debit', credit: 'credit',
    purpose: 'purpose', manat: 'manat', valyuta: 'valyuta', rate: 'rate' };
  const labels = () => Object.fromEntries(Object.entries(LAB).map(([k, v]) => [k, T(v)]));
  const rest = (a, end) => {
    const nat = Number(a.currencyid) === 0;
    const v = end ? a.endostat : a.ostat, l = end ? a.endpokostat : a.pokostat, r = end ? a.rate_end : a.rate_beg;
    return `${esc(T(nat ? 'manat' : 'valyuta'))}${esc(money(Math.abs(v || 0)))} ${esc((end ? a.ap_end : a.ap_beg) || '')}`
      + (nat ? '' : ` · ${esc(T('manat'))}${esc(money(Math.abs(l || 0)))} · ${esc(T('rate'))}${esc(rate4(Math.abs(r || 0)))}`);
  };
  function preview(r, o) {
    if (!r.accounts.length) return `<p class="muted">${esc(T('empty'))}</p>`;
    const right = o.setting === 0, cf = right && o.val_view === 1 ? 'avalname' : 'paircurrencyid';
    return r.accounts.map(a => {
      const rows = a.trans.map(x => `<tr><td>${esc(d(x.dat))}</td><td>${esc(x[cf] ?? '')}</td><td>${esc(x.pairaccountname || '')}</td>
          <td class="num">${esc(money(x.ldebit))}${x.fx ? `<br><span class="muted">${esc(money(x.debit))}</span>` : ''}</td>
          <td class="num">${esc(money(x.lkredit))}${x.fx ? `<br><span class="muted">${esc(money(x.kredit))}</span>` : ''}</td>
          ${right ? `<td>${esc(x.name || '')}</td>` : ''}</tr>${right ? '' : `<tr><td colspan="5" class="muted">${esc(T('purpose'))}: ${esc(x.name || '')}</td></tr>`}`).join('');
      const s = a.sums;
      return `<div class="card" style="margin:10px 0;${o.print_mode === 1 ? 'border-top:3px solid var(--teal,#14b8a6)' : ''}">
        <div class="rephead"><b>${esc(r.bank)}</b> · ${esc(T('acc_no_l'))} <b>${esc(a.accountnumber)}</b></div>
        <div>${esc(T('acc_name'))} ${esc(a.accountname)} · ${esc(T('voen'))} ${esc(a.customervoin || '')} · ${esc(T('currency_l'))} ${esc(a.currencyname)}</div>
        <div class="muted">${esc(T('period'))} ${esc(o.beg === o.end ? d(o.beg) : d(o.beg) + ' – ' + d(o.end))} · ${esc(T('last_op'))} ${esc(d(a.lastopdate))} · ${esc(d(a.opendate))}</div>
        <div>${esc(T('begin_rest'))} ${rest(a, false)}</div>
        <div class="tablewrap"><table class="grid"><thead><tr><th>${esc(T('date'))}</th><th>${esc(T('val'))}</th><th>${esc(T('pair'))}</th>
          <th class="num">${esc(T('debit'))}</th><th class="num">${esc(T('credit'))}</th>${right ? `<th>${esc(T('purpose'))}</th>` : ''}</tr></thead>
          <tbody>${rows}<tr class="total"><td colspan="3"></td><td class="num"><b>${esc(money(s.ldebit))}</b>${a.show_fx_sums ? `<br>${esc(money(s.debit))}` : ''}</td>
          <td class="num"><b>${esc(money(s.lkredit))}</b>${a.show_fx_sums ? `<br>${esc(money(s.kredit))}` : ''}</td>${right ? '<td></td>' : ''}</tr></tbody></table></div>
        <div>${esc(T('end_rest'))} ${rest(a, true)} · ${esc(T('count_l'))} ${a.count}</div></div>`;
    }).join('');
  }
  function transView(r, el) {
    if (!r.accounts.length) return `<p class="muted">${esc(T('empty'))}</p>`;
    const C = ['DAT', 'PAIRCURRENCYID', 'PAIRACCOUNTNAME', 'DEBIT', 'KREDIT', 'LDEBIT', 'LKREDIT'];
    const html = `<h3>${esc(T('accounts'))}</h3><div class="tablewrap" style="max-height:30vh"><table class="grid" id="sm"><thead><tr>
      <th>${esc(T('c_ACCOUNTNUMBER'))}</th><th>${esc(T('c_CURRENCYID'))}</th><th>${esc(T('c_ACCOUNTNAME'))}</th></tr></thead><tbody>
      ${r.accounts.map((a, i) => `<tr data-i="${i}" style="cursor:pointer"><td>${esc(a.accountnumber)}</td><td>${esc(a.currencyid)}</td><td>${esc(a.accountname)}</td></tr>`).join('')}</tbody></table></div>
      <div id="sp" style="margin:8px 0"></div><h3>${esc(T('transactions'))}</h3><div id="sd"></div>`;
    setTimeout(() => {
      const show = (i) => {
        const a = r.accounts[i];
        el.querySelectorAll('#sm tbody tr').forEach(x => x.classList.toggle('active', +x.dataset.i === i));
        el.querySelector('#sp').innerHTML = `${esc(T('c_OSTAT'))}: <b>${esc(money(a.ostat))}</b> · ${esc(T('c_ENDOSTAT'))}: <b>${esc(money(a.endostat))}</b>`;
        el.querySelector('#sd').innerHTML = `<div class="tablewrap" style="max-height:30vh"><table class="grid"><thead><tr>${C.map(c => `<th>${esc(T('c_' + c))}</th>`).join('')}</tr></thead><tbody>
          ${a.trans.map(x => `<tr>${C.map(c => `<td class="${/DEBIT|KREDIT/.test(c) ? 'num' : ''}">${esc(c === 'DAT' ? d(x.dat) : /DEBIT|KREDIT/.test(c) ? money(x[c.toLowerCase()]) : x[c.toLowerCase()] ?? '')}</td>`).join('')}</tr>`).join('')
          || `<tr><td colspan="7" class="muted">${esc(T('empty'))}</td></tr>`}</tbody></table></div>`;
      };
      el.querySelectorAll('#sm tbody tr').forEach(x => { x.onclick = () => show(+x.dataset.i); });
      show(0);
    });
    return html;
  }
  async function page(el) {
    el.innerHTML = '<div class="spinner"></div>';
    let I; try { I = await api(P + '/init'); } catch (e) { el.innerHTML = `<div class="card">${errHtml(e)}</div>`; return; }
    const look = (id, list) => `<select id="${id}" disabled><option value="-1"></option>${list.some(x => x.id === 0) ? '' : '<option value="0"></option>'}${list.map(x => `<option value="${x.id}">${esc(x.name)}</option>`).join('')}</select>`;
    const radio = (n, k, items, sel = 0) => field(k, `<span class="radios">${items.map((x, i) => `<label><input type="radio" name="${n}" value="${i}" ${i === sel ? 'checked' : ''}> ${esc(T(x))}</label>`).join(' ')}</span>`);
    el.innerHTML = `<div class="card"><div class="toolbar"><h2 style="margin:0">${esc(T('title'))}</h2></div>
      <div style="display:grid;grid-template-columns:repeat(auto-fill,minmax(220px,1fr));gap:10px 14px;align-items:end;margin-top:8px">
      ${field('beg', `<input type="date" id="sb" value="${I.date}">`)}${field('end', `<input type="date" id="se" value="${I.date}">`)}
      <label><input type="checkbox" id="st" checked> ${esc(T('turnover'))}</label><label><input type="checkbox" id="sr"> ${esc(T('rate_diff'))}</label>
      ${field('acc_no', `<input id="sa" placeholder="AZ..., AZ...">`)}${field('bal_cn', `<input id="sl" placeholder="9101,9201">`)}${field('cli_id', `<input id="sc">`)}
      ${field('currency', `<span style="display:flex;gap:6px"><input type="checkbox" id="xc">${look('vc', I.currencies)}</span>`)}
      ${field('branch', `<span style="display:flex;gap:6px"><input type="checkbox" id="xf">${look('vf', I.branches)}</span>`)}
      ${field('user', `<span style="display:flex;gap:6px"><input type="checkbox" id="xu">${look('vu', I.users)}</span>`)}
      ${radio('pm', 'print_mode', ['pm_0', 'pm_1'])}${radio('set', 'setting', ['set_0', 'set_1'])}${radio('vv', 'val_view', ['vv_0', 'vv_1'])}
      ${field('output', `<select id="so">${[0, 1, 2, 3, 4].map(i => `<option value="${i}">${esc(T('out_' + i))}</option>`).join('')}</select>`)}</div>
      <div class="toolbar" style="gap:8px;margin-top:8px"><button class="btn" id="b_ok">${esc(T('ok'))}</button><button class="btn secondary" id="b_pdf" style="display:none">PDF</button></div>
      <div id="serr"></div><div id="sres" style="margin-top:10px"></div></div>`;
    const v = (id) => el.querySelector('#' + id);
    // CBCurrencyClick / CBFilialClick / CBUserClick: checked -> KeyValue 0, unchecked -> -1
    [['xc', 'vc'], ['xf', 'vf'], ['xu', 'vu']].forEach(([c, s]) => { v(c).onchange = () => { v(s).disabled = !v(c).checked; v(s).value = v(c).checked ? '0' : '-1'; }; });
    const rv = (n) => +el.querySelector(`input[name="${n}"]:checked`).value;
    const body = () => ({ beg: v('sb').value, end: v('se').value, turnover: v('st').checked, rate_diff: v('sr').checked,
      acc_no: v('sa').value, bal_cn: v('sl').value, cli_id: v('sc').value, currency: +v('vc').value, branch: +v('vf').value, user: +v('vu').value,
      print_mode: rv('pm'), setting: rv('set'), val_view: rv('vv') });
    const file = async (fmt) => {
      const res = await fetch(`${P}/statement.${fmt}`, { method: 'POST', headers: { 'Content-Type': 'application/json', 'X-CSRF': window.SB.csrf || '' }, credentials: 'same-origin', body: JSON.stringify({ ...body(), labels: labels() }) });
      if (!res.ok) { const j = await res.json().catch(() => ({})); v('serr').innerHTML = errHtml(j.detail || {}); return; }
      v('serr').innerHTML = '';
      const a = document.createElement('a'); a.href = URL.createObjectURL(await res.blob()); a.download = `out-statement.${fmt}`; a.click();
    };
    v('b_pdf').onclick = () => file('pdf');
    v('b_ok').onclick = async () => {
      const k = +v('so').value; v('b_pdf').style.display = 'none';
      if (k === 4) { v('sres').innerHTML = `<p class="muted">${esc(T('closed'))}</p>`; location.hash = '#/home'; return; }
      if (k === 1) return file('txt');
      if (k === 2) return file('xlsx');
      try {
        const o = body(), r = await api(P + '/run', { method: 'POST', body: o }); v('serr').innerHTML = '';
        if (k === 0) { v('sres').innerHTML = preview(r, o); v('b_pdf').style.display = ''; } else v('sres').innerHTML = transView(r, el);
      } catch (e) { v('serr').innerHTML = errHtml(e); }
    };
  }
  window.SB.pages['/m/out-statement'] = page;
})();

/* Balance report group – ports of Packages/Balance (TFrmBalance), DBDBalance (TFrmDayByDayBalance), TodayBalance
   (TFrmTodayBalance), BalanceAnalys (TFormBalanceAnalys), AccBalanceCheck (TAccBalanceCheckForm).
   All SQL and rules run in the API (api/app/balance.py, bal_logic.py). QuickReport previews are on-screen grids;
   PDF / Excel come from the API. */
(function () {
  const { api, t, esc, toast } = window.SB;
  const MONEY = new Set(['FIRSTACTIVE', 'FIRSTPASSIVE', 'DTURNOVER', 'KTURNOVER', 'CTURNOVER', 'LASTACTIVE', 'LASTPASSIVE', 'ACTIVE', 'PASSIVE',
    'AMOUNT', 'LAMOUNT', 'DEBITTURNOVER', 'DEBITLTURNOVER', 'CREDITTURNOVER', 'CREDITLTURNOVER', 'BEGINACTIVE', 'BEGINPASSIVE', 'ENDACTIVE',
    'ENDPASSIVE', 'CEM', 'AMMOUNT', 'AMMOUNT_C', 'LAMMOUNT', 'DEBT_TURNOVER', 'CREDIT_TURNOVER', 'RESTBEGINPERIOD', 'RESTLASTPERIOD']);
  const money = (v) => v === null || v === undefined || v === '' ? '' : Number(v).toLocaleString(window.I18N.lang, { minimumFractionDigits: 2, maximumFractionDigits: 2 });
  const lab = (c) => t('balance.c_' + c.toUpperCase());
  const errHtml = (e) => `<div class="alert error">${esc(t(e.key || 'error.generic', e))}${e.ora ? `<span class="ora">${esc(e.ora)}</span>` : ''}</div>`;
  const opt = (list, key, label, val) => (list || []).map(x => `<option value="${esc(x[key])}" ${String(x[key]) === String(val ?? '') ? 'selected' : ''}>${esc(label(x))}</option>`).join('');
  const checks = (name, list, key, label, on = () => true) => `<div class="checklist" data-name="${name}">${(list || []).map(x =>
    `<label><input type="checkbox" value="${esc(x[key])}" ${on(x) ? 'checked' : ''}> ${esc(label(x))}</label>`).join('')}</div>`;
  const checked = (el, name, num = true) => [...el.querySelectorAll(`.checklist[data-name="${name}"] input:checked`)].map(i => num ? +i.value : i.value);
  const field = (k, inner) => `<label class="field"><span>${esc(t(k))}</span>${inner}</label>`;
  const val = (el, id) => el.querySelector('#' + id).value;

  /* grid: cols upper-case field names; rows lower-case keys (API convention) */
  function grid(cols, rows, opts = {}) {
    const td = (r, c) => { const v = r[c.toLowerCase()]; const m = MONEY.has(c);
      return `<td style="${m ? 'text-align:right;font-variant-numeric:tabular-nums' : ''}">${esc(m ? money(v) : v ?? '')}</td>`; };
    const tot = (tt, label) => tt && Object.keys(tt).length ? `<tr class="total"><td><b>${esc(label)}</b></td>${cols.slice(1).map(c =>
      `<td style="text-align:right"><b>${c.toLowerCase() in tt ? esc(money(tt[c.toLowerCase()])) : ''}</b></td>`).join('')}</tr>` : '';
    let body;
    if (opts.groups) body = opts.groups.map(g => `<tr class="grouphead"><td colspan="${cols.length}"><b>${esc(t('balance.group'))}: ${esc(g.key ?? '')}</b></td></tr>`
      + g.rows.map(r => `<tr>${cols.map(c => td(r, c)).join('')}</tr>`).join('') + tot(g.totals, t('balance.group_total'))).join('');
    else body = rows.map((r, i) => `<tr data-i="${i}" class="${opts.sel === i ? 'sel' : ''}">${cols.map(c => td(r, c)).join('')}${opts.extra ? opts.extra(r) : ''}</tr>`).join('');
    if (!rows.length) body = `<tr><td colspan="${cols.length + (opts.extra ? 1 : 0)}" class="muted">${esc(t('balance.empty'))}</td></tr>`;
    return `<div class="tablewrap" style="max-height:${opts.h || '52vh'}"><table class="grid"><thead><tr>${cols.map(c =>
      `<th style="${MONEY.has(c) ? 'text-align:right' : ''}">${esc(lab(c))}</th>`).join('')}${opts.extraHead ? `<th>${esc(opts.extraHead)}</th>` : ''}</tr></thead>
      <tbody>${body}${tot(opts.totals, t('balance.total'))}</tbody></table></div>
      <div class="gridfoot"><span class="muted">${esc(t('balance.rows', { n: rows.length }))}</span></div>`;
  }
  function bindRows(host, fn, dbl) {
    host.querySelectorAll('tr[data-i]').forEach(tr => {
      tr.onclick = () => { host.querySelectorAll('tr.sel').forEach(x => x.classList.remove('sel')); tr.classList.add('sel'); fn && fn(+tr.dataset.i); };
      if (dbl) tr.ondblclick = () => dbl(+tr.dataset.i);
    });
  }
  async function download(url, body, name, errEl) {
    const res = await fetch(url, { method: 'POST', headers: { 'Content-Type': 'application/json', 'X-CSRF': window.SB.csrf || '' }, credentials: 'same-origin', body: JSON.stringify(body) });
    if (!res.ok) { const j = await res.json().catch(() => ({})); errEl.innerHTML = errHtml(j.detail || { key: 'error.generic' }); return; }
    errEl.innerHTML = '';
    const a = document.createElement('a'); a.href = URL.createObjectURL(await res.blob()); a.download = name; a.click();
  }
  const labels = (title, cols, header = [], signatures = []) => ({ title, header, signatures, total: t('balance.total'), group_total: t('balance.group_total'),
    cols: Object.fromEntries(cols.map(c => [c.toLowerCase(), lab(c)])), sheet: title.slice(0, 31) });
  const shell = (title, form, buttons) => `<div class="card"><div class="toolbar" style="gap:8px;flex-wrap:wrap"><h2 style="margin:0 12px 0 0">${esc(t(title))}</h2></div>
    <div style="display:grid;grid-template-columns:repeat(auto-fill,minmax(210px,1fr));gap:10px 14px;align-items:end;margin-top:8px">${form}</div>
    <div class="toolbar" style="gap:8px;flex-wrap:wrap;margin-top:8px">${buttons}</div><div id="berr"></div><div id="bres" style="margin-top:10px"></div></div>`;
  const btn = (id, k, sec = true) => `<button class="btn ${sec ? 'secondary' : ''}" id="${id}">${esc(t(k))}</button>`;
  const plans = () => [0, 1, 2, 3].map(i => ({ id: i, n: t('balance.plan_' + i) }));
  const fail = (el) => (e) => { el.querySelector('#berr').innerHTML = errHtml(e); };
  async function boot(el, url, page) {
    el.innerHTML = '<div class="spinner"></div>';
    let init; try { init = await api(url); } catch (e) { el.innerHTML = `<div class="card">${errHtml(e)}</div>`; return; }
    page(el, init);
  }

  /* ------------------------------------------------------------------------------- Balance (TFrmBalance) */
  const EXPORT_FIELDS = ['BAL_CN', 'FIRSTACTIVE', 'FIRSTPASSIVE', 'DTURNOVER', 'KTURNOVER', 'LASTACTIVE', 'LASTPASSIVE', 'BALNAME'];
  function balancePage(el, I) {
    el.innerHTML = shell('balance.title_balance',
      field('balance.beg', `<input type="date" id="bb" value="${I.date}">`) + field('balance.end', `<input type="date" id="be" value="${I.date}">`)
      + field('balance.plan', `<select id="bp">${opt(plans(), 'id', x => x.n, 0)}</select>`)
      + field('balance.currency', `<select id="bc"><option value="-1">${esc(t('balance.all_currencies'))}</option>${opt(I.currencies, 'valute', x => x.valu_name)}</select>`)
      + field('balance.format', `<select id="bf"><option value="0">${esc(t('balance.format_0'))}</option><option value="1">${esc(t('balance.format_1'))}</option></select>`)
      + field('balance.report', `<select id="br">${[0, 1, 2, 3, 4, 5].map(i => `<option value="${i}">${esc(t('balance.rpt_' + i))}</option>`).join('')}</select>`)
      + field('balance.branches', checks('br', I.branches, 'id', x => x.name))
      + field('balance.divisor', `<input id="bd" value="1" size="6">`),
      btn('bshow', 'balance.show', false) + btn('bpdf', 'balance.pdf') + btn('bxls', 'balance.excel') + btn('bexp', 'balance.export_fields') + btn('bf600', 'balance.f600')
      + (I.comp_visible ? btn('bcomp', 'balance.comp') + btn('bcset', 'balance.comp_settings') : ''));
    const body = () => ({ beg: val(el, 'bb'), end: val(el, 'be'), plan: +val(el, 'bp'), currency: +val(el, 'bc'), format: +val(el, 'bf'),
      report: +val(el, 'br'), branches: checked(el, 'br') });
    const rptTitle = () => t('balance.rpt_' + val(el, 'br'));
    let last = null;
    const header = (r) => r ? [r.bank.bank, `${t('balance.period')}: ${r.dates.fdate}${r.dates.show_ldate ? ' – ' + r.dates.ldate : ''}`] : [];
    const sigs = (r) => r ? [[t('balance.manager'), r.bank.manager], [t('balance.accountant'), r.bank.accountant]] : [];
    el.querySelector('#bshow').onclick = async () => {
      try { const r = await api('/api/balance/run', { method: 'POST', body: body() }); last = r; el.querySelector('#berr').innerHTML = '';
        const cols = r.report.cols.map(c => c.toUpperCase());
        el.querySelector('#bres').innerHTML = `<div class="rephead"><b>${esc(r.bank.bank)}</b> · ${esc(rptTitle())} · ${esc(header(r)[1])}</div>`
          + grid(cols, r.report.rows, { totals: r.report.totals, groups: r.report.groups })
          + `<div class="muted" style="margin-top:6px">${esc(t('balance.manager'))}: ${esc(r.bank.manager)} · ${esc(t('balance.accountant'))}: ${esc(r.bank.accountant)}</div>`;
      } catch (e) { fail(el)(e); }
    };
    const rep = (kind) => async () => {
      let r = last; if (!r) { try { r = last = await api('/api/balance/run', { method: 'POST', body: body() }); } catch (e) { return fail(el)(e); } }
      const cols = r.report.cols.map(c => c.toUpperCase());
      download('/api/balance/report.' + kind, { ...body(), labels: labels(rptTitle(), cols, header(r), sigs(r)) }, 'balance.' + kind, el.querySelector('#berr'));
    };
    el.querySelector('#bpdf').onclick = rep('pdf'); el.querySelector('#bxls').onclick = rep('xlsx');
    el.querySelector('#bexp').onclick = () => {
      const res = el.querySelector('#bres');
      res.innerHTML = `<div class="card"><h3>${esc(t('balance.export_fields'))}</h3>${checks('ef', EXPORT_FIELDS.map(f => ({ f })), 'f', x => lab(x.f))}
        <div class="actions" style="justify-content:flex-start">${btn('bexpgo', 'balance.excel', false)}</div></div>`;
      res.querySelector('#bexpgo').onclick = () => { const fields = checked(res, 'ef', false);
        download('/api/balance/export.xlsx', { ...body(), fields, labels: labels(t('balance.title_balance'), fields) }, 'balance-export.xlsx', el.querySelector('#berr')); };
    };
    el.querySelector('#bf600').onclick = () => download('/api/balance/f600.dbf', { beg: val(el, 'bb'), end: val(el, 'be'), plan: +val(el, 'bp'), divisor: val(el, 'bd') }, 'F600ta.dbf', el.querySelector('#berr'));
    if (I.comp_visible) {
      const cb = () => ({ beg: val(el, 'bb'), end: val(el, 'be'), currency: +val(el, 'bc'), branches: checked(el, 'br') });
      el.querySelector('#bcomp').onclick = async () => {
        try { const r = await api('/api/balance/comp', { method: 'POST', body: cb() }); el.querySelector('#berr').innerHTML = '';
          const cols = ['CODE', 'NAME', 'RESTBEGINPERIOD', 'RESTLASTPERIOD'];
          el.querySelector('#bres').innerHTML = `<div class="rephead"><b>${esc(t('balance.comp'))}</b></div>` + grid(cols, r.report.rows, { groups: r.report.groups })
            + `<div class="actions" style="justify-content:flex-start">${btn('bcpdf', 'balance.pdf')}${btn('bcxls', 'balance.excel')}</div>`;
          const f = (k) => () => download('/api/balance/comp.' + k, { ...cb(), labels: labels(t('balance.comp'), cols) }, 'comp-balance.' + k, el.querySelector('#berr'));
          el.querySelector('#bcpdf').onclick = f('pdf'); el.querySelector('#bcxls').onclick = f('xlsx');
        } catch (e) { fail(el)(e); }
      };
      el.querySelector('#bcset').onclick = async () => {
        try { const rows = await api('/api/balance/comp/settings');
          const res = el.querySelector('#bres');
          res.innerHTML = `<div class="tablewrap"><table class="grid"><thead><tr><th>${esc(lab('CODE'))}</th><th>${esc(lab('BALANCE'))}</th><th>${esc(lab('NAME'))}</th><th></th></tr></thead><tbody>
            ${rows.map((r, i) => `<tr data-k="${i}"><td><input value="${esc(r.code ?? '')}" data-f="code" size="6"></td><td><input value="${esc(r.balance ?? '')}" data-f="balance" size="30"></td>
            <td><input value="${esc(r.name ?? '')}" data-f="name" size="30"></td><td><button class="btn secondary" data-save="${i}">${esc(t('balance.save'))}</button></td></tr>`).join('')}</tbody></table></div>`;
          res.querySelectorAll('[data-save]').forEach(b => b.onclick = async () => {
            const tr = b.closest('tr'), r = rows[+b.dataset.save]; const o = { rowid: r.rowid };
            tr.querySelectorAll('input').forEach(i => o[i.dataset.f] = i.value);
            try { await api('/api/balance/comp/settings', { method: 'POST', body: o }); toast(t('balance.saved')); } catch (e) { fail(el)(e); }
          });
        } catch (e) { fail(el)(e); }
      };
    }
  }

  /* ---------------------------------------------------------------------- DBDBalance (TFrmDayByDayBalance) */
  const DBD_COLS = ['ADATE', 'ACCOUNTNUM', 'ACCOUNTNAME', 'ACTIVE', 'PASSIVE', 'DEBT_TURNOVER', 'CREDIT_TURNOVER'];
  function dbdPage(el, I) {
    el.innerHTML = shell('balance.title_dbd',
      field('balance.beg', `<input type="date" id="db" value="${I.date}">`) + field('balance.end', `<input type="date" id="de" value="${I.date}">`)
      + field('balance.branch', `<select id="dbr"><option value="-1">${esc(t('balance.all_branches'))}</option>${opt(I.branches, 'id', x => x.name)}</select>`)
      + field('balance.plan', `<select id="dp">${opt(plans(), 'id', x => x.n, 0)}</select>`)
      + field('balance.dbd_mode', `<select id="dm"><option value="0">${esc(t('balance.dbd_mode_0'))}</option><option value="1">${esc(t('balance.dbd_mode_1'))}</option></select>`)
      + field('balance.dbd_edit', `<input id="ded" size="28" placeholder="${esc(t('balance.dbd_edit_hint'))}">`)
      + field('balance.symbols', checks('sym', I.symbols, 'symbol', x => x.symbol + ' – ' + x.description))
      + field('balance.currencies', checks('val', I.valutes, 'valute', x => x.valu_name || x.valute))
      + `<label><input type="checkbox" id="dout"> ${esc(t('balance.with_out'))}</label>`,
      btn('dshow', 'balance.show', false) + btn('dxls', 'balance.excel'));
    const body = () => ({ beg: val(el, 'db'), end: val(el, 'de'), branch: +val(el, 'dbr'), plan: +val(el, 'dp'), mode: +val(el, 'dm'), edit: val(el, 'ded'),
      symbols: checked(el, 'sym', false), currencies: checked(el, 'val'), with_out: el.querySelector('#dout').checked });
    el.querySelector('#dshow').onclick = async () => {
      try { const r = await api('/api/dbdbalance/run', { method: 'POST', body: body() }); el.querySelector('#berr').innerHTML = '';
        el.querySelector('#bres').innerHTML = `<h3>${esc(t('balance.sheet_balance'))}</h3>` + grid(DBD_COLS, r.balance, { h: '40vh' })
          + (body().with_out ? `<h3>${esc(t('balance.sheet_out'))}</h3>` + grid(DBD_COLS, r.out, { h: '30vh' }) : '');
      } catch (e) { fail(el)(e); }
    };
    el.querySelector('#dxls').onclick = () => download('/api/dbdbalance/export.xlsx', { ...body(), labels: { ...labels(t('balance.title_dbd'), DBD_COLS), sheet: 'Balans', sheet2: 'Balansdankənar' } }, 'daybyday-balance.xlsx', el.querySelector('#berr'));
  }

  /* -------------------------------------------------------------------------- TodayBalance (TFrmTodayBalance) */
  function todayPage(el, I) {
    const one = I.single_branch ? I.branches[0].branchid : -1;
    el.innerHTML = shell('balance.title_today',
      field('balance.date', `<input type="date" id="td" value="${I.date}">`)
      + field('balance.currency', `<select id="tc"><option value="-1">${esc(t('balance.all_currencies'))}</option>${opt(I.currencies, 'currency', x => x.currlname)}</select>`)
      + field('balance.branch', `<select id="tb" ${I.single_branch ? 'disabled' : ''}>${I.single_branch ? '' : `<option value="-1">${esc(t('balance.all_branches'))}</option>`}${opt(I.branches, 'branchid', x => x.branchname, one)}</select>`)
      + field('balance.amount_type', `<select id="ta"><option value="0">${esc(t('balance.amount_0'))}</option><option value="1">${esc(t('balance.amount_1'))}</option></select>`)
      + field('balance.accounts', `<input id="tl" size="24" placeholder="1001,1101">`)
      + field('balance.report', `<select id="tr">${[0, 1, 2].map(i => `<option value="${i}">${esc(t('balance.trpt_' + i))}</option>`).join('')}</select>`),
      btn('tshow', 'balance.show', false) + btn('tpdf', 'balance.pdf') + btn('txls', 'balance.excel') + btn('texp', 'balance.export_all') + btn('tchk', 'balance.checking'));
    const body = () => ({ date: val(el, 'td'), currency: +val(el, 'tc'), branch: +val(el, 'tb'), amount_type: +val(el, 'ta'), accounts: val(el, 'tl'), report: +val(el, 'tr') });
    let last = null;
    const header = (r) => r ? [[r.bank.bank, r.bank.name].filter(Boolean).join(' · '), `${t('balance.date')}: ${r.target}`] : [];
    el.querySelector('#tshow').onclick = async () => {
      try { const r = last = await api('/api/todaybalance/run', { method: 'POST', body: body() }); el.querySelector('#berr').innerHTML = '';
        el.querySelector('#bres').innerHTML = `<div class="rephead">${esc(header(r).join(' · '))}</div>` + grid(r.report.cols.map(c => c.toUpperCase()), r.report.rows, { totals: r.report.totals });
      } catch (e) { fail(el)(e); }
    };
    const rep = (k) => async () => {
      let r = last; if (!r) { try { r = last = await api('/api/todaybalance/run', { method: 'POST', body: body() }); } catch (e) { return fail(el)(e); } }
      download('/api/todaybalance/report.' + k, { ...body(), labels: labels(t('balance.trpt_' + val(el, 'tr')), r.report.cols.map(c => c.toUpperCase()), header(r)) }, 'today-balance.' + k, el.querySelector('#berr'));
    };
    el.querySelector('#tpdf').onclick = rep('pdf'); el.querySelector('#txls').onclick = rep('xlsx');
    el.querySelector('#texp').onclick = () => download('/api/todaybalance/export.xlsx', { ...body(), labels: labels(t('balance.title_today'), ['ACCOUNTNUMBER', 'ACTIVE', 'PASSIVE', 'DTURNOVER', 'CTURNOVER', 'ACCOUNTNAME']) }, 'today-balance.xlsx', el.querySelector('#berr'));
    el.querySelector('#tchk').onclick = async () => {
      try { const r = await api('/api/todaybalance/checking', { method: 'POST', body: body() }); el.querySelector('#berr').innerHTML = '';
        const res = el.querySelector('#bres'); const BC = ['ACCOUNTNUMBER', 'ACCOUNTNAME', 'ACTIVE', 'PASSIVE', 'DTURNOVER', 'CTURNOVER'];
        const AC = ['ACCNUMBER', 'ACCOUNTNAME', 'ACCCURRENCY', 'ACTIVE', 'PASSIVE', 'DTURNOVER', 'CTURNOVER'];
        const TC = ['ID', 'TRANSACTIONDATE', 'DEBITACCNO', 'DEBITCURRENCYSNAME', 'CREDITACCNO', 'CREDITCURRENCYSNAME', 'DEBITAMOUNT', 'CREDITAMOUNT', 'LAMOUNT', 'TRDESCRIPTION'];
        res.innerHTML = `<h3>${esc(t('balance.balance_accounts'))}</h3><div id="tcb">${grid(BC, r.balance, { h: '28vh' })}</div>
          <label><input type="checkbox" id="trest"> ${esc(t('balance.rest_only'))}</label><h3>${esc(t('balance.accounts_h'))}</h3><div id="tca"></div><h3>${esc(t('balance.transactions'))}</h3><div id="tct"></div>`;
        let accs = [], bi = null;
        const tr = (acc) => { const a = acc == null ? -1 : acc; res.querySelector('#tct').innerHTML = grid(TC, r.transactions.filter(x => x.debitaccid === a || x.creditaccid === a), { h: '24vh' }); };
        const loadAcc = async () => { if (bi === null) return;
          accs = await api('/api/todaybalance/checking/accounts', { method: 'POST', body: { ...body(), account_number: r.balance[bi].accountnumber, rest_only: res.querySelector('#trest').checked } });
          res.querySelector('#tca').innerHTML = grid(AC, accs, { h: '24vh' }); bindRows(res.querySelector('#tca'), (i) => tr(accs[i].accid)); tr(accs.length ? accs[0].accid : null); };
        bindRows(res.querySelector('#tcb'), (i) => { bi = i; loadAcc().catch(fail(el)); });
        res.querySelector('#trest').onchange = () => loadAcc().catch(fail(el));
        if (r.balance.length) { bi = 0; res.querySelector('#tcb tr[data-i="0"]').classList.add('sel'); await loadAcc(); }
      } catch (e) { fail(el)(e); }
    };
  }

  /* ------------------------------------------------------------------------ BalanceAnalys (TFormBalanceAnalys) */
  function analysPage(el, I) {
    el.innerHTML = shell('balance.title_analys',
      field('balance.beg', `<input type="date" id="ab" value="${I.date}">`) + field('balance.end', `<input type="date" id="ae" value="${I.date}">`)
      + field('balance.branches', checks('abr', I.branches, 'id', x => x.name))
      + field('balance.currency', `<span><input type="checkbox" id="acon"> <select id="ac">${opt(I.currencies, 'valute', x => x.valu_name)}</select></span>`)
      + field('balance.balances', `<input id="abal" size="20" placeholder="1001,1101">`)
      + field('balance.view', `<select id="av"><option value="0">${esc(t('balance.view_0'))}</option><option value="1">${esc(t('balance.view_1'))}</option></select>`)
      + field('balance.plan', `<select id="ap">${opt(plans(), 'id', x => x.n, 0)}</select>`)
      + field('balance.operator', `<span><input type="checkbox" id="aopon"> <select id="aop">${opt(I.operators, 'id', x => x.name)}</select></span>`),
      btn('arun', 'balance.refresh', false) + btn('axb', 'balance.excel_balance') + btn('axa', 'balance.excel_accounts') + btn('axt', 'balance.excel_transactions'));
    const body = (extra = {}) => ({ beg: val(el, 'ab'), end: val(el, 'ae'), branches: checked(el, 'abr'), currency_on: el.querySelector('#acon').checked,
      currency: el.querySelector('#acon').checked ? +val(el, 'ac') : null, balances: val(el, 'abal'), view: +val(el, 'av'), plan: +val(el, 'ap'),
      operator: el.querySelector('#aopon').checked ? +val(el, 'aop') : null, ...extra });
    const BC = ['BALANCEACCOUNT', 'FIRSTACTIVE', 'FIRSTPASSIVE', 'DTURNOVER', 'CTURNOVER', 'LASTACTIVE', 'LASTPASSIVE'];
    const AC = ['ACCNO', 'NAME', 'CURRENCYID', 'BRANCHID', 'BEGINACTIVE', 'BEGINPASSIVE', 'DTURNOVER', 'CTURNOVER', 'ENDACTIVE', 'ENDPASSIVE'];
    const TC = ['ID', 'DAT', 'DEBTACC', 'DVALNAME', 'CREDITACC', 'CVALNAME', 'AMMOUNT', 'AMMOUNT_C', 'LAMMOUNT', 'NAME', 'USERNAME'];
    const SC = ['DEBETBALANS', 'KREDITBALANS', 'CEM'];
    let cur = { balans: null, acc: null };
    el.querySelector('#arun').onclick = async () => {
      try { const r = await api('/api/balanceanalys/refresh', { method: 'POST', body: body() }); el.querySelector('#berr').innerHTML = '';
        const res = el.querySelector('#bres');
        res.innerHTML = `<h3>${esc(t('balance.balance_accounts'))}</h3><div id="ag1">${grid(BC, r.balance, { h: '24vh' })}</div><h3>${esc(t('balance.accounts_h'))}</h3><div id="ag2"></div>
          <div style="display:grid;grid-template-columns:1fr 1fr;gap:10px"><div><h3>${esc(t('balance.debt_bal'))}</h3><div id="ag3"></div></div><div><h3>${esc(t('balance.cred_bal'))}</h3><div id="ag4"></div></div></div>
          <h3>${esc(t('balance.transactions'))}</h3><div id="ag5"></div>`;
        const trans = async (kind, extra = {}) => { const x = await api('/api/balanceanalys/transactions', { method: 'POST', body: body({ kind, account_id: cur.acc, ...extra }) });
          res.querySelector('#ag5').innerHTML = grid(TC, x, { h: '24vh' }); };
        const pickAcc = async (a) => { cur.acc = a ? a.accountid : null;
          const s = await api('/api/balanceanalys/balacc', { method: 'POST', body: body({ account_id: cur.acc }) });
          res.querySelector('#ag3').innerHTML = grid(SC, s.debt, { h: '18vh' }); res.querySelector('#ag4').innerHTML = grid(SC, s.cred, { h: '18vh' });
          bindRows(res.querySelector('#ag3'), null, (i) => trans('debt', { balans: s.debt[i].kreditbalans }).catch(fail(el)));
          bindRows(res.querySelector('#ag4'), null, (i) => trans('cred', { balans: s.cred[i].debetbalans }).catch(fail(el)));
          await trans('all'); };
        const pickBal = async (i) => { cur.balans = r.balance[i] ? r.balance[i].balanceaccount : null;
          const accs = r.accounts.filter(a => a.balanceno === cur.balans);
          res.querySelector('#ag2').innerHTML = grid(AC, accs, { h: '24vh' }); bindRows(res.querySelector('#ag2'), (j) => pickAcc(accs[j]).catch(fail(el)));
          await pickAcc(accs[0]); };
        bindRows(res.querySelector('#ag1'), (i) => pickBal(i).catch(fail(el)));
        if (r.balance.length) { res.querySelector('#ag1 tr[data-i="0"]').classList.add('sel'); await pickBal(0); }
      } catch (e) { fail(el)(e); }
    };
    const x = (kind, cols, name) => () => download('/api/balanceanalys/export.xlsx', body({ kind, account_id: cur.acc, balans: cur.balans, labels: labels(t('balance.title_analys'), cols) }), name, el.querySelector('#berr'));
    el.querySelector('#axb').onclick = x('balance', BC, 'balance-analysis.xlsx'); el.querySelector('#axa').onclick = x('account', AC, 'balance-accounts.xlsx');
    el.querySelector('#axt').onclick = x('all', TC, 'balance-transactions.xlsx');
  }

  /* --------------------------------------------------------------------- AccBalanceCheck (TAccBalanceCheckForm) */
  async function checkPage(el) {
    const COLS = ['ACCOUNTNO', 'ACCNAME', 'AMOUNT', 'LAMOUNT', 'DEBITTURNOVER', 'DEBITLTURNOVER', 'CREDITTURNOVER', 'CREDITLTURNOVER'];
    el.innerHTML = shell('balance.title_check', '', btn('cchk', 'balance.check', false) + btn('ccor', 'balance.correct') + btn('cref', 'balance.refresh'));
    let rows = [], sel = 0;
    const draw = () => {
      el.querySelector('#bres').innerHTML = grid(COLS, rows, { sel, extraHead: t('balance.c_STATUS'), extra: (r) => `<td>${r.status ? `<span class="badge ${r.status === 'Ok' ? 'teal' : 'red'}">${esc(t('balance.st_' + r.status))}</span>` : ''}</td>` });
      bindRows(el.querySelector('#bres'), (i) => { sel = i; });
    };
    const load = async () => { try { rows = await api('/api/accbalancecheck/list'); el.querySelector('#berr').innerHTML = ''; draw(); } catch (e) { fail(el)(e); } };
    const act = (a) => async () => { const r = rows[sel]; if (!r) return;
      try { const x = await api(`/api/accbalancecheck/${r.id}/${a}`, { method: 'POST' }); r.status = x.status; draw(); } catch (e) { fail(el)(e); } };
    el.querySelector('#cchk').onclick = act('check'); el.querySelector('#ccor').onclick = act('correct'); el.querySelector('#cref').onclick = load;
    load();
  }

  window.SB.pages['/m/balance'] = (el) => boot(el, '/api/balance/init', balancePage);
  window.SB.pages['/m/daybydaybalance'] = (el) => boot(el, '/api/dbdbalance/init', dbdPage);
  window.SB.pages['/m/todaybalance'] = (el) => boot(el, '/api/todaybalance/init', todayPage);
  window.SB.pages['/m/balanceanalys'] = (el) => boot(el, '/api/balanceanalys/init', analysPage);
  window.SB.pages['/m/accbalancecheck'] = checkPage;
})();

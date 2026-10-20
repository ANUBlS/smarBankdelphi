/* SBDM_ApplyMoney_new.bpl (Yatırım), SBDM_ExtractMoney_new.bpl (Əmanətin ödənilməsi) and the delayed-transactions
   confirmation (SBDM_Common_new TrDelayed_Show). Every rule runs in the API (api/app/dep_ops.py). */
(function () {
  const { api, esc, toast } = window.SB;
  const D = () => window.SB.dep;
  const K = (k, p) => window.SB.t('deposits.' + k, p);
  const money = (v) => v === null || v === undefined || v === '' ? '' : Number(v).toLocaleString(window.I18N.lang, { minimumFractionDigits: 2, maximumFractionDigits: 2 });
  const dt = (v) => v ? String(v).slice(0, 10).split('-').reverse().join('.') : '';
  const numIn = (s) => { const x = parseFloat(String(s).replace(/\s/g, '').replace(',', '.')); return isNaN(x) ? 0 : x; };
  const right = (code) => api('/api/deposits/right/' + code, { method: 'POST' });

  async function download(url, body, name) {
    const res = await fetch(url, { method: 'POST', headers: { 'Content-Type': 'application/json', 'X-CSRF': window.SB.csrf || '' }, credentials: 'same-origin', body: JSON.stringify(body) });
    if (!res.ok) { const j = await res.json().catch(() => ({})); toast(D().errText(j.detail || { key: 'error.generic' }), 'error'); return; }
    const a = document.createElement('a'); a.href = URL.createObjectURL(await res.blob()); a.download = name; a.click();
  }

  // ---------------------------------------------------------------- TrDelayed_Show (TTransactionsViewForm_new)
  function delayed(r) {
    return new Promise((resolve) => {
      let done = false, cur = 0;
      D().modal(`<h3>${esc(r.caption)}</h3><div class="tablewrap" style="max-height:50vh"><table class="grid"><thead><tr>
        <th>${esc(K('o_date'))}</th><th>Debet</th><th>$</th><th>Kredit</th><th>$</th><th>${esc(K('o_tt_cash'))}</th><th style="text-align:right">${esc(K('o_total'))}</th></tr></thead>
        <tbody>${r.delayed.map((x, i) => `<tr data-i="${i}" class="${i === 0 ? 'sel' : ''}"><td>${esc(dt(x.trdate))}</td><td>${esc(x.debitaccno ?? '')}</td><td>${esc(x.debitcurrency ?? '')}</td>
          <td>${esc(x.creditaccno ?? '')}</td><td>${esc(x.creditcurrency ?? '')}</td><td>${esc(x.inbalancechar ?? '')}</td><td style="text-align:right">${esc(money(x.tramount))}</td></tr>`).join('') || `<tr><td colspan="7" class="muted">—</td></tr>`}</tbody></table></div>
        <label class="muted">${esc(K('o_tt_purpose'))}</label><input class="ro" readonly id="ttDesc" style="width:100%" value="${esc(r.delayed[0]?.trdescription ?? '')}">
        <div class="actions"><button class="btn" id="ttOk">${esc(K('tt_commit'))}</button><button class="btn secondary" id="ttNo">${esc(K('tt_dismiss'))}</button></div>`, (m, close) => {
        m.querySelectorAll('tr[data-i]').forEach(tr => tr.onclick = () => {
          cur = +tr.dataset.i; m.querySelectorAll('tr[data-i]').forEach(x => x.classList.toggle('sel', x === tr));
          m.querySelector('#ttDesc').value = r.delayed[cur]?.trdescription ?? '';
        });
        const fin = async (ok) => {
          if (done) return;
          if (!ok && !confirm(K('tt_cancel_confirm'))) return;          // FormCloseQuery: 'Əməliyyat aparılmayacaq! Əminsinizmi?'
          done = true; close();
          try { await api('/api/deposits/delayed/finish', { method: 'POST', body: { ok } }); resolve(ok); }
          catch (e) { toast(D().errText(e), 'error'); resolve(false); }
        };
        m.querySelector('#ttOk').onclick = () => fin(true);
        m.querySelector('#ttNo').onclick = () => fin(false);
        m.addEventListener('keydown', (e) => { if (e.key === 'Escape') { e.preventDefault(); e.stopPropagation(); fin(false); } });
        m.querySelector('#ttOk').focus();
      }, 'wide dep-sub dep-tt');
    });
  }
  window.SB.depDelayed = delayed;

  // shared list form (frmApplyMoneynew / frmExtractMoney_new)
  function listForm(cfg, sel) {
    const body = { contract_id: sel.id };
    return (async () => {
      let o; try { o = await api(cfg.url + '/open', { method: 'POST', body }); } catch (e) { toast(D().errText(e), 'error'); return; }
      const f = { o, refresh: false, cur: o[cfg.rows][0]?.id ?? null };
      D().modal('<div class="opBody"></div>', (m, close) => {
        let exit = () => { close(); if (f.refresh) D().reloadMain(false); };     // FormClose: RefreshWithSavely when an op was OK
        const draw = () => {
          const rows = f.o[cfg.rows], empty = !rows.length, dis = cfg.delNeedsRows && empty ? 'disabled' : '';
          m.querySelector('.opBody').innerHTML = `<h3>${esc(K(cfg.caption, { no: sel.no }))}</h3>
            <div class="toolbar" style="gap:8px"><button class="btn" data-a="new">${esc(K('o_new'))}</button><button class="btn secondary" data-a="del" ${dis}>${esc(K(cfg.delLabel))}</button>
              <button class="btn secondary" data-a="xls" ${dis}>${esc(K('o_excel'))}</button><button class="btn secondary" data-a="exit">${esc(K('o_exit'))}</button></div>
            <fieldset class="dgrp" style="margin:8px 0"><legend>${esc(K(cfg.group))}</legend>${cfg.group === 'o_about' ? esc(K('o_customer')) + ': ' : ''}<b>${esc(f.o.info.name ?? '')}</b></fieldset>
            <div class="tablewrap" style="max-height:45vh"><table class="grid"><thead><tr>${cfg.cols.map(c => `<th style="${c[2] === 'm' ? 'text-align:right' : ''}">${esc(c[1].startsWith('o_') ? K(c[1]) : c[1])}</th>`).join('')}</tr></thead>
            <tbody>${rows.map(x => `<tr data-id="${x.id}" class="${x.id === f.cur ? 'sel' : ''}">${cfg.cols.map(c => `<td style="${c[2] === 'm' ? 'text-align:right' : ''}">${esc(c[2] === 'm' ? money(x[c[0]]) : c[2] === 'd' ? dt(x[c[0]]) : (x[c[0]] ?? ''))}</td>`).join('')}</tr>`).join('')
              || `<tr><td colspan="${cfg.cols.length}" class="muted">${esc(K('empty_ops'))}</td></tr>`}</tbody></table></div>`;
          m.querySelectorAll('tr[data-id]').forEach(tr => {
            tr.onclick = () => { f.cur = +tr.dataset.id; draw(); };
            tr.oncontextmenu = (e) => { f.cur = +tr.dataset.id; draw(); window.SB.contextMenu(e, [{ label: K('view_tr'), onClick: () => toast(K('not_migrated', { bpl: 'SBDM_TransactionViewer.bpl' }), 'info') }]); };
          });
          const b = (a) => m.querySelector(`[data-a="${a}"]`);
          b('new').onclick = () => cfg.add(f, body, async () => { f.refresh = true; f.o = await api(cfg.url + '/open', { method: 'POST', body }); f.cur = f.o[cfg.rows][0]?.id ?? null; draw(); });
          b('del').onclick = async () => {
            try {
              await right(cfg.delRight);
              if (!confirm(K('confirm_delete'))) return;
              f.o = await api(cfg.url + '/delete', { method: 'POST', body: { ...body, item_id: f.cur ?? 0 } }); f.cur = f.o[cfg.rows][0]?.id ?? null; draw();
            } catch (e) { toast(D().errText(e), 'error'); }
          };
          b('xls').onclick = () => download(cfg.url + '/export.xlsx', body, cfg.xls);
          b('exit').onclick = exit;
        };
        draw();
        // Esc closes the form when it is the top modal (focus may be on <body> after a sub-form closed)
        const onKey = (e) => { if (e.key === 'Escape' && [...document.querySelectorAll('.backdrop.stacked')].pop() === m.parentElement) exit(); };
        document.addEventListener('keydown', onKey);
        const exit0 = exit; exit = () => { document.removeEventListener('keydown', onKey); exit0(); };
      }, 'wide');
    })();
  }

  // ---------------------------------------------------------------- frmAddMoneynew
  async function addMoney(f, body, after) {
    let a; try { a = await api('/api/deposits/apply/add', { method: 'POST', body }); } catch (e) { toast(D().errText(e), 'error'); return; }
    D().modal(`<h3>${esc(K('m_deposit'))}</h3><div id="amErr"></div><div class="dc-form">
      <div class="dc-row"><label>${esc(K('o_dep_amount'))}</label><input class="ro" readonly value="${esc(money(a.info.amount))}"></div>
      <div class="dc-row"><label>${esc(K('o_date2'))}</label><input type="date" disabled value="${esc(a.date)}"></div>
      <div class="dc-row"><label>${esc(K('o_sum'))}</label><input id="amSum" inputmode="decimal" value="${esc(a.sum)}"></div>
      <div class="dc-row"><label>${esc(K('o_annual'))}</label><input id="amPct" value="${esc(a.percent_text)}"></div>
      <div class="dc-row"><label>${esc(K('o_custacc'))}</label><select id="amAcc">${a.debit.map(x => `<option value="${x.id}" ${x.id === a.accid ? 'selected' : ''}>${esc(x.acc_no)} · ${esc(x.name ?? '')}</option>`).join('')}</select></div></div>
      <div class="actions"><button class="btn" id="amOk" disabled>${esc(K('o_accept'))}</button><button class="btn secondary" id="amNo">${esc(K('o_refuse'))}</button></div>`, (m, close) => {
      const q = (s) => m.querySelector(s);
      const upd = () => { q('#amOk').disabled = !(numIn(q('#amSum').value) > 0); };    // ActnTransactionUpdate: Value > 0
      q('#amSum').oninput = upd;
      q('#amNo').onclick = close;
      m.addEventListener('keydown', (e) => { if (e.key === 'Escape') { e.preventDefault(); e.stopPropagation(); close(); } });
      q('#amOk').onclick = async () => {
        q('#amErr').innerHTML = '';
        try {
          const r = await api('/api/deposits/apply/run', { method: 'POST', body: { ...body, accid: q('#amAcc').value ? +q('#amAcc').value : null, total: numIn(q('#amSum').value), percent_text: q('#amPct').value, counttransh: a.counttransh } });
          if (await delayed(r)) { close(); await after(); }               // ModalResult := mrOk
        } catch (e) { q('#amErr').innerHTML = `<div class="alert error">${D().errHtmlInner(e)}</div>`; }
      };
      q('#amSum').focus(); q('#amSum').select();
    }, 'dep-sub dep-contract');
  }

  // ---------------------------------------------------------------- frmAddExtractMoney_new
  async function addExtract(f, body, after) {
    let a; try { a = await api('/api/deposits/extract/add', { method: 'POST', body }); } catch (e) { toast(D().errText(e), 'error'); return; }
    const grp = (cap, acc, ost, id, val) => `<fieldset class="dgrp" style="margin-bottom:8px"><legend>${esc(K(cap))}</legend>
      <div class="dc-row"><label>${esc(K('o_accno'))}</label><input class="ro" readonly value="${esc(acc ?? '')}"></div>
      <div class="dc-row"><label>${esc(K('o_rest'))}</label><input class="ro" readonly value="${esc(money(ost))}"></div>
      <div class="dc-row"><label>${esc(K('o_topay'))}</label><input id="${id}" inputmode="decimal" value="${esc(val)}"></div></fieldset>`;
    D().modal(`<h3>${esc(K('m_withdraw'))}</h3><div id="emErr"></div>
      ${grp('o_g_main', a.custacc.contractaccno, a.info.facticaldebt, 'emMain', a.main)}
      ${grp('o_g_int', a.custacc.interestaccno, a.info.facticalinterestdebt, 'emInt', a.interest)}
      <div class="dc-form"><div class="dc-row"><label>${esc(K('o_date'))}</label><input type="date" disabled value="${esc(a.date)}"></div>
      <div class="dc-row"><label>${esc(K('o_custacc'))}</label><select id="emAcc"><option value=""></option>${a.accs.map(x => `<option value="${x.id}" ${x.id === a.accid ? 'selected' : ''}>${esc(x.acc_no)} · ${esc(x.name ?? '')}</option>`).join('')}</select></div></div>
      <div class="actions"><button class="btn" id="emOk">${esc(K('o_accept'))}</button><button class="btn secondary" id="emNo">${esc(K('o_refuse'))}</button></div>`, (m, close) => {
      const q = (s) => m.querySelector(s);
      const upd = () => { q('#emOk').disabled = !((numIn(q('#emMain').value) + numIn(q('#emInt').value)) > 0); };   // ActiontrUpdate
      ['#emMain', '#emInt'].forEach(s => q(s).oninput = upd); upd();
      q('#emNo').onclick = close;
      m.addEventListener('keydown', (e) => { if (e.key === 'Escape') { e.preventDefault(); e.stopPropagation(); close(); } });
      q('#emOk').onclick = async () => {
        q('#emErr').innerHTML = '';
        try {
          const r = await api('/api/deposits/extract/run', { method: 'POST', body: { ...body, accid: q('#emAcc').value ? +q('#emAcc').value : null, main: numIn(q('#emMain').value), interest: numIn(q('#emInt').value) } });
          if (await delayed(r)) { close(); await after(); }
        } catch (e) { q('#emErr').innerHTML = `<div class="alert error">${D().errHtmlInner(e)}</div>`; }
      };
    }, 'dep-sub dep-contract');
  }

  // ---------------------------------------------------------------- SBDM_Prolongation_new (frmProlongation_new)
  async function prolongForm(sel) {
    const body = { contract_id: sel.id }, P = '/api/deposits/prolong';
    let o; try { o = await api(P + '/open', { method: 'POST', body }); } catch (e) { toast(D().errText(e), 'error'); return; }
    D().modal('<div class="opBody"></div>', (m, close) => {
      const draw = () => {
        const dis = o.rows.length ? '' : 'disabled';                                   // ActnDelUpdate / ActnExportUpdate
        m.querySelector('.opBody').innerHTML = `<h3>${esc(K('m_prolongation'))} · ${esc(sel.no)}</h3>
          <div class="toolbar" style="gap:8px"><button class="btn" data-a="new">${esc(K('p_add'))}</button><button class="btn secondary" data-a="del" ${dis} title="${esc(K('p_del_last'))}">${esc(K('o_delete'))}</button>
            <button class="btn secondary" data-a="xls" ${dis}>${esc(K('o_excel'))}</button><button class="btn secondary" data-a="exit">${esc(K('o_exit'))}</button></div>
          <div class="tablewrap" style="max-height:45vh;margin-top:8px"><table class="grid"><thead><tr><th>№</th><th>${esc(K('o_date'))}</th><th>${esc(K('p_old'))}</th><th>${esc(K('p_new'))}</th></tr></thead>
          <tbody>${o.rows.map(x => `<tr data-id="${x.id}"><td>${x.id}</td><td>${esc(dt(x.hdate))}</td><td>${esc(dt(x.olddate))}</td><td>${esc(dt(x.newdate))}</td></tr>`).join('')
            || `<tr><td colspan="4" class="muted">${esc(K('empty_ops'))}</td></tr>`}</tbody></table></div>`;
        const b = (a) => m.querySelector(`[data-a="${a}"]`);
        b('new').onclick = () => addProlong(body, (r) => { o = r; draw(); });
        b('del').onclick = async () => {
          try {
            await right('DELETE_SBCM_PROLONGATION');
            if (!confirm(K('p_confirm_delete'))) return;
            o = await api(P + '/delete', { method: 'POST', body }); draw();
          } catch (e) { toast(D().errText(e), 'error'); }
        };
        b('xls').onclick = () => download(P + '/export.xlsx', body, 'Prolonqasiya.xlsx');
        b('exit').onclick = exit;
      };
      // FormClose has no refresh of the manager grid (none in frmProlongationImpl_new.pas)
      const onKey = (e) => { if (e.key === 'Escape' && [...document.querySelectorAll('.backdrop.stacked')].pop() === m.parentElement) exit(); };
      const exit = () => { document.removeEventListener('keydown', onKey); close(); };
      document.addEventListener('keydown', onKey);
      draw();
    }, 'wide');
  }
  async function addProlong(body, after) {                // ActnAddProlongExecute: INSERT_SBCM_PROLONGATION, frmAddProlongation_new
    let a; try { a = await api('/api/deposits/prolong/add/open', { method: 'POST', body }); } catch (e) { toast(D().errText(e), 'error'); return; }
    D().modal(`<h3>${esc(K('m_prolongation'))}</h3><div id="prErr"></div>
      <fieldset class="dgrp"><legend>${esc(K('p_last_close'))}</legend><input type="date" id="prLast" disabled value="${esc(a.closedate ?? '')}"></fieldset>
      <fieldset class="dgrp"><legend>${esc(K('p_new_close'))}</legend><input type="date" id="prNew" value="${esc(a.newdate)}"></fieldset>
      <div class="actions"><button class="btn" id="prOk">${esc(K('o_accept'))}</button><button class="btn secondary" id="prNo">${esc(K('o_refuse'))}</button></div>`, (m, close) => {
      const q = (s) => m.querySelector(s);
      q('#prNo').onclick = close;
      m.addEventListener('keydown', (e) => { if (e.key === 'Escape') { e.preventDefault(); e.stopPropagation(); close(); } });
      q('#prOk').onclick = async () => {
        q('#prErr').innerHTML = '';
        try { const r = await api('/api/deposits/prolong/add', { method: 'POST', body: { ...body, newdate: q('#prNew').value } }); close(); after(r); }
        catch (e) { q('#prErr').innerHTML = `<div class="alert error">${D().errHtmlInner(e)}</div>`; }   // MessageDlg(rsInvalidDate) keeps the form open
      };
      q('#prNew').focus();
    }, 'dep-sub dep-contract');
  }

  // ---------------------------------------------------------------- Sbdm_Shedule_new (form1 / TPaymentShedule_new)
  async function sheduleForm(sel) {
    const body = { contract_id: sel.id, contract_no: sel.no };
    let o; try { o = await api('/api/deposits/shedule/open', { method: 'POST', body }); } catch (e) { toast(D().errText(e), 'error'); return; }
    let saveOn = false;                       // ToolButton1 / ToolButton14 visually re-enabled by 'Plan' (their actions have no handler)
    D().modal('<div class="opBody"></div>', (m, close) => {
      const tb = (lab, a, on) => `<button class="btn secondary" data-a="${a}" ${on ? '' : 'disabled'}>${esc(K(lab))}</button>`;
      const grid = () => `<table class="grid"><thead><tr><th>№</th><th>${esc(K('o_date'))}</th><th style="text-align:right">${esc(K('s_rate_col'))}</th><th style="text-align:right">${esc(K('s_calc_col'))}</th></tr></thead>
          <tbody>${o.rows.map(x => `<tr><td>${x.seqno}</td><td>${esc(dt(x.hdate))}</td><td style="text-align:right">${esc(x.interest ?? '')}</td><td style="text-align:right">${esc(money(x.ipinterest))}</td></tr>`).join('')
            || `<tr><td colspan="4" class="muted">${esc(K('empty_ops'))}</td></tr>`}</tbody></table>`;
      const draw = () => {
        m.querySelector('.opBody').innerHTML = `<div style="display:flex;justify-content:space-between;align-items:center"><h3>${esc(o.caption)}</h3><button class="btn secondary" data-a="x" title="${esc(K('o_exit'))}">✕</button></div>
          <div class="toolbar" style="gap:6px">${tb('s_save', 'save', saveOn)}${tb('s_print', 'print')}${tb('o_exit', 'exit')}</div>
          <div class="toolbar" style="gap:6px;margin-top:6px">${tb('o_new', 'add')}${tb('s_edit', 'edit')}${tb('o_delete', 'del', saveOn)}${tb('s_refresh', 'ref')}
            <button class="btn" data-a="plan">${esc(K('s_plan'))}</button>${tb('s_change', 'chg')}</div>
          <fieldset class="dgrp" style="margin:8px 0"><legend>${esc(K('o_customer'))}</legend><input class="ro" readonly style="width:100%" value="${esc(o.name)}"></fieldset>
          <fieldset class="dgrp"><legend>${esc(K('s_about'))}</legend><div class="dc-form" style="grid-template-columns:auto 1fr auto 1fr;display:grid;gap:6px 10px">
            <label>${esc(K('s_amount'))}</label><input class="ro" readonly value="${esc(o.amount)}"><label>${esc(K('s_open'))}</label><input class="ro" readonly value="${esc(o.opendate)}">
            <label>${esc(K('s_rate'))}</label><input class="ro" readonly value="${esc(o.interest)}"><label>${esc(K('s_close'))}</label><input class="ro" readonly value="${esc(o.closedate)}"></div></fieldset>
          <div class="tablewrap" style="max-height:40vh;margin-top:8px" id="shGrid">${grid()}</div>`;
        const b = (a) => m.querySelector(`[data-a="${a}"]`);
        b('save').onclick = b('del').onclick = () => toast(K('s_noop'), 'info');
        b('plan').onclick = () => planForm(body, (rows) => { o.rows = rows; m.querySelector('#shGrid').innerHTML = grid(); }, () => { saveOn = true; draw(); });
        b('x').onclick = exit;
      };
      // ActionClose has no handler either: the form closes through the window close box (✕) / Esc (no FormKeyPress -> Esc ignored in Delphi)
      const exit = () => close();
      draw();
    }, 'wide');
  }
  async function planForm(body, onRows, onShown) {   // ToolButton18Click -> TPaymentShedule_new.ShowModal
    let p; try { p = await api('/api/deposits/shedule/plan/open', { method: 'POST', body }); } catch (e) { toast(D().errText(e), 'error'); return; }
    onShown();
    D().modal(`<h3>${esc(K('s_plan'))}</h3><div id="spErr"></div><fieldset class="dgrp"><legend>${esc(K('s_terms'))}</legend>
      <div class="dc-form"><div class="dc-row"><label>${esc(K('s_first'))}</label><input type="date" id="spDate" value="${esc(p.date)}"></div>
      <div class="dc-row"><label>${esc(K('s_sum'))}</label><input id="spAmt" inputmode="decimal" value="${esc(p.amount)}"></div>
      <div class="dc-row"><label>${esc(K('s_periods'))}</label><input id="spPer" value="${esc(p.periods)}"></div></div></fieldset>
      <div class="actions"><button class="btn" id="spOk">${esc(K('o_accept'))}</button><button class="btn secondary" id="spNo">${esc(K('o_refuse'))}</button></div>`, (m, close) => {
      const q = (s) => m.querySelector(s);
      q('#spNo').onclick = close;
      m.addEventListener('keydown', (e) => { if (e.key === 'Escape') { e.preventDefault(); e.stopPropagation(); close(); } });
      q('#spOk').onclick = async () => {                // Button1Click: sbcmperiod, OracleDataSet2.Refresh; the form stays open
        q('#spErr').innerHTML = '';
        try { onRows((await api('/api/deposits/shedule/plan/accept', { method: 'POST', body: { contract_id: body.contract_id, date: q('#spDate').value, amount: numIn(q('#spAmt').value), periods: q('#spPer').value, time: p.time } })).rows); }
        catch (e) { q('#spErr').innerHTML = `<div class="alert error">${D().errHtmlInner(e)}</div>`; }
      };
    }, 'dep-sub dep-contract');
  }

  const APPLY = { url: '/api/deposits/apply', rows: 'tranches', caption: 'o_a_caption', group: 'o_about', delLabel: 'o_delete', delRight: 'DELETE_SBCM_TRANSH',
    delNeedsRows: false, xls: 'Depozit_yatrimlari.xlsx', add: addMoney,
    cols: [['id', '№'], ['hdate', 'o_date', 'd'], ['total', 'o_total', 'm'], ['reserve', 'o_reserve'], ['description', 'o_descr']] };
  const EXTRACT = { url: '/api/deposits/extract', rows: 'payments', caption: 'o_e_caption', group: 'o_customer', delLabel: 'o_cancel_op', delRight: 'DELETE_SBCM_PEYMENT',
    delNeedsRows: true, xls: 'Odenilmis_emeliyyat.xlsx', add: addExtract,
    cols: [['id', '№'], ['hdate', 'o_date', 'd'], ['facticaldebt', 'o_main_from', 'm'], ['interestdebt', 'o_int_from', 'm']] };

  window.SB.depForms = window.SB.depForms || {};
  const needSel = (cfg) => (sel) => sel ? listForm(cfg, sel) : toast(K('err_no_deposit'), 'error');   // Get_SelectedContID
  window.SB.depForms.apply_money = needSel(APPLY);
  window.SB.depForms.extract_money = needSel(EXTRACT);
  window.SB.depForms.shedule = (sel) => sel ? sheduleForm(sel) : toast(K('err_no_deposit'), 'error');
  window.SB.depForms.prolongation = (sel) => sel ? prolongForm(sel) : toast(K('err_no_deposit'), 'error');
})();

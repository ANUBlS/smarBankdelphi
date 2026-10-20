/* NewDepositsApplyMoney.bpl (Yatırım), NewDepositsExtractMoney.bpl (Əmanətin ödənilməsi) and the shared delayed-transactions
   confirmation (TrDelayed_Show). Rules run in the API (api/app/dep_money.py). */
(function () {
  const { api, t, esc, toast } = window.SB;
  const D = () => window.SB.dep;
  const K = (k, p) => t('deposits.' + k, p);
  const money = (v) => v === null || v === undefined || v === '' ? '' : Number(v).toLocaleString(window.I18N.lang, { minimumFractionDigits: 2, maximumFractionDigits: 2 });
  const dt = (v) => v ? String(v).slice(0, 10).split('-').reverse().join('.') : '';
  const numIn = (s) => { const x = parseFloat(String(s).replace(/\s/g, '').replace(',', '.')); return isNaN(x) ? 0 : x; };

  async function download(url, body, name) {
    const res = await fetch(url, { method: 'POST', headers: { 'Content-Type': 'application/json', 'X-CSRF': window.SB.csrf || '' }, credentials: 'same-origin', body: JSON.stringify(body) });
    if (!res.ok) { const j = await res.json().catch(() => ({})); toast(D().errText(j.detail || { key: 'error.generic' }), 'error'); return; }
    const a = document.createElement('a'); a.href = URL.createObjectURL(await res.blob()); a.download = name; a.click();
  }

  // ---------------------------------------------------------------- TrDelayed_Show (TNewTransactionsViewForm)
  function delayed(r) {
    return new Promise((resolve) => {
      let done = false;
      D().modal(`<h3>${esc(r.caption)}</h3><div class="tablewrap" style="max-height:50vh"><table class="grid"><thead><tr>
        <th>${esc(K('tt_date'))}</th><th></th><th>${esc(K('tt_debit'))}</th><th>$</th><th>${esc(K('tt_credit'))}</th><th>$</th><th style="text-align:right">${esc(K('tt_amount'))}</th></tr></thead>
        <tbody>${r.delayed.map((x, i) => `<tr data-i="${i}"><td>${esc(dt(x.trdate))}</td><td title="CANPROCESS ${esc(x.canprocess)}">${+x.canprocess ? '✔' : '⚠'}</td><td>${esc(x.debitaccno ?? '')}</td><td>${esc(x.debitcurrency ?? '')}</td>
          <td>${esc(x.creditaccno ?? '')}</td><td>${esc(x.creditcurrency ?? '')}</td><td style="text-align:right">${esc(money(x.tramount))}</td></tr>`).join('') || `<tr><td colspan="7" class="muted">—</td></tr>`}</tbody></table></div>
        <input class="ro" readonly id="ttDesc" style="width:100%;margin-top:6px" value="${esc(r.delayed[0]?.trdescription ?? '')}">
        <div class="actions"><button class="btn" id="ttOk">${esc(K('tt_commit'))}</button><button class="btn secondary" id="ttNo">${esc(K('tt_dismiss'))}</button></div>`, (m, close) => {
        m.querySelectorAll('tr[data-i]').forEach(tr => tr.onclick = () => { m.querySelector('#ttDesc').value = r.delayed[+tr.dataset.i].trdescription ?? ''; });
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
      }, 'wide');
    });
  }
  window.SB.depDelayed = delayed;

  // ---------------------------------------------------------------- Yatırım
  async function applyForm(sel) {
    const body = { contract_id: sel?.id ?? null };
    let o; try { o = await api('/api/deposits/apply/open', { method: 'POST', body }); } catch (e) { toast(D().errText(e), 'error'); return; }
    const f = { o, refresh: false, cur: o.tranches[0]?.id ?? null };
    D().modal('<div id="amBody"></div>', (m, close) => {
      f.m = m;
      const draw = () => {
        m.querySelector('#amBody').innerHTML = `<h3>${esc(K('am_caption', { no: sel.no }))}</h3>
          <div class="toolbar" style="gap:8px"><button class="btn" id="amNew">${esc(K('m_new'))}</button><button class="btn secondary" id="amDel">${esc(K('delete'))}</button>
            <button class="btn secondary" id="amXls">${esc(K('export'))}</button><button class="btn secondary" id="amExit">${esc(K('exit'))}</button></div>
          <fieldset class="dgrp" style="margin:8px 0"><legend>${esc(K('am_about'))}</legend><span>${esc(K('am_customer'))}: <b>${esc(f.o.info.name ?? '')}</b></span></fieldset>
          <div class="tablewrap" style="max-height:45vh"><table class="grid"><thead><tr><th>№</th><th>${esc(K('am_hdate'))}</th><th style="text-align:right">${esc(K('am_total'))}</th><th>${esc(K('am_descr'))}</th></tr></thead>
          <tbody>${f.o.tranches.map(x => `<tr data-id="${x.id}" class="${x.id === f.cur ? 'sel' : ''}"><td>${x.id}</td><td>${esc(dt(x.hdate))}</td><td style="text-align:right">${esc(money(x.total))}</td><td>${esc(x.description ?? '')}</td></tr>`).join('')
            || `<tr><td colspan="4" class="muted">${esc(K('empty_ops'))}</td></tr>`}</tbody></table></div>`;
        m.querySelectorAll('tr[data-id]').forEach(tr => {
          tr.onclick = () => { f.cur = +tr.dataset.id; draw(); };
          tr.oncontextmenu = (e) => { f.cur = +tr.dataset.id; draw(); window.SB.contextMenu(e, [{ label: K('view_tr'), onClick: () => toast(K('not_migrated', { bpl: 'SBDM_TransactionViewer.bpl (' + (f.o.tranches.find(x => x.id === f.cur)?.trid ?? 0) + ')' }), 'info') }]); };
        });
        m.querySelector('#amNew').onclick = () => addMoney(f, body, draw);
        m.querySelector('#amDel').onclick = async () => {                      // ActnDelExecute (no OnUpdate: always enabled)
          try {
            await api('/api/deposits/right', { method: 'POST', body: { code: 'DELETE_DM_TRANSH' } });
            if (!confirm(K('confirm_delete'))) return;
            f.o = await api('/api/deposits/apply/delete', { method: 'POST', body: { ...body, item_id: f.cur } }); f.cur = f.o.tranches[0]?.id ?? null; draw();
          } catch (e) { toast(D().errText(e), 'error'); }
        };
        m.querySelector('#amXls').onclick = () => download('/api/deposits/apply/export.xlsx', body, 'Depozit_yatrimlari.xlsx');
        m.querySelector('#amExit').onclick = () => { close(); if (f.refresh) D().reloadMain(true); };
      };
      draw();
      m.addEventListener('keydown', (e) => { if (e.key === 'Escape' && !document.querySelector('.backdrop.stacked .modal.dep-sub')) { close(); if (f.refresh) D().reloadMain(true); } });
    }, 'wide');
  }
  async function addMoney(f, body, redraw) {         // ActnAddExecute: right INSERT_DM_TRANSH, then TNewDepositsFrmAddMoney
    let a; try { a = await api('/api/deposits/apply/add', { method: 'POST', body }); } catch (e) { toast(D().errText(e), 'error'); return; }
    D().modal(`<h3>${esc(K('m_deposit'))}</h3><div id="amErr"></div><div class="dc-form">
      <div class="dc-row"><label>${esc(K('am_contractno'))}</label><input class="ro" readonly value="${esc(a.info.contractno ?? '')}"></div>
      <div class="dc-row"><label>${esc(K('am_customer'))}</label><input class="ro" readonly value="${esc(a.info.name ?? '')}"></div>
      <div class="dc-row"><label>${esc(K('am_accno'))}</label><input class="ro" readonly value="${esc(a.debit.acc_no ?? '')}"></div>
      <div class="dc-row"><label>${esc(K('am_percent'))}</label><input class="ro" readonly id="amPct" value="${esc(a.percent_text)}"></div>
      <div class="dc-row"><label>${esc(K('am_amount'))}</label><input class="ro" readonly value="${esc(a.info.amount ?? '')}"></div>
      <div class="dc-row"><label>${esc(K('am_date'))}</label><input class="ro" readonly value="${esc(dt(a.info.opdate))}"></div>
      <div class="dc-row"><label>${esc(K('am_sum'))}</label><input id="amSum" inputmode="decimal" value="${esc(a.sum)}"></div>
      <div class="dc-row"><label>${esc(K('am_purpose'))}</label><select id="amDescr">${a.descripts.map((d, i) => `<option ${i === a.descript_index ? 'selected' : ''}>${esc(d)}</option>`).join('')}</select></div>
      <div class="dc-row"><label>${esc(K('am_accno'))}</label><select id="amAcc">${a.client_accs.map(x => `<option value="${x.id}" ${x.id === a.caccid ? 'selected' : ''}>${esc(x.acc_no)}</option>`).join('')}</select></div>
      <div class="dc-row"><label>${esc(K('am_ostat'))}</label><input class="ro" readonly id="amOst" value="${esc(a.ostat)}"></div></div>
      <div class="actions"><button class="btn" id="amOk" disabled>${esc(K('accept'))}</button><button class="btn secondary" id="amNo">${esc(K('c_cancel'))}</button></div>`, (m, close) => {
      const q = (s) => m.querySelector(s);
      const upd = () => { q('#amOk').disabled = !(numIn(q('#amSum').value) > 0); };    // ActnTransactionUpdate
      q('#amSum').oninput = upd;
      q('#amAcc').onchange = async () => { try { q('#amOst').value = (await api('/api/deposits/apply/ostat', { method: 'POST', body: { accid: +q('#amAcc').value } })).ostat; } catch (e) { toast(D().errText(e), 'error'); } };
      q('#amNo').onclick = close;
      m.addEventListener('keydown', (e) => { if (e.key === 'Escape') { e.preventDefault(); e.stopPropagation(); close(); } });
      q('#amOk').onclick = async () => {
        q('#amErr').innerHTML = '';
        try {
          const r = await api('/api/deposits/apply/run', { method: 'POST', body: { ...body, total: numIn(q('#amSum').value), percent_text: q('#amPct').value, descript: q('#amDescr').value, caccid: +q('#amAcc').value } });
          const ok = await delayed(r);
          if (ok) {                                   // ModalResult := mrOk -> CanRefReshDeposit; Tranches.Refresh
            close(); f.refresh = true; f.o = await api('/api/deposits/apply/open', { method: 'POST', body }); redraw();
          }
        } catch (e) { q('#amErr').innerHTML = `<div class="alert error">${D().errHtmlInner(e)}</div>`; }
      };
      q('#amSum').focus(); q('#amSum').select();
    }, 'dep-sub dep-contract');
  }

  // ---------------------------------------------------------------- Əmanətin ödənilməsi
  async function extractForm(sel) {
    const body = { contract_id: sel?.id ?? null };
    let o; try { o = await api('/api/deposits/extract/open', { method: 'POST', body }); } catch (e) { toast(D().errText(e), 'error'); return; }
    const f = { o, refresh: false, cur: o.payments[0]?.id ?? null };
    const cols = [['id', '№'], ['hdate', K('am_hdate')], ['facticaldebt', K('em_main')], ['interestdebt', K('em_int')], ['clientdebt', K('em_client')], ['trid', 'TRID'], ['inttrid', 'INTTRID'], ['tranchesid', 'TRANCHESID'], ['description', K('em_descr')]];
    const MON = new Set(['facticaldebt', 'interestdebt', 'clientdebt']);
    D().modal('<div id="emBody"></div>', (m, close) => {
      const exit = () => { close(); if (f.refresh) D().reloadMain(true); };
      const draw = () => {
        const empty = !f.o.payments.length;
        m.querySelector('#emBody').innerHTML = `<h3>${esc(K('em_caption', { no: sel.no }))}</h3>
          <div class="toolbar" style="gap:8px"><button class="btn" id="emNew">${esc(K('m_new'))}</button><button class="btn secondary" id="emDel" ${empty ? 'disabled' : ''}>${esc(K('em_cancel_op'))}</button>
            <button class="btn secondary" id="emXls" ${empty ? 'disabled' : ''}>${esc(K('export'))}</button><button class="btn secondary" id="emExit">${esc(K('exit'))}</button></div>
          <fieldset class="dgrp" style="margin:8px 0"><legend>${esc(K('am_customer'))}</legend><b>${esc(f.o.info.name ?? '')}</b></fieldset>
          <div class="tablewrap" style="max-height:45vh"><table class="grid"><thead><tr>${cols.map(c => `<th>${esc(c[1])}</th>`).join('')}</tr></thead>
          <tbody>${f.o.payments.map(x => `<tr data-id="${x.id}" class="${x.id === f.cur ? 'sel' : ''}">${cols.map(c => `<td style="${MON.has(c[0]) ? 'text-align:right' : ''}">${esc(MON.has(c[0]) ? money(x[c[0]]) : c[0] === 'hdate' ? dt(x.hdate) : (x[c[0]] ?? ''))}</td>`).join('')}</tr>`).join('')
            || `<tr><td colspan="${cols.length}" class="muted">${esc(K('empty_ops'))}</td></tr>`}</tbody></table></div>`;
        m.querySelectorAll('tr[data-id]').forEach(tr => { tr.onclick = () => { f.cur = +tr.dataset.id; draw(); }; tr.oncontextmenu = (e) => { e.preventDefault(); }; });   // N1Click body is commented out
        m.querySelector('#emNew').onclick = () => addExtract(f, body, draw);
        m.querySelector('#emDel').onclick = async () => {
          try {
            await api('/api/deposits/right', { method: 'POST', body: { code: 'DELETE_SBCM_PEYMENT' } });
            if (!confirm(K('confirm_delete'))) return;
            f.o = await api('/api/deposits/extract/delete', { method: 'POST', body: { ...body, item_id: f.cur } }); f.cur = f.o.payments[0]?.id ?? null; draw();
          } catch (e) { toast(D().errText(e), 'error'); }
        };
        m.querySelector('#emXls').onclick = () => download('/api/deposits/extract/export.xlsx', body, 'Odenilmis_emeliyyat.xlsx');
        m.querySelector('#emExit').onclick = exit;
      };
      draw();
      m.addEventListener('keydown', (e) => { if (e.key === 'Escape' && !document.querySelector('.modal.dep-sub')) exit(); });
    }, 'wide');
  }
  async function addExtract(f, body, redraw) {        // ActnAddExecute: right INSERT_SBCM_PEYMENT, then TNewDepositsFrmAddExtractMoney
    let a; try { a = await api('/api/deposits/extract/add', { method: 'POST', body }); } catch (e) { toast(D().errText(e), 'error'); return; }
    const grp = (cap, acc, ost, id, val) => `<fieldset class="dgrp" style="margin-bottom:8px"><legend>${esc(K(cap))}</legend>
      <div class="dc-row"><label>${esc(K('am_accno'))}</label><input class="ro" readonly value="${esc(acc ?? '')}"></div>
      <div class="dc-row"><label>${esc(K('am_ostat'))}</label><span style="display:flex;gap:6px"><input class="ro" readonly value="${esc(money(ost))}"><input id="${id}" inputmode="decimal" value="${esc(val)}"></span></div></fieldset>`;
    D().modal(`<h3>${esc(K('m_withdraw'))}</h3><div id="emErr"></div>
      ${grp('em_g_client', a.custacc.clientaccno, a.info.ostat, 'emClient', a.client)}
      ${grp('em_g_main', a.custacc.contractaccno, a.info.facticaldebt, 'emMain', a.main)}
      ${grp('em_g_int', a.custacc.interestaccno, a.info.facticalinterestdebt, 'emInt', a.interest)}
      <div class="dc-row"><label>${esc(K('am_date'))}</label><input type="date" disabled value="${esc(a.date)}"></div>
      <div class="actions"><button class="btn" id="emOk">${esc(K('accept'))}</button><button class="btn secondary" id="emNo">${esc(K('c_cancel'))}</button></div>`, (m, close) => {
      const q = (s) => m.querySelector(s);
      const upd = () => { q('#emOk').disabled = !((numIn(q('#emMain').value) + numIn(q('#emInt').value) + numIn(q('#emClient').value)) > 0); };   // ActiontrUpdate
      ['#emMain', '#emInt', '#emClient'].forEach(s => q(s).oninput = upd); upd();
      q('#emNo').onclick = close;
      m.addEventListener('keydown', (e) => { if (e.key === 'Escape') { e.preventDefault(); e.stopPropagation(); close(); } });
      q('#emOk').onclick = async () => {
        q('#emErr').innerHTML = '';
        try {
          const r = await api('/api/deposits/extract/run', { method: 'POST', body: { ...body, main: numIn(q('#emMain').value), interest: numIn(q('#emInt').value), client: numIn(q('#emClient').value) } });
          if (await delayed(r)) { close(); f.refresh = true; f.o = await api('/api/deposits/extract/open', { method: 'POST', body }); redraw(); }
        } catch (e) { q('#emErr').innerHTML = `<div class="alert error">${D().errHtmlInner(e)}</div>`; }
      };
    }, 'dep-sub dep-contract');
  }

  window.SB.depForms = window.SB.depForms || {};
  const needSel = (fn) => (sel) => sel ? fn(sel) : toast(K('err_no_deposit'), 'error');   // Get_SelectedContID
  window.SB.depForms.apply_money = needSel(applyForm);
  window.SB.depForms.extract_money = needSel(extractForm);
})();

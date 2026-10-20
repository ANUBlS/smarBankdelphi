/* Exchange Manager (V.D.M.) – port of Packages/ExchangeMGR-NBC (TExchangeMGR_X, Unit_ExchangeMGR.pas/.dfm). API:
   api/app/exchangemgr.py. Chunk 1: the main PageControl with the read side of 'Valyuta D. M.', 'Resurslar',
   'Əməliyyatlar', 'Məzənnələr', 'Filiallar üzrə məzənnələr' and 'V.D.M-də Qalıqlar'. GridMaster's current office is the
   master of the Resurslar / Əməliyyatlar / Qalıqlar datasets (DOA Master/Detail EX_NO -> :ex_id). Toolbar actions of
   the forms not ported yet show the "not migrated yet" notice; prints show the "on hold" notice. */
(function () {
  const { api, t, esc, toast } = window.SB;
  const P = '/api/exchangemgr', T = (k, p) => t('em.' + k, p);
  const errT = (e) => t(e.key || 'error.generic', e) + (e.ora ? ' ' + e.ora : '');
  const d10 = (s) => String(s || '').slice(0, 10);
  const fD = (s) => { if (!s) return ''; const [y, m, d] = d10(s).split('-'); return `${d}.${m}.${y}`; };
  const fN = (v, dec) => { if (v === null || v === undefined || v === '') return ''; const n = Number(v); if (dec === undefined) return String(v).replace('.', ',');
    const s = Math.abs(n).toFixed(dec).split('.'); return (n < 0 ? '-' : '') + s[0].replace(/\B(?=(\d{3})+(?!\d))/g, ' ') + ',' + s[1]; };
  const TABS = ['t_main', 't_resurs', 't_trans', 't_rate', 't_rfilial', 't_remainder', 't_turnover'];
  // DBGrid column lists (Unit_ExchangeMGR.dfm): [field, caption key, format]
  const G = {
    master: [['ex_no', 'c_no'], ['ex_name', 'c_ex_name'], ['ex_address', 'c_ex_address'], ['ex_worker_name', 'c_worker'], ['ex_check_no', 'c_check_no'], ['filialname', 'c_filial']],
    resurs: [['status', 'c_hash'], ['commitstatus', 'c_hash2'], ['status_str', 'c_status'], ['dat', 'c_date', 'd'], ['val_name', 'c_currency'], ['ex_name', 'c_vdm_name'], ['amount', 'c_amount', 2], ['insuser', 'c_insuser'], ['commituser', 'c_commituser']],
    trans: [['rownum', 'c_no', null, 'ROWNUM'], ['status', 'c_hash', null, 'STATUS'], ['status_str', 'c_status', null, 'STATUS_STR'], ['status_cashless', 'c_cashless', null, 'STATUS_CASHLESS'], ['dat', 'c_date', 'd', 'DAT'], ['val_name', 'c_currency', null, 'VAL_NAME'],
      ['debitamount', 'c_amount', 2, 'DEBITAMOUNT'], ['val_changed_name', 'c_currency', null, 'VAL_CHANGED_NAME'], ['lamount', 'c_lamount', 2, 'LAMOUNT'], ['fee_amount', 'c_fee', 2, 'FEE_AMOUNT'], ['op_course', 'c_course', null, 'OP_COURSE'],
      ['trans_close', 'c_hash', null, 'TRANS_CLOSE'], ['oper_name', 'c_oper_name', null, 'OPER_NAME'], ['sessionname', 'c_insuser', null, 'SESSIONNAME'], ['username', 'c_commituser', null, 'USERNAME']],
    rate: [['dat', 'c_date', 'd'], ['val_id', 'c_val'], ['val_name', 'c_hash'], ['val_full_name', 'c_val_full'], ['val_purchase_course', 'c_pc', 6], ['val_purchase_course_end', 'c_pce'], ['val_selling_course', 'c_sc', 6], ['val_selling_course_end', 'c_sce'], ['val_nb_course', 'c_nb', 6], ['username', 'c_user']],
    rfilial: [['exname', 'c_point'], ['val_name', 'c_currency'], ['val_purchase_course_user', 'c_pc_cash'], ['val_selling_course_user', 'c_sc_cash'], ['cashless_purchase_course', 'c_pc_nocash'], ['cashless_selling_course', 'c_sc_nocash']],
    remain: [['dat', 'c_date', 'd'], ['val_name', 'c_dollar'], ['first_ostat', 'c_first'], ['ftpe_ostat', 'c_ftpe'], ['pefr_ostat', 'c_pefr'], ['purchase_turn', 'c_pturn'], ['selling_turn', 'c_sturn'], ['current_ostat', 'c_current']],
  };
  const cell = (r, [f, , fmt]) => { const v = r[f]; return fmt === 'd' ? fD(v) : typeof fmt === 'number' ? fN(v, fmt) : (typeof v === 'number' ? fN(v) : (v ?? '')); };
  const grid = (id, cols, rs, cur, titles) => `<div class="em-grid"><table class="grid acc-grid" id="${id}"><thead><tr>${cols.map(c => `<th ${titles && c[3] ? `data-title="${c[3]}" style="cursor:pointer"` : ''}>${esc(T(c[1]))}</th>`).join('')}</tr></thead><tbody>${
    rs.map((r, i) => `<tr data-i="${i}" class="${i === cur ? 'sel' : ''}">${cols.map(c => `<td ${typeof r[c[0]] === 'number' ? 'style="text-align:right"' : ''}>${esc(cell(r, c))}</td>`).join('')}</tr>`).join('')}</tbody></table></div>`;
  const btn = (id, k, dis) => `<button class="btn secondary" id="${id}" ${dis ? 'disabled' : ''}>${esc(T(k))}</button>`;

  async function page(el) {
    el.innerHTML = `<div class="card"><h2>${esc(T('title'))}</h2><div id="emBody">${esc(t('app.loading'))}</div></div>`;
    let j;
    try { j = await api(P + '/init'); } catch (e) { el.querySelector('#emBody').textContent = errT(e); return; }
    if (j.message) toast(T(j.message.slice(3)), 'error');
    const S = { tab: 0, ...j, offices: j.offices || [], provarch: j.provarch || [], resurs: j.resurs || [], remainder: j.remainder || [],
      rates: j.rates || [], rates_filial: j.rates_filial || [], rfilial: j.rfilial || [], cur: 0, curT: 0, curR: 0, title: 'dat', rtitle: 'dat',
      filter: 2, rateDate: d10(j.dat), filialDate: d10(j.dat), filialKey: -1, opForm: {} };
    const office = () => S.offices[S.cur];
    const body = () => ({ ex_no: office() ? office().ex_no : null, dat: d10(S.dat), sdat: d10(S.sdat), title: S.title, rtitle: S.rtitle });
    const ctx = { S, body, office: () => office(), draw: () => draw(),
      apply: (r) => { ['provarch', 'rates', 'remainder', 'sum_fee'].forEach(k => { if (k in r) S[k] = r[k]; }); if (S.curT >= trans().length) S.curT = 0; } };
    const notYet = (k) => () => toast(T('not_yet', { what: T(k) }), 'info');
    const held = (k) => () => toast(T('on_hold', { what: T(k) }), 'info');
    // FilterRadioGroupClick: 0 'status=1', 1 'status=2', 2 '' (or RecordCount = 0)
    const trans = () => S.filter === 2 ? S.provarch : S.provarch.filter(r => r.status === (S.filter === 0 ? 1 : 2));
    async function scroll(i) {                                                     // GridMaster scroll -> details re-open
      S.cur = i; S.curT = 0; S.curR = 0;
      try { Object.assign(S, await api(P + '/office', { method: 'POST', body: body() })); } catch (e) { toast(errT(e), 'error'); }
      draw();
    }
    const sysd = () => `<span class="em-sys">${esc(T('l_date'))} <input type="date" disabled value="${esc(d10(S.dat))}"> ${esc(T('l_time'))} <input disabled value="${esc(S.time || '')}" style="width:80px"></span>`;
    function tabHtml() {
      switch (S.tab) {
        case 0: return `<div class="toolbar">${btn('mAdd', 'add')}${btn('mEdit', 'edit')}${btn('mDel', 'delete')}${btn('mSet', 'settings')}${btn('mPar', 'parameters')}${btn('mAcc', 'acc_settings')}</div>
          ${grid('gMaster', G.master, S.offices, S.cur)}`;
        case 1: return `<div class="toolbar">${sysd()}${btn('rRef', 'refresh')}${btn('rAdd', 'add')}${btn('rConf', 'confirm')}${btn('rDel', 'delete')}${btn('rPrint', 'print')}</div>
          <div class="em-office">${esc(office() ? office().ex_name : '')}</div>${grid('gResurs', G.resurs, S.resurs, S.curR)}`;
        case 2: { const tr = trans(), r = tr[S.curT];
          return `<div class="toolbar">${sysd()}${btn('tRef', 'refresh')}<span class="em-dd">${btn('tAdd', 'add')}<span class="em-menu" id="tMenu" hidden><button data-op="purchase">${esc(T('m_purchase'))}</button><button data-op="selling">${esc(T('m_selling'))}</button></span></span>${btn('tConf', 'confirm', !r || r.trans_close !== 0)}${btn('tDel', 'delete')}${btn('tPrint', 'print', !r || r.trans_close !== 1)}${btn('tOst', 'remainders')}
            <fieldset class="cd-g"><legend>Filter</legend>${['f_purchase', 'f_selling', 'f_all'].map((k, i) => `<label><input type="radio" name="emF" value="${i}" ${S.filter === i ? 'checked' : ''}> ${esc(T(k))}</label>`).join(' ')}</fieldset></div>
            <div class="em-office">${esc(office() ? office().ex_name : '')}</div>${grid('gTrans', G.trans, tr, S.curT, true)}
            <div class="toolbar"><span>${esc(T('l_fee_total'))}</span><input readonly value="${esc(fN(S.sum_fee, 2))}" style="width:140px;text-align:right"></div>`; }
        case 3: return `<div class="toolbar"><input type="date" disabled value="${esc(S.rateDate)}"></div>${grid('gRate', G.rate, S.rates, -1)}`;
        case 4: return `<div class="toolbar">${esc(T('l_date'))} <input type="date" disabled value="${esc(S.filialDate)}"> <span>Filial</span>
            <select id="fKey">${S.rfilial.map(f => `<option value="${f.id}" ${f.id === S.filialKey ? 'selected' : ''}>${esc(f.name)}</option>`).join('')}</select>${btn('fEdit', 'edit')}${btn('fXls', 'excel')}</div>
            ${grid('gRFilial', G.rfilial, S.rates_filial, -1)}`;
        case 5: return `<div class="toolbar"><input type="date" disabled value="${esc(d10(S.dat))}"></div><div class="em-office">${esc(office() ? office().ex_name : '')}</div>${grid('gRemain', G.remain, S.remainder, -1)}`;
        case 6: return `<p>${esc(T('turnover_next'))}</p>`;
      }
      return '';
    }
    function draw() {
      const b = el.querySelector('#emBody');
      b.innerHTML = `<div class="tabs">${TABS.map((k, i) => `<button data-tab="${i}" class="${S.tab === i ? 'on' : ''}">${esc(T(k))}</button>`).join('')}</div>${S.opened ? tabHtml() : ''}`;
      b.querySelectorAll('[data-tab]').forEach(x => x.onclick = () => showTab(+x.dataset.tab));
      const q = (id) => b.querySelector('#' + id), on = (id, f) => { const x = q(id); if (x) x.onclick = f; };
      b.querySelectorAll('#gMaster tr[data-i]').forEach(tr => tr.onclick = () => scroll(+tr.dataset.i));
      b.querySelectorAll('#gTrans tr[data-i]').forEach(tr => tr.onclick = () => { S.curT = +tr.dataset.i; draw(); });   // ODSExchProvarchAfterScroll
      b.querySelectorAll('#gResurs tr[data-i]').forEach(tr => tr.onclick = () => { S.curR = +tr.dataset.i; draw(); });
      b.querySelectorAll('#gTrans th[data-title]').forEach(th => th.onclick = async () => {                          // DBGridEhTransTitleClick2
        S.title = th.dataset.title; try { Object.assign(S, await api(P + '/office', { method: 'POST', body: body() })); } catch (e) { toast(errT(e), 'error'); } draw(); });
      b.querySelectorAll('input[name=emF]').forEach(r => r.onchange = () => { S.filter = +r.value; S.curT = 0; draw(); });
      on('tRef', () => scroll(S.cur));                                                                                // ToolButton11Click2
      on('rRef', async () => { try { S.resurs = (await api(P + '/resurs/refresh', { method: 'POST', body: body() })).resurs; } catch (e) { toast(errT(e), 'error'); } draw(); });   // ToolButton20Click
      const fk = q('fKey'); if (fk) fk.onchange = async () => {                                                      // DBLookupComboBox2Click
        S.filialKey = +fk.value; try { S.rates_filial = (await api(P + '/rates-filial', { method: 'POST', body: { ex_id: S.filialKey, dat: S.filialDate } })).rates_filial; } catch (e) { toast(errT(e), 'error'); } draw(); };
      [['mAdd', 'f_addexch'], ['mEdit', 'f_editexch'], ['mDel', 'delete'], ['mSet', 'settings'], ['mPar', 'parameters'], ['mAcc', 'acc_settings'], ['rAdd', 'f_resurs'], ['rConf', 'confirm'], ['rDel', 'delete'],
        ['tOst', 'remainders'], ['fEdit', 'edit'], ['fXls', 'excel']].forEach(([id, k]) => on(id, notYet(k)));
      on('rPrint', held('print')); on('tPrint', held('print'));
      // Əməliyyatlar toolbar (chunk 2): ToolBtnAddTrans DropdownMenu = PopupMenu (Purchase / Selling; ExchangeCurrency Visible = False)
      on('tAdd', (e) => { e.stopPropagation(); const mn = q('tMenu'); mn.hidden = !mn.hidden; });
      b.querySelectorAll('#tMenu [data-op]').forEach(x => x.onclick = () => { q('tMenu').hidden = true; window.SB.emOps.opDialog(x.dataset.op, ctx); });
      on('tConf', () => window.SB.emOps.confirmTrans(ctx, trans()[S.curT]));          // ToolButton27Click
      on('tDel', () => window.SB.emOps.deleteTrans(ctx, trans()[S.curT]));           // ToolButton6Click2
    }
    async function showTab(i) {
      S.tab = i;
      if (i === 3) { try { S.rates = (await api(P + '/rates', { method: 'POST', body: { dat: S.rateDate } })).rates; } catch (e) { toast(errT(e), 'error'); } }   // TabShRateShow
      if (i === 5) { try { const r = await api(P + '/remainder/show', { method: 'POST', body: body() }); if (r.refreshed) S.remainder = r.remainder; } catch (e) { toast(errT(e), 'error'); } }   // TabRemainderShow
      draw();
    }
    draw();
  }
  window.SB.pages['/m/exchangemgr'] = page;
})();

/* Memorial order – port of Packages/MemorialOrder (TfrmMemorialOrder, MemorialOrderImpl.pas/.dfm + MOrdDataModImpl +
   TuningAccountsUnit 'Sazlama'). Layout as the Delphi form: ToolBar1 on top (Yeniləmək | Hesabat | Filter paneli (check,
   Down) | Sazlama), FilterPanel on the left (RadioGroup1, Tarix, Valyuta, Filial, İstifadəçi, FİLTER, Hesabat forması),
   TransactionsViewer grid (never opened in Delphi -> empty) and Panel2 at the bottom. RefreshTB / ShowReportTB have no
   OnClick in Delphi and do nothing. API in api/app/memorialorder.py. */
(function () {
  const { api, t, esc, toast, modal } = window.SB;
  const P = '/api/memorialorder', T = (k, p) => t('mo.' + k, p);
  const errT = (e) => t(e.key || 'error.generic', e) + (e.ora ? ' ' + e.ora : '');
  const fG = (v) => v === null || v === undefined || v === '' ? '' : String(v).replace('.', ',');   // TFloatField AsString
  // TSearchCombo: Items = [DefaultString] + ViewField values, ItemIndex not set (-1 -> blank)
  const combo = (id, def, items) => `<select id="${id}"><option value="-1" selected></option>
      <option value="0" style="color:navy">${esc(def)}</option>${items.map((x, i) => `<option value="${i + 1}">${esc(x ?? '')}</option>`).join('')}</select>`;
  const COLS = ['c_transid', 'c_operid', 'c_transdate', 'c_debitaccount', 'c_debitaccname', 'c_debitcurrency', 'c_debittaxid',
    'c_creditaccount', 'c_creditaccname', 'c_creditcurrency', 'c_credittaxid', 'c_debitrate', 'c_creditrate', 'c_debitamount', 'c_creditamount', 'c_lamount'];

  async function page(el) {
    el.innerHTML = '<div class="spinner"></div>';
    let I; try { I = await api(P + '/init'); } catch (e) { el.innerHTML = `<div class="card"><div class="alert error">${esc(errT(e))}</div></div>`; return; }
    const S = { mem: I.memorial };
    el.innerHTML = `<div class="card memorialorder"><div class="toolbar"><h2 style="margin:0">${esc(T('title'))}</h2></div>
      <div class="toolbar" style="gap:4px;margin-top:6px">
        <button class="btn secondary" id="moRefresh">${esc(T('refresh'))}</button><span class="sep" style="width:8px"></span>
        <button class="btn secondary" id="moReport">${esc(T('report'))}</button><span class="sep" style="width:8px"></span>
        <button class="btn secondary active" id="moFilterTB" aria-pressed="true">${esc(T('filter_panel'))}</button><span class="sep" style="width:8px"></span>
        <button class="btn secondary" id="moTuning">${esc(T('tuning'))}</button></div>
      <div style="display:flex;gap:6px;margin-top:6px;align-items:stretch">
        <div id="moFilter" class="mo-filter" style="width:200px;flex:0 0 200px;display:flex;flex-direction:column;gap:2px">
          <fieldset class="cd-g" style="margin:0"><label><input type="radio" name="moRG1" value="0" checked> ${esc(T('rg_confirmed'))}</label>
            <label><input type="radio" name="moRG1" value="1"> ${esc(T('rg_planned'))}</label></fieldset>
          <fieldset class="cd-g" style="margin:0"><legend>${esc(T('g_date'))}</legend>
            <input type="date" id="moFirst" value="${esc(I.first)}" > <input type="date" id="moLast" value="${esc(I.last)}" ></fieldset>
          <fieldset class="cd-g" style="margin:0"><legend>${esc(T('g_currency'))}</legend>${combo('moCur', T('all_currencies'), I.currencies)}</fieldset>
          <fieldset class="cd-g" style="margin:0"><legend>${esc(T('g_branch'))}</legend>${combo('moBranch', T('whole_bank'), I.branches)}</fieldset>
          <fieldset class="cd-g" style="margin:0"><legend>${esc(T('g_user'))}</legend>${combo('moUser', T('all_users'), I.users)}<br>
            <label><input type="checkbox" id="moSelf"> ${esc(T('self_trans'))}</label></fieldset>
          <fieldset class="cd-g" style="margin:0"><legend>${esc(T('g_filter'))}</legend>
            <fieldset class="cd-g" style="margin:0"><legend>${esc(T('g_debet'))}</legend><input id="moDebAcc"><br>
              <label><input type="checkbox" id="moDebSub"> ${esc(T('sub_acc'))}</label></fieldset>
            <fieldset class="cd-g" style="margin:0"><legend>${esc(T('g_credit'))}</legend><input id="moCreAcc"><br>
              <label><input type="checkbox" id="moCreSub"> ${esc(T('sub_acc'))}</label></fieldset>
            <label><input type="checkbox" id="moUseFilter"> ${esc(T('use_filter'))}</label></fieldset>
          <fieldset class="cd-g" style="margin:0"><legend>${esc(T('g_report_form'))}</legend>
            <label><input type="checkbox" id="moBlank"> ${esc(T('cust_blank'))}</label><br>
            <label><input type="radio" name="moRG2" value="0" checked> ${esc(T('copies1'))}</label>
            <label><input type="radio" name="moRG2" value="1"> ${esc(T('copies2'))}</label></fieldset>
        </div>
        <div class="tablewrap" style="flex:1;min-height:432px;border:1px solid var(--border)"><table class="grid" id="moGrid">
          <thead><tr>${COLS.map(k => `<th style="color:navy">${esc(T(k))}</th>`).join('')}</tr></thead><tbody></tbody></table></div>
      </div>
      <div style="height:45px;margin-top:6px;border:1px solid var(--border);border-radius:6px;padding:2px;display:flex">
        <fieldset class="cd-g" style="width:185px;margin:0"></fieldset></div></div>`;
    const css = document.createElement('style');
    css.textContent = '.mo-filter fieldset{box-sizing:border-box;width:100%;min-width:0;padding:2px 6px} .mo-filter input:not([type=checkbox]):not([type=radio]),.mo-filter select{box-sizing:border-box;width:100%} .mo-filter label{font-size:12px;white-space:nowrap}';
    el.querySelector('.memorialorder').appendChild(css);
    const v = (id) => el.querySelector('#' + id);
    // UseFilterCBClick (pas:382-402): enables / greys the account edits; called once from ActiveFormCreate (unchecked)
    const useFilter = () => {
      const on = v('moUseFilter').checked;
      ['moDebAcc', 'moDebSub', 'moCreAcc', 'moCreSub'].forEach(id => { v(id).disabled = !on; });
      ['moDebAcc', 'moCreAcc'].forEach(id => { v(id).style.background = on ? '#ffffff' : '#808080'; });
    };
    v('moUseFilter').onclick = useFilter; useFilter();
    v('moSelf').onclick = () => { v('moUser').disabled = v('moSelf').checked; };            // SelfTransactionsCBClick :370-374
    v('moFilterTB').onclick = () => {                                                         // ShowFilterPanelTBClick :376-380
      const b = v('moFilterTB'), down = b.getAttribute('aria-pressed') !== 'true';
      b.setAttribute('aria-pressed', String(down)); b.classList.toggle('active', down);
      v('moFilter').style.display = down ? 'flex' : 'none';
    };
    v('moRefresh').onclick = () => {};                                                        // RefreshTB: no OnClick
    v('moReport').onclick = () => {};                                                         // ShowReportTB: no OnClick
    v('moTuning').onclick = () => tuning(S);                                                  // ToolButton4Click :404-407
  }

  // frmTuning 'Sazlama' (TuningAccountsUnit.dfm): DBNavigator1 [Insert, Delete, Edit, Post, Cancel, Refresh] + DBGrid1 on Memorial
  function tuning(S) {
    const st = { i: S.mem.length ? 0 : -1, mode: 'browse', val: '' };    // mode: browse | edit | insert
    const NAV = [['insert', '+'], ['delete', '−'], ['edit', '▲'], ['post', '✓'], ['cancel', '✕'], ['refresh', '↻']];
    modal(`<div class="cap-head"><h3>${esc(T('tuning'))}</h3><button class="btn secondary" id="tX">✕</button></div>
      <div class="toolbar" id="tNav" style="gap:2px">${NAV.map(([k, g]) => `<button class="btn secondary" data-b="${k}" title="${esc(T('nav_' + k))}" style="min-width:24px;padding:2px 6px">${g}</button>`).join('')}</div>
      <div class="tablewrap" style="margin-top:4px;height:319px;border:1px solid var(--border)"><table class="grid" id="tGrid"></table></div>`, (m, close) => {
      m.style.width = '260px';
      const q = (id) => m.querySelector('#' + id);
      const rows = () => st.mode === 'insert' ? [...S.mem.slice(0, st.i), { balance: null, rid: null }, ...S.mem.slice(st.i)] : S.mem;
      function draw() {
        const R = rows(), editing = st.mode !== 'browse';
        q('tGrid').innerHTML = `<thead><tr><th style="width:12px"></th><th>BALANCE</th></tr></thead><tbody>${R.map((r, i) => `<tr data-i="${i}" class="${i === st.i ? 'sel' : ''}">
          <td>${i === st.i ? (st.mode === 'insert' ? '*' : st.mode === 'edit' ? 'I' : '▶') : ''}</td>
          <td>${i === st.i && editing ? `<input id="tVal" value="${esc(st.val)}" style="width:100%">` : esc(fG(r.balance))}</td></tr>`).join('')}</tbody>`;
        const has = S.mem.length > 0;
        const en = { insert: true, delete: has || st.mode === 'insert', edit: has && !editing, post: editing, cancel: editing, refresh: true };
        m.querySelectorAll('#tNav button').forEach(b => { b.disabled = !en[b.dataset.b]; });
        q('tGrid').querySelectorAll('tr[data-i]').forEach(tr => {
          tr.onclick = async (ev) => {
            const j = +tr.dataset.i; if (j === st.i) { if (!editing && ev.detail === 2) nav('edit'); return; }
            if (editing && !(await nav('post'))) return;                    // scrolling -> CheckBrowseMode (Post)
            st.i = Math.min(j, S.mem.length - 1); draw();
          };
        });
        const inp = q('tVal');
        if (inp) {
          inp.focus(); inp.oninput = () => { st.val = inp.value; };
          inp.onkeydown = (e) => { if (e.key === 'Enter') { e.preventDefault(); nav('post'); } if (e.key === 'Escape') { e.preventDefault(); e.stopPropagation(); nav('cancel'); } };
        }
      }
      async function call(path, body) {
        try { const j = await api(P + path, body ? { method: 'POST', body } : {}); S.mem = j.memorial; return true; }
        catch (e) { toast(errT(e), 'error'); return false; }
      }
      async function nav(b) {
        if (b === 'insert') {                                               // TDataSet.Insert (CheckBrowseMode first)
          if (st.mode !== 'browse' && !(await nav('post'))) return false;
          st.mode = 'insert'; st.i = Math.max(st.i, 0); st.val = '';
        } else if (b === 'edit') {
          if (st.i < 0) return false; st.mode = 'edit'; st.val = fG(S.mem[st.i].balance);
        } else if (b === 'cancel') {
          st.mode = 'browse'; st.i = Math.min(Math.max(st.i, 0), S.mem.length - 1);
        } else if (b === 'post') {
          if (st.mode === 'browse') return true;
          const rid = st.mode === 'insert' ? null : S.mem[st.i].rid;
          if (!(await call('/memorial/post', { rid, balance: st.val }))) return false;   // failed Post keeps the edit state
          if (st.mode === 'insert') st.i = S.mem.length - 1;
          st.mode = 'browse';
        } else if (b === 'delete') {
          if (st.mode === 'insert') { return nav('cancel'); }                 // TDataSet.Delete in dsInsert = Cancel
          if (!confirm(T('confirm_delete'))) return false;                   // DBNavigator ConfirmDelete
          if (!(await call('/memorial/delete', { rid: S.mem[st.i].rid }))) return false;
          st.mode = 'browse'; st.i = Math.min(st.i, S.mem.length - 1);
        } else if (b === 'refresh') {                                        // CheckBrowseMode, then Refresh
          if (st.mode !== 'browse' && !(await nav('post'))) return false;
          if (!(await call('/memorial'))) return false;
          st.i = Math.min(Math.max(st.i, 0), S.mem.length - 1);
        }
        draw(); return true;
      }
      m.querySelectorAll('#tNav button').forEach(btn => { btn.onclick = () => nav(btn.dataset.b); });
      q('tX').onclick = close;
      draw();
    });
  }
  window.SB.pages['/m/memorialorder'] = page;
})();

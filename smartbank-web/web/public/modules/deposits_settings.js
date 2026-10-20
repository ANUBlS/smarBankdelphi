/* SBDM_Settings_new.bpl (ReferLoader_new): showcccgroups / showcategories / showdeposittypes / showaccountturning / showrefer.
   DB-aware grids + TDBNavigator; every Post / Delete runs in the API (api/app/dep_settings.py, DOA default ApplyRecord). */
(function () {
  const { api, esc, toast } = window.SB;
  const D = () => window.SB.dep;
  const K = (k, p) => window.SB.t('deposits.' + k, p);
  const U = '/api/deposits/sett/';
  const call = (p, body) => api(U + p, { method: 'POST', body });
  const fail = (e) => toast(D().errText(e), 'error');
  const v = (x) => x === null || x === undefined ? '' : String(x);
  // Esc goes to the topmost stacked form only (document listener: focus may be on body after a sub-form closed)
  function onEsc(m, fn) {
    const h = (e) => {
      if (!m.isConnected) return document.removeEventListener('keydown', h, true);
      if (e.key !== 'Escape' || [...document.querySelectorAll('.backdrop.stacked')].pop() !== m.parentElement) return;
      e.preventDefault(); e.stopPropagation(); document.removeEventListener('keydown', h, true); fn(e);
    };
    document.addEventListener('keydown', h, true);
  }

  // TDBNavigator (all VisibleButtons): First Prior Next Last Insert Delete Edit Post Cancel Refresh
  const NAV = [['first', '⏮'], ['prior', '◀'], ['next', '▶'], ['last', '⏭'], ['insert', '+'], ['delete', '−'], ['edit', '▲'], ['post', '✓'], ['cancel', '✗'], ['refresh', '↻']];
  function navHtml(g) {
    const br = g.mode === 'browse', n = g.rows.length, i = g.cur;
    const en = { first: br && i > 0, prior: br && i > 0, next: br && i < n - 1, last: br && i < n - 1, insert: true, delete: br && n > 0,
                 edit: br && n > 0, post: !br, cancel: !br, refresh: br };
    return `<div class="dep-nav">${NAV.map(([a, s]) => `<button class="btn secondary" data-nav="${a}" title="${esc(K('st_nav_' + a))}" ${en[a] ? '' : 'disabled'}>${s}</button>`).join('')}</div>`;
  }

  /* editable DB grid: cfg {cols:[{f, title, edit, max, w}], post(rec, values) -> data, del(rec) -> data, refresh() -> data, rowsOf(data)} */
  function dbGrid(host, cfg) {
    const g = { rows: [], cur: 0, mode: 'browse', draft: null };
    const curRec = () => g.mode === 'insert' ? null : g.rows[g.cur];
    const set = (data) => { g.rows = cfg.rowsOf(data); g.cur = Math.min(g.cur, Math.max(g.rows.length - 1, 0)); g.mode = 'browse'; g.draft = null; cfg.onData && cfg.onData(data); draw(); };
    const cell = (c, r, i) => {
      const editing = g.mode !== 'browse' && i === g.cur && c.edit;
      return editing ? `<td><input data-f="${c.f}" maxlength="${c.max || 32}" value="${esc(v(g.draft[c.f]))}" style="width:100%"></td>` : `<td>${esc(v(r[c.f.toLowerCase()]))}</td>`;
    };
    function draw() {
      const rows = g.mode === 'insert' ? [...g.rows.slice(0, g.cur), {}, ...g.rows.slice(g.cur)] : g.rows;
      host.innerHTML = `<div class="tablewrap" style="max-height:${cfg.h || 300}px"><table class="grid acc-grid"><thead><tr><th style="width:12px"></th>${cfg.cols.map(c => `<th style="${c.w ? 'width:' + c.w + 'px' : ''}">${esc(c.title)}</th>`).join('')}</tr></thead>
        <tbody>${rows.map((r, i) => `<tr data-i="${i}" class="${i === g.cur ? 'sel' : ''}"><td class="muted">${i === g.cur ? (g.mode === 'insert' ? '*' : g.mode === 'edit' ? 'I' : '▸') : ''}</td>${cfg.cols.map(c => cell(c, r, i)).join('')}</tr>`).join('')}</tbody></table></div>
        ${cfg.nav ? navHtml(g) : ''}`;
      host.querySelectorAll('tr[data-i]').forEach(tr => {
        tr.onclick = async () => { const i = +tr.dataset.i; if (i === g.cur) return; if (g.mode !== 'browse' && !(await doPost())) return; g.cur = Math.min(i, g.rows.length - 1); draw(); cfg.onMove && cfg.onMove(g.rows[g.cur]); };
        tr.ondblclick = () => { if (g.mode === 'browse' && cfg.nav) startEdit(); };
      });
      host.querySelectorAll('input[data-f]').forEach(inp => {
        inp.oninput = () => { g.draft[inp.dataset.f] = inp.value; g.modified = true; };
        inp.onkeydown = (e) => { if (e.key === 'Enter') { e.preventDefault(); doPost(); } };
      });
      host.querySelector('input[data-f]')?.focus();
      host.querySelectorAll('[data-nav]').forEach(b => b.onclick = () => nav(b.dataset.nav));
    }
    const startEdit = () => { const r = g.rows[g.cur]; if (!r) return; g.mode = 'edit'; g.modified = false; g.draft = Object.fromEntries(cfg.cols.map(c => [c.f, r[c.f.toLowerCase()]])); draw(); };
    async function doPost() {
      if (g.mode === 'browse') return true;
      try { const wasIns = g.mode === 'insert'; const d = await cfg.post(curRec(), g.draft); if (wasIns) g.cur = g.rows.length; set(d); return true; }
      catch (e) { fail(e); return false; }
    }
    async function nav(a) {
      const n = g.rows.length;
      if (a === 'first') g.cur = 0; else if (a === 'prior') g.cur = Math.max(0, g.cur - 1);
      else if (a === 'next') g.cur = Math.min(n - 1, g.cur + 1); else if (a === 'last') g.cur = n - 1;
      else if (a === 'insert') { if (g.mode !== 'browse' && !(await doPost())) return; g.mode = 'insert'; g.modified = false; g.draft = Object.fromEntries(cfg.cols.map(c => [c.f, c.f === cfg.masterField ? cfg.masterValue() : null])); }
      else if (a === 'edit') return startEdit();
      else if (a === 'post') return doPost();
      else if (a === 'cancel') { g.mode = 'browse'; g.draft = null; }
      else if (a === 'delete') { if (!confirm(K('st_nav_delq'))) return; try { set(await cfg.del(g.rows[g.cur])); } catch (e) { fail(e); } return; }   // ConfirmDelete
      else if (a === 'refresh') { try { set(await cfg.refresh()); } catch (e) { fail(e); } return; }
      draw(); if (['first', 'prior', 'next', 'last'].includes(a)) cfg.onMove && cfg.onMove(g.rows[g.cur]);
    }
    g.set = set; g.draw = draw; g.curRec = curRec;
    return g;
  }

  // ---------------------------------------------------------------- frmCategories_new (showcategories)
  async function categories() {
    let o; try { o = await call('open', { form: 'categories' }); } catch (e) { return fail(e); }
    D().modal(`<h3>${esc(K('s_categories'))}</h3><div class="stGrid"></div><div class="dep-status"></div>`, (m, close) => {
      const g = dbGrid(m.querySelector('.stGrid'), {
        nav: true, h: 280, cols: [{ f: 'CATEGORY', title: 'Müştərinin tipi', edit: true, max: 128 }], rowsOf: (d) => d.rows,
        post: (r, vals) => call('post', { form: 'categories', rid: r?.rid ?? null, values: vals }),
        del: (r) => call('delete', { form: 'categories', rid: r?.rid ?? null }), refresh: () => call('open', { form: 'categories' }) });
      g.set(o);
      // KeyPreview: FormKeyPress Close, then DBGridEh1KeyPress Categories.Delete (Insert state: Cancel). No confirmation.
      onEsc(m, async () => {
        close();
        if (g.mode === 'insert') return;
        try { await call('delete', { form: 'categories', rid: g.rows[g.cur]?.rid ?? null }); } catch (er) { fail(er); }
      });
      m.tabIndex = -1; m.focus();
    }, 'dep-sub dep-st-cat');
  }

  // ---------------------------------------------------------------- frmAccGroups_new (showcccgroups)
  async function cccgroups() {
    let o; try { o = await call('open', { form: 'cccgroups' }); } catch (e) { return fail(e); }
    D().modal(`<h3>${esc(K('s_cccgroups'))}</h3><div class="stZones"></div><div class="stInfo"></div>`, (m, close) => {
      let zoneid = o.zoneid;
      const zg = dbGrid(m.querySelector('.stZones'), {
        h: 155, cols: [{ f: 'ZONEID', title: '№', w: 69 }, { f: 'DESCRIPTION', title: 'Qrupun adı' }], rowsOf: (d) => d.zones,
        onMove: async (r) => { if (!r) return; zoneid = r.zoneid; try { ig.set(await call('open', { form: 'cccgroups', zoneid })); } catch (e) { fail(e); } } });
      const ig = dbGrid(m.querySelector('.stInfo'), {
        nav: true, h: 155, masterField: 'ZONEID', masterValue: () => zoneid,
        cols: [{ f: 'ZONEID', title: 'Qrupun  №', edit: true, max: 24 }, { f: 'ACCGROUP', title: 'Balans hesabı', edit: true, max: 24 }], rowsOf: (d) => d.rows,
        post: (r, vals) => call('post', { form: 'cccgroups', zoneid, rid: r?.rid ?? null, values: vals }),
        del: (r) => call('delete', { form: 'cccgroups', zoneid, rid: r?.rid ?? null }), refresh: () => call('open', { form: 'cccgroups', zoneid }) });
      zg.set(o); ig.set(o);
      onEsc(m, close);   // FormKeyPress
      m.tabIndex = -1; m.focus();
    }, 'dep-sub dep-st-grp');
  }

  // ---------------------------------------------------------------- frmDepositTypes_new (showdeposittypes) + frmAddEditDepositTypes_new
  async function depositTypes() {
    let o; try { o = await call('open', { form: 'deposittypes' }); } catch (e) { return fail(e); }
    D().modal(`<div class="stBody"></div>`, (m, close) => {
      let cur = 0;
      const draw = () => {
        const rows = o.rows;
        m.querySelector('.stBody').innerHTML = `<h3>${esc(K('s_deposittypes'))}</h3>
          <div class="toolbar" style="gap:8px"><button class="btn" data-a="new">Yeni</button><button class="btn secondary" data-a="edit">Redaktə</button>
            <button class="btn secondary" data-a="del">Silmək</button><button class="btn secondary" data-a="ref">Yeniləmək</button></div>
          <div class="tablewrap" style="max-height:340px"><table class="grid acc-grid"><thead><tr><th style="width:50px">№</th><th>Adı</th></tr></thead>
          <tbody>${rows.map((r, i) => `<tr data-i="${i}" class="${i === cur ? 'sel' : ''}"><td>${esc(v(r.id))}</td><td>${esc(v(r.type))}</td></tr>`).join('')}</tbody></table></div>
          <div class="actions"><button class="btn secondary" data-a="close">Bağla</button></div>`;
        m.querySelectorAll('tr[data-i]').forEach(tr => tr.onclick = () => { cur = +tr.dataset.i; draw(); });
        m.querySelectorAll('[data-a]').forEach(b => b.onclick = () => act(b.dataset.a));
      };
      const refresh = async () => { try { o = await call('open', { form: 'deposittypes' }); cur = Math.min(cur, Math.max(o.rows.length - 1, 0)); draw(); } catch (e) { fail(e); } };
      async function act(a) {
        const r = o.rows[cur];
        if (a === 'close') return close();
        if (a === 'ref') return refresh();
        if (a === 'del') {                                     // ToolButton5Click
          if (!confirm('Silinməsinə əminsinizmi?')) return;
          try { o = await call('delete', { form: 'deposittypes', id: r?.id ?? 0 }); cur = Math.min(cur, Math.max(o.rows.length - 1, 0)); draw(); } catch (e) { fail(e); refresh(); }
          return;
        }
        if (a === 'edit' && !r) return fail({ key: 'deposits.st_err_empty' });
        await typeForm(a === 'new' ? null : r);
        refresh();                                             // DepositTypes.Refresh (CheckBrowseMode handled server side)
      }
      function typeForm(r) {
        return new Promise((resolve) => {
          const st = { TYPE: r?.type ?? '', WITHDRAWTYPE: r ? r.withdrawtype : null, PERCENT_RULE: r?.percent_rule === 1, AMOUNT_RULE: r?.amount_rule === 1, modified: false };
          D().modal(`<h3>${r ? 'Redaktə' : 'Yeni'}</h3>
            <div class="form-grid" style="grid-template-columns:40px 1fr;gap:6px"><label>Adı</label><input id="dtType" maxlength="256" value="${esc(st.TYPE)}">
              <label>Tipi</label><select id="dtWith"><option value=""></option>${o.withtypes.map(w => `<option value="${esc(w.withdrtype)}" ${w.withdrtype === st.WITHDRAWTYPE ? 'selected' : ''}>${esc(w.withdrtypedesc)}</option>`).join('')}</select></div>
            <label style="display:block;margin:8px 0"><input type="checkbox" id="dtAmount" ${st.AMOUNT_RULE ? 'checked' : ''}> Cari məbləğə görə hesabla</label>
            <div class="actions"><button class="btn" id="dtOk">Qəbul</button><button class="btn secondary" id="dtNo">İmtina</button></div>`, (f, closeF) => {
            const done = () => { closeF(); resolve(); };
            f.querySelector('#dtType').oninput = (e) => { st.TYPE = e.target.value; st.modified = true; };
            f.querySelector('#dtWith').onchange = (e) => { st.WITHDRAWTYPE = e.target.value || null; st.modified = true; };
            f.querySelector('#dtAmount').onchange = (e) => { st.AMOUNT_RULE = e.target.checked; };       // TCheckBox: not data-aware
            const body = (esc_) => ({ form: 'deposittypes', rid: r?.rid ?? null, esc: esc_, modified: st.modified,
                                      values: { TYPE: st.TYPE, WITHDRAWTYPE: st.WITHDRAWTYPE, PERCENT_RULE: st.PERCENT_RULE, AMOUNT_RULE: st.AMOUNT_RULE } });
            f.querySelector('#dtOk').onclick = async () => { try { await call('post', body(false)); done(); } catch (e) { fail(e); } };   // Post; Commit
            f.querySelector('#dtNo').onclick = done;                                                                                 // Cancel
            onEsc(f, async () => {                                // Esc closes; the caller's Refresh -> CheckBrowseMode (Post if modified)
              try { if (st.modified) await call('post', body(true)); } catch (er) { fail(er); } done();
            });
            f.querySelector('#dtType').focus();
          }, 'dep-sub dep-st-dtf');
        });
      }
      draw();
      onEsc(m, close);
      m.tabIndex = -1; m.focus();
    }, 'wide dep-sub dep-st-dt');
  }

  // ---------------------------------------------------------------- frmAccountTurning_new (showaccountturning) + frmAddEditAccTurning_new
  async function accountTurning() {
    let o; try { o = await call('open', { form: 'accountturning' }); } catch (e) { return fail(e); }
    D().modal(`<div class="stBody"></div>`, (m, close) => {
      let cur = 0;
      const load = async (b) => { try { o = await call('open', { form: 'accountturning', ...b }); cur = Math.min(cur, Math.max(o.rows.length - 1, 0)); draw(); } catch (e) { fail(e); } };
      const ids = () => ({ typeid: o.typeid, parentid: o.parentid });
      const draw = () => {
        const has = o.rows.length > 0;                          // ActionList1Update: Del / Edit need RecordCount > 0
        m.querySelector('.stBody').innerHTML = `<h3>${esc(K('s_accountturning'))}</h3>
          <div class="toolbar" style="gap:8px"><button class="btn" data-a="add" title="${esc(K('st_add'))}">+</button><button class="btn secondary" data-a="edit" title="${esc(K('st_edit'))}" ${has ? '' : 'disabled'}>✎</button>
            <button class="btn secondary" data-a="del" title="${esc(K('st_del'))}" ${has ? '' : 'disabled'}>−</button><button class="btn secondary" data-a="ref">Yeniləmək</button><button class="btn secondary" data-a="close">Bağla</button></div>
          <div style="display:grid;grid-template-columns:1fr 1.4fr;gap:8px">
            <div class="tablewrap" style="max-height:170px"><table class="grid acc-grid"><thead><tr><th>Müştərinin tipi</th></tr></thead><tbody>${o.categories.map(c => `<tr data-t="${c.id}" class="${c.id === o.typeid ? 'sel' : ''}"><td>${esc(v(c.category))}</td></tr>`).join('')}</tbody></table></div>
            <div class="tablewrap" style="max-height:170px"><table class="grid acc-grid"><thead><tr><th>Hesab qrupu</th></tr></thead><tbody>${o.movies.map(x => `<tr data-p="${x.id}" class="${x.id === o.parentid ? 'sel' : ''}"><td>${esc(v(x.description))}</td></tr>`).join('')}</tbody></table></div></div>
          <div class="tablewrap" style="max-height:220px;margin-top:8px"><table class="grid acc-grid"><thead><tr><th>Filial</th><th style="width:60px">$</th><th>Hesabın №-si</th></tr></thead>
            <tbody>${o.rows.map((r, i) => `<tr data-i="${i}" class="${i === cur ? 'sel' : ''}"><td>${esc(v(r.filialname))}</td><td>${esc(v(r.currencyname))}</td><td>${esc(v(r.accountnumber))}</td></tr>`).join('')}</tbody></table></div>`;
        m.querySelectorAll('tr[data-t]').forEach(tr => tr.onclick = () => { cur = 0; load({ typeid: +tr.dataset.t }); });
        m.querySelectorAll('tr[data-p]').forEach(tr => tr.onclick = () => { cur = 0; load({ typeid: o.typeid, parentid: +tr.dataset.p }); });
        m.querySelectorAll('tr[data-i]').forEach(tr => tr.onclick = () => { cur = +tr.dataset.i; draw(); });
        m.querySelectorAll('[data-a]').forEach(b => b.onclick = () => act(b.dataset.a));
      };
      async function act(a) {
        const r = o.rows[cur];
        if (a === 'close') return close();
        if (a === 'ref') return load(ids());
        if (a === 'del') {
          if (!confirm('Silinməsinə əminsinizmi?')) return;
          try { o = await call('delete', { form: 'accountturning', ...ids(), rid: r?.rid ?? null }); cur = Math.min(cur, Math.max(o.rows.length - 1, 0)); draw(); } catch (e) { fail(e); }
          return;
        }
        await accForm(a === 'add' ? null : r); load(ids());
      }
      function accForm(r) {
        return new Promise((resolve) => {
          const st = { BRANCHID: r ? r.branchid : null, CURRENCYID: r ? r.currencyid : null, ACCID: r ? r.accid : null, modified: false };
          const opt = (lst, k, lab, sel) => `<option value=""></option>` + lst.map(x => `<option value="${esc(v(x[k]))}" ${x[k] === sel ? 'selected' : ''}>${esc(v(x[lab]))}</option>`).join('');
          D().modal(`<h3>${r ? 'Redaktə' : 'Yeni'}</h3>
            <div class="form-grid" style="grid-template-columns:70px 1fr;gap:6px"><label>Filial</label><select id="atBr">${opt(o.filials, 'id', 'name', st.BRANCHID)}</select>
              <label>Valyuta</label><select id="atVal">${opt(o.valutes, 'valute', 'val_name', st.CURRENCYID)}</select>
              <label>Hesab №</label><select id="atAcc">${opt(o.accounts, 'id', 'acc_no', st.ACCID)}</select></div>
            <div class="actions"><button class="btn" id="atOk">Qəbul</button><button class="btn secondary" id="atNo">İmtina</button></div>`, (f, closeF) => {
            const done = () => { closeF(); resolve(); };
            const num = (x) => x === '' ? null : Number(x);
            f.querySelector('#atBr').onchange = (e) => { st.BRANCHID = num(e.target.value); st.modified = true; };
            f.querySelector('#atVal').onchange = (e) => { st.CURRENCYID = num(e.target.value); st.modified = true; };   // DataField CURRENCYID; LocateKey moves valute
            f.querySelector('#atAcc').onchange = (e) => { st.ACCID = num(e.target.value); st.modified = true; };
            const body = (esc_) => ({ form: 'accountturning', ...ids(), rid: r?.rid ?? null, esc: esc_, modified: st.modified,
                                      values: { BRANCHID: st.BRANCHID, ACCID: st.ACCID, CURRENCYID: st.CURRENCYID } });
            f.querySelector('#atOk').onclick = async () => { try { await call('post', body(false)); done(); } catch (e) { fail(e); } };
            f.querySelector('#atNo').onclick = done;
            onEsc(f, async () => {
              try { if (st.modified) await call('post', body(true)); } catch (er) { fail(er); } done();
            });
            f.querySelector('#atBr').focus();
          }, 'dep-sub dep-st-atf');
        });
      }
      draw();
      onEsc(m, close);
      m.tabIndex = -1; m.focus();
    }, 'wide dep-sub dep-st-at');
  }

  // ---------------------------------------------------------------- frmReferences_new (showrefer; menu N1 is Visible = False)
  async function refer() {
    let o; try { o = await call('open', { form: 'refer' }); } catch (e) { return fail(e); }
    D().modal(`<h3>${esc(K('st_refer'))}</h3><div style="display:grid;grid-template-columns:1fr 1fr;gap:10px">
        <fieldset><legend>Verilənlər</legend><div class="stTree" style="max-height:320px;overflow:auto"></div></fieldset>
        <fieldset><legend>Qiymətlər</legend><div class="stVal"></div><div class="actions"><button class="btn" id="rfOk" disabled>Qəbul</button></div></fieldset></div>`, (m, close) => {
      let sel = null, item = { mode: 'none', apply: false };
      const tree = (nodes, d) => nodes.map(n => `<div class="rf-node" data-id="${n.id}" style="padding-left:${d * 16}px;cursor:pointer">${n.children.length ? '▾' : '·'} ${esc(v(n.lname))}</div>${tree(n.children, d + 1)}`).join('');
      m.querySelector('.stTree').innerHTML = tree(o.tree, 0);
      const drawVal = () => {
        const box = m.querySelector('.stVal');
        box.innerHTML = item.mode === 'combo' ? `<select id="rfCombo" style="width:100%">${item.items.map((x, i) => `<option value="${i}" ${i === item.index ? 'selected' : ''}>${esc(x)}</option>`).join('')}</select>`
          : `<input id="rfEdit" style="width:100%" value="${esc(item.mode === 'edit' ? item.value : '')}" ${item.mode === 'edit' ? '' : 'disabled'}>`;
        if (item.mode === 'combo' && item.index === -1) box.querySelector('#rfCombo').selectedIndex = -1;
        m.querySelector('#rfOk').disabled = !item.apply;
      };
      m.querySelectorAll('.rf-node').forEach(nd => nd.onclick = async () => {      // TVChange
        m.querySelectorAll('.rf-node').forEach(x => x.classList.toggle('sel', x === nd)); sel = +nd.dataset.id;
        try { item = await call('refer/item', { form: 'refer', id: sel }); drawVal(); } catch (e) { fail(e); }
      });
      m.querySelector('#rfOk').onclick = async () => {        // BtnApplyClick
        const b = { form: 'refer', id: sel };
        if (item.mode === 'combo') { const i = m.querySelector('#rfCombo').selectedIndex; b.index = i; } else b.value = m.querySelector('#rfEdit').value;
        try { item = await call('refer/apply', b); drawVal(); } catch (e) { fail(e); }
      };
      drawVal();
      onEsc(m, close);
    }, 'wide dep-sub dep-st-ref');
  }

  window.SB.depForms = window.SB.depForms || {};
  Object.assign(window.SB.depForms, { sett_categories: categories, sett_cccgroups: cccgroups, sett_deposittypes: depositTypes,
                                      sett_accountturning: accountTurning, sett_refer: refer });
})();

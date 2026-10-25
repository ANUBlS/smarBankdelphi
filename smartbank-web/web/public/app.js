/* SmartBank web shell – vanilla JS, no build step. All texts via t('key') from /locales/*.json */
(function () {
  'use strict';
  const S = { cfg: null, session: null, system: null, tree: [], modules: {}, activePath: null, collapsed: false,
              lastActivity: Date.now(), lastPing: 0, idleWarnShown: false, search: '' };
  const $app = () => document.getElementById('app');
  const esc = (v) => String(v ?? '').replace(/[&<>"']/g, c => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c]));
  const fmtDate = (iso) => { if (!iso) return '—'; const d = new Date(iso); return isNaN(d) ? iso : d.toLocaleDateString(I18N.lang, { day: '2-digit', month: 'short', year: 'numeric' }); };
  const fmtDT = (iso) => { if (!iso) return '—'; const d = new Date(iso); return isNaN(d) ? iso : d.toLocaleString(I18N.lang, { day: '2-digit', month: 'short', year: 'numeric', hour: '2-digit', minute: '2-digit', second: '2-digit' }); };

  // ---------------------------------------------------------------- API
  async function api(path, { method = 'GET', body, activity = true } = {}) {
    const headers = { 'Accept': 'application/json' };
    if (body !== undefined) headers['Content-Type'] = 'application/json';
    if (!activity) headers['X-SB-Activity'] = '0';
    let r;
    try { r = await fetch(path, { method, headers, body: body !== undefined ? JSON.stringify(body) : undefined, credentials: 'same-origin' }); }
    catch (_) { throw { key: 'error.network' }; }
    const ct = r.headers.get('content-type') || '';
    const data = ct.includes('json') ? await r.json() : await r.text();
    if (!r.ok) {
      const d = (data && data.detail) || {};
      const e = typeof d === 'object' && d.key ? { ...d, status: r.status } : { key: 'error.generic', status: r.status };
      if (r.status === 401 && e.key === 'error.session_expired' && S.session) { S.session = null; showLogin({ info: t('error.session_expired') }); }
      throw e;
    }
    return data;
  }
  const errText = (e) => esc(t(e.key || 'error.generic', e)) + (e.ora ? `<span class="ora">${esc(e.ora)}</span>` : '');

  function toast(msg, kind = '') {
    const el = document.createElement('div'); el.className = 'toast ' + kind; el.textContent = msg;
    document.getElementById('toasts').appendChild(el); setTimeout(() => el.remove(), 6500);
  }
  function modal(html, onMount) {
    const root = document.getElementById('modal-root');
    root.innerHTML = `<div class="backdrop"><div class="modal" role="dialog">${html}</div></div>`;
    const close = () => { root.innerHTML = ''; };
    onMount && onMount(root.querySelector('.modal'), close);
    return close;
  }
  const langSelect = (cls = 'lang-select') =>
    `<select class="${cls}" id="lang" aria-label="${esc(t('header.language'))}">${I18N.languages.map(l => `<option value="${esc(l.code)}" ${l.code === I18N.lang ? 'selected' : ''}>${esc(l.name)}</option>`).join('')}</select>`;
  function bindLang(rerender) {
    const el = document.getElementById('lang');
    el && el.addEventListener('change', async () => { await I18N.load(el.value); rerender(); });
  }

  // ---------------------------------------------------------------- login
  function showLogin(opts = {}) {
    stopIdle();
    location.hash = '#/login';
    const expired = !!opts.expired;
    $app().innerHTML = `
    <div class="login-wrap">
      <div class="login-brand">
        <div class="logo"><div class="logo-mark">SB</div>${esc(S.cfg.product_name)}</div>
        <div><h1>${esc(t('app.title'))}</h1><p>${esc(t('login.subtitle'))}</p></div>
        <small style="opacity:.6">© SmartBank</small>
      </div>
      <div class="login-panel"><form class="login-card" id="loginForm" autocomplete="off" novalidate>
        <div class="lang-row">${langSelect()}</div>
        <h2>${esc(t('login.title'))}</h2><p class="sub">${esc(t('login.subtitle'))}</p>
        ${opts.info ? `<div class="alert info">${esc(opts.info)}</div>` : ''}
        <div id="loginErr"></div>
        <div class="field"><label for="u">${esc(t('login.username'))}</label><input id="u" name="username" value="${esc(opts.username || '')}" ${expired ? 'readonly' : ''} autofocus></div>
        <div class="field"><label for="p">${esc(t('login.password'))}</label><input id="p" type="password" name="password"></div>
        ${expired ? `<div class="alert info">${esc(t('login.password_expired'))}</div>
          <div class="field"><label for="np">${esc(t('login.new_password'))}</label><input id="np" type="password"></div>
          <div class="field"><label for="np2">${esc(t('login.new_password_retype'))}</label><input id="np2" type="password"></div>` : ''}
        <button class="btn" style="width:100%" id="loginBtn">${esc(t(expired ? 'login.set_and_sign_in' : 'login.submit'))}</button>
      </form></div>
    </div>`;
    bindLang(() => showLogin(opts));
    const form = document.getElementById('loginForm');
    if (opts.username) document.getElementById('p').focus();
    form.addEventListener('submit', async (ev) => {
      ev.preventDefault();
      const u = form.querySelector('#u').value.trim(), p = form.querySelector('#p').value;
      const errBox = document.getElementById('loginErr');
      if (!u || !p) { errBox.innerHTML = `<div class="alert error">${esc(t('login.required'))}</div>`; return; }
      const body = { username: u, password: p };
      if (expired) { body.new_password = form.querySelector('#np').value; body.new_password_retype = form.querySelector('#np2').value; }
      const btn = document.getElementById('loginBtn'); btn.disabled = true; btn.textContent = t('login.signing_in');
      try {
        const r = await api('/api/login', { method: 'POST', body });
        startSplash(r);
      } catch (e) {
        btn.disabled = false; btn.textContent = t(expired ? 'login.set_and_sign_in' : 'login.submit');
        if (e.key === 'login.password_expired') return showLogin({ expired: true, username: u });
        let extra = e.remaining !== undefined ? `<div style="margin-top:6px">${esc(t('login.attempts_left', { n: e.remaining }))}</div>` : '';
        errBox.innerHTML = `<div class="alert error">${errText(e)}${extra}</div>`;
        form.querySelector('#p').value = ''; form.querySelector('#p').focus();
      }
    });
  }

  // ---------------------------------------------------------------- splash
  async function startSplash(loginRes) {
    location.hash = '#/home';
    $app().innerHTML = `<div class="splash"><div class="logo"><div class="logo-mark">SB</div>${esc(S.cfg.product_name)}</div>
      <div class="progress"><div id="pb" style="width:5%"></div></div><div class="step" id="st">${esc(t('splash.loading_session'))}</div></div>`;
    const step = (pct, key) => { document.getElementById('pb').style.width = pct + '%'; document.getElementById('st').textContent = t(key); };
    try {
      S.session = await api('/api/session');
      step(35, 'splash.loading_system'); S.system = await api('/api/system');
      step(65, 'splash.loading_menu'); S.tree = await api('/api/tree');
      S.modules = (await fetch('/modules.json').then(r => r.json())).modules || {};
      step(100, 'splash.ready');
      await new Promise(r => setTimeout(r, 350));
      renderMain();
      (loginRes && loginRes.warnings || []).forEach(w => toast(t(w.key, w), 'warn'));
      if (S.system.last_login) toast(`${t('header.last_login')}: ${fmtDT(S.system.last_login)}`);
      startIdle();
      route();
    } catch (e) {
      if (e.status === 401) return showLogin();
      $app().innerHTML = `<div class="center-screen"><div class="card"><div class="alert error">${errText(e)}</div><button class="btn" id="back">${esc(t('common.ok'))}</button></div></div>`;
      document.getElementById('back').onclick = () => logout();
    }
  }

  // ---------------------------------------------------------------- main layout
  function renderMain() {
    const s = S.system;
    $app().innerHTML = `
    <div class="layout">
      <header class="topbar">
        <button class="btn ghost" id="toggleSide" title="${esc(t('header.toggle_menu'))}" aria-label="${esc(t('header.toggle_menu'))}">☰</button>
        <div class="logo"><div class="logo-mark">SB</div>${esc(s.product_name)}</div>
        <div class="meta">
          <div class="meta-item"><small>${esc(t('header.operation_date'))}</small><span id="hdrDate">${esc(fmtDate(s.operation_date))}</span></div>
          <div class="meta-item"><small>${esc(t('header.user'))}</small><span>${esc(s.app_header || s.username)}</span></div>
          <div class="meta-item"><small>${esc(t('header.branch'))}</small><span>${esc(s.branch ?? '—')}</span></div>
          <div class="meta-item"><small>${esc(t('header.company'))}</small><span id="hdrCompany">${esc(S.session.company || '—')}</span></div>
          <div class="meta-item"><small>${esc(t('header.last_login'))}</small><span>${esc(fmtDT(s.last_login))}</span></div>
        </div>
        <div class="spacer"></div>
        ${langSelect('')}
        <div class="menu" id="userMenu"><button class="btn ghost" id="userBtn">${esc(s.username)} ▾</button>
          <div class="menu-pop">
            <button data-act="company">${esc(t('header.change_company'))}</button>
            <button data-act="password">${esc(t('header.change_password'))}</button>
            ${S.session.is_admin ? `<button data-act="history">${esc(t('history.title'))}</button>` : ''}
            <button data-act="logout">${esc(t('header.logout'))}</button>
          </div></div>
      </header>
      <div class="body ${S.collapsed ? 'collapsed' : ''}" id="body">
        <aside class="sidebar"><div class="side-tools">
          <input id="treeSearch" placeholder="${esc(t('tree.search'))}" value="${esc(S.search)}">
          <div class="row"><button id="expAll">${esc(t('tree.expand_all'))}</button><button id="colAll">${esc(t('tree.collapse_all'))}</button></div>
        </div><nav class="tree" id="tree"></nav></aside>
        <main class="content" id="content"></main>
      </div>
    </div>`;
    bindLang(() => { renderMain(); route(); });
    document.getElementById('toggleSide').onclick = () => { S.collapsed = !S.collapsed; document.getElementById('body').classList.toggle('collapsed', S.collapsed); };
    const um = document.getElementById('userMenu');
    document.getElementById('userBtn').onclick = (e) => { e.stopPropagation(); um.classList.toggle('open'); };
    document.addEventListener('click', () => um.classList.remove('open'));
    um.querySelectorAll('[data-act]').forEach(b => b.onclick = () => {
      const a = b.dataset.act; um.classList.remove('open');
      if (a === 'company') companyDialog(); if (a === 'password') passwordDialog(); if (a === 'logout') logout();
      if (a === 'history') location.hash = '#/admin/login-history';
    });
    const ts = document.getElementById('treeSearch');
    ts.addEventListener('input', () => { S.search = ts.value; renderTree(); });
    document.getElementById('expAll').onclick = () => document.querySelectorAll('#tree li.folder').forEach(li => li.classList.remove('closed'));
    document.getElementById('colAll').onclick = () => document.querySelectorAll('#tree li.folder').forEach(li => li.classList.add('closed'));
    renderTree();
  }

  function renderTree() {
    const q = S.search.trim().toLowerCase();
    const hl = (s) => { if (!q) return esc(s); const i = s.toLowerCase().indexOf(q); return i < 0 ? esc(s) : esc(s.slice(0, i)) + '<mark>' + esc(s.slice(i, i + q.length)) + '</mark>' + esc(s.slice(i + q.length)); };
    const cap = (n) => n.caption_key ? t(n.caption_key) : n.caption;   // web-only locale key for captions added by the port
    const match = (n) => !q || cap(n).toLowerCase().includes(q) || n.children.some(match);
    const build = (nodes) => '<ul>' + nodes.filter(match).map(n => {
      const folder = n.children.length > 0;
      const denied = n.clsid && !n.allowed;
      const ico = folder ? '📁' : (denied ? '🔒' : '📄');
      return `<li class="${folder ? 'folder' : ''} ${folder && !q ? 'closed' : ''}">
        <div class="node ${denied ? 'denied' : ''} ${S.activePath === n.path ? 'active' : ''}" data-path="${esc(n.path)}" ${denied ? `title="${esc(t('tree.denied'))}"` : ''} tabindex="0">
          <span class="tw">${folder ? '▸' : ''}</span><span class="ico">${ico}</span><span class="cap">${hl(cap(n))}</span></div>
        ${folder ? build(n.children) : ''}</li>`;
    }).join('') + '</ul>';
    const el = document.getElementById('tree');
    const html = S.tree.length ? build(S.tree) : `<p class="muted" style="padding:12px">${esc(t('tree.empty'))}</p>`;
    el.innerHTML = q && !S.tree.some(match) ? `<p class="muted" style="padding:12px">${esc(t('tree.no_results'))}</p>` : html;
    el.querySelectorAll('.node').forEach(nd => {
      const act = () => {
        const li = nd.parentElement, n = findNode(S.tree, nd.dataset.path);
        if (li.classList.contains('folder')) { li.classList.toggle('closed'); nd.querySelector('.tw').textContent = li.classList.contains('closed') ? '▸' : '▾'; }
        if (n && n.clsid) openNode(n);
      };
      nd.addEventListener('click', act); nd.addEventListener('keydown', e => { if (e.key === 'Enter') act(); });
    });
  }
  const findNode = (ns, p) => { for (const n of ns) { if (n.path === p) return n; const f = findNode(n.children, p); if (f) return f; } return null; };
  // variant key '<CLSID>@<params>' first: Out_BalanceAnalys shares the BalanceAnalys CLSID (tree Action '#n@Out')
  const slugFor = (clsid, params) => { const m = (params && S.modules[clsid + '@' + params]) || S.modules[clsid]; return (m && m.route) || '/m/unknown'; };

  async function openNode(n) {
    if (!n.allowed) { toast(t('tree.denied'), 'error'); return; }
    try {
      const r = await api('/api/modules/open', { method: 'POST', body: { path: n.path } });
      S.activePath = n.path;
      location.hash = '#' + slugFor(r.clsid, r.params) + '?node=' + encodeURIComponent(n.path);
    } catch (e) { toast(t(e.key, e), 'error'); }
  }

  // ---------------------------------------------------------------- routes / pages
  const pages = {};  // future migrated modules register here: pages['/m/accounts'] = (ctx) => {...}
  window.SB = { pages, api, t, esc, toast, modal, fmtDate, fmtDT, state: S };

  function closeAllModals() {
    const mr = document.getElementById('modal-root');
    if (mr) mr.innerHTML = '';
    document.querySelectorAll('.backdrop').forEach(b => b.remove());
  }

  (function installModalExitGuard() {
    if (window.__sbModalGuard) return;
    window.__sbModalGuard = true;
    const closeBackdrop = (bd) => {
      if (!bd) return;
      if (bd.parentElement && bd.parentElement.id === 'modal-root') bd.parentElement.innerHTML = '';
      else bd.remove();
    };
    const enhance = (bd) => {
      if (!bd || bd.dataset.sbEnhanced) return;
      bd.dataset.sbEnhanced = '1';
      const m = bd.querySelector('.modal');
      if (m && !m.querySelector('.modal-close-x')) {
        const x = document.createElement('button');
        x.type = 'button';
        x.className = 'modal-close-x';
        x.title = 'Bağla (Esc)';
        x.textContent = '✕';
        x.addEventListener('click', (e) => {
          e.stopPropagation();
          closeBackdrop(bd);
        });
        m.insertBefore(x, m.firstChild);
      }
      bd.addEventListener('click', (e) => {
        if (e.target === bd) closeBackdrop(bd);
      });
    };
    const mo = new MutationObserver(() => {
      document.querySelectorAll('.backdrop').forEach(enhance);
    });
    mo.observe(document.documentElement, { childList: true, subtree: true });
    document.addEventListener('keydown', (e) => {
      if (e.key === 'Escape') {
        const bds = document.querySelectorAll('.backdrop');
        if (bds.length) {
          e.stopPropagation();
          closeBackdrop(bds[bds.length - 1]);
        }
      }
    });
  })();

  function route() {
    closeAllModals();
    if (!S.session) return;
    const h = location.hash.replace(/^#/, '') || '/home';
    const [path, qs] = h.split('?');
    const params = new URLSearchParams(qs || '');
    const c = document.getElementById('content'); if (!c) return;
    if (params.get('node')) { S.activePath = params.get('node'); document.querySelectorAll('.node').forEach(x => x.classList.toggle('active', x.dataset.path === S.activePath)); }
    if (path === '/home' || path === '/login') return homePage(c);
    if (path === '/admin/login-history') return historyPage(c);
    const entry = Object.entries(S.modules).find(([, m]) => m.route === path);
    if (entry && entry[1].migrated && pages[path]) return pages[path](c, { clsid: entry[0], module: entry[1], node: findNode(S.tree, S.activePath), params });
    if (entry && entry[1].route === '/home') return homePage(c);
    notMigratedPage(c, entry, findNode(S.tree, S.activePath));
  }
  window.addEventListener('hashchange', route);

  function homePage(c) {
    c.innerHTML = `<div class="card"><h2>${esc(t('home.welcome', { user: S.system.app_header || S.system.username }))}</h2><p class="muted">${esc(t('home.hint'))}</p>
      <dl class="kv"><dt>${esc(t('header.operation_date'))}</dt><dd>${esc(fmtDate(S.system.operation_date))}</dd>
      <dt>${esc(t('header.branch'))}</dt><dd>${esc(S.system.branch ?? '—')}</dd>
      <dt>${esc(t('header.last_login'))}</dt><dd>${esc(fmtDT(S.system.last_login))}</dd>
      <dt>${esc(t('header.last_logout'))}</dt><dd>${esc(fmtDT(S.system.last_logout))}${S.system.logout_reason === 'idle' ? ' · ' + esc(t('history.reason_idle')) : ''}</dd></dl></div>`;
  }

  function notMigratedPage(c, entry, node) {
    const m = entry ? entry[1] : null;
    c.innerHTML = `<div class="card"><div class="nm-ill">⏳</div><h2>${esc(t('module.not_migrated_title'))}</h2>
      <p>${esc(t('module.not_migrated_text', { name: node ? node.caption : (m ? m.name : t('module.unknown')) }))}</p>
      <dl class="kv"><dt>${esc(t('module.clsid'))}</dt><dd>${esc(entry ? entry[0] : (node && node.clsid) || '—')}</dd>
      <dt>${esc(t('module.delphi_class'))}</dt><dd>${esc(m ? m.delphi_class : '—')}</dd>
      <dt>${esc(t('module.source'))}</dt><dd>${esc(m ? m.source : '—')}</dd>
      ${node && node.params ? `<dt>${esc(t('module.params'))}</dt><dd>${esc(node.params)}</dd>` : ''}</dl>
      <p style="margin-top:16px"><span class="badge amber">${esc(t('module.not_migrated_title'))}</span></p></div>`;
  }

  // ---------------------------------------------------------------- admin: login history + lockouts
  async function historyPage(c) {
    if (!S.session.is_admin) { c.innerHTML = `<div class="card"><div class="alert error">${esc(t('error.access_denied'))}</div></div>`; return; }
    const f = historyPage.f || (historyPage.f = { user: '', date_from: '', date_to: '', status: '' });
    c.innerHTML = `<div class="card"><h2>${esc(t('history.title'))}</h2><p class="muted">${esc(t('history.note'))}</p>
      <form class="filters" id="hf">
        <div class="field"><label>${esc(t('history.user'))}</label><input name="user" value="${esc(f.user)}"></div>
        <div class="field"><label>${esc(t('history.from'))}</label><input type="date" name="date_from" value="${esc(f.date_from)}"></div>
        <div class="field"><label>${esc(t('history.to'))}</label><input type="date" name="date_to" value="${esc(f.date_to)}"></div>
        <div class="field"><label>${esc(t('history.status'))}</label><select name="status">${['', 'success', 'failed', 'locked', 'blocked', 'db_locked', 'unlocked'].map(s => `<option value="${s}" ${f.status === s ? 'selected' : ''}>${esc(t(s ? 'history.status_' + s : 'history.status_all'))}</option>`).join('')}</select></div>
        <button class="btn">${esc(t('history.apply'))}</button><button class="btn secondary" type="button" id="hreset">${esc(t('history.reset'))}</button>
        <a class="btn secondary" id="hcsv" style="text-decoration:none">${esc(t('history.export'))}</a>
      </form><div id="hcount" class="muted"></div><div class="tablewrap" id="htable"></div></div>
      <div class="card" style="margin-top:20px"><h2>${esc(t('lock.title'))}</h2><div class="alert info">${esc(t('lock.db_note'))}</div>
        <form class="filters" id="uf"><div class="field"><label>${esc(t('lock.unlock_user'))}</label><input name="username" required></div><button class="btn">${esc(t('lock.unlock'))}</button></form>
        <div id="lockTable"></div></div>
      <div class="card" style="margin-top:20px"><h2>${esc(t('lock.actions'))}</h2><div class="tablewrap" id="actTable"></div></div>`;
    const qs = () => new URLSearchParams({ user: f.user, date_from: f.date_from, date_to: f.date_to }).toString();
    const load = async () => {
      document.getElementById('hcsv').href = '/api/admin/login-history.csv?' + qs();
      try {
        let rows = await api('/api/admin/login-history?' + qs());
        if (f.status) rows = rows.filter(r => r.status === f.status);
        document.getElementById('hcount').textContent = t('history.count', { n: rows.length });
        const badge = (st) => `<span class="badge ${st === 'success' ? 'teal' : st === 'unlocked' ? '' : st === 'failed' ? 'amber' : 'red'}">${esc(t('history.status_' + st))}</span>`;
        const reason = (r) => r.status !== 'success' ? '' : r.logout_reason ? esc(t('history.reason_' + r.logout_reason)) : `<span class="muted">${esc(t('history.reason_active'))}</span>`;
        document.getElementById('htable').innerHTML = `<table class="grid"><thead><tr><th>${esc(t('history.col_user'))}</th><th>${esc(t('history.col_status'))}</th><th>${esc(t('history.col_login'))}</th><th>${esc(t('history.col_logout'))}</th><th>${esc(t('history.col_reason'))}</th><th>${esc(t('history.col_error'))}</th><th>${esc(t('history.col_session'))}</th><th>${esc(t('history.col_ip'))}</th></tr></thead><tbody>
          ${rows.map(r => `<tr><td>${esc(r.username)}</td><td>${badge(r.status)}</td><td>${esc(fmtDT(r.login_at))}</td><td>${esc(r.logout_at ? fmtDT(r.logout_at) : '')}</td><td>${reason(r)}</td><td style="font-family:Consolas,monospace;font-size:12px">${esc(r.error || '')}</td><td>${esc(r.oracle_session_id ?? '')}</td><td>${esc(r.client_ip || '')}</td></tr>`).join('')}</tbody></table>`;
        const locks = await api('/api/admin/lockouts');
        document.getElementById('lockTable').innerHTML = locks.length ? `<table class="grid"><thead><tr><th>${esc(t('history.col_user'))}</th><th>${esc(t('lock.col_failed'))}</th><th>${esc(t('lock.col_locked_at'))}</th><th>${esc(t('lock.col_last_failed'))}</th><th></th></tr></thead><tbody>
          ${locks.map(l => `<tr><td>${esc(l.username)}</td><td>${esc(l.failed_count)}</td><td>${l.locked_at ? `<span class="badge red">${esc(fmtDT(l.locked_at))}</span>` : '—'}</td><td>${esc(fmtDT(l.last_failed_at))}</td><td><button class="btn small" data-unlock="${esc(l.username)}">${esc(t('lock.unlock'))}</button></td></tr>`).join('')}</tbody></table>` : `<p class="muted">${esc(t('lock.none'))}</p>`;
        document.querySelectorAll('[data-unlock]').forEach(b => b.onclick = () => doUnlock(b.dataset.unlock));
        const acts = await api('/api/admin/actions');
        document.getElementById('actTable').innerHTML = `<table class="grid"><tbody>${acts.map(a => `<tr><td>${esc(fmtDT(a.at))}</td><td>${esc(a.admin)}</td><td>${esc(a.action)}</td><td>${esc(a.target)}</td><td style="font-size:12px">${esc(a.details)}</td></tr>`).join('')}</tbody></table>`;
      } catch (e) { document.getElementById('htable').innerHTML = `<div class="alert error">${errText(e)}</div>`; }
    };
    const doUnlock = async (u) => {
      if (!confirm(t('lock.confirm', { user: u }))) return;
      try {
        const r = await api('/api/admin/unlock', { method: 'POST', body: { username: u } });
        toast(t('lock.unlocked', { user: u }) + ' · ' + t(r.oracle_unlocked ? 'lock.oracle_unlocked' : 'lock.oracle_not_found'));
        load();
      } catch (e) { modal(`<h3>${esc(t('lock.unlock'))}</h3><div class="alert error">${errText(e)}</div><div class="actions"><button class="btn" id="mc">${esc(t('common.close'))}</button></div>`, (m, close) => m.querySelector('#mc').onclick = close); load(); }
    };
    document.getElementById('hf').onsubmit = (e) => { e.preventDefault(); const fd = new FormData(e.target); Object.assign(f, Object.fromEntries(fd)); load(); };
    document.getElementById('hreset').onclick = () => { Object.assign(f, { user: '', date_from: '', date_to: '', status: '' }); historyPage(c); };
    document.getElementById('uf').onsubmit = (e) => { e.preventDefault(); doUnlock(e.target.username.value.trim()); };
    load();
  }

  // ---------------------------------------------------------------- dialogs
  async function companyDialog() {
    let list = [];
    try { list = await api('/api/companies'); } catch (e) { return toast(t(e.key, e), 'error'); }
    modal(`<h3>${esc(t('company.title'))}</h3><div class="company-list">${list.map(c => `<button data-name="${esc(c.name)}" class="${c.name === S.session.company ? 'sel' : ''}">${esc(c.name)}</button>`).join('')}</div>
      <div class="actions"><button class="btn secondary" id="cc">${esc(t('password.cancel'))}</button></div>`, (m, close) => {
      m.querySelector('#cc').onclick = close;
      // CompanySelection.pas:58-75: clicking an item selects it and closes the form
      m.querySelectorAll('[data-name]').forEach(b => b.onclick = async () => {
        try { const r = await api('/api/companies/select', { method: 'POST', body: { name: b.dataset.name } });
          S.session.company = r.name; document.getElementById('hdrCompany').textContent = r.name; toast(t('company.selected', { name: r.name })); close();
        } catch (e) { toast(t(e.key, e), 'error'); }
      });
    });
  }

  function passwordDialog() {
    modal(`<h3>${esc(t('password.title'))}</h3><form id="pf" autocomplete="off"><div id="perr"></div>
      <div class="field"><label>${esc(t('password.old'))}</label><input type="password" name="old_password" autofocus></div>
      <div class="field"><label>${esc(t('password.new'))}</label><input type="password" name="new_password"></div>
      <div class="field"><label>${esc(t('password.retype'))}</label><input type="password" name="retype_password"></div>
      <div class="actions"><button type="button" class="btn secondary" id="pc">${esc(t('password.cancel'))}</button><button class="btn">${esc(t('password.submit'))}</button></div></form>`, (m, close) => {
      m.querySelector('#pc').onclick = close;
      m.querySelector('#pf').onsubmit = async (e) => {
        e.preventDefault(); const fd = Object.fromEntries(new FormData(e.target));
        try { await api('/api/password', { method: 'POST', body: fd }); toast(t('password.changed')); close(); }
        catch (er) {
          m.querySelector('#perr').innerHTML = `<div class="alert error">${errText(er)}</div>`;
          // PasswordChange_unit.pas:46-52 EmptyText(): clears old + retype, focus new
          e.target.old_password.value = ''; e.target.retype_password.value = ''; e.target.new_password.focus();
        }
      };
    });
  }

  async function logout(reasonKey) {
    stopIdle();
    try { await api('/api/logout', { method: 'POST' }); } catch (_) {}
    S.session = null; S.tree = []; S.activePath = null; document.getElementById('modal-root').innerHTML = ''; document.getElementById('toasts').innerHTML = '';
    showLogin(reasonKey ? { info: t(reasonKey) } : {});
  }

  // ---------------------------------------------------------------- inactivity auto-logout
  let idleTimer = null;
  const onActivity = () => {
    S.lastActivity = Date.now();
    if (S.idleWarnShown) return;
    if (Date.now() - S.lastPing > 60000) { S.lastPing = Date.now(); api('/api/session/activity', { method: 'POST' }).catch(() => {}); }
  };
  function startIdle() {
    stopIdle(); S.lastActivity = Date.now(); S.lastPing = Date.now();
    ['mousemove', 'mousedown', 'keydown', 'wheel', 'touchstart'].forEach(ev => window.addEventListener(ev, onActivity, { passive: true }));
    let lastPoll = 0;
    idleTimer = setInterval(async () => {
      const limit = S.cfg.idle_minutes * 60 * 1000, idle = Date.now() - S.lastActivity, left = Math.ceil((limit - idle) / 1000);
      if (left <= 0) return logout('idle.logged_out');
      if (left <= 60 && !S.idleWarnShown) {
        S.idleWarnShown = true;
        modal(`<h3>${esc(t('idle.title'))}</h3><p id="idleTxt"></p><div class="actions"><button class="btn" id="stay">${esc(t('idle.stay'))}</button></div>`, (m, close) => {
          m.querySelector('#stay').onclick = async () => { S.idleWarnShown = false; S.lastActivity = Date.now(); S.lastPing = Date.now(); close();
            try { await api('/api/session/activity', { method: 'POST' }); } catch (_) {} };
        });
      }
      const it = document.getElementById('idleTxt'); if (it) it.textContent = t('idle.text', { seconds: Math.max(0, left) });
      if (Date.now() - lastPoll > 30000) { // detect server-side expiry (does not count as activity)
        lastPoll = Date.now();
        try { const st = await api('/api/session', { activity: false }); if (st.idle_seconds_left <= 0) logout('idle.logged_out'); }
        catch (e) { if (e.status === 401) { stopIdle(); S.session = null; showLogin({ info: t('idle.logged_out') }); } }
      }
    }, 1000);
  }
  function stopIdle() {
    if (idleTimer) clearInterval(idleTimer); idleTimer = null; S.idleWarnShown = false;
    ['mousemove', 'mousedown', 'keydown', 'wheel', 'touchstart'].forEach(ev => window.removeEventListener(ev, onActivity));
  }

  // ---------------------------------------------------------------- boot
  (async function boot() {
    await I18N.load();
    S.cfg = await fetch('/api/config').then(r => r.json()).catch(() => ({ product_name: 'SmartBank', idle_minutes: 45 }));
    try { await api('/api/session', { activity: false }); startSplash(null); }
    catch (_) { showLogin(); }
  })();
})();

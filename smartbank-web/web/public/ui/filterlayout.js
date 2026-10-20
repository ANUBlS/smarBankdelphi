/* Reusable UI pieces for list screens.
   SB.filterLayout(host, opts): left filter sidebar + grid area on the right.
     opts = { key, title, applyLabel, clearLabel, onApply, onClear }
     returns { side, body, main, setCollapsed(bool), toggle(), isCollapsed() }
     - collapsible; state kept per user + key in localStorage ('sb.flt.<user>.<key>')
     - on narrow screens (CSS @media) the sidebar sits on top of the grid
   SB.contextMenu(ev, items): right-click popup; items = [{label, shortcut, onClick, disabled, checked} | '-']
   SB.fmtD(iso): Delphi ShortDateFormat-style dd.mm.yyyy;  SB.fmtN(v): DisplayFormat '#,##0.00'. */
(function () {
  const SB = window.SB;
  const esc = SB.esc;
  const user = () => (SB.state && SB.state.system && SB.state.system.username) || 'anon';
  const lsKey = (key) => `sb.flt.${user()}.${key}`;

  SB.filterLayout = function (host, opts) {
    const o = Object.assign({ key: 'default', title: '', applyLabel: 'Apply', clearLabel: 'Clear' }, opts || {});
    const saved = localStorage.getItem(lsKey(o.key));
    let collapsed = saved === '1';
    host.innerHTML = `<div class="flt-layout${collapsed ? ' collapsed' : ''}">
      <aside class="flt-side" aria-label="${esc(o.title)}">
        <div class="flt-head"><span class="flt-title">${esc(o.title)}</span>
          <button type="button" class="flt-toggle" data-flt-toggle title="${esc(o.title)}" aria-expanded="${!collapsed}">⟨</button></div>
        <div class="flt-body"></div>
        <div class="flt-foot">
          <button type="button" class="btn" data-flt-apply>${esc(o.applyLabel)}</button>
          <button type="button" class="btn secondary" data-flt-clear>${esc(o.clearLabel)}</button></div>
      </aside>
      <section class="flt-main"></section></div>`;
    const root = host.querySelector('.flt-layout');
    const api = {
      root, side: root.querySelector('.flt-side'), body: root.querySelector('.flt-body'), main: root.querySelector('.flt-main'),
      isCollapsed: () => collapsed,
      setCollapsed(v) {
        collapsed = !!v; root.classList.toggle('collapsed', collapsed);
        root.querySelector('[data-flt-toggle]').setAttribute('aria-expanded', String(!collapsed));
        localStorage.setItem(lsKey(o.key), collapsed ? '1' : '0');
        o.onToggle && o.onToggle(collapsed);
      },
      toggle() { api.setCollapsed(!collapsed); },
    };
    root.querySelector('[data-flt-toggle]').onclick = () => api.toggle();
    root.querySelector('[data-flt-apply]').onclick = () => o.onApply && o.onApply();
    root.querySelector('[data-flt-clear]').onclick = () => o.onClear && o.onClear();
    return api;
  };

  let openMenu = null;
  function closeMenu() { if (openMenu) { openMenu.remove(); openMenu = null; } }
  document.addEventListener('click', closeMenu);
  document.addEventListener('keydown', (e) => { if (e.key === 'Escape') closeMenu(); });
  window.addEventListener('blur', closeMenu);
  SB.contextMenu = function (ev, items) {
    ev.preventDefault(); closeMenu();
    const m = document.createElement('div'); m.className = 'ctx-menu'; m.setAttribute('role', 'menu');
    const build = (list, parent) => list.forEach(it => {
      if (it === '-') { parent.insertAdjacentHTML('beforeend', '<div class="ctx-sep"></div>'); return; }
      const b = document.createElement('button'); b.type = 'button'; b.className = 'ctx-item' + (it.default ? ' default' : '') + (it.items ? ' sub' : '');
      b.disabled = !!it.disabled; b.setAttribute('role', 'menuitem');
      b.innerHTML = `<span class="ctx-check">${it.checked ? '✓' : ''}</span><span class="ctx-label">${esc(it.label)}</span><span class="ctx-sc">${esc(it.shortcut || (it.items ? '▸' : ''))}</span>`;
      if (it.items) {
        const sub = document.createElement('div'); sub.className = 'ctx-menu ctx-submenu'; build(it.items, sub); b.appendChild(sub);
        b.onclick = (e) => e.stopPropagation();
      } else b.onclick = (e) => { e.stopPropagation(); closeMenu(); it.onClick && it.onClick(); };
      parent.appendChild(b);
    });
    build(items, m);
    document.body.appendChild(m); openMenu = m;
    const r = m.getBoundingClientRect();
    m.style.left = Math.min(ev.clientX, window.innerWidth - r.width - 4) + 'px';
    m.style.top = Math.min(ev.clientY, window.innerHeight - r.height - 4) + 'px';
    return m;
  };

  const pad = (n) => String(n).padStart(2, '0');
  SB.fmtD = (iso) => {   // TDateTimeField default display (ShortDateFormat dd.mm.yyyy; time shown only if not 00:00)
    if (!iso) return '';
    const m = /^(\d{4})-(\d{2})-(\d{2})(?:[T ](\d{2}):(\d{2})(?::(\d{2}))?)?/.exec(String(iso));
    if (!m) return String(iso);
    const time = m[4] && !(m[4] === '00' && m[5] === '00' && (!m[6] || m[6] === '00')) ? ` ${m[4]}:${m[5]}:${m[6] || '00'}` : '';
    return `${m[3]}.${m[2]}.${m[1]}${time}`;
  };
  SB.fmtN = (v) => {     // DisplayFormat '#,##0.00' / Currency field: thousands separator, 2 decimals
    if (v === null || v === undefined || v === '') return '';
    const n = Number(v); if (isNaN(n)) return String(v);
    const s = Math.abs(n).toFixed(2).split('.');
    return (n < 0 ? '-' : '') + s[0].replace(/\B(?=(\d{3})+(?!\d))/g, ' ') + ',' + s[1];
  };
  SB.pad2 = pad;
})();

/* SB.unifyLayout(content, path): gives older list modules the Accounts look without touching their logic.
   - every listed module: .card.page + .page-head on its title toolbar (Accounts header style)
   - modules with filters: the module's own filter containers (same nodes, ids and handlers) are moved into the
     SB.filterLayout left panel; everything below the title/toolbars goes into .flt-main.
   - the module keeps control: its own "Filter panel" buttons still hide/show its containers; when all of them are
     hidden the left panel is hidden too (.flt-hidden), so filter visibility/semantics stay exactly as in the port.
   - Apply clicks the module's own refresh/run button (cfg.apply); Clear restores the initial filter values and fires
     input/change like a user edit, then Apply. A MutationObserver re-applies after the module re-renders. */
(function () {
  const SB = window.SB;
  const up = (sel, n) => (s) => { let e = s.querySelector(sel); for (let i = 0; e && i < n; i++) e = e.parentElement; return e; };
  const fs = (sel) => (s) => { const e = s.querySelector(sel); return e && e.closest('fieldset'); };
  const BAL = { f: ['.bal-form'] };   // balance.js shell(): one form grid for every balance screen
  const CFG = {
    '/m/bbpayings': { f: ['#bPanel'], tg: '#bFP', open: true },
    '/m/cashdesk': { f: ['.cd-filters'] },
    '/m/currencyposition': { f: [fs('#pBeg'), fs('#pPlan'), fs('#sDate')], apply: '#bRefresh' },
    '/m/depositsmanager-new': { f: ['#dFilterPanel', '#dSearch'], apply: '#dRefresh', tg: '#dFilter' },
    '/m/memorialorder': { f: ['#moFilter'], apply: '#moRefresh', tg: '#moFilterTB' },
    '/m/oldratesproj': { f: [fs('#oDat'), fs('#oBeg')] },
    '/m/payments': { f: ['#pFG'], apply: '#pRefresh', tg: '#pFilter' },
    '/m/ratedifferencereport': { f: [(s) => { const e = s.querySelector('#rCur'); return e && e.closest('div[style*="186px"]'); }], apply: '#rRefresh' },
    '/m/out-account': { f: ['#oaFilter', '#oaSearch'], apply: '[data-a=refresh]', tg: '[data-a=filter]', open: true },
    '/m/out-control-tape': { f: [up('#cd', 2)], apply: '#b_refresh' },
    '/m/out-memorial': { f: [up('#mb', 2)], apply: '#m_run' },
    '/m/out-repair': { f: ['#radv'], apply: '#r_ref', tg: '#r_adv', open: true },
    '/m/out-statement': { f: [up('#sb', 2)], apply: '#b_ok' },
    '/m/out-transactionmanagerform': { f: ['#trFilter', '.cs-search'], apply: '[data-a=refresh]', tg: '[data-a=filter]' },
    '/m/out-turnovers': { f: [up('#tb', 2)], apply: '#b_run' },
    '/m/balance': BAL, '/m/daybydaybalance': BAL, '/m/todaybalance': BAL, '/m/balanceanalys': BAL,
    '/m/out-balance': BAL, '/m/out-todaybalance': BAL, '/m/out-balanceanalys': BAL,
  };
  // header/toolbar style only (no filters, or forms/tabs rather than list filters)
  // cards: its filter panels are looked up inside the Clients tab box (v = box.querySelector), so they must stay there;
  // ratesviewer: RatesViewer.pas Filter panel is empty; accbalancecheck: no filter fields
  const HEAD_ONLY = new Set(['/m/accbalancecheck', '/m/cards', '/m/ratesviewer', '/m/asanfinance', '/m/azips', '/m/cashsymbols', '/m/exchange', '/m/exchangemgr', '/m/order', '/m/ratedifference',
    '/m/xohks', '/m/out-avalute', '/m/out-balancerefeditx', '/m/out-excel-import', '/m/out-tuningacctypes']);
  const HEADISH = (n) => n.matches('.toolbar,.tabs,.page-head,h2,style,script,link') || !!n.querySelector(':scope > h2');   // title row stays above the panel
  const fields = (n) => [...n.querySelectorAll('input,select,textarea')].filter(i => i.type !== 'file' && i.type !== 'button');
  const val = (i) => (i.type === 'checkbox' || i.type === 'radio') ? i.checked : (i.multiple ? [...i.selectedOptions].map(o => o.value).join('\u0001') : i.value);
  const hidden = (n) => !n.isConnected || n.style.display === 'none';

  let obs = null;
  SB.unifyLayout = function (c, path) {
    if (obs) { obs.disconnect(); obs = null; }
    const cfg = CFG[path];
    if (!cfg && !HEAD_ONLY.has(path)) return;
    let queued = false;
    const run = () => { queued = false; try { adapt(c, path, cfg); } catch (e) { console.warn('unifyLayout', e); } };
    obs = new MutationObserver(() => { if (!queued) { queued = true; queueMicrotask(run); } });
    obs.observe(c, { childList: true, subtree: true, attributes: true, attributeFilter: ['style'] });
    run();
  };

  function adapt(c, path, cfg) {
    const card = c.querySelector(':scope > .card'); if (!card) return;
    if (!card.classList.contains('page')) card.classList.add('page');
    const head = card.querySelector(':scope > .toolbar');
    if (head && head.querySelector(':scope > h2') && !head.classList.contains('page-head')) head.classList.add('page-head');
    if (!cfg) return;
    let st = card.__flt;
    const scope = st ? st.lay.main : card;
    const found = cfg.f.map(s => typeof s === 'function' ? s(scope) : scope.querySelector(s));
    if (!st) {
      const first = found.find(Boolean); if (!first) return;
      let top = first; while (top.parentElement !== card) top = top.parentElement;
      const cand = [...card.children].find(n => !HEADISH(n));
      const anchor = cand && (cand === top || (cand.compareDocumentPosition(top) & Node.DOCUMENT_POSITION_FOLLOWING)) ? cand : top;
      const rest = []; for (let n = anchor; n; n = n.nextElementSibling) rest.push(n);
      const host = document.createElement('div'); host.className = 'flt-host';
      card.insertBefore(host, anchor);
      const t = SB.t || ((k) => k);
      st = card.__flt = { slots: [], apply: null };
      st.lay = SB.filterLayout(host, { key: 'mod' + path.replace(/\W/g, '_'), title: t('accounts.filter_title'),
        applyLabel: t('accounts.refresh'), clearLabel: t('accounts.clear'),
        onApply: () => { const b = cfg.apply && card.querySelector(cfg.apply); if (b && !b.disabled) b.click(); },
        onClear: () => {
          st.slots.forEach(sl => sl && sl.isConnected && (sl.__flt0 || []).forEach(([i, v]) => {
            if (!i.isConnected || val(i) === v) return;
            if (i.type === 'checkbox' || i.type === 'radio') i.checked = v;
            else if (i.multiple) { const set = new Set(v.split('\u0001')); [...i.options].forEach(o => { o.selected = set.has(o.value); }); }
            else i.value = v;
            i.dispatchEvent(new Event('input', { bubbles: true })); i.dispatchEvent(new Event('change', { bubbles: true }));
          }));
          st.lay.root.querySelector('[data-flt-apply]').click();
        } });
      rest.forEach(n => st.lay.main.appendChild(n));
      st.lay.root.querySelector('[data-flt-toggle]').addEventListener('click', (e) => {
        if (!st.lay.root.classList.contains('flt-off')) return;
        e.stopImmediatePropagation();
        const b = cfg.tg && card.querySelector(cfg.tg); if (b) b.click();
        if (st.lay.isCollapsed()) st.lay.setCollapsed(false);
      }, true);
    }
    let changed = false;
    found.forEach((n, i) => {
      if (!n || n === st.slots[i]) return;
      if (st.slots[i] && st.slots[i].parentElement === st.lay.body) st.slots[i].remove();   // stale copy after a module re-render
      n.classList.add('flt-moved'); n.__flt0 = fields(n).map(x => [x, val(x)]);
      st.slots[i] = n; changed = true;
    });
    if (changed) st.slots.forEach(n => n && st.lay.body.appendChild(n));
    let vis = st.slots.some(n => n && !hidden(n));
    const tgb = cfg.tg && card.querySelector(cfg.tg);
    if (!vis && cfg.open && !st.opened && tgb) { st.opened = true; tgb.click(); vis = st.slots.some(n => n && !hidden(n)); }  // module hides its panel by default (Panel.Visible toggle only)
    st.opened = true;
    // panel hidden by the module: a collapsed strip whose toggle presses the module's own filter button; no button -> no panel
    st.lay.root.classList.toggle('flt-off', !vis && !!tgb);
    st.lay.root.classList.toggle('flt-hidden', !vis && !tgb);
    const ab = st.lay.root.querySelector('[data-flt-apply]');
    const has = !!(cfg.apply && card.querySelector(cfg.apply));
    if (ab.hidden === has) ab.hidden = !has;
  }
})();

/* Rate difference – port of Packages/RateDifference (TRateDifferenceForm, RateDifferenceFormImpl1.pas/.dfm).
   ToolBar1 with DBNavigator1 (no DataSource -> all buttons disabled) and DBGrid1 on OracleDataSet1, which the Delphi form
   never opens: the grid is empty. Nothing else happens on this form (see api/app/ratedifference.py). */
(function () {
  const { api, t, esc } = window.SB;
  const P = '/api/ratedifference', T = (k, p) => t('ratedifference.' + k, p);
  const errT = (e) => t(e.key || 'error.generic', e) + (e.ora ? ' ' + e.ora : '');
  const NAV = [['first', '⏮'], ['prior', '◀'], ['next', '▶'], ['last', '⏭'], ['insert', '+'], ['delete', '−'], ['edit', '▲'], ['post', '✓'], ['cancel', '✕'], ['refresh', '↻']];
  async function page(el) {
    el.innerHTML = '<div class="spinner"></div>';
    try { await api(P + '/init'); } catch (e) { el.innerHTML = `<div class="card"><div class="alert error">${esc(errT(e))}</div></div>`; return; }
    el.innerHTML = `<div class="card ratedifference"><div class="toolbar"><h2 style="margin:0">${esc(T('title'))}</h2></div>
      <div class="toolbar" id="rdNav" style="gap:2px;margin-top:6px">${NAV.map(([k, g]) => `<button class="btn secondary" disabled title="${esc(T('nav_' + k))}" style="min-width:24px;padding:2px 6px">${g}</button>`).join('')}</div>
      <div class="tablewrap" style="margin-top:6px;min-height:240px;border:1px solid var(--border)"><table class="grid" id="rdGrid"><thead><tr><th style="width:12px"></th></tr></thead><tbody></tbody></table></div></div>`;
  }
  window.SB.pages['/m/ratedifference'] = page;
})();

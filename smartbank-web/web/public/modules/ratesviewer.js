/* Rates viewer – port of Packages/RatesViewer (TFrmRates, UntRatesImpl.pas/.dfm).
   Panel1: FilterPanel (TGroupBox 'Filter Paneli', alLeft 185 px, empty) and DBGrid1 (no DataSource -> empty grid).
   RatesDataSet has no SQL and is never opened (see api/app/ratesviewer.py). ActiveFormKeyDown: Ctrl+F toggles FilterPanel. */
(function () {
  const { api, t, esc } = window.SB;
  const P = '/api/ratesviewer', T = (k, p) => t('ratesviewer.' + k, p);
  const errT = (e) => t(e.key || 'error.generic', e) + (e.ora ? ' ' + e.ora : '');
  async function page(el) {
    el.innerHTML = '<div class="spinner"></div>';
    try { await api(P + '/init'); } catch (e) { el.innerHTML = `<div class="card"><div class="alert error">${esc(errT(e))}</div></div>`; return; }
    el.innerHTML = `<div class="card ratesviewer"><div class="toolbar"><h2 style="margin:0">${esc(T('title'))}</h2></div>
      <div id="rvPanel" style="display:flex;gap:0;margin-top:6px;min-height:420px;border:1px solid var(--border);border-radius:6px;padding:2px">
        <fieldset id="rvFilter" class="cd-g" style="width:185px;flex:0 0 185px;margin:0"><legend>${esc(T('filter_panel'))}</legend></fieldset>
        <div class="tablewrap" style="flex:1;min-height:400px;border:1px solid var(--border)"><table class="grid" id="rvGrid"><thead><tr><th style="width:12px"></th></tr></thead><tbody></tbody></table></div>
      </div></div>`;
    const card = el.querySelector('.ratesviewer');
    const onKey = (ev) => {                                    // ActiveFormKeyDown (pas:326-331)
      if (!document.body.contains(card)) { document.removeEventListener('keydown', onKey); return; }
      if (ev.ctrlKey && (ev.key === 'f' || ev.key === 'F')) {
        ev.preventDefault();
        const f = el.querySelector('#rvFilter'); f.style.display = f.style.display === 'none' ? '' : 'none';
      }
    };
    document.addEventListener('keydown', onKey);
  }
  window.SB.pages['/m/ratesviewer'] = page;
})();

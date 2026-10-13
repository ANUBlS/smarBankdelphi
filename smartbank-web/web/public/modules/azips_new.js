/* AZIPS part 2b – filereport.bpl 'Azipsnew' (Packages/Cards_New/FileReprt/Unitazips.pas, Tazips).
   The server runs the verbatim Delphi unit on a virtual VCL form (api/app/azips_new.py + vcl.py); this file only draws the
   controls of the .dfm (positions, captions, Visible/Enabled/Checked/Items/Text as the Delphi code sets them) and sends each
   user action back: typing (OnKeyPress per character, OnChange), leaving a field (OnExit), entering (OnEnter), clicks,
   selections, Enter key. Captions are the bank's own .dfm texts and stay as they are. */
(function () {
  const { api, t, esc, toast } = window.SB;
  const P = '/api/azips/new-form', K = (k) => t('azips.' + k);
  const errT = (e) => t(e.key || 'error.generic', e) + (e.ora ? ' ' + e.ora : '');
  const INPUTS = ['TEdit', 'TSearchEdit', 'TMemo', 'TRichEdit'];

  function overlay() {
    const d = document.createElement('div');
    d.className = 'backdrop'; d.style.zIndex = 60;
    document.body.appendChild(d);
    return d;
  }
  function msgBox(lines, title) {                         // ShowMessage is modal in Delphi: one box per message, in order
    return new Promise((res) => {
      if (!lines.length) return res();
      const o = overlay();
      o.innerHTML = `<div class="modal" role="alertdialog" style="max-width:520px"><h3>${esc(title || K('n_message'))}</h3>
        ${lines.map(m => `<p>${esc(m)}</p>`).join('')}<div class="actions"><button class="btn" id="mok">OK</button></div></div>`;
      const b = o.querySelector('#mok'); b.focus();
      b.onclick = () => { o.remove(); res(); };
    });
  }
  function askModal(spec) {                               // Tform17 (Unit17) – template name
    return new Promise((res) => {
      const o = overlay();
      const edit = spec.controls.find(c => c.name.toLowerCase() === 'edit1') || {};
      const btn = spec.controls.find(c => c.name.toLowerCase() === 'button1') || {};
      o.innerHTML = `<div class="modal" role="dialog" style="max-width:420px"><h3>${esc(spec.caption)}</h3>
        <input class="input" id="m17" style="width:100%" value="${esc(edit.text || '')}">
        <div class="actions"><button class="btn secondary" id="m17x">${esc(K('close'))}</button><button class="btn" id="m17ok">${esc(btn.caption || 'OK')}</button></div></div>`;
      o.querySelector('#m17').focus();
      o.querySelector('#m17ok').onclick = () => { const v = o.querySelector('#m17').value; o.remove(); res({ edit1: v, ok: true }); };
      o.querySelector('#m17x').onclick = () => { o.remove(); res({ edit1: '', ok: false }); };
    });
  }

  async function open(k, caller, onClose) {
    let r;
    try { r = await api(P + '/open', { method: 'POST', body: { k: String(k), caller } }); }
    catch (e) { toast(errT(e), 'error'); return; }
    if (!r.fid) { await msgBox(r.messages || []); if (r.error) toast(r.error.text || t(r.error.key, r.error), 'error'); return; }
    const o = overlay();
    o.innerHTML = `<div class="modal azn" role="dialog" style="width:min(1200px,98vw);max-width:98vw;max-height:96vh;overflow:auto;padding:12px">
      <div class="toolbar" style="justify-content:space-between"><h3 style="margin:0">${esc(r.caption)}</h3>
      <button class="btn secondary" id="azx" aria-label="${esc(K('close'))}">✕</button></div>
      <p class="error" id="azerr" style="display:none"></p>
      <div id="azform" style="position:relative;width:${r.width || 1152}px;height:${r.height || 612}px;font-size:12px"></div></div>`;
    const S = { fid: r.fid, q: Promise.resolve() };
    const done = () => { o.remove(); onClose && onClose(); };
    o.querySelector('#azx').onclick = async () => { try { await api(P + '/close', { method: 'POST', body: { fid: S.fid } }); } catch (_) { /* gone */ } done(); };
    await apply(r);

    async function apply(res) {
      if (res.gone) { toast(K('n_gone'), 'error'); done(); return; }
      if (res.controls) draw(res.controls);
      const err = o.querySelector('#azerr');
      err.style.display = res.error ? '' : 'none';
      err.textContent = res.error ? (res.error.text || t(res.error.key, res.error)) : '';
      await msgBox(res.messages || []);
      if (res.closed) done();
    }
    function act(action) {                       // actions run one after another, in the order the user made them
      S.q = S.q.catch((e) => console.error(e)).then(() => act1(action));
      return S.q;
    }
    async function act1(action, answers = []) {
      let res;
      try {
        for (;;) {
          res = await api(P + '/act', { method: 'POST', body: { fid: S.fid, action, answers } });
          if (!res.modal) break;
          await msgBox(res.messages || []);
          answers = [...answers, await askModal(res.modal)];
        }
      } catch (e) { toast(errT(e), 'error'); return; }
      const focus = document.activeElement && document.activeElement.dataset ? document.activeElement.dataset.n : null;
      await apply(res);
      if (focus) { const f = o.querySelector(`[data-n="${focus}"]`); if (f && f.focus) { S.quiet = true; f.focus(); S.quiet = false; } }   // no OnEnter for a redraw
    }

    function draw(controls) {
      const by = Object.fromEntries(controls.map(c => [c.name, c]));
      const shown = (c) => { for (let x = c; x; x = by[x.parent]) { if (!x.visible) return false; } return true; };
      const abs = (c) => {           // Delphi Left/Top are relative to the parent's client area (group box caption ~ 0)
        let l = 0, tp = 0;
        for (let x = c; x; x = by[x.parent]) {
          l += x.left || 0; tp += x.top || 0;
          if (x !== c && x.cls === 'TGroupBox') tp += 2;
        }
        return [l, tp];
      };
      const root = o.querySelector('#azform');
      const html = [];
      const sorted = controls.filter(c => c.parent && shown(c)).sort((a, b) => (a.cls === 'TGroupBox' || a.cls === 'TPanel' ? 0 : 1) - (b.cls === 'TGroupBox' || b.cls === 'TPanel' ? 0 : 1));
      for (const c of sorted) {
        let [l, tp] = abs(c);
        let w = c.width || 80, h = c.height || 21;
        if (c.align === 'alTop' && by[c.parent]) { w = by[c.parent].width || w; l -= (c.left || 0); tp -= (c.top || 0); }
        const pos = `position:absolute;left:${l}px;top:${tp}px;width:${w}px;`;
        const dis = c.enabled ? '' : 'disabled';
        const n = esc(c.name);
        switch (c.cls) {
          case 'TGroupBox': html.push(`<fieldset style="${pos}height:${h}px;margin:0;padding:0;border:1px solid var(--border,#cfd8e3);border-radius:8px"><legend style="font-size:11px;padding:0 4px">${esc(c.caption)}</legend></fieldset>`); break;
          case 'TPanel': html.push(`<div style="${pos}height:${h}px;border:1px solid var(--border,#cfd8e3);border-radius:8px;background:rgba(0,128,128,.03)"></div>`); break;
          case 'TLabel': html.push(`<span style="${pos.replace(/width:\d+px;/, '')}white-space:nowrap">${esc(c.caption)}</span>`); break;
          case 'TButton': html.push(`<button class="btn" data-n="${n}" data-k="click" style="${pos}height:${h + 2}px;padding:0 6px" ${dis}>${esc(c.caption)}</button>`); break;
          case 'TRadioButton': case 'TCheckBox':
            html.push(`<label style="${pos}height:${h}px;display:flex;gap:4px;align-items:center;white-space:nowrap;overflow:hidden"><input type="${c.cls === 'TRadioButton' ? 'radio' : 'checkbox'}" data-n="${n}" data-k="click" ${c.checked ? 'checked' : ''} ${dis}>${esc(c.caption)}</label>`); break;
          case 'TEdit': case 'TSearchEdit':
            html.push(`<input class="input" data-n="${n}" data-k="type" style="${pos}height:${h}px;padding:1px 4px" value="${esc(c.text || '')}" ${c.readonly ? 'readonly' : ''} ${c.maxlength ? `maxlength="${c.maxlength}"` : ''} ${dis}>`);
            if (c.cls === 'TSearchEdit' && c.enabled && c.list && c.list.rows.length) html.push(`<select data-n="${n}" data-k="select" title="${esc(K('n_pick'))}" style="position:absolute;left:${l + w + 2}px;top:${tp}px;width:22px;height:${h}px"><option></option>${c.list.rows.map((x, i) => `<option value="${i}">${esc(x[1])}</option>`).join('')}</select>`);
            break;
          case 'TMemo': case 'TRichEdit':
            html.push(`<textarea class="input" data-n="${n}" data-k="type" style="${pos}height:${h}px;padding:2px 4px;resize:none;font-family:monospace;font-size:12px" ${c.readonly ? 'readonly' : ''} ${dis}>${esc((c.text || '').replace(/\r\n/g, '\n'))}</textarea>`); break;
          case 'TComboBox': {
            const has = c.items.includes(c.text);
            html.push(`<select class="input" data-n="${n}" data-k="select" style="${pos}height:${h}px;padding:0 2px" ${dis}>${has ? '' : `<option selected value="">${esc(c.text || '')}</option>`}${c.items.map((x, i) => `<option value="${i}" ${has && (c.itemindex === i || (c.itemindex < 0 && x === c.text)) ? 'selected' : ''}>${esc(x)}</option>`).join('')}</select>`); break;
          }
          case 'TDBLookupComboBox': case 'TDBLookupComboboxEh': {
            const rows = (c.list && c.list.rows) || [];
            html.push(`<select class="input" data-n="${n}" data-k="select" style="${pos}height:${h}px;padding:0 2px" ${dis}><option value="">${esc(c.text || '')}</option>${rows.map((x, i) => `<option value="${i}">${esc(x[1])}</option>`).join('')}</select>`); break;
          }
          case 'TDateTimePicker': html.push(`<input type="date" class="input" data-n="${n}" data-k="date" style="${pos}height:${h}px" value="${esc(c.date || '')}" ${dis}>`); break;
          case 'TDBGrid':
            html.push(`<div style="${pos}height:${h}px;overflow:auto"><table class="grid" data-g="${n}"><thead><tr>${c.columns.map(x => `<th>${esc(x)}</th>`).join('')}</tr></thead><tbody>${c.rows.map((rw, i) => `<tr data-i="${i}" class="${c.pos === i ? 'sel' : ''}">${rw.map(x => `<td>${esc(x)}</td>`).join('')}</tr>`).join('') || `<tr><td class="muted" colspan="${c.columns.length || 1}">${esc(K('empty'))}</td></tr>`}</tbody></table></div>`); break;
          default: break;
        }
      }
      // text the user is still typing (not sent yet) survives a redraw
      const pending = [...root.querySelectorAll('[data-k="type"]')].filter(e => e._changed).map(e => [e.dataset.n, e.value]);
      S.quiet = true; root.innerHTML = html.join(''); S.quiet = false;
      root.querySelectorAll('[data-n]').forEach(el => {
        const c = by[el.dataset.n]; const ev = c.events || []; const k = el.dataset.k;
        if (k === 'click') {
          // mousedown keeps the focus where it is; the field being left gets its OnChange/OnExit first, as in the VCL
          el.onmousedown = (e) => { e.preventDefault(); const a = document.activeElement; if (a && a._leave) { a._skip = true; a._leave(); a.blur(); } act({ name: c.name, kind: 'click' }); };
          el.onclick = (e) => e.preventDefault();
          el.onkeydown = (e) => { if (e.key === ' ' || e.key === 'Enter') { e.preventDefault(); act({ name: c.name, kind: 'click' }); } };
        }
        if (k === 'type') {
          if (ev.includes('OnEnter')) el.onfocus = () => { if (!S.quiet) act({ name: c.name, kind: 'enter' }); };
          el.oninput = () => { el._changed = true; };
          el._leave = () => {                                // typed text (OnKeyPress/OnChange), then OnExit
            if (el._changed) { el._changed = false; act({ name: c.name, kind: 'type', value: el.value }); }
            if (ev.includes('OnExit')) act({ name: c.name, kind: 'exit' });
          };
          el.onblur = () => { if (S.quiet) return; if (el._skip) { el._skip = false; return; } el._leave(); };
          if (el.tagName === 'INPUT') el.onkeydown = async (e) => {
            if (e.key !== 'Enter') return;
            e.preventDefault(); el._changed = false;
            act({ name: c.name, kind: 'type', value: el.value });
            act({ name: c.name, kind: 'key', value: '\r' });
          };
        }
        if (k === 'select') el.onchange = () => { if (el.value !== '') act({ name: c.name, kind: 'select', value: +el.value }); };
        if (k === 'date') el.onchange = () => el.value && act({ name: c.name, kind: 'date', value: el.value });
      });
      for (const [nm, val] of pending) { const e = root.querySelector(`[data-n="${nm}"]`); if (e) { e.value = val; e._changed = true; } }
      root.querySelectorAll('table[data-g]').forEach(tb => tb.querySelectorAll('tbody tr[data-i]').forEach(tr => {
        tr.onclick = () => tb.querySelectorAll('tr').forEach(x => x.classList.toggle('sel', x === tr));
        tr.ondblclick = async () => { await act({ name: tb.dataset.g, kind: 'select', value: +tr.dataset.i }); await act({ name: tb.dataset.g, kind: 'dblclick' }); };
      }));
    }
  }
  window.SB.azipsNew = { open };
})();

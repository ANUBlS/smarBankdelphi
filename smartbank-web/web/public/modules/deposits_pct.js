/* SBDM_PercentSettings_new.bpl (faizlərin sazlanması, PercentSettingImpl_new) and SBDM_DepozitAccSettings_new.bpl (empty form).
   Seven DB grids chained through OnDataChange (api/app/dep_pct.py). No navigator: TDBGrid keys - Insert / Down on the last row
   (append), F2 / double-click / typing (edit), Delete (the grids' OnKeyDown: confirm + Delete), moving to another row posts.
   Enter also posts (web convenience). Esc: KeyPreview FormKeyPress -> Close (the grid cancels its edit first). */
(function () {
  const { api, esc } = window.SB;
  const D = () => window.SB.dep;
  const K = (k, p) => window.SB.t('deposits.' + k, p);
  const U = '/api/deposits/pct/';
  const call = (p, body) => api(U + p, { method: 'POST', body });
  const fail = (e) => window.SB.toast(D().errText(e), 'error');
  const v = (x) => x === null || x === undefined ? '' : String(x);
  let keep = null;            // the form and its open datasets survive between openings (created in initialization, never freed)

  // [ds, title, columns [field, title, picklist?], key of the cursor, editable]
  const GRIDS = {
    types: ['Depozitlərin tipləri', [['#', '№'], ['TYPE', 'Tipi']], 'id', false],
    periods: ['Müddətlər üzrə', [['PERIOD', 'Period(aylarla)'], ['DESCRIPTION', 'Təyinatı'], ['PERIOD_TYPE', '(Ay və ya Gün )', ['Ay', 'Gün']]], 'id', true],
    caps: ['Kapitallaşdırma müddətləri üzrə', [['PERIOD', 'Period(günlərlə)'], ['DESCRIPTION', 'Təyinatı']], 'id', true],
    valutes: ['Valyutalar', [['#', '№'], ['VAL_NAME', '$'], ['VALU_NAME', 'Adı']], 'valute', false],
    amounts: ['Məbləğlər', [['FIRSTAMOUNT', 'Məbləğ(min)'], ['LASTAMOUNT', 'Məbləğ(max)'], ['MAXAMUONTCONRTACT', 'Məb.artımı(max)'], ['MAXAMUONTCONRTACTPERCENT', 'Məb.artımı(max) %']], 'id', true],
    pers: ['Artım Məbləğləri və Faizlər', [['FIRSTAMOUNT', 'Məbləğ(min)'], ['LASTAMOUNT', 'Məbləğ(max)'], ['AMOUNT_GROWTH_FIRST', 'Məbləğ%(Min)'],
      ['AMOUNT_GROWTH_LAST', 'Məbləğ%(Max)'], ['FIRST_DAY', 'Dövrün əvvəli'], ['LAST_DAY', 'Dövrün sonu'], ['INTERESTRATE', 'İllik%'], ['BEFOINTRATE', 'M.Ə.%'],
      ['DUEINTRATE', 'M.S.%'], ['PERCENTAGE_GROWTH_STEP', 'Faiz artımı ']], 'rid', true],
    dats: ['Müddətdən əvvəl faiz dərəcələri', [['FIRSTDATEINT', 'Dövrün əvvəli'], ['LASTDATEINT', 'Dövrün sonu'], ['PERCENT', 'İllik%']], 'rid', true],
  };
  const SELK = { types: 'dep', periods: 'period', caps: 'cap', valutes: 'val', amounts: 'amt', pers: 'pers' };
  const DESC = { types: ['periods', 'caps', 'amounts', 'pers', 'dats'], periods: ['caps', 'amounts', 'pers', 'dats'], caps: ['amounts', 'pers', 'dats'],
                 valutes: ['amounts', 'pers', 'dats'], amounts: ['pers', 'dats'], pers: ['dats'], dats: [] };
  const KEYPRESS = { amounts: true, pers: true, dats: true };   // XDBGrid7 / XDBGrid5 / XDBGrid6 OnKeyPress

  async function percent() {
    const st = keep || { sel: {}, datsIdx: 0 };
    let o; try { o = await call('open', st.sel); } catch (e) { return fail(e); }
    st.check = false;                                                  // FormShow: XFCheckBox1.Checked := False
    let ed = null;                                                     // {ds, mode: insert|edit, idx, rid, draft, committed, assigned, modified}
    let kq = Promise.resolve();                                        // XDBGrid5KeyPress calls, in order
    D().modal(`<div class="pctBody"></div>`, (m, close) => {
      const rowsOf = (ds) => o[ds];
      const curIdx = (ds) => {
        if (ds === 'dats') return Math.min(st.datsIdx, Math.max(o.dats.length - 1, 0));
        const key = GRIDS[ds][2], want = ds === 'pers' ? o.cur.pers : o.cur[SELK[ds]];
        return Math.max(0, o[ds].findIndex(r => r[key] === want));
      };
      const selFor = () => ({ ...st.sel });
      async function reload(sel) {
        try { o = await call('state', sel || st.sel); } catch (e) { fail(e); }
        draw();
      }
      // ------------------------------------------------------------------ rendering
      function gridHtml(ds, h) {
        const [title, cols, , editable] = GRIDS[ds];
        const rows = rowsOf(ds).slice(), ci = curIdx(ds);
        let at = ci;
        if (ed && ed.ds === ds && ed.mode === 'insert') { at = ed.idx; rows.splice(at, 0, { __new: 1 }); }
        const cell = (c, r, i) => {
          const [f, , pick] = c;
          if (f === '#') return `<td class="muted">${i + 1}</td>`;
          if (ed && ed.ds === ds && i === at) {
            const val = v(ed.draft[f]);
            return pick ? `<td><input data-f="${f}" list="pl-${ds}-${f}" value="${esc(val)}" style="width:100%"><datalist id="pl-${ds}-${f}">${pick.map(p => `<option value="${esc(p)}">`).join('')}</datalist></td>`
                        : `<td><input data-f="${f}" value="${esc(val)}" style="width:100%"></td>`;
          }
          return `<td>${esc(v(r[f.toLowerCase()]))}</td>`;
        };
        const mark = (i) => i !== at ? '' : ed && ed.ds === ds ? (ed.mode === 'insert' ? '*' : 'I') : '▸';
        return `<fieldset class="pct-box" data-ds="${ds}"><legend>${esc(title)}</legend>
          <div class="tablewrap pct-grid" tabindex="0" data-g="${ds}" style="height:${h}px"><table class="grid acc-grid"><thead><tr><th style="width:12px"></th>${cols.map(c => `<th>${esc(c[1])}</th>`).join('')}</tr></thead>
          <tbody>${rows.map((r, i) => `<tr data-i="${i}" class="${i === at ? 'sel' : ''}"><td class="muted">${mark(i)}</td>${cols.map(c => cell(c, r, i)).join('')}</tr>`).join('')}</tbody></table></div>
          ${editable ? '' : ''}</fieldset>`;
      }
      function draw() {
        const focus = document.activeElement?.closest?.('[data-g]')?.dataset.g;
        m.querySelector('.pctBody').innerHTML = `<h3>${esc(K('s_percent'))}</h3>
          <div class="pct-wrap">${gridHtml('types', 110)}
          <div class="pct-row">${gridHtml('periods', 126)}${gridHtml('caps', 126)}</div>
          <div class="pct-row">${gridHtml('valutes', 101)}${gridHtml('amounts', 101)}</div>
          ${gridHtml('pers', 143)}${gridHtml('dats', 119)}</div>
          <div class="pct-bar"><button class="btn" id="pcSave">Yaddaşa yaz</button><button class="btn" id="pcConfirm">Təsdiqlə</button>
            <label class="pct-chk"><input type="checkbox" id="pcOld" ${st.check ? 'checked' : ''}> Əvvəlki yatrımlarında % dərəcələrini dəyiş</label></div>`;
        wire();
        const inp = m.querySelector('input[data-f]');
        if (inp) { if (!inp.dataset.noFocus) inp.focus(); }
        else if (focus) m.querySelector(`[data-g="${focus}"]`)?.focus();
      }
      // ------------------------------------------------------------------ cursor moves (OnDataChange chain)
      async function move(ds, i) {
        if (ed && ed.ds === ds) { if (!(await post())) return; }
        if (ed && DESC[ds].includes(ed.ds)) ed = null;                               // the detail dataset is closed: edit discarded
        else if (ed && ed.mode === 'insert' && !ed.modified) ed = null;              // dgCancelOnExit
        const r = rowsOf(ds)[i]; if (!r) return draw();
        if (ds === 'dats') { st.datsIdx = i; return draw(); }
        st.sel[SELK[ds]] = r[GRIDS[ds][2]];
        for (const d of DESC[ds]) if (SELK[d]) st.sel[SELK[d]] = null;
        if (DESC[ds].includes('dats')) st.datsIdx = 0;
        reload();
      }
      // ------------------------------------------------------------------ edit / post / delete
      function begin(ds, mode, idx) {
        const cols = GRIDS[ds][1].filter(c => c[0] !== '#');
        const r = mode === 'edit' ? rowsOf(ds)[curIdx(ds)] : null;
        if (mode === 'edit' && !r) return;
        const draft = Object.fromEntries(cols.map(c => [c[0], r ? r[c[0].toLowerCase()] : null]));
        ed = { ds, mode, idx, rid: r ? r.rid : null, draft, committed: { ...draft }, assigned: false, modified: false };
        if (mode === 'insert' && SELK[ds]) {                          // the cursor is on a record whose ID is null: dependents run with 0
          st.sel[SELK[ds]] = ds === 'pers' ? '0' : 0;
          for (const d of DESC[ds]) if (SELK[d]) st.sel[SELK[d]] = null;
          return reload();
        }
        draw();
      }
      async function post() {
        if (!ed) return true;
        const e = ed;
        try {
          const before = new Set(rowsOf(e.ds).map(r => r.rid));
          const sel = selFor();
          const r = await call('post', { ds: e.ds, rid: e.rid, values: e.draft, assign: e.assigned, sel });
          ed = null;
          if (SELK[e.ds]) {
            const nr = e.mode === 'insert' ? r[e.ds].find(x => !before.has(x.rid)) : r[e.ds].find(x => x.rid === e.rid);
            st.sel[SELK[e.ds]] = nr ? nr[GRIDS[e.ds][2]] : null;
            for (const d of DESC[e.ds]) if (SELK[d]) st.sel[SELK[d]] = null;   // AfterPost Refresh -> OnDataChange -> dependents reopened
            if (e.ds === 'periods') st.sel.cap = null;
            await reload();
          } else {                                                  // Depositdatsettings: AfterPost Refresh
            o = r; const i = e.mode === 'insert' ? r.dats.findIndex(x => !before.has(x.rid)) : r.dats.findIndex(x => x.rid === e.rid);
            st.datsIdx = Math.max(i, 0); draw();
          }
          return true;
        } catch (er) { fail(er); return false; }
      }
      function cancel() {
        if (!ed) return;
        const e = ed; ed = null;
        if (e.mode === 'insert' && SELK[e.ds]) { st.sel[SELK[e.ds]] = null; for (const d of DESC[e.ds]) if (SELK[d]) st.sel[SELK[d]] = null; return reload(); }
        draw();
      }
      async function del(ds) {                                       // XDBGrid3KeyDown / XDBGrid5KeyDown / XDBGrid6KeyDown
        if (!rowsOf(ds).length) return;
        if (!confirm('Silinməsinə əminsinizmi?')) return;
        const r = rowsOf(ds)[curIdx(ds)];
        try {
          o = await call('delete', { ds, rid: r.rid, sel: selFor() });
          if (SELK[ds]) { st.sel[SELK[ds]] = null; for (const d of DESC[ds]) if (SELK[d]) st.sel[SELK[d]] = null; await reload(); } else draw();
        } catch (e) { fail(e); }
      }
      function keyPress(ds, ch) {                                    // the grids' OnKeyPress (fires before the key is processed)
        if (!KEYPRESS[ds]) return;
        const inState = ed && ed.ds === ds;
        if (ds === 'pers') {
          const rid = inState ? ed.rid : (rowsOf('pers')[curIdx('pers')] || {}).rid ?? null;
          const body = { rid, values: inState ? { ...ed.committed } : {}, assigned: inState && ed.assigned, sel: selFor() };
          kq = kq.then(() => call('keypress', body)).catch(fail);
        }
        if (inState) ed.assigned = true;                             // UpdateStatus in [usInserted, usModified]
      }
      // ------------------------------------------------------------------ events
      function wire() {
        m.querySelectorAll('[data-g]').forEach(g => {
          const ds = g.dataset.g, editable = GRIDS[ds][3];
          g.querySelectorAll('tr[data-i]').forEach(tr => {
            tr.onclick = (ev) => { if (ev.target.tagName === 'INPUT') return; const i = +tr.dataset.i; if (ed && ed.ds === ds && ed.mode === 'insert' && i === ed.idx) return; const real = ed && ed.ds === ds && ed.mode === 'insert' && i > ed.idx ? i - 1 : i; if (real !== curIdx(ds) || (ed && ed.ds !== ds)) move(ds, real); else g.focus(); };
            tr.ondblclick = () => { if (editable && !ed) begin(ds, 'edit'); };
          });
          g.onkeydown = (ev) => {
            if (ev.target.tagName === 'INPUT') return;
            const n = rowsOf(ds).length, i = curIdx(ds);
            if (ev.key === 'ArrowDown') { ev.preventDefault(); if (i < n - 1) move(ds, i + 1); else if (editable && !ed) begin(ds, 'insert', n); }
            else if (ev.key === 'ArrowUp') { ev.preventDefault(); if (i > 0) move(ds, i - 1); }
            else if (!editable) return;
            else if (ev.key === 'Insert') { ev.preventDefault(); if (!ed) begin(ds, 'insert', n ? i : 0); }
            else if (ev.key === 'Delete') { ev.preventDefault(); if (!ed) del(ds); }
            else if (ev.key === 'F2') { ev.preventDefault(); if (!ed) begin(ds, 'edit'); }
            else if (ev.key.length === 1 && !ev.ctrlKey && !ev.altKey && !ed && n) {   // typing starts the edit (KeyPress in browse state first)
              ev.preventDefault(); keyPress(ds, ev.key); begin(ds, 'edit');
              const inp = m.querySelector(`[data-g="${ds}"] input[data-f]`); if (inp) { inp.value = ev.key; ed.draft[inp.dataset.f] = ev.key; ed.modified = true; }
            }
          };
        });
        m.querySelectorAll('input[data-f]').forEach(inp => {
          const ds = inp.closest('[data-g]').dataset.g;
          inp.oninput = () => { ed.draft[inp.dataset.f] = inp.value; ed.modified = true; };
          inp.onchange = () => { ed.committed[inp.dataset.f] = inp.value; };          // the in-place editor writes the field on leaving the cell
          inp.onkeydown = async (ev) => {
            if (ev.key === 'Escape') return;
            if (ev.key.length === 1 || ev.key === 'Enter' || ev.key === 'Backspace' || ev.key === 'Tab') keyPress(ds, ev.key);
            if (ev.key === 'Enter') { ev.preventDefault(); ed.committed[inp.dataset.f] = inp.value; await post(); }
            else if (ev.key === 'ArrowDown' || ev.key === 'ArrowUp') {
              ev.preventDefault(); ed.committed[inp.dataset.f] = inp.value;
              const down = ev.key === 'ArrowDown', wasIns = ed.mode === 'insert', at = wasIns ? ed.idx : curIdx(ds);
              if (!(await post())) return;
              const n = rowsOf(ds).length, i = curIdx(ds);
              if (down && i >= n - 1 && GRIDS[ds][3]) begin(ds, 'insert', n); else move(ds, Math.max(0, Math.min(n - 1, down ? i + 1 : i - 1)));
              void at;
            }
          };
        });
        m.querySelector('#pcOld').onchange = (e) => { st.check = e.target.checked; };
        m.querySelector('#pcSave').onclick = async () => {           // XFButton1Click
          try { const r = await call('save', { sel: selFor() }); alert(r.message); } catch (e) { fail(e); }
        };
        m.querySelector('#pcConfirm').onclick = async () => {        // XFButton2Click
          try {
            let r = await call('confirm', { sel: selFor(), change_old: st.check });
            if (r.ask) r = await call('confirm', { sel: selFor(), change_old: true, answer: confirm(r.ask) });
            if (r.message) alert(r.message);
          } catch (e) { fail(e); }
        };
      }
      // Esc: the grid's KeyDown cancels the edit, then KeyPress: FormKeyPress closes and XDBGrid5KeyPress still runs
      const onEsc = (e) => {
        if (!m.isConnected) return document.removeEventListener('keydown', onEsc, true);
        if (e.key !== 'Escape' || [...document.querySelectorAll('.backdrop.stacked')].pop() !== m.parentElement) return;
        e.preventDefault(); e.stopPropagation();
        const g = document.activeElement?.closest?.('[data-g]')?.dataset.g;
        if (ed) { const x = ed; ed = null; if (x.mode === 'insert' && SELK[x.ds]) { st.sel[SELK[x.ds]] = null; for (const d of DESC[x.ds]) if (SELK[d]) st.sel[SELK[d]] = null; } }
        if (g) keyPress(g, '\x1b');
        document.removeEventListener('keydown', onEsc, true);
        keep = st; close();
      };
      document.addEventListener('keydown', onEsc, true);
      draw();
      m.querySelector('[data-g="types"]').focus();
    }, 'wide dep-sub dep-pct');
  }

  // SBDM_DepozitAccSettings_new: FrmDepozitAccSettings has only a TStatusBar; KeyPreview without a handler (Esc does nothing),
  // the window's close box closes it. Menu item Hesablarin1 is Visible = False.
  function accSettings() {
    D().modal(`<div style="display:flex;justify-content:space-between;align-items:center"><h3 style="margin:0">${esc(K('s_accounts'))}</h3>
        <button class="btn secondary" id="daX" title="✕">✕</button></div><div style="height:420px"></div><div class="dep-status" style="border-top:1px solid var(--line,#ddd);height:19px"></div>`,
      (m, close) => { m.querySelector('#daX').onclick = close; }, 'dep-sub dep-accsett');
  }

  window.SB.depForms = window.SB.depForms || {};
  Object.assign(window.SB.depForms, { sett_percent: percent, sett_accounts: accSettings });
})();

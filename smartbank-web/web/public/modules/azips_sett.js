/* AZIPS part 4c – settings forms: 'in' = insett.pas TIn_sett (ToolButton10, IN tab), 'out' = MTsett.pas TAzpSettings
   (ToolButton12, OUT tab). Logic in api/app/azips_sett.py. Labels are the Delphi captions. */
(function () {
  const { api, t, esc, toast, modal } = window.SB;
  const P = '/api/azips/settings/';
  const errT = (e) => t(e.key || 'error.generic', e) + (e.ora ? ' ' + e.ora : '');
  const COLS = {
    mt103: ['ACCOUNT_BACC', 'ACCOUNT_CACC', 'BRANCH_NAME', 'VALUTE_NAME'],
    mt205: ['SENDCODE_NAME', 'ACCOUNT_A', 'ACCOUNT_B', 'BRANCH_NAME', 'VALUTE_NAME', 'BANKNAME'],
    bproc: ['BUS_PROC', 'VALUTE', 'MT'],
    names: { in: ['ID', 'MTNAME', 'ACCOUNT_A', 'ACCOUNT_B', 'VALUTE', 'MT', 'DESCRIPTION', 'CODE'], out: ['ID', 'RBNAME', 'VALUTE', 'BPCODE'] },
  };
  const opt = (rows, k, l, sel) => `<option value=""></option>` + rows.map(r => `<option value="${esc(r[k])}" ${String(r[k]) === String(sel) ? 'selected' : ''}>${esc(r[l])}</option>`).join('');
  const sopt = (items) => `<option value=""></option>` + items.map(x => `<option>${esc(x)}</option>`).join('');
  const grid = (cols, rows) => `<table class="grid acc-grid"><thead><tr>${cols.map(c => `<th>${esc(c)}</th>`).join('')}</tr></thead><tbody>${
    rows.map((r, i) => `<tr data-i="${i}">${cols.map(c => `<td>${esc(r[c.toLowerCase()] ?? '')}</td>`).join('')}</tr>`).join('') || `<tr><td colspan="${cols.length}" class="muted">—</td></tr>`}</tbody></table>`;
  const fld = (label, inner) => `<label class="field"><span>${esc(label)}</span>${inner}</label>`;

  async function open(form, onClose) {
    let d;
    try { d = await api(P + form); } catch (e) { return toast(errT(e), 'error'); }
    const tabs = [['mt103', 'MT 103'], ['mt205', 'MT 205'], ['bproc', form === 'in' ? 'Bizness process' : 'Biznes process'],
      ['names', form === 'in' ? 'Bizness prosess' : 'MT205 Names']];
    modal(`<h3>${form === 'in' ? 'In_Settings' : 'OUT_Setting'}</h3>
      <div class="tabs">${tabs.map(([k, l], i) => `<button data-t="${k}" class="${i ? '' : 'on'}">${esc(l)}</button>`).join('')}</div>
      <div id="sb"></div><div class="actions"><button class="btn secondary" id="sx">${esc(t('azips.close'))}</button></div>`, (m, close) => {
      m.style.width = 'min(1200px, 95vw)'; m.style.maxWidth = '95vw';
      const q = (id) => m.querySelector('#' + id);
      const st = { tab: 'mt103', cur: null, mb: [], comm: [], main: [], alter: [], banks: [] };
      q('sx').onclick = () => { close(); onClose && onClose(); };
      m.querySelectorAll('.tabs button').forEach(b => b.onclick = () => {
        st.tab = b.dataset.t; st.cur = null; m.querySelectorAll('.tabs button').forEach(x => x.classList.toggle('on', x === b)); draw();
      });
      const val = (id) => q(id) ? q(id).value : '';
      const num = (id) => val(id) === '' ? null : +val(id);
      const txt = (id) => { const s = q(id); return s && s.selectedIndex >= 0 ? s.options[s.selectedIndex].text : ''; };
      async function reload() { try { d = await api(P + form); } catch (e) { toast(errT(e), 'error'); } draw(); }
      async function lookup(body) { try { return await api(P + form + '/lookup', { method: 'POST', body }); } catch (e) { toast(errT(e), 'error'); return null; } }
      function draw() {
        const rows = d.grids[st.tab] || [];
        const cols = st.tab === 'names' ? COLS.names[form] : COLS[st.tab];
        let add = '';
        if (st.tab === 'mt103') add = `${fld('Filial', `<select class="input" id="f_fil">${opt(d.filial, 'id', 'name')}</select>`)}
          ${fld('Valyuta', `<select class="input" id="f_val">${opt(d.avalute, 'valute', 'val_name')}</select>`)}
          ${fld('Muxbir Hesab', `<select class="input" id="f_b">${opt(st.mb, 'id', 'acc_no')}</select>`)}
          ${fld('Komissiya Hesab', `<select class="input" id="f_c">${opt(st.comm, 'id', 'acc_no')}</select>`)}`;
        else if (st.tab === 'mt205') add = `${fld('MT205 ', `<input class="input" list="f_pl" id="f_p"><datalist id="f_pl">${d.mt205_items.map(x => `<option value="${esc(x)}">`).join('')}</datalist>`)}
          ${fld('Filial', `<select class="input" id="f_fil">${opt(d.filial, 'id', 'name')}</select>`)}
          ${fld('Valyuta', `<select class="input" id="f_val">${opt(d.avalute, 'valute', 'val_name')}</select>`)}
          ${fld('Dt Balans Hesab', `<input class="input" id="f_e1" style="width:90px">`)}${fld('Debet Hesab', `<select class="input" id="f_a">${opt(st.main, 'id', 'acc_no')}</select>`)}
          ${fld('Kt Balans Hesab', `<input class="input" id="f_e2" style="width:90px">`)}${fld('Kredit Hesab', `<select class="input" id="f_b">${opt(st.alter, 'id', 'acc_no')}</select>`)}
          ${fld('Bank Adı', `<select class="input" id="f_bank">${opt(st.banks, 'bankcode', 'name')}</select>`)}
          ${form === 'out' ? fld('Bank Kodu', `<input class="input" id="f_e3" style="width:90px">`) : ''}`;
        else if (st.tab === 'bproc') add = `${fld('Biznes prosess', `<select class="input" id="f_bp">${opt(d.bproc, 'id', 'name')}</select>`)}
          ${fld('Valyuta', `<select class="input" id="f_cur">${d.curr_items.map(x => `<option>${x}</option>`).join('')}</select>`)}
          ${fld('MT', `<select class="input" id="f_mt">${d.mt_items.map(x => `<option>${x}</option>`).join('')}</select>`)}
          ${fld('Filial', `<select class="input" id="f_of">${d.ofis_items.map(x => `<option>${esc(x)}</option>`).join('')}</select>`)}`;
        else if (form === 'in') add = `${fld('MT', `<select class="input" id="f_mt">${sopt(d.names_mt_items)}</select>`)}
          ${fld('Adı', `<input class="input" id="f_e4">`)}${fld('Təyinatı', `<input class="input" id="f_e5">`)}
          ${fld('Valyuta', `<select class="input" id="f_val">${opt(d.avalute, 'valute', 'val_name')}</select>`)}
          ${fld('Dt Balans Hesab', `<input class="input" id="f_e1" style="width:90px">`)}${fld('Debet Hesab', `<select class="input" id="f_a">${opt(st.main, 'id', 'acc_no')}</select>`)}
          ${fld('Kt Balans Hesab', `<input class="input" id="f_e2" style="width:90px">`)}${fld('Kredit Hesab', `<select class="input" id="f_b">${opt(st.alter, 'id', 'acc_no')}</select>`)}`;
        const canAdd = add !== '';
        const canDel = !(form === 'out' && st.tab === 'names');
        q('sb').innerHTML = `<div class="tablewrap" style="max-height:38vh">${grid(cols, rows)}</div>
          ${canAdd ? `<div class="toolbar" style="gap:8px;flex-wrap:wrap;margin-top:8px">${add}</div>` : ''}
          <div class="toolbar" style="gap:8px">${canAdd ? '<button class="btn" id="f_save">Yadda Saxla</button>' : ''}${canDel ? '<button class="btn danger" id="f_del">Sil</button>' : ''}</div>`;
        q('sb').querySelectorAll('tbody tr[data-i]').forEach(tr => tr.onclick = () => {
          st.cur = rows[+tr.dataset.i]; q('sb').querySelectorAll('tbody tr').forEach(x => x.classList.toggle('sel', x === tr));
        });
        // DBLookupComboBox3/4CloseUp -> mbacc / comm_acc
        const mbc = async (needFil) => {
          if (needFil && !val('f_fil')) { toast('Ilk öncə Filial seçilməlidir ', 'error'); q('f_val').value = ''; return; }
          const r = await lookup({ kind: 'mb_comm', fil: num('f_fil'), val: num('f_val'), val_text: txt('f_val') });
          if (r) { st.mb = r.mbacc; st.comm = r.comm_acc; const f = val('f_fil'), v = val('f_val'); draw(); q('f_fil').value = f; q('f_val').value = v; }
        };
        if (st.tab === 'mt103') { q('f_fil').onchange = () => mbc(false); q('f_val').onchange = () => mbc(true); }
        // Edit1/17 (Main_acc), Edit2/6 (alter_acc) on Enter; Valyuta first
        const keep = () => ['f_p', 'f_fil', 'f_val', 'f_e1', 'f_e2', 'f_e4', 'f_e5', 'f_mt', 'f_a', 'f_b', 'f_bank', 'f_e3'].reduce((o, k) => (q(k) && (o[k] = q(k).value), o), {});
        const restore = (o) => Object.entries(o).forEach(([k, v]) => { if (q(k)) q(k).value = v; });
        const balKey = (id, kind, key) => q(id) && (q(id).onkeydown = async (e) => {
          if (!val('f_val')) { toast('Birinci Valyuta Secilməlidir!!', 'error'); q(id).value = ''; return; }
          if (e.key !== 'Enter') return;
          const r = await lookup({ kind, val: num('f_val'), bal: val(id) });
          if (r) { const o = keep(); st[key] = r; draw(); restore(o); }
        });
        balKey('f_e1', 'main', 'main'); balKey('f_e2', 'alter', 'alter');
        if (st.tab === 'mt205') {
          q('f_p').value = st.mt205text || ''; q('f_p').oninput = () => { st.mt205text = val('f_p'); };   // ComboBox3.Text (also read by Button4Click)
          q('f_val').onchange = async () => {                                   // DBLookupComboBox6CloseUp -> all_banks(:valute = Text)
            const r = await lookup({ kind: 'banks', val_text: txt('f_val') });
            if (r) { const o = keep(); st.banks = r; draw(); restore(o); }
          };
          if (form === 'in') q('f_bank').onchange = () => { if (!val('f_val')) { toast('Ilk öncə Valyuta seçilməlidir ', 'error'); q('f_bank').value = ''; } };
          if (form === 'out') {
            q('f_bank').onchange = () => { q('f_e3').value = val('f_bank'); };
            q('f_e3').onkeydown = (e) => {                                      // Edit3KeyPress: All_Banks.Filter := 'bankcode = ' + Edit3.Text
              if (e.key !== 'Enter') return;
              const o = keep(); st.banks = st.banks.filter(b => String(b.bankcode) === val('f_e3')); draw(); restore(o);
            };
          }
        }
        if (q('f_save')) q('f_save').onclick = async () => {
          const v = { mt103: { acc_b: num('f_b'), acc_c: num('f_c'), fil: num('f_fil'), val: num('f_val') },
            mt205: { purpose_text: val('f_p'), acc_a: num('f_a'), acc_b: num('f_b'), val: num('f_val'), fil: num('f_fil'),
              bankcode: form === 'out' ? val('f_e3') : val('f_bank'), bank_name: txt('f_bank') },
            bproc: { bproc_id: num('f_bp'), bproc_name: txt('f_bp'), curr: val('f_cur'), mt: val('f_mt'), purpose_text: st.mt205text || '' },
            names: { mt: val('f_mt'), acc_a: num('f_a'), acc_b: num('f_b'), val: num('f_val'), edit5: val('f_e5'), edit4: val('f_e4') } }[st.tab];
          try { const r = await api(P + form + '/save', { method: 'POST', body: { tab: st.tab, values: v } }); toast(r.message, r.error ? 'error' : undefined); }
          catch (e) { toast(errT(e), 'error'); }
          reload();
        };
        if (q('f_del')) q('f_del').onclick = async () => {
          if (!st.cur) return toast(t('azips.pick_row'), 'error');
          if (!confirm('Silinsin')) return;
          try { toast((await api(P + form + '/delete', { method: 'POST', body: { tab: st.tab, id: st.cur.id } })).message); } catch (e) { toast(errT(e), 'error'); }
          reload();
        };
      }
      draw();
    }, true);
  }
  window.SB.azipsSett = { open };
})();

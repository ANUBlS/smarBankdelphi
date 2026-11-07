/* Cards ▸ Sazlama sub forms 3, 5-11, 13, 14 (cards_azericard setac.pas TForm10 Button1Click / DBGrid1DblClick), api/app/cards_sett2.py:
   3 crdtype.pas TForm14, 5 filialaccounts.pas TFilial_Accounts, 6 domesticbank.pas Tdomestic_bank, 7 banksettings.pas TBank_Settings,
   8 atmendpos.pas Tatmpos, 9 poscomission.pas TPOS_COMMISION, 10 Unit155.pas TPROVS, 11 cardbranch.pas Tcard_branch,
   13 excsett.pas TExchangesettings, 14 Taxfilessettings.pas TRbsTaxFileAccsett. Labels / buttons are the Delphi captions (locale keys
   cards.s2_*), grid titles the Delphi Title.Caption texts. TSearchEdit boxes = free text with the account list as suggestions. */
(function () {
  const { t, esc, toast, modal } = window.SB;
  const K = (k) => t('cards.' + k);
  const errT = (e) => t(e.key || 'error.generic', e) + (e.ora ? ' ' + e.ora : '');
  const S = '/api/cards/sett';
  let uid = 0;
  if (!document.getElementById('s2css')) { const c = document.createElement('style'); c.id = 's2css';
    c.textContent = '.s2row{display:flex;gap:8px;flex-wrap:wrap;align-items:flex-end;margin-bottom:8px}.s2row label{margin:0}.s2row input,.s2row select{margin:0}'; document.head.appendChild(c); }
  const fld = (label, inner) => `<label style="display:flex;flex-direction:column;gap:2px"><span class="muted" style="font-size:12px">${esc(label)}</span>${inner}</label>`;
  const inp = (id, val = '', w = 170) => `<input id="${id}" value="${esc(val ?? '')}" style="width:${w}px">`;
  const sedit = (id, list) => { const l = 'dl' + (++uid); return `<input id="${id}" list="${l}" style="width:230px"><datalist id="${l}">${list.map(x => `<option value="${esc(x)}"></option>`).join('')}</datalist>`; };
  const sel = (id, rows, key, label, cur) => `<select id="${id}" style="width:200px"><option value=""></option>${rows.map(r => `<option value="${esc(r[key])}" ${cur != null && String(r[key]) === String(cur) ? 'selected' : ''}>${esc(r[label])}</option>`).join('')}</select>`;
  const grid = (id, cols, rows, sortable) => `<div class="tablewrap" style="max-height:42vh"><table class="grid" id="${id}" tabindex="0"><thead><tr>${cols.map(c => `<th ${sortable ? `data-sort="${c[0].toUpperCase()}" style="cursor:pointer"` : ''}>${esc(c[1])}</th>`).join('')}</tr></thead>
    <tbody>${rows.map((r, i) => `<tr data-i="${i}">${cols.map(c => `<td>${esc(r[c[0]] ?? '')}</td>`).join('')}</tr>`).join('') || `<tr><td colspan="${cols.length}" class="muted">${esc(K('empty'))}</td></tr>`}</tbody></table></div>`;
  async function xls(path, name) {
    const res = await fetch(S + path, { method: 'POST', headers: { 'Content-Type': 'application/json', 'X-CSRF': window.SB.csrf || '' }, credentials: 'same-origin', body: '{}' });
    if (!res.ok) { const j = await res.json().catch(() => ({})); toast(errT(j.detail || {}), 'error'); return; }
    const a = document.createElement('a'); a.href = URL.createObjectURL(await res.blob()); a.download = name + '.xlsx'; a.click();
  }

  // shared shell: modal + current row (the DataSet cursor) + optional TitleClick sort
  function shell(form, title, v0, render) {
    const call = async (path, body) => { try { return await window.SB.api(S + '/' + form + path, { method: 'POST', body: body || {} }); } catch (e) { toast(errT(e), 'error'); return null; } };
    modal(`<h2>${esc(title)}</h2><div id="s2b"></div><div class="actions"><button class="btn secondary" data-x>${esc(K('cancel'))}</button></div>`, (m, close) => {
      m.style.width = 'min(1200px, 95vw)'; m.style.maxWidth = '95vw';
      m.querySelector('[data-x]').onclick = close;
      const st = { v: v0, cur: 0 };
      const q = (id) => m.querySelector('#' + id);
      const set = (r) => { if (r) { st.v = r; if (st.cur >= (r.rows || []).length) st.cur = 0; draw(); } return r; };
      function draw() {
        m.querySelector('#s2b').innerHTML = render.html(st.v, st);
        m.querySelectorAll('table.grid tbody tr[data-i]').forEach(tr => tr.onclick = () => {
          st.cur = +tr.dataset.i; tr.parentNode.querySelectorAll('tr.sel').forEach(x => x.classList.remove('sel')); tr.classList.add('sel'); });
        const tr0 = m.querySelector(`table.grid tbody tr[data-i="${st.cur}"]`); if (tr0) tr0.classList.add('sel');
        m.querySelectorAll('table.grid th[data-sort]').forEach(th => th.onclick = async () => set(await call('/sort', { field: th.dataset.sort })));
        render.bind({ m, q, st, call, set, row: () => (st.v.rows || [])[st.cur], yesno: window.SBCardsSett2.yesno, draw });
      }
      draw();
    });
  }
  const val = (q, id) => (q(id) ? q(id).value : '');
  const selText = (q, id) => { const s = q(id); return s && s.selectedIndex > 0 ? s.options[s.selectedIndex].text : ''; };
  const selKey = (q, id) => { const s = q(id); return s && s.value !== '' ? +s.value : null; };

  const FORMS = {
    // 3 TForm14: Button1 'Enter' :14, Button2 'Delete' :27, DBGrid1TitleClick :33, FormActivate :52 clears the boxes
    crdtype: { title: 's2_t_crdtype', html: (v) => `<div class="s2row">
        ${fld(K('s2_product'), inp('c1'))}${fld(K('s2_subtype'), inp('c2'))}${fld(K('s2_currency'), sel('cv', v.valuta, 'val_name', 'val_name'))}
        ${fld(K('s2_service'), inp('c5'))}${fld(K('s2_scheme'), inp('c3'))}${fld(K('s2_bin'), inp('c4'))}
        <button class="btn" id="ca">${esc(K('s2_enter'))}</button><button class="btn secondary" id="cd">${esc(K('s2_delete'))}</button></div>
        ${grid('cg', [['name', 'Contract PRODUCT'], ['code', 'Subtype'], ['currency', 'Currency'], ['service', 'Service Pack'], ['scheme', 'Acnt Scheme'], ['bin', 'Bin']], v.rows, true)}`,
      bind: ({ q, call, set, row, yesno }) => {
        q('ca').onclick = async () => { const r = set(await call('/add', { f: { edit1: val(q, 'c1'), edit2: val(q, 'c2'), currency: selText(q, 'cv'), edit5: val(q, 'c5'), edit3: val(q, 'c3'), edit4: val(q, 'c4') } })); if (r && r.message) toast(r.message); };
        q('cd').onclick = async () => { const ok = await yesno(K('s2_msg_del')); set(await call('/delete', { rowid: row() && row().rowid, confirmed: ok })); };
      } },
    // 5 TFilial_Accounts: Button1 'Yadda saxla' :9 (no confirmation), Button2 'Sil' :26, DBGrid1TitleClick :38
    filialaccounts: { title: 's2_t_filialaccounts', html: (v) => `<div class="s2row">
        ${fld(K('s2_filial'), sel('ff', v.filial, 'name', 'name'))}${fld(K('s2_valyuta'), sel('fv', v.valuta, 'val_name', 'val_name'))}
        ${fld(K('s2_h2801'), sedit('f1', v.accounts))}${fld(K('s2_h4801'), sedit('f2', v.accounts))}${fld(K('s2_h64'), sedit('f3', v.accounts))}
        ${fld(K('s2_dil_gel'), sedit('f4', v.accounts))}${fld(K('s2_dil_xer'), sedit('f5', v.accounts))}${fld(K('s2_kod'), inp('fk', '', 80))}
        ${fld(K('s2_h2803'), sedit('f6', v.accounts))}${fld(K('s2_h4803'), sedit('f7', v.accounts))}
        <button class="btn" id="fa">${esc(K('st_save'))}</button><button class="btn secondary" id="fd">${esc(K('on_delete'))}</button></div>
        ${grid('fg', [['filial', 'FILIAL'], ['valyuta', 'VALYUTA'], ['hesab_28', 'HESAB_2801-11'], ['hesab_48', 'HESAB_4801-11'], ['rez28', 'HESAB_2803-13'], ['rez48', 'HESAB_4803-13'], ['hesab_64', 'HESAB_64'], ['diling_gelir', 'DİLİNQ GƏLİR'], ['diling_xerc', 'DİLİNQ XƏRC'], ['kod', 'KOD']], v.rows, true)}`,
      bind: ({ q, call, set, row, yesno }) => {
        q('fa').onclick = async () => set(await call('/add', { f: { filial: selText(q, 'ff'), currency: selText(q, 'fv'), se1: val(q, 'f1'), se2: val(q, 'f2'), se3: val(q, 'f3'), se4: val(q, 'f4'), se5: val(q, 'f5'), edit1: val(q, 'fk'), se6: val(q, 'f6'), se7: val(q, 'f7') } }));
        q('fd').onclick = async () => { const ok = await yesno(K('s2_msg_del')); set(await call('/delete', { rowid: row() && row().rowid, confirmed: ok })); };
      } },
    // 6 Tdomestic_bank: Button1 :9 'Dəyişikliklər yadda saxlanılsın?', Button2 :22, DBGrid1TitleClick :28, FormActivate accountdomestic.Open
    domesticbank: { title: 's2_t_domesticbank', html: (v) => `<div class="s2row">
        ${fld(K('s2_bankid'), inp('d1'))}${fld(K('s2_bankname'), inp('d2'))}${fld(K('s2_valyuta'), sel('dv', v.valuta, 'val_name', 'val_name'))}
        ${fld(K('s2_h25'), sedit('ds1', v.accounts))}${fld(K('s2_h45'), sedit('ds2', v.accounts))}${fld(K('s2_h64'), sedit('ds3', v.accounts))}
        <button class="btn" id="da">${esc(K('st_save'))}</button><button class="btn secondary" id="dd">${esc(K('on_delete'))}</button></div>
        ${grid('dg', [['bankid', 'Bank ID'], ['bankname', 'Bankın adı'], ['val_name', 'Valyuta'], ['acc_no', 'Hesab (25)'], ['acc_no_1', 'Hesab (45)'], ['acc_no_2', 'Hesab (64)']], v.rows, true)}`,
      bind: ({ q, call, set, row, yesno }) => {
        q('da').onclick = async () => { const ok = await yesno(K('s2_msg_save_ch')); set(await call('/add', { f: { edit1: val(q, 'd1'), edit2: val(q, 'd2'), currency: selText(q, 'dv'), se1: val(q, 'ds1'), se2: val(q, 'ds2'), se3: val(q, 'ds3') }, confirmed: ok })); };
        q('dd').onclick = async () => { const ok = await yesno(K('s2_msg_del')); set(await call('/delete', { rowid: row() && row().rowid, confirmed: ok })); };
      } },
    // 7 TBank_Settings: FormActivate settings.Edit; Button1 'Yadda saxla' (cardsettingssave, then 'Dəyişiklik yadda saxlanılsın?'); FormClose Cancel
    banksettings: { title: 's2_t_banksettings', html: (v) => `<div style="display:grid;grid-template-columns:repeat(2,minmax(220px,1fr));gap:10px;max-width:640px">
        ${fld(K('s2_bankid'), inp('b1', v.bankid))}${fld(K('s2_accclose'), inp('b2', v.accountclosecode))}
        ${fld(K('s2_kl25'), sedit('b3', v.accounts))}${fld(K('s2_kl45'), sedit('b4', v.accounts))}
        <label><input type="checkbox" id="b5" ${v.dord ? 'checked' : ''}> ${esc(K('s2_verif'))}</label>
        <fieldset><legend>${esc(K('s2_moh'))}</legend><label><input type="radio" name="brz" value="0" ${v.rez === 0 ? 'checked' : ''}> ${esc(K('s2_moh0'))}</label><br>
          <label><input type="radio" name="brz" value="1" ${v.rez === 1 ? 'checked' : ''}> ${esc(K('s2_moh1'))}</label></fieldset></div>
        <div class="toolbar" style="margin-top:8px"><button class="btn" id="bs">${esc(K('st_save'))}</button></div>`,
      bind: ({ m, q, st, call, set, yesno }) => {
        q('b3').value = st.v.kliring_25; q('b4').value = st.v.kliring_45;          // FormShow SearchEdit3 / 4 := kliring_25 / kliring_45
        q('bs').onclick = async () => {
          if (!(await call('/check'))) return;                                    // CheckAdvancedObjectAccess('cardsettingssave') before the question
          const ok = await yesno(K('s2_msg_save_ch1'));
          set(await call('/save', { confirmed: ok, f: { bankid: val(q, 'b1'), accountclosecode: val(q, 'b2'), kliring_25: val(q, 'b3'), kliring_45: val(q, 'b4'), dord: q('b5').checked, rez: +(m.querySelector('input[name=brz]:checked') || { value: 0 }).value } }));
        };
      } },
    // 8 Tatmpos: Button1 'Yadda saxla' :9 (cardatmpossave; required boxes; 'Yadda saxlanılsın?'), Button2 'Sil' :27 (cardatmposdelete), Button3 'Excel' :57
    atmendpos: { title: 's2_t_atmendpos', html: (v) => `<div class="s2row">
        ${fld(K('s2_tipi'), `<select id="a0" style="width:120px"><option></option>${v.types.map(x => `<option>${esc(x)}</option>`).join('')}</select>`)}${fld(K('s2_id'), inp('a1'))}${fld(K('s2_adi'), inp('a2'))}
        ${fld(K('s2_contract'), inp('a3'))}${fld(K('s2_filial'), sel('af', v.filial, 'name', 'name'))}${fld(K('s2_valyuta'), sel('av', v.valuta, 'val_name', 'val_name'))}
        ${fld(K('s2_hmain'), sedit('as3', v.accounts))}${fld(K('s2_hara'), sedit('as2', v.accounts))}${fld(K('s2_hgel'), sedit('as1', v.accounts))}
        <button class="btn" id="aa">${esc(K('st_save'))}</button><button class="btn secondary" id="ad">${esc(K('on_delete'))}</button><button class="btn secondary" id="ax">Excel</button></div>
        ${grid('ag', [['atmpos', 'Tip'], ['atmid', 'ID'], ['contractnumber', 'Müqavilə nömrəsi'], ['atmname', 'Ad'], ['filial', 'Filial'], ['valyuta', 'Valyuta'], ['mainaccount', 'Hesab (əsas)'], ['interacount', 'Hesab (ara)'], ['profitacount', 'Hesab (gəlir)']], v.rows, true)}`,
      bind: ({ q, call, set, row, yesno }) => {
        const f = () => ({ type: val(q, 'a0'), edit1: val(q, 'a1'), edit2: val(q, 'a2'), edit3: val(q, 'a3'), filial: selText(q, 'af'), currency: selText(q, 'av'), se1: val(q, 'as1'), se2: val(q, 'as2'), se3: val(q, 'as3') });
        q('aa').onclick = async () => { const c = await call('/check', { f: f() }); if (!c) return; const ok = c.ask ? await yesno(K('s2_msg_save')) : false; set(await call('/add', { f: f(), confirmed: ok })); };
        q('ad').onclick = async () => { if (!(await call('/delcheck'))) return; const ok = await yesno(K('s2_msg_del2')); set(await call('/delete', { id: row() ? row().id : null, confirmed: ok })); };
        q('ax').onclick = () => xls('/atmendpos/excel', 'CARDS');
      } },
    // 9 TPOS_COMMISION: Button1 'Yadda saxla' :17 (Insert / Post / Commit; errors swallowed), Button2 'Sil' :9, Button3 'Excel' :43, TitleClick :49
    poscomission: { title: 's2_t_poscomission', html: (v) => `<div class="s2row">
        ${fld(K('s2_merchant'), inp('p1'))}${fld(K('s2_min'), inp('p6', '', 110))}${fld(K('s2_max'), inp('p3', '', 110))}${fld(K('s2_dom'), inp('p4', '', 110))}
        ${fld(K('s2_int1'), inp('p5', '', 110))}${fld(K('s2_int2'), inp('p2', '', 110))}${fld(K('s2_onus'), inp('p7', '', 110))}
        <button class="btn" id="pa">${esc(K('st_save'))}</button><button class="btn secondary" id="pd">${esc(K('on_delete'))}</button><button class="btn secondary" id="px">Excel</button></div>
        ${grid('pg', [['posid', 'Merchant ID'], ['minvalue', 'MIN Value'], ['maxvalue', 'MAX Value'], ['domesticpercent', 'Domestic Percent'], ['interpercent1', 'Int Percent (affiliate)'], ['interpercent2', 'Int Percent (principal)'], ['onuspercent', 'On Us Percent']], v.rows, true)}`,
      bind: ({ q, call, set, row, yesno }) => {
        q('pa').onclick = async () => set(await call('/add', { f: { posid: val(q, 'p1'), minvalue: val(q, 'p6'), maxvalue: val(q, 'p3'), domesticpercent: val(q, 'p4'), interpercent1: val(q, 'p5'), interpercent2: val(q, 'p2'), onuspercent: val(q, 'p7') } }));
        q('pd').onclick = async () => { const ok = await yesno(K('s2_msg_del')); set(await call('/delete', { rowid: row() && row().rowid, confirmed: ok })); };
        q('px').onclick = () => xls('/poscomission/excel', 'POS');
      } },
    // 10 TPROVS: Button1 'Əlavə et' :8 (insert_noprovs), Button2 'Sil' :13 (Delete without confirmation, Commit, Refresh)
    unit155: { title: 's2_t_unit155', html: (v) => `<div class="s2row">${inp('n1', '', 300)}
        <button class="btn" id="na">${esc(K('st_add'))}</button><button class="btn secondary" id="nd">${esc(K('on_delete'))}</button></div>${grid('ng', [['str', 'STRING']], v.rows, false)}`,
      bind: ({ q, call, set, row }) => {
        q('na').onclick = async () => set(await call('/add', { text: val(q, 'n1') }));
        q('nd').onclick = async () => set(await call('/delete', { rowid: row() ? row().rowid : null }));
      } },
    // 11 Tcard_branch: Button1 'Yadda saxla' :8, PopupMenu1 S1 'Sil' :160, Button2 'XML Al' :17 (Visible = False; F11 on the grid shows it, F10 hides it)
    cardbranch: { title: 's2_t_cardbranch', html: (v, st) => `<div class="s2row">
        ${fld(K('s2_filial'), sel('cbf', v.filial, 'id', 'name'))}${fld(K('s2_brcode'), inp('cbc'))}
        <button class="btn" id="cba">${esc(K('st_save'))}</button><button class="btn secondary" id="cbx" style="${st.xml ? '' : 'display:none'}">${esc(K('s2_xml'))}</button></div>
        ${grid('cbg', [['branchid', 'Filial kodu'], ['branch_name', 'Filial'], ['branch_code', 'Filialin plastik kart kodu']], v.rows, false)}`,
      bind: ({ m, q, st, call, set, row, yesno, draw }) => {
        q('cba').onclick = async () => { const r = set(await call('/add', { filial_id: selKey(q, 'cbf'), filial_name: selText(q, 'cbf'), code: val(q, 'cbc') })); if (r && r.message) toast(r.message); };
        q('cbg').onkeydown = (e) => { if (e.key === 'F11') { e.preventDefault(); st.xml = true; draw(); q('cbg').focus(); } if (e.key === 'F10') { e.preventDefault(); st.xml = false; draw(); q('cbg').focus(); } };
        q('cbx').onclick = async () => { const r = await call('/xml'); if (!r) return;
          r.files.forEach(f => { const bb = Uint8Array.from(atob(f.b64), c => c.charCodeAt(0)); const a = document.createElement('a'); a.href = URL.createObjectURL(new Blob([bb])); a.download = f.name; a.click(); });
          r.messages.forEach(x => toast(x)); };
        q('cbg').oncontextmenu = (e) => { const tr = e.target.closest('tr[data-i]'); if (!tr) return; e.preventDefault(); st.cur = +tr.dataset.i;
          document.querySelectorAll('.cf_pop').forEach(x => x.remove());
          const pm = document.createElement('div'); pm.className = 'cf_pop'; pm.style.cssText = `position:fixed;left:${e.clientX}px;top:${e.clientY}px;z-index:1200;background:#fff;border:1px solid #888`;
          pm.innerHTML = `<button class="btn secondary" id="cbs">${esc(K('on_delete'))}</button>`; document.body.appendChild(pm);
          const off = () => { pm.remove(); document.removeEventListener('click', off); }; setTimeout(() => document.addEventListener('click', off), 0);
          pm.querySelector('#cbs').onclick = async () => { off(); const ok = await yesno(K('s2_msg_delcode')); set(await call('/delete', { id: row() ? row().branchid : null, confirmed: ok })); }; };
      } },
    // 13 TExchangesettings: filialcomboCloseUp (exchange_acc :fil), BitBtn1 'Yadda saxla' (addexchangeacc), BitBtn2 'Sil' (no OnClick)
    excsett: { title: 's2_t_excsett', html: (v) => `<div class="s2row">
        ${fld(K('s2_filial'), sel('ef', v.filial, 'id', 'name', v.fil))}${fld(K('s2_atmname'), inp('en'))}${fld(K('s2_contrno'), inp('ec'))}
        ${[['atmazn', 's2_atmazn'], ['vdmazn', 's2_vdmazn'], ['atmusd', 's2_atmusd'], ['vdmusd', 's2_vdmusd'], ['atmeur', 's2_atmeur'], ['vdmeur', 's2_vdmeur'], ['vdmincome', 's2_vdmgel'], ['ara', 's2_ara']].map(([k, l]) => fld(K(l), sedit('e_' + k, v.accounts))).join('')}
        <button class="btn" id="ea">${esc(K('st_save'))}</button><button class="btn secondary" id="ed">${esc(K('on_delete'))}</button></div>
        ${grid('eg', [['contractnum', 'KONTRACTNUM'], ['atmname', 'Atm adı'], ['atmazn', 'Azn atm'], ['vdmazn', 'Azn vdm'], ['atmusd', 'Usd Atm'], ['vdmusd', 'Usd Vdm'], ['atmeur', 'Eur Atm'], ['vdmeur', 'Eur Vdm'], ['aznincome', 'Gəlir'], ['middleacc', 'Ara hesab'], ['branch', 'Filial']], v.rows, false)}`,
      bind: ({ q, call, set }) => {
        q('ef').onchange = async () => set(await call('/filial', { fil: selKey(q, 'ef') }));
        q('ea').onclick = async () => { const f = { filial: selKey(q, 'ef'), nameofatm: val(q, 'en'), contract_num: val(q, 'ec') };
          ['atmazn', 'vdmazn', 'atmusd', 'vdmusd', 'atmeur', 'vdmeur', 'vdmincome', 'ara'].forEach(k => f[k] = val(q, 'e_' + k));
          set(await call('/add', { f })); };
        q('ed').onclick = () => {};                                                        // BitBtn2 has no OnClick
      } },
    // 14 TRbsTaxFileAccsett: valutecomboCloseUp (rbs_tax_accounts :fil/:valu), BitBtn1 'Yadda saxla', BitBtn2 'Sil' (deletes the account
    // lookup dataset: error); DBGrid1 is editable (dgEditing): change a cell to Post, Ctrl+Del deletes ('Delete record?')
    taxfilessettings: { title: 's2_t_taxfilessettings', html: (v, st) => `<div class="s2row">
        ${fld(K('s2_filial'), sel('tf', v.filial, 'id', 'name', st.fil))}${fld(K('s2_valyuta'), sel('tv', v.valuta, 'valute', 'valu_name', st.valu))}
        ${fld(K('s2_tax1'), sedit('t1', v.accounts))}${fld(K('s2_tax10'), sedit('t10', v.accounts))}${fld(K('s2_tax18'), sedit('t18', v.accounts))}
        <button class="btn" id="ta">${esc(K('st_save'))}</button><button class="btn secondary" id="td">${esc(K('on_delete'))}</button><button class="btn secondary" id="ti">${esc(K('s2_newrow'))}</button></div>
        <div class="tablewrap" style="max-height:42vh"><table class="grid" id="tg"><thead><tr>${['ID', 'TAX1', 'TAX10', 'TAX18', 'BRANCH', 'VALUTE'].map(c => `<th>${c}</th>`).join('')}</tr></thead><tbody>
        ${v.rows.map((r, i) => `<tr data-i="${i}">${['id', 'tax1', 'tax10', 'tax18', 'branch', 'valute'].map(c => `<td><input data-f="${c}" value="${esc(r[c] ?? '')}" style="width:${c.startsWith('tax') ? 220 : 70}px"></td>`).join('')}</tr>`).join('')}</tbody></table></div>`,
      bind: ({ m, q, st, call, set, yesno }) => {
        q('tv').onchange = async () => { st.fil = selKey(q, 'tf'); st.valu = selKey(q, 'tv'); set(await call('/valute', { fil: st.fil, valu: st.valu })); };
        q('tf').onchange = () => { st.fil = selKey(q, 'tf'); };
        q('ta').onclick = async () => set(await call('/add', { f: { filial: selKey(q, 'tf'), valute: selKey(q, 'tv'), tax1: val(q, 't1'), tax10: val(q, 't10'), tax18: val(q, 't18') } }));
        q('td').onclick = async () => { const ok = await yesno(K('s2_msg_del')); set(await call('/delete', { confirmed: ok })); };
        q('ti').onclick = async () => set(await call('/apply', { op: 'insert', f: {} }));
        m.querySelectorAll('#tg tbody tr').forEach(tr => {
          const r = st.v.rows[+tr.dataset.i]; const get = () => Object.fromEntries([...tr.querySelectorAll('input')].map(i => [i.dataset.f, i.value]));
          tr.querySelectorAll('input').forEach(i => i.onchange = async () => set(await call('/apply', { op: 'update', rowid: r.rowid, f: get() })));
          tr.onkeydown = async (e) => { if (e.ctrlKey && e.key === 'Delete') { e.preventDefault(); if (await yesno('Delete record?')) set(await call('/apply', { op: 'delete', rowid: r.rowid })); } };
        });
      } },
  };

  window.SBCardsSett2 = {
    yesno: null,
    has: (form) => form in FORMS,
    async open(form, yesno) {
      this.yesno = yesno;
      const f = FORMS[form];
      let v; try { v = await window.SB.api(S + '/' + form + '/open', { method: 'POST', body: {} }); } catch (e) { return toast(errT(e), 'error'); }
      shell(form, K(f.title), v, f);
    },
  };
})();

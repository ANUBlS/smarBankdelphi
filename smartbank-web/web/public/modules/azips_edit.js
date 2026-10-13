/* AZIPS part 2 – OUT_FORM (Yeni / Ctrl+N), MT103 + MT103AZN editors ("Redaktə et"), MT103Show (committed view).
   Port of OUT_MT.pas, editmt103.pas, formmt103.pas, Editmt103Show.pas. All save logic is server side (api/app/azips_edit.py);
   this file reproduces the controls, the panel switching and the key-level input rules of the Delphi forms. */
(function () {
  const { api, t, esc, toast, modal } = window.SB;
  const P = '/api/azips', K = (k) => t('azips.' + k);
  const errT = (e) => t(e.key || 'error.generic', e) + (e.ora ? ' ' + e.ora : '');
  // Sub-panels per option field: [panel, [[control, kind, label]...]] (OUT_MT.dfm / editmt103.dfm)
  const SUB = {
    CMF50: [['MF50A', [['Edit1_MF50', 'acc', 'account'], ['Edit2_MF50', 'bic', 'bic'], ['Memo1_MF50', 'memo', 'name_addr', 1]]],
            ['MF50D', [['Edit4_MF50', 'acc', 'account'], ['Memo3_MF50', 'memo', 'name_addr']]],
            ['MF50K', [['Edit7', 'kli', 'customer_id'], ['Edit3_MF50', 'accsel', 'account'], ['Memo2_MF50', 'memo', 'name_addr']]]],
    CMF52: [['MF52A', [['Edit1_MF52', 'text', 'account'], ['Edit2_MF52', 'bic', 'bic'], ['Memo1_MF52', 'memo', 'name_addr', 1]]],
            ['MF52D', [['Edit3_MF52', 'text', 'account'], ['Memo2_MF52', 'memo', 'name_addr']]]],
    CMF54: [['MF54A', [['Edit1_MF54', 'text', 'account'], ['Edit2_MF54', 'bic', 'bic'], ['Memo1_MF54', 'memo', 'name_loc', 1]]],
            ['MF54B', [['Edit4_MF54', 'text', 'account'], ['Edit5_MF54', 'text', 'location']]],
            ['MF54D', [['Edit6_MF54', 'text', 'account'], ['Memo2_MF54', 'memo', 'name_loc']]]],
    CMF55: [['MF55A', [['Edit1_MF55', 'text', 'account'], ['Edit2_MF55', 'bic', 'bic'], ['Memo1_MF55', 'memo', 'name_loc', 1]]],
            ['MF55B', [['Edit3_MF55', 'text', 'account'], ['Edit4_MF55', 'text', 'location']]],
            ['MF55D', [['Edit5_MF55', 'text', 'account'], ['Memo2_MF55', 'memo', 'name_loc']]]],
    CMF56: [['MF56A', [['Edit1_MF56', 'text', 'account'], ['Edit2_MF56', 'bic', 'bic'], ['Memo1_MF56', 'memo', 'name_loc', 1]]],
            ['MF56C', [['Edit3_MF56', 'text', 'account']]],
            ['MF56D', [['Edit4_MF56', 'text', 'account'], ['Memo2_MF56', 'memo', 'name_loc']]]],
    CMF57: [['MF57A', [['Edit1_MF57', 'text', 'account'], ['Edit2_MF57', 'bic', 'bic'], ['Memo1_MF57', 'memo', 'name_loc', 1]]],
            ['MF57B', [['Edit3_MF57', 'text', 'account'], ['Edit4_MF57', 'text', 'location']]],
            ['MF57C', [['Edit5_MF57', 'text', 'account']]],
            ['MF57D', [['Edit6_MF57', 'text', 'account'], ['Memo2_MF57', 'memo', 'name_loc']]]],
    CMF59: [['MF59', [['Edit1_MF59', 'text', 'account'], ['Memo2_MF59', 'memo', 'name_addr']]],
            ['MF59A', [['Edit2_MF59', 'text', 'account'], ['Edit3_MF59', 'bic', 'bic'], ['Memo1_MF59', 'memo', 'name_addr', 1]]]],
  };
  const TAG = { CMF50: 'MF50', CMF52: 'OF52', CMF53: 'OF53', CMF54: 'OF54', CMF55: 'OF55', CMF56: 'OF56', CMF57: 'MF57', CMF59: 'MF59' };
  // Key rules: Memo*KeyPress = UpCase + 4 x 35; rKeyPress = 0-9 . only; OF70 148 chars / no Enter; OF72 /BNF/ layout.
  function bindRules(m) {
    m.querySelectorAll('textarea.m35').forEach(a => a.addEventListener('input', async () => {
      const p = a.selectionStart; a.value = (await api(P + '/text/memo', { method: 'POST', body: { text: a.value } })).text; a.selectionStart = a.selectionEnd = p;
    }));
    m.querySelectorAll('input.amt').forEach(a => a.addEventListener('keypress', e => { if (!/[0-9.]/.test(e.key)) e.preventDefault(); }));
    m.querySelectorAll('textarea.r70,textarea.r72').forEach(a => {
      a.addEventListener('keypress', e => { if (e.key === 'Enter') e.preventDefault(); });
      a.addEventListener('input', async () => {
        const k = a.classList.contains('r70') ? '70' : '72';
        a.value = (await api(P + '/text/' + k, { method: 'POST', body: { text: a.value } })).text.replace(/\r\n$/, '').replace(/\r\n/g, '\n');
      });
    });
  }
  const crlf = (s) => (s || '').replace(/\r?\n/g, '\r\n');
  const fld = (id, lab, inner) => `<label class="field"><span>${esc(lab)}</span>${inner}</label>`;
  const inp = (id, v = '', a = '') => `<input class="input" id="${id}" value="${esc(v ?? '')}" ${a}>`;
  const memo = (id, v = '', cls = 'm35', ro) => `<textarea class="input ${cls}" id="${id}" rows="4" style="width:100%;font-family:monospace;text-transform:uppercase" ${ro ? 'readonly' : ''}>${esc((v || '').replace(/\r\n/g, '\n'))}</textarea>`;
  function sub(name, ctrls, rec, ro) {
    return `<div class="azsub" data-p="${name}" hidden><div class="muted" style="font-size:12px">${name}</div><div class="grid2">${ctrls.map(([c, kind, lab, r]) =>
      kind === 'memo' ? fld(c, K('f_' + lab), memo(c, rec[c], 'm35', ro || r)) :
      kind === 'accsel' ? fld(c, K('f_' + lab), `<select class="input" id="${c}" ${ro ? 'disabled' : ''}><option value="${esc(rec[c] || '')}">${esc(rec[c] || '')}</option></select>`) :
      fld(c, K('f_' + lab), inp(c, rec[c], `data-k="${kind}" ${ro ? 'readonly' : ''}`))).join('')}</div></div>`;
  }
  function showSub(m, combo, panel, list) {
    (list || SUB[combo] || []).forEach(([p]) => { const d = m.querySelector(`[data-p="${p}"]`); if (d) d.hidden = p !== panel; });
  }
  async function bicLookup(m, input, memoId, boxIds) {
    const v = input.value.trim(); let b = null;
    if (v) { try { b = (await api(P + '/bank/' + encodeURIComponent(v))).bank; } catch (e) { b = null; } }
    input.style.color = v && !b ? '#c62828' : ''; input.dataset.red = v && !b ? '1' : '';
    if (memoId) { const mm = m.querySelector('#' + memoId); if (mm) mm.value = b ? b.NAME + '\n' + b.CITY : ''; }       // Edit2_MF5xChange
    if (boxIds) boxIds.forEach((id, i) => { m.querySelector('#' + id).value = b ? [b.NAME, b.CITY, b.ADDRESS, b.COUNTRY][i] : ''; });
    return b;
  }
  function wireBic(m) {
    m.querySelectorAll('input[data-k="bic"]').forEach(x => {
      const memoId = x.id.replace(/^Edit2_/, 'Memo1_').replace(/^Edit3_MF59$/, 'Memo1_MF59');
      x.addEventListener('change', () => bicLookup(m, x, memoId));
    });
    m.querySelectorAll('input[data-k="acc"]').forEach(x => x.addEventListener('change', async () => {
      const r = await api(P + '/account/' + encodeURIComponent(x.value.trim() || '-'));
      x.style.color = x.value && !r.found ? '#c62828' : '';
      if (x.value && !r.found) x.value = '';                               // Edit1_MF50Exit: red -> Clear
    }));
    m.querySelectorAll('input[data-k="kli"]').forEach(x => x.addEventListener('change', async () => {   // Edit7Enter
      const r = await api(P + '/account/' + encodeURIComponent(x.value.trim() || '-'));
      const s = m.querySelector('#Edit3_MF50');
      s.innerHTML = '<option value=""></option>' + r.accs.map(a => `<option value="${esc(a.acc_no)}">${esc(a.acc_no)}</option>`).join('');
    }));
  }

  // ------------------------------------------------------------------------------------------- OUT_FORM (Yeni)
  async function newForm(onDone) {
    let init;
    try { init = await api(P + '/new/init'); } catch (e) { toast(errT(e), 'error'); return; }
    const combos = Object.keys(TAG);
    modal(`<h3 id="azcap">${esc(init.fin + init.fincopy)}</h3>
      <div class="tabs"><button data-t="h" class="on">Header</button><button data-t="x">Text</button></div>
      <div data-tab="h"><div class="grid2">
        ${fld('', K('f_sender'), inp('senderlt', init.senderlt, 'disabled'))}${fld('', K('f_sendertype'), inp('sendertype', init.sendertype, 'disabled'))}
        ${fld('', K('f_receiver_bic'), inp('reciverbic', '', 'maxlength="11" style="text-transform:uppercase"'))}${fld('', K('f_recivertype'), inp('recivertype', init.recivertype, 'disabled'))}
        ${fld('', K('f_bank'), inp('Edit2', '', 'disabled'))}${fld('', K('f_city'), inp('Edit3', '', 'disabled'))}
        ${fld('', K('f_address'), inp('Edit4', '', 'disabled'))}${fld('', K('f_country'), inp('Edit5', '', 'disabled'))}
        ${fld('', 'FIN-Copy', `<select class="input" id="fincopy"><option value=""></option><option value="AZN" selected>AZN</option></select>`)}
        ${fld('', 'Message Type', `<select class="input" id="fin">${init.mt_list.map(x => `<option ${x === init.fin ? 'selected' : ''}>${esc(x)}</option>`).join('')}</select>`)}
        ${fld('', 'Application', inp('Application', 'FIN', 'disabled'))}${fld('', 'Priority / Monitoring', inp('priority', 'N / N', 'disabled'))}
      </div></div>
      <div data-tab="x" hidden style="max-height:62vh;overflow:auto"><div class="grid2">
        ${fld('', 'MF20 ' + K('f_ref'), inp('MF20_edit', '', 'disabled maxlength="16"'))}${fld('', 'MF23B', inp('MF23b_edit', 'CRED', 'disabled'))}
        ${fld('', 'MF21 ' + K('f_related'), inp('MF26T_edit', '', 'maxlength="3"'))}${fld('', 'MF32A ' + K('f_date'), `<input type="date" class="input" id="mf32_date" value="${init.mf32_date}">`)}
        ${fld('', 'MF32A ' + K('f_cur'), `<select class="input" id="mf32a_val" disabled><option>AZN</option>${init.valutes.map(v => `<option>${esc(v)}</option>`).join('')}</select>`)}
        ${fld('', 'MF32A ' + K('f_amount'), inp('Edit11_mf32a', '', 'class="input amt" maxlength="15"'))}
        ${fld('', 'OF33B', inp('MF33_edit') + inp('mf33_edit2'))}${fld('', 'MF36', inp('Edit1'))}
        ${fld('', 'OF53 B - Sender Correspondent - Location', inp('DBEdit1', '', 'disabled'))}
      </div>
      ${combos.filter(c => c !== 'CMF53').map(c => `<fieldset class="card" style="padding:6px 10px;margin:6px 0"><legend>${TAG[c]}</legend>
        <select class="input" style="width:100%" id="${c}" data-combo="${c}"></select>${(SUB[c] || []).map(([p, cs]) => sub(p, cs, {})).join('')}</fieldset>`).join('')}
      <div class="grid2">${fld('', 'OF70', memo('OF70_RichEdit', '', 'r70'))}${fld('', 'OF72', memo('OF72_RichEdit', '', 'r72'))}
        ${fld('', 'MF71A', `<select class="input" id="CBox_MF71A">${init.MF71A.map(x => `<option>${x}</option>`).join('')}</select>`)}${fld('', 'MF77B', memo('MF77_memo', '', ''))}</div></div>
      <div class="actions"><button class="btn secondary" id="ax">${esc(K('close'))}</button><button class="btn" id="Mtcreate">${esc(K('create_msg'))}</button></div>`, (m, close) => {
      const q = (id) => m.querySelector('#' + id);
      m.style.width = 'min(980px,96vw)'; m.style.maxWidth = '96vw';
      m.querySelectorAll('.tabs button').forEach(b => b.onclick = () => {
        m.querySelectorAll('.tabs button').forEach(x => x.classList.toggle('on', x === b));
        m.querySelectorAll('[data-tab]').forEach(d => d.hidden = d.dataset.tab !== b.dataset.t);
        if (b.dataset.t === 'x') { q('CBox_MF71A').disabled = q('fincopy').value === 'AZN'; q('CBox_MF71A').selectedIndex = 0; }  // TabSheet1Show
      });
      const corr = async () => { q('DBEdit1').value = (await api(P + '/corr', { method: 'POST', body: { v: q('mf32a_val').value, b: q('reciverbic').value } })).CORACOUNT; };
      const finChange = () => {                                               // FINChange :596-633
        q('azcap').textContent = q('fin').value + q('fincopy').value;
        combos.forEach(c => { const s = q(c); if (s) { s.innerHTML = ''; s.dataset.loaded = ''; showSub(m, c, null); } });
        if (q('fincopy').value === 'AZN') { q('mf32a_val').value = 'AZN'; q('mf32a_val').disabled = true; } else { q('mf32a_val').value = ''; q('mf32a_val').disabled = false; }
      };
      q('fin').onchange = finChange; q('fincopy').onchange = finChange;
      q('reciverbic').addEventListener('change', async () => { await bicLookup(m, q('reciverbic'), null, ['Edit2', 'Edit3', 'Edit4', 'Edit5']); corr(); });
      q('mf32a_val').onchange = corr;
      combos.forEach(c => {
        const s = q(c); if (!s) return;
        s.addEventListener('focus', async () => {                             // CMF50Enter -> InsertComboBoxItems
          if (s.dataset.loaded) return;
          const r = await api(P + '/new/combo', { method: 'POST', body: { fin: q('fin').value, fincopy: q('fincopy').value, combo: c } });
          s.innerHTML = r.items.map(x => `<option>${esc(x)}</option>`).join(''); s.dataset.loaded = '1';
        });
        s.onchange = async () => {                                            // CMF50Change
          const r = await api(P + '/new/panels', { method: 'POST', body: { fin: q('fin').value, fincopy: q('fincopy').value, combo: c, selected: s.value } });
          showSub(m, c, r.show[0] || null);
        };
      });
      wireBic(m); bindRules(m);
      q('ax').onclick = close;
      q('Mtcreate').onclick = async () => {
        const fields = {}; m.querySelectorAll('.azsub input, .azsub textarea, .azsub select').forEach(x => fields[x.id] = crlf(x.value));
        const cmb = {}, ctext = {}; combos.forEach(c => { const s = q(c); if (s && s.dataset.loaded) { cmb[c] = s.selectedIndex; ctext[c] = s.value; } });
        const body = { fin: q('fin').value, fincopy: q('fincopy').value, reciverbic: q('reciverbic').value.toUpperCase(), Edit2: q('Edit2').value, Edit3: q('Edit3').value,
          MF23b_edit: q('MF23b_edit').value, MF26T_edit: q('MF26T_edit').value, mf32_date: q('mf32_date').value, mf32a_val: q('mf32a_val').value,
          Edit11_mf32a: q('Edit11_mf32a').value, MF33_edit: q('MF33_edit').value, mf33_edit2: q('mf33_edit2').value, Edit1: q('Edit1').value,
          combos: cmb, combo_text: ctext, fields, OF70_RichEdit: crlf(q('OF70_RichEdit').value), OF72_RichEdit: crlf(q('OF72_RichEdit').value),
          MF77_memo: crlf(q('MF77_memo').value), Edit1_MF71A: q('CBox_MF71A').value };
        try {
          const r = await api(P + '/new/create', { method: 'POST', body });
          if (!r.ok) { toast(r.message, 'error'); return; }                    // CanClose := False
          q('MF20_edit').value = r.reference; toast(K('saved') + ' ' + r.reference); close(); onDone && onDone();
        } catch (e) { toast(errT(e), 'error'); }
      };
    });
  }

  // ------------------------------------------------------------------------------------------- MT103 / MT103Show / MT103AZN
  const ITEMS = {        // editmt103.dfm / Editmt103Show.dfm ComboBox Items
    CMF50: ['', 'A - Ordering Customer - BIC/BE', 'F-Ordering Customer-ID', 'K-Ordering Customer-Name $ Address'],
    CMF52: ['', 'A - Ordering Institute - BIC/BEI', 'D -  Ordering Institute - Name & Address'],
    CMF53: ['', 'A - Sender Correspondent - (BIC)', 'B - Sender Correspondent - Location', 'D - Sender Correspondent - Name & Address'],
    CMF54: ['', 'A - Reciver`s - (BIC)', 'B -Reciver`s - Location', 'D -Reciver`s - Name & Address'],
    CMF55: ['', 'A - Third Reimbursement inst - (BIC)', 'B - Third Reimbursement inst - Location', 'D -Third Reimbursement inst - Name & Address'],
    CMF56: ['', 'A - Intermediary Institute - (BIC)', 'C -  Intermediary Institute', 'D - Intermediary Institute - Name & Address'],
    CMF57: ['', 'A - Account With Institution - (BIC)', 'B - Account With Institution -Location', 'C - Account With Institution', 'D - Account With Institution - Name & Address'],
    CMF59: ['', 'Field - 59', 'Field - 59A'],
  };
  // MT103 sub-panels (editmt103.dfm): control -> DataField when DB-aware
  const E_SUB = {
    CMF50: [['MF50A', [['Edit1_MF50', null], ['Edit2_MF50', null], ['DBMemo1_MF50', 'MF50_NAME$ADRESS', 1]]], ['MF50F', [['Edit4_MF50', null], ['DBMemo3_MF50', 'MF50_NAME$ADRESS']]], ['MF50K', [['Edit3_MF50', null], ['DBMemo2_MF50', 'MF50_NAME$ADRESS']]]],
    CMF52: [['MF52A', [['DBEdit1_MF52', 'MF52_ACCOUNT'], ['Edit2_MF52', null], ['DBMemo1_MF52', 'MF52_NAME$ADRESS', 1]]], ['MF52D', [['DBEdit3_MF52', 'MF52_ACCOUNT'], ['DBMemo2_MF52', 'MF52_NAME$ADRESS']]]],
    CMF53: [['MF53A', [['DBEdit1_MF53', 'MF53_ACCOUNT'], ['Edit2_MF53', null], ['DBMemo1_MF53', 'MF53_NAME$LOCATION', 1]]], ['MF53B', [['DBEdit3_MF53', 'CORACOUNT', 1], ['DBEdit4_MF53', 'MF53_NAME$LOCATION']]], ['MF53D', [['DBEdit5_MF53', 'MF53_ACCOUNT'], ['DBMemo2_MF53', 'MF53_NAME$LOCATION']]]],
    CMF54: [['MF54A', [['DBEdit1_MF54', 'MF54_ACCOUNT'], ['Edit2_MF54', null], ['DBMemo1_MF54', 'MF54_NAME$LOCATION', 1]]], ['MF54B', [['DBEdit4_MF54', 'MF54_ACCOUNT'], ['DBEdit5_MF54', 'MF54_NAME$LOCATION']]], ['MF54D', [['DBEdit6_MF54', 'MF54_ACCOUNT'], ['DBMemo2_MF54', 'MF54_NAME$LOCATION']]]],
    CMF55: [['MF55A', [['DBEdit1_MF55', 'MF55_ACCOUNT'], ['Edit2_MF55', null], ['DBMemo1_MF55', 'MF55_NAME$LOCATION', 1]]], ['MF55B', [['DBEdit3_MF55', 'MF55_ACCOUNT'], ['DBEdit4_MF55', 'MF55_NAME$LOCATION']]], ['MF55D', [['DBEdit5_MF55', 'MF55_ACCOUNT'], ['DBMemo2_MF55', 'MF55_NAME$LOCATION']]]],
    CMF56: [['MF56A', [['DBEdit1_MF56', 'MF56_ACCOUNT'], ['Edit2_MF56', null], ['DBMemo1_MF56', 'MF56_NAME$LOCATION', 1]]], ['MF56C', [['DBEdit3_MF56', 'MF56_ACCOUNT']]], ['MF56D', [['DBEdit4_MF56', 'MF56_ACCOUNT'], ['DBMemo2_MF56', 'MF56_NAME$LOCATION']]]],
    CMF57: [['MF57A', [['DBEdit1_MF57', 'MF57_ACCOUNT'], ['Edit2_MF57', null], ['DBMemo1_MF57', 'MF57_NAME$LOCATION', 1]]], ['MF57B', [['DBEdit3_MF57', 'MF57_ACCOUNT'], ['DBEdit4_MF57', 'MF57_NAME$LOCATION']]], ['MF57C', [['DBEdit5_MF57', 'MF57_ACCOUNT']]], ['MF57D', [['DBEdit6_MF57', 'MF57_ACCOUNT'], ['DBMemo2_MF57', 'MF57_NAME$LOCATION']]]],
    CMF59: [['MF59', [['DBEdit59_account', 'MF59_ACCOUNT'], ['DBMemo59_nameadress', 'MF59_NAME$ADRESS']]], ['MF59A', [['DBEdit59A_account', 'MF59_ACCOUNT'], ['Edit59A_bic', null], ['DBMemo59A_nameadress', 'MF59_NAME$ADRESS', 1]]]],
  };
  function editForm(id, d, ro, onDone) {
    const r = d.rec, h = d.header;
    const initVal = (c, f) => f === 'CORACOUNT' ? d.corr : f ? r[f] : ({ Edit1_MF50: r.MF50_ACCOUNT, Edit2_MF50: r.MF50_BIC, Edit4_MF50: r.MF50_ACCOUNT, Edit3_MF50: d.Edit3_MF50,
      Edit2_MF52: r.MF52_BIC, Edit2_MF54: r.MF54_BIC, Edit2_MF55: r.MF55_BIC, Edit2_MF56: r.MF56_BIC, Edit2_MF57: r.MF58_BIC, Edit59A_bic: r.MF59_BIC, Edit2_MF53: '' })[c] || '';
    const subE = (c) => E_SUB[c].map(([p, cs]) => `<div class="azsub" data-p="${p}" hidden><div class="muted" style="font-size:12px">${p}</div><div class="grid2">${cs.map(([ctl, f, rdo]) =>
      fld('', ctl + (f ? ' (' + f + ')' : ''), /Memo/.test(ctl) ? memo(ctl, initVal(ctl, f), 'm35', ro || rdo).replace('<textarea', `<textarea data-f="${f || ''}"`)
        : inp(ctl, initVal(ctl, f), `data-f="${f || ''}" ${ro || rdo ? 'readonly' : ''}`))).join('')}</div></div>`).join('');
    modal(`<h3>${ro ? 'MT103Show' : 'MT103'} · ${esc(r.MESSAGETYPE)} ${esc(r.FINCOPY)} · ${esc(r.MF20_REFERENCE)}</h3>
      <div class="grid2">${fld('', K('f_receiver_bic'), inp('reciverbic', r.RECEIVERBIC, ro ? 'disabled' : 'maxlength="11"'))}${fld('', K('f_bank'), inp('Edit2', h.receiver.NAME, 'disabled'))}
        ${fld('', K('f_city'), inp('Edit3', h.receiver.CITY, 'disabled'))}${fld('', K('f_sender'), inp('senderlt', h.senderlt, 'disabled'))}
        ${fld('', 'COUNTRY', inp('DBEdit4', r.COUNTRY, `data-f="COUNTRY" ${ro ? 'readonly' : ''}`))}${fld('', 'HESABAT', inp('DBEdit5', r.HESABAT, `data-f="HESABAT" ${ro ? 'readonly' : ''}`))}</div>
      <div style="max-height:58vh;overflow:auto"><div class="grid2">
        ${fld('', 'MF20', inp('MF20_edit', r.MF20_REFERENCE, 'readonly'))}${fld('', 'MF23B', inp('MF23b_edit', r.MF23B, 'readonly'))}
        ${fld('', 'MF32A ' + K('f_date'), inp('mf32_date', (r.MF32A_DATE || '').slice(0, 10), 'disabled'))}${fld('', 'MF32A ' + K('f_cur'), inp('mf32a_val', r.MF32A_CURR, ro ? 'disabled' : 'maxlength="3"'))}
        ${fld('', 'MF32A ' + K('f_amount'), inp('edit11_mf32a', r.MF32A_AMOUNT, `class="input amt" data-f="MF32A_AMOUNT" ${ro ? 'readonly' : ''}`))}
      </div>
      ${Object.keys(ITEMS).map(c => `<fieldset class="card" style="padding:6px 10px;margin:6px 0"><legend>${TAG[c]}</legend>
        <select class="input" style="width:100%" id="${c}" ${ro || c === 'CMF53' ? 'disabled' : ''}>${ITEMS[c].map((x, i) => `<option value="${i}" ${i === d.combos[c] ? 'selected' : ''}>${esc(x)}</option>`).join('')}</select>${subE(c)}</fieldset>`).join('')}
      <div class="grid2">${fld('', 'OF70', memo('OF70_RichEdit', r.MF70, 'r70', ro))}${fld('', 'OF72', memo('OF72_RichEdit', r.MF72, 'r72', ro))}
        ${fld('', 'MF71A', `<select class="input" id="CBox_MF71A" ${ro ? 'disabled' : ''}><option value=""></option>${['OUR', 'BEN', 'SHA'].map(x => `<option ${x === d.MF71A ? 'selected' : ''}>${x}</option>`).join('')}</select>`)}
        ${fld('', 'MF71G', inp('Edit1_MF71G', d.Edit1_MF71G, ro ? 'readonly' : '') + inp('Edit2_MF71G', d.Edit2_MF71G, ro ? 'readonly' : ''))}
        ${fld('', 'MF77B', memo('DBMF77_memo', r.MF77B, '', ro).replace('<textarea', '<textarea data-f="MF77B"'))}
        ${fld('', K('f_comission'), `<select class="input" id="ComissionAccs" data-f="COM_ACCID" ${ro ? 'disabled' : ''}><option value=""></option>${d.accs.map(a => `<option value="${a.id}" ${String(a.id) === String(r.COM_ACCID) ? 'selected' : ''}>${esc(a.acc_no)}</option>`).join('')}</select>`)}</div></div>
      <div class="actions"><button class="btn secondary" id="ax">${esc(K('close'))}</button>${ro ? '' : `<button class="btn" id="MtCreate">${esc(K('create_msg'))}</button>`}</div>`, (m, close) => {
      const q = (x) => m.querySelector('#' + x);
      m.style.width = 'min(980px,96vw)'; m.style.maxWidth = '96vw';
      Object.keys(ITEMS).forEach(c => {
        const s = q(c), sync = () => { const idx = +s.value; showSub(m, c, idx > 0 ? E_SUB[c][idx - 1][0] : null, E_SUB[c]); };
        s.onchange = sync; sync();
      });
      if (d.combos.CMF59 === -1) q('CMF59').selectedIndex = -1;
      bindRules(m);
      q('ax').onclick = close;
      if (ro) return;
      q('reciverbic').addEventListener('change', () => bicLookup(m, q('reciverbic'), null, ['Edit2', 'Edit3']));
      q('MtCreate').onclick = async () => {
        const cmb = {}, ctext = {}; Object.keys(ITEMS).forEach(c => { cmb[c] = q(c).selectedIndex; ctext[c] = q(c).selectedIndex > 0 ? ITEMS[c][q(c).selectedIndex] : ''; });
        const bound = {}; m.querySelectorAll('.azsub:not([hidden]) [data-f], [data-f]:not(.azsub [data-f])').forEach(x => { if (x.dataset.f && x.dataset.f !== 'CORACOUNT') bound[x.dataset.f] = crlf(x.value); });
        const edits = { Edit1_MF71A: q('CBox_MF71A').value, Edit1_MF71G: q('Edit1_MF71G').value, Edit2_MF71G: q('Edit2_MF71G').value };
        m.querySelectorAll('.azsub input:not([data-f]), .azsub input[data-f=""]').forEach(x => edits[x.id] = x.value);
        m.querySelectorAll('#DBEdit1_MF53').forEach(x => edits.DBEdit1_MF53 = x.value);
        try {
          const res = await api(P + '/out/' + id + '/mt103', { method: 'POST', body: { reciverbic: q('reciverbic').value.toUpperCase(), mf32a_val: q('mf32a_val').value,
            combos: cmb, combo_text: ctext, edits, bound, OF70_RichEdit: crlf(q('OF70_RichEdit').value), OF72_RichEdit: crlf(q('OF72_RichEdit').value) } });
          if (!res.ok) { toast(res.message, 'error'); return; }
          toast(K('saved')); close(); onDone && onDone();
        } catch (e) { toast(errT(e), 'error'); }
      };
    });
  }
  function aznForm(id, d, onDone) {
    const r = d.rec, h = d.header;
    modal(`<h3>MT103AZN · ${esc(r.MF20_REFERENCE)}</h3><div style="max-height:66vh;overflow:auto"><div class="grid2">
      ${fld('', K('f_receiver_bic'), inp('reciverbic', r.RECEIVERBIC, 'maxlength="11"'))}${fld('', K('f_bank'), inp('Edit2', h.receiver.NAME, 'disabled'))}
      ${fld('', 'FINCOPY / TYPE', inp('DBEdit2', r.FINCOPY + ' ' + r.MESSAGETYPE, 'disabled'))}${fld('', 'COUNTRY', inp('DBEdit4', r.COUNTRY, 'data-f="COUNTRY"'))}
      ${fld('', 'HESABAT', inp('DBEdit5', r.HESABAT, 'data-f="HESABAT"'))}${fld('', 'MF20', inp('DBEdit6', r.MF20_REFERENCE, 'disabled'))}
      ${fld('', 'MF32A ' + K('f_date'), `<input type="date" class="input" id="DBDateTimeEditEh1" data-f="MF32A_DATE" value="${esc((r.MF32A_DATE || '').slice(0, 10))}">`)}
      ${fld('', 'MF32A ' + K('f_cur'), inp('mf32a_val', 'AZN', 'disabled'))}${fld('', 'MF32A ' + K('f_amount'), inp('DBEdit8', r.MF32A_AMOUNT, 'class="input amt" data-f="MF32A_AMOUNT"'))}
      ${fld('', 'MF50 ' + K('f_account'), inp('Edit3_MF50', d.Edit3_MF50, 'data-f="MF50_ACCOUNT"'))}${fld('', 'MF50 ' + K('f_name_addr'), memo('DBMemo1', r['MF50_NAME$ADRESS']).replace('<textarea', '<textarea data-f="MF50_NAME$ADRESS"'))}
      ${fld('', 'MF59', `<select class="input" id="CMF59">${['', 'Field - 59', 'Field - 59A'].map((x, i) => `<option ${i === d.combos.CMF59 ? 'selected' : ''}>${x}</option>`).join('')}</select>`)}
      ${fld('', 'MF59 ' + K('f_account'), inp('DBEdit11', r.MF59_ACCOUNT, 'data-f="MF59_ACCOUNT"'))}${fld('', 'MF59 ' + K('f_name_addr'), memo('DBMemo3', r['MF59_NAME$ADRESS']).replace('<textarea', '<textarea data-f="MF59_NAME$ADRESS"'))}
      ${fld('', 'MF59A BIC', inp('DBLookupComboBox2', r.MF59_BIC, 'data-f="MF59_BIC" maxlength="11"'))}${fld('', 'MF59A ' + K('f_name_addr'), memo('RichEdit1', '', ''))}
      ${fld('', 'OF70', memo('OF70_RichEdit', d.OF70_RichEdit.replace(/(\r\n)+$/, ''), 'r70'))}${fld('', 'OF72', memo('RichEdit3', d.RichEdit3.replace(/(\r\n)+$/, ''), 'r72'))}
      </div></div><div class="actions"><button class="btn secondary" id="ax">${esc(K('close'))}</button><button class="btn" id="Change1">${esc(K('change'))}</button></div>`, (m, close) => {
      const q = (x) => m.querySelector('#' + x);
      m.style.width = 'min(900px,96vw)'; m.style.maxWidth = '96vw';
      bindRules(m); q('ax').onclick = close;                                  // FormClose: sw_out.Cancel
      q('reciverbic').addEventListener('change', () => bicLookup(m, q('reciverbic'), null, ['Edit2']));
      q('DBLookupComboBox2').addEventListener('change', async () => { const b = await bicLookup(m, q('DBLookupComboBox2')); q('RichEdit1').value = b ? b.NAME.slice(0, 35) + '\n' + b.CITY : ''; });
      q('Change1').onclick = async () => {
        const bound = { RECEIVERBIC: q('reciverbic').value.toUpperCase() };   // reciverbicChange: DBEdit1.Text := reciverbic.Text
        m.querySelectorAll('[data-f]').forEach(x => bound[x.dataset.f] = crlf(x.value));
        try {
          await api(P + '/out/' + id + '/mt103azn', { method: 'POST', body: { CMF59_text: q('CMF59').value, RichEdit1: crlf(q('RichEdit1').value),
            OF70_RichEdit: crlf(q('OF70_RichEdit').value), RichEdit3: crlf(q('RichEdit3').value), bound } });
          toast(K('saved')); close(); onDone && onDone();
        } catch (e) { toast(errT(e), 'error'); }
      };
    });
  }
  async function edit(id, onDone) {                                           // ToolButton2Click
    try {
      const d = await api(P + '/out/' + id + '/edit');
      if (d.form === 'MT103') editForm(id, d, false, onDone);
      else if (d.form === 'MT103AZN') aznForm(id, d, onDone);
      else if (d.form === 'plugin') window.SB.azipsNew.open(d.id, 'grid_out', onDone);   // SENDERLT<>'103' -> filereport.bpl 'Azipsnew' id (right SW_OUT_EDIT already checked)
    } catch (e) { toast(errT(e), 'error'); }
  }
  async function view(id) {                                                   // Redakteet1Click
    try {
      const d = await api(P + '/out2/' + id + '/show');
      if (d.form === 'MT103Show') editForm(id, d, true); else toast(K('form7_na'), 'error');
    } catch (e) { toast(errT(e), 'error'); }
  }
  window.SB.azipsEdit = { newForm, edit, view };
})();

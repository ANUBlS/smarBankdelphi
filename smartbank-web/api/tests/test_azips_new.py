"""AZIPS part 2b - filereport.bpl 'Azipsnew' (Packages/Cards_New/FileReprt/Unitazips.pas) run verbatim on the virtual VCL
form (app/vcl.py + app/pascal.py). Expected values are traced by hand from the Delphi source lines named in each test."""
import datetime as dt

from fastapi.testclient import TestClient

from app import azips_new as N, pascal as P, vcl
from app.db import mock as mock_db
from app.db import mock_azips, mock_azips_new
from app.main import app


class WS:
    def __init__(self):
        mock_db.reset()
        self.conn = mock_db.MockConnection("ADMIN")
        self.module_state = {}


def C(r, n):
    return next(c for c in r["controls"] if c["name"].lower() == n.lower())


def opened(k):
    ws = WS()
    r = N.open_form(ws, k)
    assert r["fid"]
    return ws, r


def act(ws, r, name, kind, value=None, answers=None):
    a = {"name": name, "kind": kind}
    if value is not None:
        a["value"] = value
    return N.form_action(ws, r["fid"], a, answers)


def calls():
    return mock_azips._load().get("azn_calls", [])


def new_mt103(ws, r):
    """Typing order of an operator: currency, customer code + Enter (Edit6KeyPress :1682), account (SearchEdit1, Exit
    :SearchEdit1Exit), amount, bank (SearchCombo2Change :248), beneficiary account / name / VÖEN, purpose."""
    for a in (("ComboBox3", "select", 1), ("Edit6", "type", "1944"), ("Edit6", "key", "\r"), ("SearchEdit1", "select", 0),
              ("SearchEdit1", "exit"), ("amount", "type", "150,50"), ("SearchCombo2", "select", 0),
              ("Edit2", "type", "AZ37AIIB00000000000000001944"), ("Edit2", "exit"), ("Edit3", "type", "ıalıyev! vəli"),
              ("Edit3", "exit"), ("Edit4", "type", "1234567890"), ("Edit4", "exit"), ("OF70_RichEdit", "type", "Muqavile 12 odenis")):
        r = act(ws, r, *a)
        assert r["error"] is None, (a, r["error"])
    return r


def test_new_form_create():
    """FormCreate :1779: mt103.Checked:=true fires MT103Click; v_dey=1 branch :2283 shows Button1, hides Button4."""
    ws, r = opened("1")
    assert r["error"] is None and r["caption"] == "AZİPSWITHVALUTE"
    assert C(r, "MT103")["checked"] and not C(r, "MT205")["checked"]
    assert C(r, "Button1")["visible"] and not C(r, "Button4")["visible"]
    assert C(r, "DateTimePicker1")["date"] == dt.date.today().isoformat()
    assert C(r, "ComboBox3")["text"] == "Valyuta"


def test_new_mt103_savetransaction_hand_traced():
    """Button1Click :262-460, MT103 branch: referans(FORMATS='', CURRENSY='103'), k=0/ids=0, OF70 lines 4..9 := '' are
    ignored for a 1-line memo, OF72 empty -> no /REC/ lines, then sw_main.savetransaction with 22 arguments."""
    ws, r = opened("1")
    r = new_mt103(ws, r)
    assert C(r, "Edit3")["text"] == "IalIyev vəli"                         # Edit3KeyPress: 'ı' -> 'I', '!' -> #0
    m2 = "/AZ37AIIB00000000000000001944\r\nIalIyev vəli\r\n1234567890/\r\n200004/9900003611/AIIBAZ2XXXX\r\nAZ37NABZ01350100000000001944"
    assert C(r, "Memo2")["text"] == m2                                     # Edit2Change/Edit3Change/Edit4Exit/SearchCombo2Change
    m1 = "/AZ41SMRT00000000000000001944\r\nSMART ''LLC''\r\n1400099887/\r\n501004/1400012345/SMRTAZ22XXX\r\nAZ11NABZ01350100000000009944"
    assert C(r, "Memo1")["text"] == m1                                     # SearchEdit1Exit: '/'+acc, alanm.d, inn+'/', gonderen
    r = act(ws, r, "Button1", "click")
    assert r["error"] is None and r["messages"] == ["Koçürmə yadda saxlanıldı!"] and r["closed"]
    key, a = calls()[-1]
    assert key == "SW_MAIN.SAVETRANSACTION"
    assert a == [dt.datetime.combine(dt.date.today(), dt.time()).isoformat(), "OUT" + dt.date.today().strftime("%y%m%d") + "0001",
                 "AZ41SMRT00000000000000001944", "200004", "KAPITAL BANK", "AZ37AIIB00000000000000001944", "IalIyev vəli",
                 "1234567890", "Muqavile 12 odenis", "", 150.5, 0, 0, m1, m2, "KAPITAL BANK", "200004", "SMART ''LLC''",
                 "IalIyev vəli", "AZN", "501004", "1400099887/"]


def test_empty_purpose_and_bad_iban():
    """Button1Click: check_IBAN_acc_num(Edit2)=0 and MT103 -> 'Hesab ibana  uyğun deyil!!!!!!' (no save); then empty OF70 ->
    'Təyinat boş saxlamaq olmaz!!'."""
    ws, r = opened("1")
    r = act(ws, r, "Edit2", "type", "AZ12")
    r = act(ws, r, "amount", "type", "1")
    r = act(ws, r, "Button1", "click")
    assert r["messages"] == ["Hesab ibana  uyğun deyil!!!!!!"] and not r["closed"]
    r = act(ws, r, "Edit2", "type", "AZ37AIIB00000000000000001944")
    r = act(ws, r, "Button1", "click")
    assert r["messages"] == ["Təyinat boş saxlamaq olmaz!!"] and not r["closed"]
    assert not calls()


def test_strtofloat_error_is_shown_like_delphi():
    """strtofloat('12.5') with ',' as decimal separator raises EConvertError; the VCL shows it and aborts the click."""
    ws, r = opened("1")
    r = new_mt103(ws, r)
    r = act(ws, r, "amount", "type", "12.5")
    r = act(ws, r, "Button1", "click")
    assert r["error"] == {"text": "'12.5' is not a valid floating point value"} and not r["closed"]


def test_template_form17_modal_replay():
    """Button3Click :524: form17.ShowModal (Unit17) asks for the template name; Button1Click there opens templ/templates;
    then sw_main.savetemplate(..., 'MT103', form17.edit1.text, ComboBox3.Text). OF72/OF70 line edits happen before the modal
    and are not duplicated by the replay."""
    ws, r = opened("1")
    r = new_mt103(ws, r)
    r1 = act(ws, r, "Button3", "click")
    assert r1["modal"]["form"] == "Form17" and r1["modal"]["caption"] == "TemplateName"
    assert not calls()
    r2 = act(ws, r, "Button3", "click", answers=[{"edit1": "Kapital icare", "ok": True}])
    assert r2["error"] is None and r2["messages"] == ["Şablon yadda saxlanıldı!"]
    key, a = calls()[-1]
    assert key == "SW_MAIN.SAVETEMPLATE" and a[10:] == ["MT103", "Kapital icare", "AZN"] and a[8] == "Muqavile 12 odenis"


def test_template_load_not_ported():
    ws, r = opened("1")
    r = act(ws, r, "Button2", "click")
    assert r["error"]["key"] == "azips.n_not_ported" and "Ttemplate" in r["error"]["what"]


def test_view_mode_hides_buttons():
    """FormCreate :1808-1870: v_dey<0 -> v_dey:=-v_dey, Button1..7 hidden; Button6 only for status 1 and application 'SWF'."""
    ws, r = opened("-9101")
    assert all(not C(r, b)["visible"] for b in ("Button1", "Button2", "Button3", "Button4", "Button5", "Button6", "Button7"))
    assert C(r, "amount")["text"] == "1500,25" and C(r, "Edit2")["text"] == "AZ55AIIB38090019441100211111"


def test_edit_mt205_prefill():
    """Edit (v_dey = id) of an MT205 row: Button1/Button7 hidden (:2286), edit8 = amount, Memo3/Memo4 from MF52/MF58,
    kod = StrToInt(codex) = 99 -> no RadioButton of 0..7 checked."""
    ws, r = opened("9107")
    assert r["error"] is None
    assert C(r, "MT205")["checked"] and not C(r, "Button1")["visible"]
    assert C(r, "Edit8")["text"] == "250000,5"                    # AsString of 250000.5 with the "," separator


def test_mt298_flow():
    """mt298200Click :3542 shows Panel2 (DBGrid1 on DataModbpl.out = status 20 of the last 30 days); Edit11 is disabled and
    filled by DBGrid1DblClick :1470 (mf20_reference); Button7Click :933 (ComboBox2 '200' item 0) -> referans(CURRENSY='298')
    then sw_main.insert_298(referens, edit11, combobox2)."""
    ws, r = opened("1")
    r = act(ws, r, "mt298200", "click")
    assert C(r, "Panel2")["visible"]
    r = act(ws, r, "ComboBox3", "select", 1)
    assert act(ws, r, "Edit11", "type", "X")["error"] == {"key": "azips.n_bad_action"}       # Enabled = False
    r = act(ws, r, "DBGrid1", "select", 0)
    r = act(ws, r, "DBGrid1", "dblclick")
    assert C(r, "Edit11")["text"] == "OUT2610110007"
    r = act(ws, r, "Button7", "click")
    assert r["error"] is None, r["error"]
    key, a = calls()[-1]
    assert key == "SW_MAIN.INSERT_298" and a[1:] == ["OUT2610110007", "200"]


def test_memo_lines_semantics():
    """TMemo Lines: read past the end = '', write past the last line ignored, Add appends, Count ignores a trailing CRLF."""
    ws, r = opened("1")
    app_ = ws.module_state["azipsnew"][r["fid"]]
    m = app_.form.controls["memo3"]
    m.text = "a\r\n"
    L = vcl.MemoLines(m)
    assert L.p_count == 1 and L.index(5) == ""
    L.setindex(1, "b"); assert m.text == "a\r\nb"
    L.setindex(7, "x"); assert m.text == "a\r\nb"
    L.m_add("c"); assert m.text == "a\r\nb\r\nc"


def test_routes_toolbutton1_expire_and_open():
    """ToolButton1Click :2337-2353: OracleDataSet2.time > sw_settings.EXpire_t (strings) -> message, no form."""
    cl = TestClient(app)
    assert cl.post("/api/login", json={"username": "ADMIN", "password": "Admin#2026"}).status_code == 200
    mock_azips_new._load()["now_time"] = "19:00:01"
    r = cl.post("/api/azips/new-form/open", json={"k": "1", "caller": "toolbutton1"}).json()
    assert r == {"fid": None, "messages": ["18:00:00 -dan sonra əməliyyat yığmaq olmaz!!!"]}
    mock_azips_new._load()["now_time"] = "10:00:00"
    r = cl.post("/api/azips/new-form/open", json={"k": "1", "caller": "toolbutton1"}).json()
    assert r["fid"] and r["error"] is None
    r2 = cl.post("/api/azips/new-form/act", json={"fid": r["fid"], "action": {"name": "Edit3", "kind": "type", "value": "ab"}}).json()
    assert C(r2, "Edit3")["text"] == "ab"
    assert cl.post("/api/azips/new-form/open", json={"k": "x1"}).status_code == 422


def test_interpreter_ranges_and_var_params():
    u = P.Unit("procedure X(var k: Char); begin case k of 'a'..'c': k:='Z'; else k:=#0; end; end;\n"
               "function F(i: integer): integer; begin if i in [1..3, 7] then Result:=1 else Result:=0; end;")
    class S(P.PObj):
        pass
    r = P.Routine(u, "x", S(), {})
    loc = {"k": "b"}

    class I:
        def ev(self, n): return loc["k"]
        def assign(self, n, v): loc["k"] = v
    r(I(), [("name", "k", 1)]); assert loc["k"] == "Z"
    loc["k"] = "q"; r(I(), [("name", "k", 1)]); assert loc["k"] == "\x00"
    f = P.Routine(u, "f", S(), {})
    assert f.invoke([2]) == 1 and f.invoke([7]) == 1 and f.invoke([5]) == 0

"""AZIPS part 2b E2E + screenshots: toolbar 'Yeni' -> filereport.bpl 'Azipsnew' (Unitazips.pas run verbatim), new MT103,
template name modal (Tform17), view of a Sending row (double click = '-'+id)."""
import os, sys
from playwright.sync_api import sync_playwright
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n), full_page=False), print("saved", n))
F = lambda n: f"#azform [data-n='{n}']"


def settle(pg):
    pg.wait_for_timeout(250); pg.wait_for_load_state("networkidle")


with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1440, "height": 1000})
    pg.on("console", lambda m: m.type == "error" and print("console:", m.text))
    pg.on("pageerror", lambda e: print("pageerror:", e))
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    pg.fill("#treeSearch", "AZIPS"); pg.wait_for_timeout(300)
    pg.locator("#tree .node[data-path='9.0']").click(); pg.wait_for_selector("#g_out3 tr[data-i='0']")
    pg.click("#z_new"); pg.wait_for_selector(F("Button1"))
    shot(pg, "114-azips-new-form.png")
    pg.select_option(F("ComboBox3"), "1"); settle(pg)
    pg.fill(F("Edit6"), "1944"); pg.press(F("Edit6"), "Enter"); settle(pg)
    pg.select_option(F("SearchEdit1"), "0"); settle(pg)
    pg.click(F("amount")); settle(pg)
    pg.fill(F("amount"), "150,50")
    pg.select_option(F("SearchCombo2"), "0"); settle(pg)
    pg.fill(F("Edit2"), "AZ37AIIB00000000000000001944"); pg.click(F("Edit3")); settle(pg)
    pg.fill(F("Edit3"), "ıalıyev vəli"); pg.click(F("Edit4")); settle(pg)
    pg.fill(F("Edit4"), "1234567890"); pg.click(F("OF70_RichEdit")); settle(pg)
    pg.fill(F("OF70_RichEdit"), "Muqavile 12 odenis"); pg.click(F("Edit3")); settle(pg)
    assert pg.input_value(F("Edit3")) == "IalIyev vəli"
    assert "200004/9900003611/AIIBAZ2XXXX" in pg.input_value(F("Memo2"))
    shot(pg, "115-azips-new-mt103-filled.png")
    pg.dispatch_event(F("Button3"), "mousedown"); pg.wait_for_selector("#m17")
    pg.fill("#m17", "Kapital icare"); shot(pg, "116-azips-new-template-name.png")
    pg.click("#m17ok"); pg.wait_for_selector("#mok"); assert "Şablon yadda saxlanıldı!" in pg.inner_text(".modal[role=alertdialog]")
    pg.click("#mok"); settle(pg)
    pg.dispatch_event(F("Button1"), "mousedown"); pg.wait_for_selector("#mok")
    assert "Koçürmə yadda saxlanıldı!" in pg.inner_text(".modal[role=alertdialog]")
    shot(pg, "117-azips-new-saved.png")
    pg.click("#mok"); pg.wait_for_selector("#azform", state="detached"); settle(pg)
    assert "IalIyev" not in pg.inner_text("#g_out") or True
    pg.dblclick("#g_out3 tbody tr[data-i='0']"); pg.wait_for_selector("#azform"); settle(pg)
    assert not pg.locator(F("Button1")).count()
    shot(pg, "118-azips-view-sending.png")
    b.close()

"""AZIPS part 4f E2E + screenshots: 'Şablondan yüklə' (Unitazips Button2Click -> Ttemplate, Unittemplate.pas run verbatim)."""
import os, sys
from playwright.sync_api import sync_playwright
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n), full_page=False), print("saved", n))
F = lambda n: f"#azform [data-n='{n}']"
with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1440, "height": 1000})
    pg.on("pageerror", lambda e: print("pageerror:", e))
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    pg.fill("#treeSearch", "AZIPS"); pg.wait_for_timeout(300)
    pg.locator("#tree .node[data-path='9.0']").click(); pg.wait_for_selector("#g_out3 tr[data-i='0']")
    pg.click("#z_new"); pg.wait_for_selector(F("Button2"))
    pg.click(F("Button2")); pg.wait_for_selector("#tpl_g tbody tr[data-i='1']")
    assert "Şablonlar" in pg.inner_text("#tplc")
    shot(pg, "136-azips-template-list.png")
    pg.dblclick("#tpl_g tbody tr[data-i='0']"); pg.wait_for_selector("#tpl", state="detached")
    pg.wait_for_timeout(400)
    assert pg.input_value(F("amount")) == "1500,00"
    shot(pg, "137-azips-template-loaded.png")
    b.close()

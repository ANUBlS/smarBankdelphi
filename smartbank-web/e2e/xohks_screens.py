"""XÖHKS step 1 E2E + screenshots: Packages/LVPCSSManager_Turan four tabs (lists and archives)."""
import os, sys
from playwright.sync_api import sync_playwright
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n), full_page=False), print("saved", n))
with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1440, "height": 1000})
    pg.on("pageerror", lambda e: print("pageerror:", e))
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    pg.fill("#treeSearch", "XÖHKS"); pg.wait_for_timeout(300)
    pg.locator("#tree .node", has_text="XÖHKS").last.click(); pg.wait_for_selector("#g_b tr[data-i='3']")
    assert pg.input_value("#x_e1") == "Modifikasiya =12000" and pg.inner_text("#x_sum") == "16801.25"
    pg.wait_for_selector("#g_xb tr[data-i='1']")
    shot(pg, "139-xohks-out.png")
    pg.click(".tabs button[data-tab='in']"); pg.wait_for_selector("#g_i tr[data-i='2']")
    shot(pg, "140-xohks-in.png")
    pg.click(".tabs button[data-tab='oarch']"); pg.fill("#x_ab", "2026-10-01"); pg.click("#x_aref")
    pg.wait_for_selector("#g_ab tr[data-i='2']"); pg.click("#g_ab tr[data-i='2']"); pg.wait_for_timeout(400)
    assert pg.input_value("#x_fil") == "Nərimanov filialı"
    shot(pg, "141-xohks-out-archive.png")
    pg.click(".tabs button[data-tab='iarch']"); pg.fill("#x_ib", "2026-10-01"); pg.click("#x_iaref")
    pg.wait_for_selector("#g_ia tr[data-i='4']"); pg.click("#x_flt"); pg.wait_for_selector("#x_l2 option", state="attached")
    pg.check("#x_c2"); pg.select_option("#x_l2", "101"); pg.click("#x_apply"); pg.wait_for_timeout(500)
    assert pg.inner_text("#x_isum") == "4915.25" and pg.locator("#g_ia tbody tr[data-i]").count() == 3
    shot(pg, "142-xohks-in-archive-filter.png")
    b.close()

"""Cards ▸ Application (applicationpas.pas) step 3a E2E + screenshots 176-177."""
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
    pg.fill("#treeSearch", "Cards"); pg.wait_for_timeout(300)
    pg.locator("#tree .node", has_text="Cards").last.click(); pg.wait_for_selector("#g_c tr[data-i='0']")
    pg.click("#m1 summary"); pg.click("[data-mi=application]"); pg.wait_for_selector("#ap_urgent tbody tr[data-id]")
    assert pg.locator("#ap_urgent tbody tr[data-id]").count() == 2 and pg.locator("#ap_simple img").count() == 2
    shot(pg, "176-cards-applications.png")
    pg.click("#ap_simple tbody tr[data-id]", button="right"); pg.click("#ap_all"); pg.wait_for_timeout(200)
    assert pg.locator("#ap_simple tr.sel").count() == 2
    with pg.expect_download() as dl:
        pg.click("[data-xls=urgent]")
    print("excel", dl.value.suggested_filename)
    shot(pg, "177-cards-applications-selectall.png")
    b.close()

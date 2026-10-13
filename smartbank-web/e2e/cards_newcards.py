"""Cards ▸ Yeni kartlar (U9.pas TForm9) E2E + screenshot 179."""
import os, sys
from playwright.sync_api import sync_playwright
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n), full_page=False), print("saved", n))
with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1440, "height": 1000}, accept_downloads=True)
    pg.on("pageerror", lambda e: print("pageerror:", e))
    pg.on("dialog", lambda d: (print("dialog:", d.message), d.dismiss()))
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    pg.fill("#treeSearch", "Cards"); pg.wait_for_timeout(300)
    pg.locator("#tree .node", has_text="Cards").last.click(); pg.wait_for_selector("#g_c tr[data-i='0']")
    pg.click("#m1 summary"); pg.click("[data-mi=newcards]"); pg.wait_for_selector("#nc_grid tbody tr[data-id]")
    n = pg.locator("#nc_grid tbody tr[data-id]").count()
    pg.click("#nc_search"); pg.wait_for_selector("#nc_p4")
    pg.click("#nc_del"); pg.wait_for_timeout(300)                     # dismissed: Refresh only
    assert pg.locator("#nc_grid tbody tr[data-id]").count() == n
    with pg.expect_download() as dl:
        pg.click("#nc_xls")
    print("excel", dl.value.suggested_filename, "rows", n)
    pg.click("#nc_search"); pg.click("#nc_search"); pg.wait_for_selector("#nc_p4")
    shot(pg, "179-cards-newcards.png")
    b.close()

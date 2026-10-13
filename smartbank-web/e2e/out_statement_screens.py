"""Off-balance account statement (Packages/Out_Statement) E2E + screenshots (mock mode)."""
import os, sys
from playwright.sync_api import sync_playwright
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n), full_page=True), print("saved", n))
with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1440, "height": 900}, accept_downloads=True)
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    pg.fill("#treeSearch", "Account Statement"); pg.wait_for_timeout(300)
    pg.locator("#tree .node[data-path='8.6']").click(); pg.wait_for_selector("#b_ok")
    pg.fill("#sb", "2026-10-06"); pg.fill("#se", "2026-10-09"); pg.click("#b_ok")
    pg.wait_for_selector("#sres .rephead"); pg.wait_for_timeout(300); shot(pg, "81-out-statement-preview.png")
    pg.select_option("#so", "3"); pg.click("#b_ok"); pg.wait_for_selector("#sm tbody tr")
    pg.locator("#sm tbody tr[data-i='2']").click(); pg.wait_for_timeout(300); shot(pg, "82-out-statement-documents.png")
    pg.select_option("#so", "2")
    with pg.expect_download() as d:
        pg.click("#b_ok")
    print("download", d.value.suggested_filename)
    b.close()

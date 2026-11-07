"""E2E: Payments 'Köçürmələr' (Packages/Payments) - screenshots 366-368 (mock mode)."""
import os, sys, re
from playwright.sync_api import sync_playwright
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n)), print("saved", n))


with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1600, "height": 960})
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    loc = pg.locator("#tree .node").filter(has=pg.locator(".cap", has_text=re.compile("^Transfers$")))
    if not loc.last.is_visible():
        pg.locator("#tree .node", has_text="Payments").first.click(); pg.wait_for_timeout(200)
    loc.last.click(); pg.wait_for_selector("#pGrid tbody tr")
    assert pg.locator("#pGrid tbody tr").count() == 9
    shot(pg, "366-payments.png")
    pg.uncheck("#pCHECKAZIPS"); pg.uncheck("#pCheckBox8"); pg.wait_for_timeout(200)
    n = pg.locator("#pGrid tbody tr").count(); assert n == 6, n          # filter on: AZIPS (2, 9), foreign (8) hidden
    pg.fill("#searchGONDEREN_NAME", "kən"); pg.wait_for_timeout(200)
    shot(pg, "367-payments-filter-search.png")
    pg.check("#pCB1"); pg.select_option("#pFil", "1"); pg.wait_for_timeout(500)
    pg.locator("#pGrid tbody tr").first.dblclick(); pg.wait_for_selector(".toast")
    shot(pg, "368-payments-filial-doc-onhold.png")
    b.close()

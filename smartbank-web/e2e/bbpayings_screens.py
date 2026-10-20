"""E2E: BB payings (Packages/BBPayings) - screenshots 372-374 (mock mode)."""
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
    loc = pg.locator("#tree .node").filter(has=pg.locator(".cap", has_text=re.compile("^BB payings$")))
    if not loc.last.is_visible():
        pg.locator("#tree .node", has_text="Payments").first.click(); pg.wait_for_timeout(200)
    loc.last.click(); pg.wait_for_selector("#bGrid tbody tr")
    assert pg.locator("#bGrid tbody tr").count() == 3
    shot(pg, "372-bbpayings.png")
    pg.click("#bFP"); pg.fill("#bSt", "2026-10-01"); pg.fill("#bEnd", "2026-10-13"); pg.uncheck("#bChC"); pg.click("#bRef"); pg.wait_for_timeout(500)
    assert pg.locator("#bGrid tbody tr").count() == 3        # status 0 only: 102, 103, 105
    shot(pg, "373-bbpayings-filter.png")
    pg.locator("#bGrid tbody tr").first.dblclick(); pg.wait_for_selector("#dCon")
    shot(pg, "374-bbpayings-edit.png")
    b.close()

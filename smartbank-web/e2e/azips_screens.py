"""AZIPS (Packages/SWIFT_MANAGER_IBAN_NEW) part 1 E2E + screenshots (mock mode)."""
import os, sys
from playwright.sync_api import sync_playwright
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n), full_page=True), print("saved", n))
with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1440, "height": 900})
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    pg.fill("#treeSearch", "AZIPS"); pg.wait_for_timeout(300)
    pg.locator("#tree .node[data-path='9.0']").click(); pg.wait_for_selector("#g_out3 tr[data-i='1']")
    assert "254951.5 AZN" in pg.input_value("#z_s1")      # status-1 rows of the mock (incl. parts 2b/3 rows)
    shot(pg, "101-azips-out.png")
    pg.click(".tabs button[data-tab=in]"); pg.wait_for_selector("#g_in tr[data-i='1']")
    pg.click("#g_in th[data-s=VALU]"); pg.wait_for_timeout(400)
    shot(pg, "102-azips-in.png")
    pg.click("#z_arxin"); pg.wait_for_selector("#a1")
    pg.fill("#a1", "2026-10-01"); pg.click("#ago"); pg.wait_for_selector("#g_arch tr[data-i='1']")
    shot(pg, "103-azips-archive-in.png")
    pg.click("#ax"); pg.click(".tabs button[data-tab=out]"); pg.click("#z_arxout"); pg.wait_for_selector("#ao option", state="attached")
    pg.fill("#a1", "2026-10-01"); pg.click("#ago"); pg.wait_for_selector("#g_arch tr[data-i='1']")
    shot(pg, "104-azips-archive-out.png")
    b.close()

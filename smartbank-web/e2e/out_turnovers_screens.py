"""Off-balance turnovers for period (Packages/Out_turn_over_for_period) E2E + screenshots (mock mode)."""
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
    pg.fill("#treeSearch", "Turnovers for Period"); pg.wait_for_timeout(300)
    pg.locator("#tree .node[data-path='8.5']").click(); pg.wait_for_selector("#b_run")
    pg.fill("#tb", "2026-10-06"); pg.fill("#te", "2026-10-09"); pg.check("#tn"); pg.click("#b_run")
    pg.wait_for_selector("#tres table tbody tr"); pg.wait_for_timeout(300); shot(pg, "79-out-turnovers-report.png")
    pg.select_option("#tr", "export"); pg.click("#b_run"); pg.wait_for_timeout(600); shot(pg, "80-out-turnovers-export.png")
    b.close()

"""Off-balance control tape (Packages/Out_control_tape) E2E + screenshots (mock mode)."""
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
    pg.fill("#treeSearch", "Control Tape"); pg.wait_for_timeout(300)
    pg.locator("#tree .node[data-path='8.4']").click(); pg.wait_for_selector("#b_refresh")
    pg.fill("#cd", "2026-10-09"); pg.click("#b_refresh"); pg.wait_for_selector("#cres table tbody tr"); pg.wait_for_timeout(300)
    shot(pg, "76-out-control-tape.png")
    pg.click("#b_print"); pg.wait_for_selector("#cres tr.grouphead"); pg.wait_for_timeout(300); shot(pg, "77-out-control-tape-print.png")
    pg.click("#b_report"); pg.wait_for_timeout(600); shot(pg, "78-out-control-tape-report.png")
    b.close()

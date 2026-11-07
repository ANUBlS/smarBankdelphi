"""Off-balance group (Out_transaction_manager, Out_Balance, Out_todaybalance, Out_BalanceAnalys) E2E + screenshots (mock mode)."""
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
    def open_(item, path):
        pg.fill("#treeSearch", ""); pg.wait_for_timeout(150)
        pg.fill("#treeSearch", item); pg.wait_for_timeout(300)
        pg.locator(f"#tree .node[data-path='{path}']").click(); pg.wait_for_timeout(700)
    pg.fill("#treeSearch", "Off-balance"); pg.wait_for_timeout(300); shot(pg, "70-offbalance-tree.png")
    open_("Off-balance Transactions", "8.0"); pg.wait_for_selector("table tbody tr"); pg.wait_for_timeout(400); shot(pg, "71-out-transactions.png")
    open_("Off-balance Balance", "8.1"); pg.wait_for_selector("#bshow")
    pg.fill("#bb", "2026-10-05"); pg.fill("#be", "2026-10-09"); pg.click("#bshow"); pg.wait_for_selector("#bres table tbody tr"); shot(pg, "72-out-balance.png")
    open_("Off-balance Today", "8.2"); pg.wait_for_selector("#tshow")
    pg.click("#tshow"); pg.wait_for_selector("#bres table tbody tr"); shot(pg, "73-out-today-balance.png")
    pg.click("#tchk"); pg.wait_for_selector("#tca table"); pg.wait_for_timeout(400); shot(pg, "74-out-today-checking.png")
    open_("Off-balance Balance Analysis", "8.3"); pg.wait_for_selector("#arun")
    pg.fill("#ab", "2026-10-05"); pg.fill("#ae", "2026-10-09"); pg.click("#arun"); pg.wait_for_selector("#ag5 table"); pg.wait_for_timeout(500)
    shot(pg, "75-out-balance-analysis.png")
    b.close()

"""Balance group (Packages/Balance, DBDBalance, TodayBalance, BalanceAnalys, AccBalanceCheck) E2E + screenshots (mock mode, fresh API)."""
import os, sys
from playwright.sync_api import sync_playwright, expect
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n), full_page=True), print("saved", n))
with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1440, "height": 900}, accept_downloads=True)
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    def open_(section, item, path):
        pg.fill("#treeSearch", ""); pg.wait_for_timeout(150)
        pg.fill("#treeSearch", item); pg.wait_for_timeout(300)
        pg.locator(f"#tree .node[data-path='{path}']").click(); pg.wait_for_timeout(500)
    # Balance
    open_("Accounts", "Balance", "1.2"); pg.wait_for_selector("#bshow")
    pg.fill("#bb", "2026-10-05"); pg.fill("#be", "2026-10-09"); pg.click("#bshow"); pg.wait_for_selector("#bres table tbody tr")
    shot(pg, "60-balance-rests.png")
    pg.select_option("#br", "4"); pg.click("#bshow"); pg.wait_for_selector("#bres tr.grouphead"); shot(pg, "61-balance-international.png")
    with pg.expect_download() as d: pg.click("#bpdf")
    assert d.value.suggested_filename == "balance.pdf"
    with pg.expect_download() as d: pg.click("#bxls")
    pg.click("#bcomp"); pg.wait_for_selector("#bres tr.grouphead"); shot(pg, "62-balance-comparative.png")
    pg.locator(".checklist[data-name=br] input").first.uncheck(); pg.locator(".checklist[data-name=br] input").last.uncheck()
    pg.click("#bshow"); pg.wait_for_selector("#berr .alert"); shot(pg, "63-balance-validation.png")
    # Day-by-day
    open_("Balance reports", "Day-by-day", "7.0"); pg.wait_for_selector("#dshow")
    pg.fill("#db", "2026-10-05"); pg.fill("#de", "2026-10-09")
    pg.locator(".checklist[data-name=sym] input").first.check()
    for i in pg.locator(".checklist[data-name=val] input").all(): i.check()
    pg.check("#dout"); pg.click("#dshow"); pg.wait_for_selector("#bres table tbody tr"); pg.wait_for_timeout(300); shot(pg, "64-dbd-balance.png")
    # Today
    open_("Balance reports", "Today balance", "7.1"); pg.wait_for_selector("#tshow")
    pg.click("#tshow"); pg.wait_for_selector("#bres table tbody tr"); shot(pg, "65-today-balance.png")
    pg.click("#tchk"); pg.wait_for_selector("#tca table"); pg.wait_for_timeout(400); shot(pg, "66-today-checking.png")
    # Analysis
    open_("Balance reports", "Balance analysis", "7.2"); pg.wait_for_selector("#arun")
    pg.fill("#ab", "2026-10-05"); pg.fill("#ae", "2026-10-09"); pg.click("#arun"); pg.wait_for_selector("#ag5 table"); pg.wait_for_timeout(500)
    shot(pg, "67-balance-analysis.png")
    # Account balance check
    open_("Balance reports", "Account balance check", "7.3"); pg.wait_for_selector("#bres table tbody tr[data-i]")
    pg.locator("#bres tr[data-i]").nth(4).click(); pg.click("#cchk"); pg.wait_for_selector(".badge.red"); shot(pg, "68-accbalancecheck-error.png")
    pg.locator("#bres tr[data-i]").nth(4).click(); pg.click("#ccor"); pg.wait_for_timeout(400)
    expect(pg.locator(".badge.red")).to_have_count(0); shot(pg, "69-accbalancecheck-corrected.png")
    b.close()

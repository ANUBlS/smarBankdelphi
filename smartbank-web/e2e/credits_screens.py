"""Credits manager (Packages/SB_Credit) E2E + screenshots (mock mode, fresh API process)."""
import os, sys
from playwright.sync_api import sync_playwright, expect
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n)), print("saved", n))
with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1440, "height": 900})
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "TELLER"); pg.fill("#p", "Teller#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    pg.locator("#tree .node", has_text="Deposits").first.click()
    pg.locator("#tree .node", has_text="Credits").last.click()
    pg.wait_for_selector("#crGrid tbody tr[data-id]"); pg.wait_for_timeout(300)
    expect(pg.locator("#crGrid tbody tr[data-id]")).to_have_count(8); shot(pg, "50-credits-main.png")
    pg.select_option("#fcur", "840"); pg.wait_for_timeout(400)
    expect(pg.locator("#crGrid tbody tr[data-id]")).to_have_count(2); shot(pg, "51-credits-filter.png")
    pg.select_option("#fcur", ""); pg.wait_for_timeout(400)
    pg.locator("#crGrid tr[data-id='7003']").dblclick(); pg.wait_for_selector("#cf"); pg.wait_for_timeout(300); shot(pg, "52-credits-card.png"); pg.click("#cx")
    pg.click("#bnew"); pg.wait_for_selector("#csave"); pg.click("#csave"); pg.wait_for_selector("#cerr .alert"); shot(pg, "53-credits-validation.png"); pg.click("#cx")
    pg.locator("#crGrid tr[data-id='7001']").click(); pg.click("#bsch"); pg.wait_for_selector("#sgen"); pg.click("#sgen"); pg.wait_for_timeout(600)
    expect(pg.locator("#sg tbody tr")).to_have_count(12); shot(pg, "54-credits-schedule.png"); pg.click("#sclose"); pg.wait_for_timeout(300)
    pg.click("#brep"); pg.wait_for_selector("#rshow"); pg.select_option("#rk", "interest"); pg.click("#rshow"); pg.wait_for_timeout(600); shot(pg, "55-credits-reports.png")
    b.close()

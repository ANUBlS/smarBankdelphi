"""Deposits: NewDepositsContract form (new / edit / view) E2E + screenshots 250-253 (mock mode, fresh API)."""
import os, sys
from playwright.sync_api import sync_playwright, expect
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n)), print("saved", n))


def login(pg, u="ADMIN", p="Admin#2026"):
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", u); pg.fill("#p", p); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    pg.locator("#tree .node", has_text="Deposits").first.click(); pg.wait_for_timeout(200)
    pg.locator("#tree .node", has_text="Deposits").last.click(); pg.wait_for_selector("#dGrid tbody tr[data-id]")


with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1440, "height": 1000})
    pg.on("dialog", lambda d: d.accept())
    login(pg)
    pg.click("#dNew"); pg.wait_for_selector("#dcCustNo")
    pg.click("#dcSave"); pg.wait_for_selector("#dcHint"); shot(pg, "250-deposits-contract-new-empty.png")
    pg.fill("#dcCustNo", "30001"); pg.wait_for_timeout(800)
    pg.select_option("#dcCur", "944"); pg.wait_for_timeout(400)
    pg.select_option("#dcType", "1"); pg.wait_for_timeout(400)
    pg.fill("#dcAmount", "60000")
    pg.select_option("#dcPeriod", "11"); pg.wait_for_timeout(400)
    pg.select_option("#dcCap", "111"); pg.wait_for_timeout(500)
    expect(pg.locator("[data-panel='ContractNumPanel'] input")).to_have_value("DM1-101-0006")
    shot(pg, "251-deposits-contract-new-filled.png")
    pg.click("#dcSave"); pg.wait_for_timeout(700); pg.click("#dcClose"); pg.wait_for_timeout(700)
    expect(pg.locator("#dGrid tr[data-id='6001']")).to_have_count(1)
    pg.locator("#dGrid tr[data-id='5001']").click(); pg.click("#dEdit"); pg.wait_for_selector("#dcSave")
    shot(pg, "252-deposits-contract-edit.png")
    pg.click("#dcCredits"); pg.wait_for_selector("#crX"); shot(pg, "253-deposits-contract-credits.png"); pg.click("#crX")
    pg.click("#dcClose"); pg.wait_for_timeout(300)
    pg.locator("#dGrid tr[data-id='5001']").dblclick(); pg.wait_for_selector("#dcClose")
    expect(pg.locator("#dcSave")).to_have_count(0); pg.click("#dcClose")
    # DEPOSITOR: module opens, Redaktə is denied
    pg.context.clear_cookies(); pg2 = b.new_page(viewport={"width": 1440, "height": 900}); pg2.on("dialog", lambda d: d.accept())
    login(pg2, "DEPOSITOR", "Depositor#2026")
    pg2.locator("#dGrid tr[data-id='5001']").click(); pg2.click("#dEdit"); pg2.wait_for_selector(".toast")
    shot(pg2, "254-deposits-contract-edit-denied.png")
    b.close()

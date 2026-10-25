"""SBDM_PartialPayment_new E2E + screenshots 278-279 (mock mode, fresh API process)."""
import os, sys
from playwright.sync_api import sync_playwright, expect
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n)), print("saved", n))


def login(b, u, p):
    pg = b.new_page(viewport={"width": 1440, "height": 900})
    pg.on("dialog", lambda d: d.accept())
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", u); pg.fill("#p", p); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    pg.locator("#tree .node", has_text="Deposits").first.click(); pg.wait_for_timeout(200)
    pg.locator("#tree .node", has_text="Deposits").last.click()
    pg.wait_for_selector("#dGrid tbody tr[data-id]"); pg.wait_for_timeout(300)
    return pg


with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = login(b, "ADMIN", "Admin#2026")
    pg.locator("#dGrid tr[data-id='5001']").click(); pg.click("#dOps"); pg.wait_for_timeout(200)
    pg.locator(".ctx-menu >> text=" + pg.evaluate("SB.t('deposits.m_partial')")).first.click()
    pg.wait_for_selector(".opBody tr[data-id]"); pg.wait_for_timeout(300); shot(pg, "278-deposits-partial-list.png")
    pg.click(".opBody [data-a='new']"); pg.wait_for_selector("#ppMain"); pg.fill("#ppMain", "500")
    expect(pg.locator("#ppOk")).to_be_enabled(); shot(pg, "279-deposits-partial-add.png")
    b.close()

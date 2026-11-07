"""SBDM_ApplyMoney_new / SBDM_ExtractMoney_new + TrDelayed_Show E2E + screenshots 263-269 (mock mode, fresh API process)."""
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
    pg.locator("#dGrid tr[data-id='5001']").click(); pg.keyboard.press("Control+d"); pg.wait_for_selector(".opBody tr[data-id]"); pg.wait_for_timeout(300)
    shot(pg, "263-deposits-apply-list.png")
    pg.click(".opBody [data-a='new']"); pg.wait_for_selector("#amSum"); expect(pg.locator("#amPct")).to_have_value("9")
    pg.fill("#amSum", "1500"); shot(pg, "264-deposits-apply-add.png")
    pg.click("#amOk"); pg.wait_for_selector("#ttOk"); pg.wait_for_timeout(300); shot(pg, "265-deposits-apply-delayed.png")
    pg.click("#ttOk"); pg.wait_for_timeout(700)
    expect(pg.locator(".opBody tr[data-id]")).to_have_count(2)
    pg.click(".opBody [data-a='exit']"); pg.wait_for_timeout(700)
    pg.locator("#dGrid tr[data-id='5004']").click(); pg.keyboard.press("Control+d"); pg.wait_for_selector(".opBody")
    pg.click(".opBody [data-a='new']"); pg.wait_for_selector("#amSum"); pg.fill("#amSum", "100"); pg.click("#amOk")
    pg.wait_for_selector("#amErr .alert"); expect(pg.locator("#amErr")).to_contain_text("first deposit amount"); shot(pg, "266-deposits-apply-check.png")
    pg.keyboard.press("Escape"); pg.wait_for_timeout(200); pg.keyboard.press("Escape"); pg.wait_for_timeout(300)
    pg.locator("#dGrid tr[data-id='5001']").click(); pg.keyboard.press("Control+m"); pg.wait_for_selector(".opBody tr[data-id]"); pg.wait_for_timeout(300)
    shot(pg, "267-deposits-extract-list.png")
    pg.click(".opBody [data-a='new']"); pg.wait_for_selector("#emInt"); pg.select_option("#emAcc", "100101"); pg.fill("#emInt", "10")
    shot(pg, "268-deposits-extract-add.png")
    pg.click("#emOk"); pg.wait_for_selector("#ttOk"); pg.wait_for_timeout(300); shot(pg, "269-deposits-extract-delayed.png")
    pg.click("#ttNo"); pg.wait_for_timeout(600)                     # confirm() accepted -> CommitWithDrawMoney(False)
    expect(pg.locator(".opBody tr[data-id]")).to_have_count(1)
    b.close()

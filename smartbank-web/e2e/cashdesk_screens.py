"""CashDeskLast / CashSymbols E2E + screenshots 295-303 (mock mode, fresh API process)."""
import os, sys
from playwright.sync_api import sync_playwright, expect
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n)), print("saved", n))


def open_node(pg, name):
    if not pg.locator("#tree .node", has_text=name).last.is_visible():
        pg.locator("#tree .node", has_text="Transactions").first.click(); pg.wait_for_timeout(200)
    pg.locator("#tree .node", has_text=name).last.click(); pg.wait_for_timeout(500)


with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1600, "height": 960})
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    open_node(pg, "Cash desk"); pg.wait_for_selector("#cRefresh")
    shot(pg, "295-cashdesk-empty.png")
    pg.click("#cRefresh"); pg.wait_for_selector("#cGrid tr[data-i]")
    expect(pg.locator("#cGrid tr[data-i]")).to_have_count(8)
    shot(pg, "296-cashdesk-refreshed.png")
    pg.locator("#cGrid th[data-c='LAMMOUNT']").click(); pg.wait_for_timeout(500)       # title click -> p_orderby
    pg.fill("#l_DEBITACC", "1001"); pg.wait_for_timeout(200)                          # quick search (Locate)
    pg.locator("#cGrid tr[data-i='2']").click(); pg.wait_for_timeout(200)
    pg.select_option("#cBSym", "42"); pg.click("#cBSymGo"); pg.wait_for_selector(".modal")
    shot(pg, "297-cashdesk-symbol-confirm.png")
    pg.click(".modal #y"); pg.wait_for_timeout(600)
    pg.locator("#cGrid tr.sel").click(button="right"); pg.wait_for_selector(".ctx-menu")
    shot(pg, "298-cashdesk-popup.png")
    pg.keyboard.press("Escape"); pg.mouse.click(5, 5); pg.wait_for_timeout(200)
    pg.click("#cIncome"); pg.wait_for_timeout(300)
    shot(pg, "299-cashdesk-print-on-hold.png")
    # Əlavə on a row with CashInfo (9104)
    idx = pg.evaluate("[...document.querySelectorAll('#cGrid tr[data-i]')].findIndex(tr => tr.children[1].textContent === '9104')")
    pg.locator(f"#cGrid tr[data-i='{idx}']").click(); pg.click("#cExtra"); pg.wait_for_selector(".modal #iUpd")
    assert pg.is_disabled(".modal #iIns") and not pg.is_disabled(".modal #iUpd")
    shot(pg, "300-cashdesk-extra-info.png")
    pg.click(".modal #iClose"); pg.wait_for_timeout(200)
    pg.click("#cSett"); pg.wait_for_selector(".modal #sOk")
    shot(pg, "301-cashdesk-settings.png")
    pg.click(".modal #sCancel"); pg.wait_for_timeout(200)
    # Planlaşdırılmış view
    pg.fill("#cBeg", "2026-10-01"); pg.locator("input[name=cTT][value='2']").check(); pg.click("#cRefresh"); pg.wait_for_timeout(600)
    expect(pg.locator("#cGrid tr[data-i]")).to_have_count(2)
    shot(pg, "302-cashdesk-planned.png")
    open_node(pg, "Cash symbols"); pg.wait_for_selector("#yGrid tr[data-i]")
    pg.locator("#yGrid tr[data-i='3']").click(button="right"); pg.wait_for_selector(".ctx-menu")
    pg.locator(".ctx-menu >> text=Update").click(); pg.wait_for_timeout(200)
    shot(pg, "303-cashsymbols.png")
    b.close()

"""Exchange (Packages/Exchange) E2E + screenshots 304-311 (mock mode, fresh API process)."""
import os, sys
from playwright.sync_api import sync_playwright, expect
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n)), print("saved", n))

with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1600, "height": 960})
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    if not pg.locator("#tree .node", has_text="Exchange").last.is_visible():
        pg.locator("#tree .node", has_text="Transactions").first.click(); pg.wait_for_timeout(200)
    pg.locator("#tree .node", has_text="Exchange").last.click(); pg.wait_for_selector("#xG1 tr[data-i]")
    expect(pg.locator("#xG2 tr[data-i]")).to_have_count(3)
    shot(pg, "304-exchange-info.png")
    pg.locator("#xG1 tr[data-i='1']").click(); expect(pg.locator("#xG2 tr[data-i]")).to_have_count(2)
    pg.click("#xEdit"); pg.wait_for_selector(".modal #e1")
    assert pg.input_value(".modal #e2") == "Gəncə VDM"
    shot(pg, "305-exchange-vdm-dialog.png")
    pg.click(".modal #eCancel"); pg.wait_for_timeout(200)
    pg.click("#aNew"); pg.wait_for_selector(".modal #a1")
    pg.select_option(".modal #a1", "2"); pg.wait_for_timeout(400)
    shot(pg, "306-exchange-account-dialog.png")
    pg.click(".modal #aOk"); pg.wait_for_timeout(500)
    expect(pg.locator("#xG2 tr[data-i]")).to_have_count(3)
    pg.locator("[data-tab='1']").click()
    pg.fill("#vBeg", "2026-10-08"); pg.click("#vRefresh"); pg.wait_for_selector("#vGrid tr[data-i]")
    expect(pg.locator("#vGrid tr[data-i]")).to_have_count(9)
    shot(pg, "307-exchange-vdm.png")
    pg.locator("#vGrid tr[data-i='2']").click(button="right"); pg.wait_for_selector(".ctx-menu")
    shot(pg, "308-exchange-vdm-popup.png")
    pg.keyboard.press("Escape"); pg.mouse.click(5, 5); pg.wait_for_timeout(200)
    pg.keyboard.press("F4"); pg.wait_for_selector(".modal #pXls")
    shot(pg, "309-exchange-print-dialog.png")
    with pg.expect_download() as d:
        pg.click(".modal #pXls")
    assert d.value.suggested_filename == "TotalExchange.xlsx"
    pg.click(".modal #pCancel"); pg.wait_for_timeout(200)
    with pg.expect_download() as d:
        pg.click("#vFile")
    assert d.value.suggested_filename == "EXCH122.dbf"
    pg.click("#vSett"); pg.wait_for_selector(".modal #t1")
    assert pg.input_value(".modal #t1") == "1001"
    shot(pg, "310-exchange-settings.png")
    pg.click(".modal #t1"); pg.keyboard.press("Escape"); pg.wait_for_timeout(200)
    pg.locator("[data-tab='2']").click()
    pg.fill("#cBeg", "2026-10-01"); pg.click("#cRefresh"); pg.wait_for_selector("#cGrid tr[data-i]")
    expect(pg.locator("#cGrid tr[data-i]")).to_have_count(3)
    pg.locator("#cGrid tr[data-i='1']").click(); pg.wait_for_timeout(200)
    assert pg.input_value("#cAssign") == "İdxal əməliyyatları üzrə ödənişlər"
    shot(pg, "311-exchange-convert.png")
    with pg.expect_download() as d:
        pg.click("#cXlsBuy")
    assert d.value.suggested_filename == "List1_BUY.xlsx"
    b.close()

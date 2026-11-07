"""Currency Position (Packages/CurrencyPosition) E2E + screenshots 312-318 (mock mode, fresh API process)."""
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
    if not pg.locator("#tree .node", has_text="Currency position").last.is_visible():
        pg.locator("#tree .node", has_text="Transactions").first.click(); pg.wait_for_timeout(200)
    pg.locator("#tree .node", has_text="Currency position").last.click(); pg.wait_for_selector("#bRun")
    assert pg.is_disabled("#bCheck")
    pg.click("#bRefresh"); pg.wait_for_timeout(300)                       # 'No  Records  in  DataSet!'
    shot(pg, "312-cp-empty.png")
    pg.fill("#pBeg", "2026-10-01"); pg.dispatch_event("#pBeg", "change")
    pg.click("#bRun"); pg.wait_for_selector("#pGrid tr[data-i]")
    assert pg.is_disabled("#bRun") and not pg.is_disabled("#bCheck")
    expect(pg.locator("#sDate option")).to_have_count(4)
    shot(pg, "313-cp-positions.png")
    pg.select_option("#sDate", "1"); pg.select_option("#sCur", "1"); pg.click("#bRefresh")
    expect(pg.locator("#pGrid tr[data-i]")).to_have_count(4)
    shot(pg, "314-cp-filtered.png")
    pg.click("#bFile"); pg.wait_for_selector(".modal #ib")
    assert pg.input_value(".modal #ib") == "51830000,25"
    shot(pg, "315-cp-capital-inputbox.png")
    pg.click(".modal #ibOk"); pg.wait_for_selector(".modal #ib"); pg.click(".modal #ibCancel"); pg.wait_for_selector(".modal #ib")
    with pg.expect_download() as d:
        pg.click(".modal #ibOk")
    assert d.value.suggested_filename == "Balansb.dbf"
    pg.wait_for_timeout(500); assert pg.input_value("#sDate") == "-1"
    pg.click("#bTuning"); pg.wait_for_selector(".modal #tBank")
    assert pg.input_value(".modal #tBank") == "SmartBank ASC"
    pg.check(".modal #tAuto"); pg.wait_for_timeout(400)
    assert pg.input_value(".modal #tCap") == "51830000,25" and not pg.is_disabled(".modal #tCommit")
    shot(pg, "316-cp-tuning.png")
    pg.click(".modal #tClose"); pg.wait_for_timeout(200)
    pg.click("#bCheck"); pg.wait_for_selector(".modal #kCap")
    pg.select_option(".modal #kDate", "1"); pg.wait_for_timeout(400)
    assert pg.input_value(".modal #kCap") == "51904500,5"
    pg.click(".modal #kCreate"); pg.wait_for_selector(".modal #kGrid tr[data-i]")
    expect(pg.locator(".modal #kGrid tr[data-i]")).to_have_count(3)
    shot(pg, "317-cp-checking.png")
    inp = pg.locator(".modal #kGrid tr[data-i='0'] input[data-f='actives']")
    inp.fill("8000000"); inp.dispatch_event("change"); pg.wait_for_timeout(300)
    expect(pg.locator(".modal #kLabel")).to_have_text("CƏRİMƏ !")
    shot(pg, "318-cp-checking-whatif.png")
    b.close()

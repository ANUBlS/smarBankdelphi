"""Currency Position 'Kapital' (TfrmCapital, UntCapital.pas) E2E + screenshots 319-324 (mock mode, fresh API process)."""
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
    pg.click("#bCapital"); pg.wait_for_selector(".modal #gFirst")
    expect(pg.locator(".modal #gFirst tr[data-i]")).to_have_count(3)             # TYPE='I', OP_TYPE=1, BAL_TYPE=1
    pg.fill(".modal [data-ed='bal']", "3031"); pg.click(".modal #bAdd1"); pg.wait_for_timeout(400)
    expect(pg.locator(".modal #gFirst tr[data-i]")).to_have_count(4)
    se = pg.locator(".modal [data-se='acc']"); se.click(); se.press_sequentially("az12smrt3041", delay=20)
    pg.wait_for_timeout(200)
    assert se.input_value() == "AZ12SMRT30410000000000000702"                    # Locate partial + SetSelectedText
    shot(pg, "319-cp-capital-first.png")
    pg.click(".modal button[data-ts='optype'][data-i='1']"); pg.wait_for_timeout(200)
    expect(pg.locator(".modal #gFirst tr[data-i]")).to_have_count(1)             # OP_TYPE=2
    pg.select_option(".modal #cMain", "2"); pg.wait_for_selector(".modal #bConnect")
    pg.click(".modal #bConnect"); pg.wait_for_timeout(300)
    assert not pg.is_disabled(".modal [data-ed='outbal']")
    expect(pg.locator(".modal #gOut tr[data-i]")).to_have_count(1)
    pg.select_option(".modal select[data-cb='outacc']", "1"); pg.fill(".modal [data-ed='outpercent']", "40")
    pg.click(".modal #bAdd8"); pg.wait_for_timeout(400)
    expect(pg.locator(".modal #gOut tr[data-i]")).to_have_count(2)
    shot(pg, "320-cp-capital-offbalance.png")
    pg.click(".modal button[data-rp='0']"); pg.wait_for_selector(".modal #gRisk")
    expect(pg.locator(".modal #gRisk tr[data-i]")).to_have_count(2)
    pg.click(".modal #gRisk th[data-ord='PERCENT']"); pg.wait_for_timeout(300)
    shot(pg, "321-cp-capital-risk.png")
    pg.select_option(".modal #cMain", "3"); pg.wait_for_selector(".modal #bCalc")
    pg.click(".modal #bCalc"); pg.wait_for_timeout(400)
    assert pg.input_value(".modal #m_firstcap") == "48250000,5"
    assert pg.input_value(".modal #cFormula") == "X+Y-Z"
    shot(pg, "322-cp-capital-calc.png")
    pg.select_option(".modal #cMain", "4"); pg.wait_for_selector(".modal #gAdi")
    pg.select_option(".modal select[data-bc='baleh']", "1991"); pg.click(".modal #bAdd10"); pg.wait_for_timeout(400)
    expect(pg.locator(".modal #gAdi tr[data-i]")).to_have_count(2)
    shot(pg, "323-cp-capital-reserves.png")
    pg.select_option(".modal #cMain", "6"); pg.wait_for_selector(".modal #gPm")
    pg.click(".modal button[data-mp='0']"); pg.wait_for_selector(".modal #gAm")
    pg.fill(".modal [data-ed='ametal']", "1052"); pg.click(".modal #bAdd14"); pg.wait_for_timeout(400)
    expect(pg.locator(".modal #gAm tr[data-i]")).to_have_count(2)
    shot(pg, "324-cp-capital-metals.png")
    pg.click(".modal #cX"); pg.wait_for_timeout(200)
    pg.click("#bCapital"); pg.wait_for_selector(".modal #gAm")                     # form kept (Assigned(frmCapital))
    b.close()

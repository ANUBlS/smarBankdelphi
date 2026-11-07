"""Exchange Manager chunk 1 (Packages/ExchangeMGR-NBC) E2E + screenshots 325-330 (mock mode, fresh API process)."""
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
    if not pg.locator("#tree .node", has_text="Exchange manager").last.is_visible():
        pg.locator("#tree .node", has_text="Transactions").first.click(); pg.wait_for_timeout(200)
    pg.locator("#tree .node", has_text="Exchange manager").last.click(); pg.wait_for_selector("#gMaster")
    expect(pg.locator("#gMaster tr[data-i]")).to_have_count(3)
    shot(pg, "325-em-offices.png")
    pg.click("[data-tab='2']"); pg.wait_for_selector("#gTrans")
    expect(pg.locator("#gTrans tr[data-i]")).to_have_count(3)
    pg.check("input[name=emF][value='0']"); expect(pg.locator("#gTrans tr[data-i]")).to_have_count(2)
    shot(pg, "326-em-operations.png")
    pg.click("[data-tab='0']"); pg.click("#gMaster tr[data-i='1']"); pg.wait_for_timeout(300)
    pg.click("[data-tab='1']"); pg.wait_for_selector("#gResurs")
    expect(pg.locator("#gResurs tr[data-i]")).to_have_count(1)
    shot(pg, "327-em-resources.png")
    pg.click("[data-tab='3']"); pg.wait_for_selector("#gRate tr[data-i]")
    shot(pg, "328-em-rates.png")
    pg.click("[data-tab='4']"); pg.wait_for_selector("#gRFilial")
    pg.select_option("#fKey", "1"); pg.wait_for_timeout(300)
    expect(pg.locator("#gRFilial tr[data-i]")).to_have_count(3)
    shot(pg, "329-em-rates-branch.png")
    pg.click("[data-tab='5']"); pg.wait_for_selector("#gRemain tr[data-i]")
    expect(pg.locator("#gRemain tr[data-i]")).to_have_count(1)                  # office 2
    shot(pg, "330-em-remainders.png")
    b.close()

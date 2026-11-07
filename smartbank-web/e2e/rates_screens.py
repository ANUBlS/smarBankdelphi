"""LastRates / RateDifference / RateDifferenceReport E2E + screenshots 351-357 (mock mode)."""
import os, sys, re
from playwright.sync_api import sync_playwright, expect
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n)), print("saved", n))


def node(pg, text):
    loc = pg.locator("#tree .node").filter(has=pg.locator(".cap", has_text=re.compile("^" + re.escape(text) + "$")))
    if not loc.last.is_visible():
        pg.locator("#tree .node", has_text="Transactions").first.click(); pg.wait_for_timeout(200)
    loc.last.click()


with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1600, "height": 960}, accept_downloads=True)
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    # Old rates
    node(pg, "Old rates"); pg.wait_for_selector("#oGrid tr[data-i]")
    expect(pg.locator("#oGrid tr[data-i]")).to_have_count(5)
    shot(pg, "351-oldrates.png")
    pg.fill("#oBeg", "2026-10-06"); pg.locator("#oBeg").dispatch_event("change")
    expect(pg.locator("#oGrid tr[data-i]")).to_have_count(25)
    pg.locator("#oGrid th[data-f='OSTAT']").click(); pg.wait_for_timeout(400)
    pg.fill("#oKod", "97"); pg.wait_for_timeout(200)
    assert "978" in pg.locator("#oGrid tr.sel").inner_text()
    shot(pg, "352-oldrates-period-search.png")
    with pg.expect_download() as d:
        pg.click("#oXls")
    assert d.value.suggested_filename == "Valyuta_mezenneleri.xlsx"
    # Rate difference
    node(pg, "Rate difference"); pg.wait_for_selector("#rdNav")
    assert pg.locator("#rdNav button:disabled").count() == 10
    shot(pg, "353-ratedifference.png")
    # Rate difference report
    node(pg, "Rate difference report"); pg.wait_for_selector("#rRefresh")
    assert pg.locator("#rReport").is_disabled()
    shot(pg, "354-rdr-empty.png")
    pg.fill("#rBeg", "2026-10-06"); pg.click("#rRefresh"); pg.wait_for_selector("#rGrid tr[data-i]")
    expect(pg.locator("#rGrid tr[data-i]")).to_have_count(6)
    shot(pg, "355-rdr-refresh.png")
    pg.select_option("#rCur", "840"); pg.keyboard.press("F5"); pg.wait_for_timeout(400)
    expect(pg.locator("#rGrid tr[data-i]")).to_have_count(4)
    pg.locator("#rGrid th[data-f='LAMMOUNT']").click(); pg.wait_for_timeout(400)
    pg.click("#rSearch"); pg.fill("#EDEBETACCOUNT", "az22"); pg.wait_for_timeout(200)
    assert "AZ22SMRT" in pg.locator("#rGrid tr.sel").inner_text()
    shot(pg, "356-rdr-filter-search.png")
    pg.locator("#rGrid tr[data-i='0']").click(button="right"); pg.wait_for_selector(".ctx-menu")
    shot(pg, "357-rdr-popup.png")
    pg.locator(".ctx-menu .ctx-item", has_text="Report").click(); pg.wait_for_timeout(300)
    b.close()

"""Order ('Sərəncam') E2E + screenshots 363-365 (mock mode)."""
import os, sys, re
from playwright.sync_api import sync_playwright
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n)), print("saved", n))


with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1600, "height": 960})
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    loc = pg.locator("#tree .node").filter(has=pg.locator(".cap", has_text=re.compile("^Order$")))
    if not loc.last.is_visible():
        pg.locator("#tree .node", has_text="Payments").first.click(); pg.wait_for_timeout(200)
    loc.last.click(); pg.wait_for_selector("#oContract")
    assert pg.input_value("#oContract").startswith("AZ10SMRT3301944")
    shot(pg, "363-order.png")
    pg.click("#oContract"); pg.fill("#oContract", ""); pg.type("#oContract", "az12", delay=30)
    assert pg.input_value("#oContract").startswith("AZ12SMRT")
    pg.keyboard.press("Enter"); pg.wait_for_timeout(200)
    assert "Kənd MMC" in pg.input_value("#oClientName")
    pg.type("#oReserve", "zz", delay=30)
    shot(pg, "364-order-search.png")
    pg.select_option("#oCur", "1"); pg.wait_for_timeout(400)
    assert pg.input_value("#oContract") == "" and "USD" in pg.input_value("#oClientName")
    pg.click("#oBtn"); pg.wait_for_selector(".toast")
    shot(pg, "365-order-usd-onhold.png")
    b.close()

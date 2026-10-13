"""AZIPS part 4e E2E + screenshots: OUT popups 'Cap et!' (Capet1 / N3 / CapEt2 -> ToolButton8Click :6179 -> cap.pas)."""
import os, sys
from playwright.sync_api import sync_playwright
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n), full_page=True), print("saved", n))
with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1440, "height": 1000})
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    pg.fill("#treeSearch", "AZIPS"); pg.wait_for_timeout(300)
    pg.locator("#tree .node[data-path='9.0']").click(); pg.wait_for_selector("#g_out tr[data-i='0']")
    pg.locator("#g_out tbody tr", has_text="9104").first.click(button="right"); pg.wait_for_selector("#az_pop1")
    shot(pg, "133-azips-out-popup-capet.png")
    pg.click("#az_pop1 button"); pg.wait_for_selector("#cap_v")
    assert ":20:" in pg.inner_text("#cap_v"); shot(pg, "134-azips-out-print-built.png"); pg.click("#cap_x")
    pg.locator("#g_out2 tbody tr", has_text="9103").first.click(button="right"); pg.click("#az_pop2 button")
    pg.wait_for_selector("#cap_v"); assert "REF9103" in pg.inner_text("#cap_v")
    shot(pg, "135-azips-out-print-hesabat.png"); pg.click("#cap_x")
    b.close()

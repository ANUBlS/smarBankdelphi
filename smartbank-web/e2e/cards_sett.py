"""Cards ▸ Sazlama (setac.pas) + balhs / comp E2E + screenshots 187-189."""
import os, sys
from playwright.sync_api import sync_playwright
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n), full_page=False), print("saved", n))
with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1440, "height": 1000})
    pg.on("pageerror", lambda e: print("pageerror:", e))
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    pg.fill("#treeSearch", "Cards"); pg.wait_for_timeout(300)
    pg.locator("#tree .node", has_text="Cards").last.click(); pg.wait_for_selector("#g_c tr[data-i='0']")
    pg.click("[data-ni=sett]"); pg.wait_for_selector("#st_g tbody tr[data-id]")
    shot(pg, "187-cards-settings.png")
    pg.dblclick("#st_g tbody tr[data-id='1']"); pg.wait_for_selector("#bh_g")
    pg.fill("#bh_b", "30000"); pg.fill("#bh_h", "2"); pg.click("#bh_a"); pg.wait_for_timeout(500)
    shot(pg, "188-cards-settings-balhs.png")
    pg.click("[data-x]"); pg.wait_for_timeout(200)
    pg.click("#st_g tbody tr[data-id='12']"); pg.click("#st_open"); pg.wait_for_selector("#pv_g")
    shot(pg, "189-cards-settings-paymentset.png")
    b.close()

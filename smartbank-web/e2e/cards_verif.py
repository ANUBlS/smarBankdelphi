"""Cards ▸ Verifikasiya (unitverification.pas) E2E + screenshots 180-181."""
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
    pg.click("#m1 summary"); pg.click("[data-mi=verif]"); pg.wait_for_selector("#vf_simple tbody tr[data-id]")
    pg.click("[data-vf=simple]"); pg.wait_for_selector("button[data-a=all]")
    shot(pg, "180-cards-verification-confirm.png")
    pg.click("button[data-a=yes]"); pg.wait_for_timeout(600)
    assert pg.locator("#vf_simple tbody tr[data-id]").count() == 0
    shot(pg, "181-cards-verification-done.png")
    b.close()

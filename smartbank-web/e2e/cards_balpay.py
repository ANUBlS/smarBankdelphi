"""Cards ▸ Balans (balans.pas) and Payment (payment.pas) E2E + screenshots 182-183."""
import os, sys
from playwright.sync_api import sync_playwright
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n), full_page=False), print("saved", n))
with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1440, "height": 1000}, accept_downloads=True)
    pg.on("pageerror", lambda e: print("pageerror:", e))
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    pg.fill("#treeSearch", "Cards"); pg.wait_for_timeout(300)
    pg.locator("#tree .node", has_text="Cards").last.click(); pg.wait_for_selector("#g_c tr[data-i='0']")
    pg.click("#m1 summary"); pg.click("[data-mi=balance]"); pg.wait_for_selector("#bl_c")
    pg.click("#bl_c"); pg.wait_for_selector("#bl_g tbody tr[data-i]")
    with pg.expect_download() as dl:
        pg.click("#bl_f")
    print("download", dl.value.suggested_filename)
    shot(pg, "182-cards-balance.png")
    pg.click("#m1 summary"); pg.click("[data-mi=payment]"); pg.wait_for_selector("#py_r")
    pg.click("#py_r"); pg.wait_for_selector("#py_g tbody tr[data-i]")
    pg.click("#py_g tbody tr[data-i='0']")
    with pg.expect_download() as dl:
        pg.click("#py_f")
    print("download", dl.value.suggested_filename)
    shot(pg, "183-cards-payment.png")
    b.close()

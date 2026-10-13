"""Cards ▸ Application 'FAYL YARAT' (applicationpas.pas Button2Click / Button5Click, step 3b) E2E + screenshot 178."""
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
    pg.on("dialog", lambda d: (print("dialog:", d.message), d.accept()))
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    pg.fill("#treeSearch", "Cards"); pg.wait_for_timeout(300)
    pg.locator("#tree .node", has_text="Cards").last.click(); pg.wait_for_selector("#g_c tr[data-i='0']")
    pg.click("#m1 summary"); pg.click("[data-mi=application]"); pg.wait_for_selector("#ap_urgent tbody tr[data-id]")
    pg.click("#ap_urgent tbody tr[data-id]", button="right"); pg.click("#ap_all"); pg.wait_for_timeout(200)
    with pg.expect_download() as dl:
        pg.click("[data-file=urgent]")
    print("file", dl.value.suggested_filename)
    pg.wait_for_timeout(500)
    shot(pg, "178-cards-applications-file.png")
    b.close()

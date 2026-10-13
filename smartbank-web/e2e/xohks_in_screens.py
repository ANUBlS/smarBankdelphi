"""XÖHKS step 4 E2E + screenshots 155-157: IN file upload (one file), Konvert (ConvertToBase run verbatim), Yoxlanıb (Form20)."""
import os, sys
from playwright.sync_api import sync_playwright
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
SAMPLE = os.path.join(os.path.dirname(__file__), "..", "api", "tests", "data", "xohks_in_sample.xml")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n), full_page=False), print("saved", n))
with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1440, "height": 1000})
    errs = []
    pg.on("pageerror", lambda e: errs.append(str(e)))
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    pg.fill("#treeSearch", "XÖHKS"); pg.wait_for_timeout(300)
    pg.locator("#tree .node", has_text="XÖHKS").last.click(); pg.wait_for_selector("#g_b tr[data-i='0']")
    pg.click(".tabs button[data-tab='in']"); pg.wait_for_selector("#x_ifile", state="attached")
    pg.set_input_files("#x_ifile", SAMPLE); pg.wait_for_selector("#x_flist [data-f]")
    shot(pg, "155-xohks-in-file-loaded.png")
    pg.click("#x_iconv"); pg.wait_for_selector("#g_i td:has-text('XIN2610130001')")
    shot(pg, "156-xohks-in-converted.png")
    pg.click("#x_iconv"); pg.wait_for_selector("#x_info")          # second time: 'Artıq konvert olunub !'
    pg.locator("#g_i tr", has_text="XIN2610130001").first.click()
    pg.click("#x_iacc"); pg.wait_for_selector("text=Verification")
    shot(pg, "157-xohks-in-accept-verification.png")
    pg.click("button:has-text('Yoxla')"); pg.wait_for_timeout(600)
    assert not errs, errs
    b.close()

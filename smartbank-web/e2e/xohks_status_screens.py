"""XÖHKS step 3a E2E + screenshots 147-149: Düzgündür + Modifikator, Verification dialog, status after Verifikator."""
import os, sys
from playwright.sync_api import sync_playwright
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
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
    pg.click("#g_b tr[data-i='0']"); pg.wait_for_selector("#g_xb tr[data-i='1']")
    pg.click("#g_xb tr[data-i='0']", modifiers=["Control"]); pg.click("#g_xb tr[data-i='1']", modifiers=["Control"])
    pg.click("#x_macc"); pg.wait_for_timeout(600)
    pg.click("#x_bacc"); pg.wait_for_timeout(600)
    shot(pg, "147-xohks-modifikator.png")
    pg.click("#g_b tr[data-i='0']"); pg.click("#x_ver"); pg.wait_for_selector("#vf_e1")
    pg.fill("#vf_e1", "1500.5")
    shot(pg, "148-xohks-verification.png")
    pg.click("#vf_ok"); pg.wait_for_selector("#vf_e1", state="detached"); pg.wait_for_timeout(600)
    shot(pg, "149-xohks-verified.png")
    assert not errs, errs
    b.close()

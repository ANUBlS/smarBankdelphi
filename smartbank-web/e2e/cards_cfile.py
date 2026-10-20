"""Cards ▸ Əməliyyat ▸ C File (cfilepas.pas) E2E + screenshots 224-226: upload one C file, Yenilə, Bazaya Göndər, Təsdiq Et."""
import os, sys, tempfile
from playwright.sync_api import sync_playwright
sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "api"))
from tests.test_cards_cfile import cfile  # noqa: E402
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n), full_page=False), print("saved", n))
errors = []
fn = os.path.join(tempfile.mkdtemp(), "C0002.293")
open(fn, "wb").write(cfile())
with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1440, "height": 1000})
    pg.on("pageerror", lambda e: (errors.append(str(e)), print("pageerror:", e)))
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    pg.fill("#treeSearch", "Cards"); pg.wait_for_timeout(300)
    pg.locator("#tree .node", has_text="Cards").last.click(); pg.wait_for_selector("#g_c tr[data-i='0']")
    pg.click("#m2 summary"); pg.click("[data-mi=cfile]"); pg.wait_for_selector("#cf_g1")
    pg.set_input_files("#cf_f", fn); pg.wait_for_selector("#cf_fn:has-text('C0002.293')")
    pg.click("#cf_r"); pg.wait_for_selector("#cf_rich span")
    shot(pg, "224-cards-cfile-preview.png")
    pg.click("#cf_b"); pg.wait_for_timeout(800)
    shot(pg, "225-cards-cfile-tobase.png")
    pg.click("#cf_g1 tbody tr[data-id='1']"); pg.click("#cf_c")
    pg.locator(".modal [data-a=yes]").last.click(); pg.wait_for_timeout(800)
    shot(pg, "226-cards-cfile-confirmed.png")
    b.close()
print("errors:", errors)
sys.exit(1 if errors else 0)

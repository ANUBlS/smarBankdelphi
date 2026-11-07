"""Off-balance account types (Packages/Out_Tuningacctypes) E2E + screenshots (mock mode)."""
import os, sys
from playwright.sync_api import sync_playwright
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n), full_page=True), print("saved", n))
with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1440, "height": 900})
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    pg.fill("#treeSearch", "Account Types"); pg.wait_for_timeout(300)
    pg.locator("#tree .node[data-path='8.9']").click(); pg.wait_for_selector("#tg tr[data-i]")
    pg.click("#t_new"); pg.fill("#tg tr.sel input[data-c=SYMBOL]", "K"); pg.fill("#tg tr.sel input[data-c=NAME]", "Kredit xətti")
    pg.fill("#tg tr.sel input[data-c=DESCRIPTION]", "Açılmamış kredit xətləri"); shot(pg, "89-out-tuningacctypes-edit.png")
    pg.click("#tg [data-a=post]"); pg.wait_for_timeout(500)
    assert "Kredit xətti" in pg.inner_text("#tg"); shot(pg, "90-out-tuningacctypes-list.png")
    b.close()

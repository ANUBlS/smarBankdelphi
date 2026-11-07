"""Off-balance currencies (Packages/out_Avalute) E2E + screenshots (mock mode)."""
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
    pg.fill("#treeSearch", "Currencies"); pg.wait_for_timeout(300)
    pg.locator("#tree .node[data-path='8.10']").click(); pg.wait_for_selector("#ag tr[data-i]")
    pg.locator("#ag tr[data-i='1'] td").first.click(); pg.wait_for_timeout(400)
    assert pg.eval_on_selector("#s_kredit", "e => e.selectedOptions[0].text") == "9100094400010001"
    shot(pg, "91-out-avalute-list.png")
    pg.locator("#ag tr[data-i='1'] td").first.click(); pg.fill("#ag tr[data-e] input[data-c=COUNTRY]", "Amerika (ABŞ)")
    pg.select_option("#s_debet", label="9200094400020001"); shot(pg, "92-out-avalute-edit.png")
    pg.click("#a_ok"); pg.wait_for_timeout(700)
    assert "Amerika (ABŞ)" in pg.inner_text("#ag")
    b.close()

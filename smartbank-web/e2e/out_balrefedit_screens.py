"""Off-balance chart of accounts editor (Packages/Out_balancerefeditx) E2E + screenshots (mock mode)."""
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
    pg.fill("#treeSearch", "Chart of Accounts"); pg.wait_for_timeout(300)
    pg.locator("#tree .node[data-path='8.8']").click(); pg.wait_for_selector("#bg table tbody tr[data-i]")
    pg.fill("#bs", "92"); pg.wait_for_timeout(200); shot(pg, "87-out-balrefedit-list.png")
    pg.click("#n_edit"); pg.fill("#f_balname", "Verilmiş zəmanətlər (bank)"); pg.select_option("#f_currencyposition", "3")
    shot(pg, "88-out-balrefedit-edit.png")
    pg.click("#n_post"); pg.wait_for_timeout(500)
    assert "Verilmiş zəmanətlər (bank)" in pg.inner_text("#bg")
    b.close()

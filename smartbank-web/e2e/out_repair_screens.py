"""Off-balance repair (Packages/out_repair) E2E + screenshots (mock mode)."""
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
    pg.fill("#treeSearch", "Repair"); pg.wait_for_timeout(300)
    pg.locator("#tree .node[data-path='8.12']").click(); pg.wait_for_selector("#r_add")
    pg.wait_for_timeout(500); pg.fill("#rd1", "2026-10-01"); pg.click("#r_ref"); pg.wait_for_selector("#rg tr[data-i='3']")
    assert pg.locator("#rg tr[data-i]").count() == 4
    pg.click("#r_adv"); pg.wait_for_timeout(200)
    shot(pg, "96-out-repair-list.png")
    pg.locator("#rg tr[data-i]").first.dblclick(); pg.wait_for_selector("#esave"); pg.wait_for_timeout(500)
    pg.fill("#ename", ""); pg.click("#esave"); pg.wait_for_selector("#eerr .alert")
    shot(pg, "97-out-repair-edit.png")
    pg.click("#ecancel"); pg.click("#r_del"); pg.wait_for_selector("#dyes")
    shot(pg, "98-out-repair-delete.png")
    b.close()

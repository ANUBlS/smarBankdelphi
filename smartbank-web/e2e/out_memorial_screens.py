"""Off-balance memorial orders (Packages/out_memorial) E2E + screenshots (mock mode)."""
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
    pg.fill("#treeSearch", "Memorial"); pg.wait_for_timeout(300)
    pg.locator("#tree .node[data-path='8.11']").click(); pg.wait_for_selector("#m_run")
    pg.fill("#mb", "2026-10-01"); pg.check("#mrep"); pg.click("#m_run"); pg.wait_for_selector("#mg tr[data-i]")
    pg.wait_for_selector("#mrp table")
    assert pg.locator("#mg tr[data-i]").count() == 4
    shot(pg, "93-out-memorial-run.png")
    pg.select_option("#mf", "1"); pg.click("#m_run"); pg.wait_for_selector("#fok")
    pg.uncheck("#fd"); pg.check("#fk"); pg.check("#fb"); pg.fill("#fl", "9200")
    shot(pg, "94-out-memorial-filter.png")
    pg.click("#fok"); pg.wait_for_timeout(600)
    pg.click("#m_ref"); pg.wait_for_selector("#rg table"); shot(pg, "95-out-memorial-refer.png")
    b.close()

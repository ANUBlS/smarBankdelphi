"""Off-balance Excel import (Packages/OutExcelImport) E2E + screenshots (mock mode)."""
import io, os, sys, tempfile
import openpyxl
from playwright.sync_api import sync_playwright
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n), full_page=True), print("saved", n))
wb = openpyxl.Workbook(); ws = wb.active
ws.append(["F1", "F2", "F3", "F4"])
ws.append(["9100094400010001", "9200094400020001", 150, "Excel girov"])
ws.append(["9100094400010001", "9900094400030001", 75.5, "Excel silinmiş"])
f = os.path.join(tempfile.gettempdir(), "out_excel_sample.xlsx"); wb.save(f)
with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1440, "height": 900})
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    pg.fill("#treeSearch", "Excel"); pg.wait_for_timeout(300)
    pg.locator("#tree .node[data-path='8.13']").click(); pg.wait_for_selector("#xsend")
    pg.set_input_files("#xf", f); pg.wait_for_selector("#xg tr[data-i='1']")
    shot(pg, "99-out-excel-import-loaded.png")
    pg.click("#xsend"); pg.wait_for_selector("#qy")
    shot(pg, "100-out-excel-import-send.png")
    pg.click("#qy"); pg.wait_for_selector("#ok"); pg.click("#ok")
    assert pg.locator("#xg tr[data-i]").count() == 0
    b.close()

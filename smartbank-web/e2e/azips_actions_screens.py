"""AZIPS part 4a/4b E2E (multi-select + Yes to all, Modifikator) + screenshots: Verifikator + Form12 (commitingExecute / yoxp.pas) with a wrong amount, and Ləğv et (out_delete)."""
import os, sys
from playwright.sync_api import sync_playwright
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n), full_page=True), print("saved", n))
with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1440, "height": 1000})
    pg.on("dialog", lambda d: d.accept())
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    pg.fill("#treeSearch", "AZIPS"); pg.wait_for_timeout(300)
    pg.locator("#tree .node[data-path='9.0']").click(); pg.wait_for_selector("#g_out2 tr[data-i='0']")
    pg.click("#g_out2 tr[data-i='0']"); pg.click("#z_verify"); pg.click("button[data-a='yes']"); pg.wait_for_selector("#f12a")
    pg.fill("#f12a", "1"); shot(pg, "114-azips-verifikator-form12.png")
    pg.click("#f12ok"); pg.wait_for_timeout(800)
    assert "Mebleq ve ya Valyuta duzgun yazilmayib!" in pg.inner_text("#g_out2")
    shot(pg, "115-azips-verifikator-wrong-amount.png")
    # Modifikator on two Ctrl+selected rows: Yes to all -> '2 sayda ...' second dialog
    pg.click("#g_out tr[data-i='0']"); pg.click("#g_out tr[data-i='1']", modifiers=["Control"])
    assert pg.locator("#g_out tr.sel").count() == 2
    pg.click("#z_modif"); pg.wait_for_selector("button[data-a='all']"); shot(pg, "119-azips-modifikator-yes-to-all.png")
    pg.click("button[data-a='all']"); pg.wait_for_selector(".modal p")
    assert "2" in pg.inner_text(".modal p"); shot(pg, "120-azips-modifikator-confirm-all.png")
    pg.click("button[data-a='yes']"); pg.wait_for_timeout(800)
    shot(pg, "121-azips-modifikator-done.png")
    pg.click("#g_out tr[data-i='0']"); pg.click("#z_odel"); pg.click("button[data-a='yes']"); pg.wait_for_timeout(800)
    assert pg.input_value("#z_memo2")
    shot(pg, "116-azips-out-delete.png")
    b.close()

"""AZIPS part 4c E2E + screenshots: Redaktə et (Unit16), Sazlama IN (insett.pas) and OUT (MTsett.pas)."""
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
    pg.locator("#tree .node[data-path='9.0']").click(); pg.wait_for_selector("#g_out tr")
    pg.click(".tabs button[data-tab='in']"); pg.wait_for_selector("#g_in tr[data-i='0']")
    pg.locator("#g_in tbody tr", has_text="AZIPS2610130006").click(); pg.click("#z_inred"); pg.wait_for_selector("#rd2")
    pg.fill("#rd2", "1400057421"); shot(pg, "127-azips-in-redakte.png"); pg.click("#rdok"); pg.wait_for_timeout(500)
    pg.click("#z_settin"); pg.wait_for_selector("#f_fil")
    pg.select_option("#f_fil", "101"); pg.wait_for_timeout(300); pg.select_option("#f_val", "944"); pg.wait_for_timeout(500)
    assert pg.locator("#f_b option").count() == 2
    shot(pg, "128-azips-settings-in-mt103.png")
    pg.click(".modal .tabs button[data-t='names']"); pg.wait_for_selector("#f_e4")
    shot(pg, "129-azips-settings-in-names.png"); pg.click("#sx"); pg.wait_for_timeout(300)
    pg.click(".tabs button[data-tab='out']"); pg.wait_for_selector("#z_settout"); pg.click("#z_settout"); pg.wait_for_selector("#f_fil")
    pg.click(".modal .tabs button[data-t='mt205']"); pg.wait_for_selector("#f_bank")
    pg.select_option("#f_val", "944"); pg.wait_for_timeout(500)
    assert pg.locator("#f_bank option").count() == 3      # empty + 2 AZN banks (all_banks :valute = combo text)
    shot(pg, "130-azips-settings-out-mt205.png"); pg.click("#sx")
    b.close()

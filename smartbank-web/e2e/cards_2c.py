"""Cards step 2c E2E + screenshots 172-175: Tclients2 cards-grid click, Kredit Info, SIL, MultiCurrency."""
import os, sys
from playwright.sync_api import sync_playwright
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n), full_page=False), print("saved", n))
with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1440, "height": 1000})
    pg.on("pageerror", lambda e: print("pageerror:", e))
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    pg.fill("#treeSearch", "Cards"); pg.wait_for_timeout(300)
    pg.locator("#tree .node", has_text="Cards").last.click(); pg.wait_for_selector("#g_c tr[data-i='0']")
    pg.click("#g_c tr[data-i='0']"); pg.click("#c_edit"); pg.wait_for_selector("#cf_g5")
    pg.click("#cf_g5 tbody tr[data-id]"); pg.wait_for_timeout(400)
    assert pg.is_disabled("#cf_ComboBox9") and pg.input_value("#cf_Edit24") == "4169730000001111"
    shot(pg, "172-cards-grid5-click.png")
    pg.dblclick("#cf_g1 tbody tr[data-id]"); pg.wait_for_selector("#kr_g")
    assert "KR-2025-071" in pg.inner_text("#kr_g")
    shot(pg, "173-cards-kredit-info.png")
    pg.click("#kr_close")
    pg.click("#cf_g6 tbody tr[data-id]", button="right"); pg.wait_for_selector("#cf_sil")
    shot(pg, "174-cards-operation-sil.png")
    pg.click("#cf_sil"); pg.wait_for_timeout(400)
    assert pg.locator("#cf_g6 tbody tr[data-id]").count() == 0
    pg.click("#cf_close"); pg.click("#c_add"); pg.wait_for_selector("#cf_Edit19")
    pg.fill("#cf_Edit14", "501"); pg.press("#cf_Edit14", "Enter"); pg.wait_for_timeout(400)
    pg.fill("#cf_DBLookupComboBox6", "38110019440000000001"); pg.dispatch_event("#cf_DBLookupComboBox6", "change"); pg.wait_for_timeout(500)
    pg.select_option("#cf_ComboBox1", "VISA CLASSIC"); pg.fill("#cf_Edit23", "ELCHIN MAMMADOV"); pg.fill("#cf_Edit25", "ANA")
    pg.fill("#cf_DateTimePicker8", "2029-10-31"); pg.check("#cf_CheckBox4")
    pg.click("#cf_b2"); pg.wait_for_selector("#mc_a1")
    pg.check("#mc_m1"); pg.select_option("#mc_a1", "38110018400000000101"); pg.dispatch_event("#mc_a1", "change")
    assert pg.input_value("#mc_e1") == "USD"
    shot(pg, "175-cards-multicurrency.png")
    pg.click("#mc_save"); pg.wait_for_timeout(500)
    b.close()

"""Cards step 1 E2E + screenshots: Packages/Cards_New/cards_azericard main menu + 'Müştərilər' list."""
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
    shot(pg, "160-cards-tree-entry.png")
    pg.locator("#tree .node", has_text="Cards").last.click(); pg.wait_for_selector("#g_c tr[data-i='4']")
    assert pg.inner_text("#c_cnt") == "5"
    shot(pg, "161-cards-clients.png")
    pg.click("#m1 summary"); pg.wait_for_timeout(200)
    shot(pg, "162-cards-menu.png")
    pg.click("#m1 summary")
    pg.click("#c_flt"); pg.check("#c_p5 [data-c='2']"); pg.select_option("#c_l2", "AZN"); pg.check("#c_p5 [data-c='4']")
    pg.select_option("#c_l4", "ACTIVE"); pg.click("#c_apply"); pg.wait_for_timeout(500)
    assert pg.inner_text("#c_cnt") == "3", pg.inner_text("#c_cnt")
    shot(pg, "163-cards-clients-filter.png")
    pg.click("#c_srch"); pg.fill("#c_p4 [data-e='FNAME']", "R"); pg.wait_for_timeout(500)
    assert pg.inner_text("#c_cnt") == "1"
    shot(pg, "164-cards-clients-search.png")
    with pg.expect_download() as dl:
        pg.click("#c_xls")
    path = dl.value.path()
    from openpyxl import load_workbook
    import io
    sh = load_workbook(io.BytesIO(open(path, "rb").read())).active
    assert sh.max_column == 28 and sh.cell(1, 2).value == "RBSNUMBER", sh.max_column
    print("excel rows", sh.max_row - 1)
    pg.wait_for_timeout(300)
    shot(pg, "165-cards-clients-excel.png")
    pg.click("#c_ref"); pg.wait_for_timeout(400)
    pg.click("#g_c tr[data-i='0']"); pg.click("#c_edit"); pg.wait_for_selector("#cf_g5")
    assert pg.input_value("#cf_Edit15") == "Elchin"
    shot(pg, "166-cards-client-edit.png")
    pg.click("#cf_close"); pg.click("#c_add"); pg.wait_for_selector("#cf_Edit19")
    assert pg.input_value("#cf_Edit19") == "BAKU"
    shot(pg, "167-cards-client-new.png")
    # step 2b: customer ID box -> account -> musterinfo fill, then save (NEW)
    pg.fill("#cf_Edit14", "501"); pg.press("#cf_Edit14", "Enter"); pg.wait_for_timeout(400)
    pg.fill("#cf_DBLookupComboBox6", "38110019440000000001"); pg.dispatch_event("#cf_DBLookupComboBox6", "change"); pg.wait_for_timeout(500)
    assert pg.input_value("#cf_Edit15") == "Elchin" and pg.inner_text("#cf_DBEdit18") == "AZN"
    pg.select_option("#cf_ComboBox1", "VISA CLASSIC"); pg.fill("#cf_Edit23", "ELCHIN MAMMADOV"); pg.fill("#cf_Edit25", "ANA")
    pg.fill("#cf_DateTimePicker8", "2029-10-31")
    shot(pg, "168-cards-client-new-filled.png")
    pg.click("#cf_b2"); pg.wait_for_timeout(600)
    shot(pg, "169-cards-client-new-saved.png")
    # EDIT -> Redakte et -> Credit Limit -> save
    pg.click("#g_c tr[data-i='0']"); pg.click("#c_edit"); pg.wait_for_selector("#cf_g5")
    pg.click("#cf_b3"); pg.wait_for_timeout(400)
    pg.select_option("#cf_ComboBox9", "Credit Limit"); pg.wait_for_timeout(400)
    assert not pg.is_disabled("#cf_Edit28")
    pg.fill("#cf_Edit28", "500")
    shot(pg, "170-cards-client-credit-limit.png")
    pg.click("#cf_b2"); pg.wait_for_timeout(700)
    shot(pg, "171-cards-client-edit-saved.png")
    b.close()

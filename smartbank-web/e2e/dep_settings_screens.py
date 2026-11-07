"""SBDM_Settings_new E2E + screenshots 283-289 (mock mode, fresh API process)."""
import os, sys
from playwright.sync_api import sync_playwright, expect
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n)), print("saved", n))


def login(b, u, p):
    pg = b.new_page(viewport={"width": 1440, "height": 900})
    pg.on("dialog", lambda d: d.accept())
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", u); pg.fill("#p", p); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    pg.locator("#tree .node", has_text="Deposits").first.click(); pg.wait_for_timeout(200)
    pg.locator("#tree .node", has_text="Deposits").last.click()
    pg.wait_for_selector("#dGrid tbody tr[data-id]"); pg.wait_for_timeout(300)
    return pg




def sett(pg, key):
    pg.click("#dSett"); pg.wait_for_timeout(200)
    pg.locator(".ctx-menu >> text=" + pg.evaluate(f"SB.t('deposits.{key}')")).first.click(); pg.wait_for_timeout(400)


with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = login(b, "ADMIN", "Admin#2026")
    # categories: insert via navigator, post
    sett(pg, "s_categories"); pg.wait_for_selector(".dep-st-cat tr[data-i]")
    pg.click(".dep-st-cat [data-nav='insert']"); pg.fill(".dep-st-cat input[data-f='CATEGORY']", "Bank"); shot(pg, "283-deposits-sett-categories-insert.png")
    pg.click(".dep-st-cat [data-nav='post']"); pg.wait_for_timeout(400)
    expect(pg.locator(".dep-st-cat tr[data-i]")).to_have_count(4)
    pg.keyboard.press("Escape"); pg.wait_for_timeout(400)     # KeyPreview Close + grid Delete of the current (first) record
    # account groups master/detail
    sett(pg, "s_cccgroups"); pg.wait_for_selector(".dep-st-grp .stInfo tr[data-i]")
    pg.locator(".dep-st-grp .stZones tr[data-i='4']").click(); pg.wait_for_timeout(300); shot(pg, "284-deposits-sett-cccgroups.png")
    pg.keyboard.press("Escape"); pg.wait_for_timeout(200)
    # deposit types list + edit form
    sett(pg, "s_deposittypes"); pg.wait_for_selector(".dep-st-dt tr[data-i]"); shot(pg, "285-deposits-sett-deposittypes.png")
    pg.click(".dep-st-dt [data-a='new']"); pg.wait_for_selector("#dtType"); pg.fill("#dtType", "Yeni növ"); pg.select_option("#dtWith", "Monthly")
    pg.check("#dtAmount"); shot(pg, "286-deposits-sett-deposittypes-new.png")
    pg.click("#dtOk"); pg.wait_for_timeout(500)
    expect(pg.locator(".dep-st-dt tr[data-i]", has_text="Yeni növ")).to_have_count(1)
    pg.keyboard.press("Escape"); pg.wait_for_timeout(200)
    # account turning: chain + add form
    sett(pg, "s_accountturning"); pg.wait_for_selector(".dep-st-at tr[data-t]"); shot(pg, "287-deposits-sett-accountturning.png")
    pg.click(".dep-st-at [data-a='add']"); pg.wait_for_selector("#atBr"); pg.select_option("#atBr", "102")
    pg.select_option("#atAcc", index=1); shot(pg, "288-deposits-sett-accountturning-add.png")
    pg.click("#atOk"); pg.wait_for_timeout(500); pg.keyboard.press("Escape"); pg.wait_for_timeout(200)
    # hidden N1 'Bankın seçmələri' (frmReferences_new) - opened directly, the menu item is Visible = False
    pg.evaluate("SB.depForms.sett_refer()"); pg.wait_for_selector(".dep-st-ref .rf-node")
    pg.locator(".dep-st-ref .rf-node[data-id='2']").click(); pg.wait_for_selector("#rfCombo"); shot(pg, "289-deposits-sett-refer.png")
    b.close()

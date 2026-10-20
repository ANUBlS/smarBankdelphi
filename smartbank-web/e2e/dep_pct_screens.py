"""SBDM_PercentSettings_new / SBDM_DepozitAccSettings_new E2E + screenshots 290-294 (mock mode, fresh API process)."""
import os, sys
from playwright.sync_api import sync_playwright, expect
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n)), print("saved", n))
msgs = []


def login(b, u, p):
    pg = b.new_page(viewport={"width": 1440, "height": 900})
    pg.on("dialog", lambda d: (msgs.append(d.message), d.accept()))
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", u); pg.fill("#p", p); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    pg.locator("#tree .node", has_text="Deposits").first.click(); pg.wait_for_timeout(200)
    pg.locator("#tree .node", has_text="Deposits").last.click()
    pg.wait_for_selector("#dGrid tbody tr[data-id]"); pg.wait_for_timeout(300)
    return pg


def sett(pg, key):
    pg.click("#dSett"); pg.wait_for_timeout(200)
    pg.locator(".ctx-menu >> text=" + pg.evaluate(f"SB.t('deposits.{key}')")).first.click(); pg.wait_for_timeout(500)


with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = login(b, "ADMIN", "Admin#2026")
    sett(pg, "s_percent"); pg.wait_for_selector(".dep-pct [data-g='pers'] tr[data-i]")
    expect(pg.locator(".dep-pct [data-g='pers'] tr[data-i]")).to_have_count(2)
    shot(pg, "290-deposits-pct-settings.png")
    # amount row 2 -> rate rows reopened for amount_setting_id 2
    pg.locator(".dep-pct [data-g='amounts'] tr[data-i='1']").click(); pg.wait_for_timeout(400)
    expect(pg.locator(".dep-pct [data-g='pers'] tr[data-i]")).to_have_count(1)
    # append a rate row: focus the grid, Down on the last row, type, Enter posts
    pg.locator(".dep-pct [data-g='pers'] tr[data-i='0'] td").nth(1).click(); pg.wait_for_timeout(100)
    pg.keyboard.press("ArrowDown"); pg.wait_for_selector(".dep-pct [data-g='pers'] input[data-f='INTERESTRATE']")
    pg.fill(".dep-pct [data-g='pers'] input[data-f='FIRST_DAY']", "366")
    pg.locator(".dep-pct [data-g='pers'] input[data-f='LAST_DAY']").click(); pg.keyboard.type("730")
    pg.locator(".dep-pct [data-g='pers'] input[data-f='INTERESTRATE']").click(); pg.keyboard.type("11")
    shot(pg, "291-deposits-pct-insert.png")
    pg.keyboard.press("Enter"); pg.wait_for_timeout(600)
    expect(pg.locator(".dep-pct [data-g='pers'] tr[data-i]")).to_have_count(2)
    # Təsdiqlə: the new row has write_memory 0 -> refused; Yaddaşa yaz; Təsdiqlə with the checkbox
    pg.click("#pcConfirm"); pg.wait_for_timeout(400)
    pg.click("#pcSave"); pg.wait_for_timeout(400)
    pg.check("#pcOld"); pg.click("#pcConfirm"); pg.wait_for_timeout(600)
    print(msgs)
    assert msgs[-4].endswith("bilməz!") and msgs[-3].endswith("yazıldı.") and msgs[-2].startswith("Sazlanmis") and msgs[-1].endswith("təsdiqləndi."), msgs
    shot(pg, "292-deposits-pct-confirmed.png")
    # delete an early-payout row (Delete key + confirm) after moving back to amount 1
    pg.locator(".dep-pct [data-g='amounts'] tr[data-i='0']").click(); pg.wait_for_timeout(400)
    expect(pg.locator(".dep-pct [data-g='dats'] tr[data-i]")).to_have_count(2)
    pg.locator(".dep-pct [data-g='dats'] tr[data-i='1']").click(); pg.keyboard.press("Delete"); pg.wait_for_timeout(500)
    expect(pg.locator(".dep-pct [data-g='dats'] tr[data-i]")).to_have_count(1)
    # periods: the second type -> its periods / caps
    pg.locator(".dep-pct [data-g='types'] tr[data-i='1']").click(); pg.wait_for_timeout(400)
    shot(pg, "293-deposits-pct-type2.png")
    pg.keyboard.press("Escape"); pg.wait_for_timeout(300)
    expect(pg.locator(".dep-pct")).to_have_count(0)
    # reopened: cursor positions kept (the form is never freed)
    sett(pg, "s_percent"); pg.wait_for_selector(".dep-pct [data-g='types'] tr.sel")
    expect(pg.locator(".dep-pct [data-g='types'] tr.sel")).to_have_attribute("data-i", "1")
    pg.keyboard.press("Escape"); pg.wait_for_timeout(300)
    # hidden Hesablarin1 (SBDM_DepozitAccSettings_new): empty form
    pg.evaluate("SB.depForms.sett_accounts()"); pg.wait_for_selector(".dep-accsett"); shot(pg, "294-deposits-acc-settings.png")
    pg.click("#daX")
    b.close()

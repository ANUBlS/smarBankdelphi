"""SBDM_Contract_new.bpl (deposit contract form) E2E + screenshots 258-262 (mock mode, fresh API process)."""
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


def sel(pg, s, v):
    pg.select_option(s, str(v)); pg.wait_for_timeout(350)


with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = login(b, "ADMIN", "Admin#2026")
    pg.click("#dNew"); pg.wait_for_selector("#dcType"); pg.wait_for_timeout(300); shot(pg, "258-deposits-contract-new-empty.png")
    pg.fill("#dcCustNo", "30001"); pg.press("#dcCustNo", "Tab"); pg.wait_for_timeout(500)
    expect(pg.locator("#dcCustName")).to_have_value("Əliyev Rəşad Kamal oğlu")
    sel(pg, "#dcCur", 944); sel(pg, "#dcType", 1); sel(pg, "#dcPeriod", 12); sel(pg, "#dcCap", 122)
    pg.fill("#dcAmount", "5000"); pg.press("#dcAmount", "Enter"); pg.wait_for_timeout(600)       # GenAnnualInt
    expect(pg.locator("#dcInt")).to_have_value("9")
    pg.fill("#dcNo", "DP-944-0100"); pg.press("#dcNo", "Tab")
    sel(pg, "#dcCat", 1); sel(pg, "#dcPers", 1)
    sel(pg, "#dcAccDep", 805001); sel(pg, "#dcAccCl", 905001); sel(pg, "#dcAccInt", 815001)
    pg.click("#dcSave"); pg.wait_for_selector("#dcHint"); expect(pg.locator("#dcHint")).to_contain_text(pg.evaluate("SB.t('deposits.c_err_boracc')").strip())
    shot(pg, "259-deposits-contract-hint.png")
    sel(pg, "#dcAccBor", 906101); shot(pg, "260-deposits-contract-new-filled.png")
    pg.click("#dcSave"); pg.wait_for_selector(".toast"); pg.wait_for_timeout(300)
    expect(pg.locator("#dcNo")).to_have_value("")                                                  # AddContract: next blank record
    pg.click("#dcCloseBtn"); pg.wait_for_timeout(800)
    expect(pg.locator("#dGrid tbody tr[data-id]")).to_have_count(9)                               # FormClose -> RefreshWithSavely
    pg.locator("#dGrid tr[data-id='5003']").click(); pg.keyboard.press("Control+e"); pg.wait_for_selector("#dcType"); pg.wait_for_timeout(500)
    expect(pg.locator("#dcInt")).to_have_value("10;10.5"); shot(pg, "261-deposits-contract-edit.png")
    pg.keyboard.press("Escape"); pg.wait_for_timeout(300)
    pg.close()
    pg = login(b, "DEPOSITOR", "Depositor#2026")
    pg.locator("#dGrid tr[data-id='5001']").click(); pg.click("#dEdit"); pg.wait_for_selector(".toast")
    expect(pg.locator(".toast").last).to_contain_text("EDIT_SBCM_CONTRACT"); shot(pg, "262-deposits-contract-edit-denied.png")
    b.close()

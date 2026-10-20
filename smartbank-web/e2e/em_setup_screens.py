"""Exchange Manager chunk 3 (Packages/ExchangeMGR-NBC) E2E + screenshots 336-344 (mock mode, fresh API process started with
EM_BAL_MANAT=1011 EM_BAL_VALUTA=1012 EM_BAL_GELIR=6011 EM_BAL_ZERER=7011 EM_BALANCE_MAIN_DEBT=1001 EM_BALANCE_MAIN_CRED=1002):
FormAddExch, FormAccount + FormExAccModify, FormParametr (user SMART); FormGivenResurs, FormResursRetrun, FormRemainder,
filial-rate edit (user ADMIN)."""
import os, sys
from playwright.sync_api import sync_playwright, expect
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n)), print("saved", n))


def open_em(b, user, pw):
    pg = b.new_page(viewport={"width": 1600, "height": 1000})
    pg.on("dialog", lambda d: d.accept())
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", user); pg.fill("#p", pw); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    if not pg.locator("#tree .node", has_text="Exchange manager").last.is_visible():
        pg.locator("#tree .node", has_text="Transactions").first.click(); pg.wait_for_timeout(200)
    pg.locator("#tree .node", has_text="Exchange manager").last.click(); pg.wait_for_selector("#gMaster")
    return pg


with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    # ---- SMART: offices, accounts, parameters
    pg = open_em(b, "SMART", "Smart#2026")
    pg.click("#mAdd"); pg.wait_for_selector("#oNo")
    for sel, v in [("#oNo", "4"), ("#oName", "VDM-4 Xətai"), ("#oAddr", "Bakı, Xətai pr. 5"), ("#oWork", "Məmmədov Elçin"), ("#oChk", "VDM-0004")]:
        pg.fill(sel, v)
    pg.select_option("#oFil", "102")
    shot(pg, "336-em-office-add.png")
    pg.click("#oOk"); pg.wait_for_selector("#oNo", state="detached")
    expect(pg.locator("#gMaster tr[data-i]")).to_have_count(4)
    pg.click("#gMaster tr[data-i='0']"); pg.wait_for_timeout(300)
    pg.click("#mAcc"); pg.wait_for_selector("#gAcc")
    expect(pg.locator("#gAcc tr[data-i]")).to_have_count(4)
    shot(pg, "337-em-accounts.png")
    pg.click("#aAdd"); pg.wait_for_selector("#mVal")
    pg.select_option("#mVal", "45"); pg.wait_for_timeout(400)
    for sel in ("#mPu", "#mSe", "#mPr", "#mHa", "#mCa", "#mPc"):
        pg.locator(sel).select_option(index=pg.locator(f"{sel} option").count() - 1)
    shot(pg, "338-em-account-modify.png")
    pg.click("#mOk"); pg.wait_for_selector("#mVal", state="detached")
    expect(pg.locator("#gAcc tr[data-i]")).to_have_count(5)
    pg.click("#aX")
    pg.click("#mPar"); pg.wait_for_selector("#gPU")
    pg.click("#gPU tr[data-i='2']"); pg.wait_for_timeout(300)
    pg.dblclick("#gPO tr[data-i='1']"); pg.wait_for_timeout(300)
    expect(pg.locator("#gPA tr[data-i]")).to_have_count(2)
    shot(pg, "339-em-parametr.png")
    pg.close()
    # ---- ADMIN: resources, remainder form, filial rates
    pg = open_em(b, "ADMIN", "Admin#2026")
    pg.click("[data-tab='1']"); pg.wait_for_selector("#gResurs")
    pg.click("#rAdd"); pg.click("#rMenu [data-rs='give']"); pg.wait_for_selector("#gVal")
    pg.select_option("#gVal", "1"); pg.fill("#gAmt", "2500"); pg.check("#gNext"); pg.fill("#gNd", "2026-10-13")
    shot(pg, "340-em-resurs-give.png")
    pg.click("#gOk"); pg.wait_for_selector("#gVal", state="detached")
    expect(pg.locator("#gResurs tr[data-i]")).to_have_count(3)
    pg.click("#rAdd"); pg.click("#rMenu [data-rs='return']"); pg.wait_for_selector("#gVal")
    pg.select_option("#gVal", "1"); expect(pg.locator("#gAmt")).to_have_value("18000.00")
    shot(pg, "341-em-resurs-return.png")
    pg.click("#gAb")
    pg.click("#gResurs tr[data-i='2']"); pg.click("#rConf"); pg.wait_for_timeout(500)
    shot(pg, "342-em-resurs-confirmed.png")
    pg.click("[data-tab='2']"); pg.wait_for_selector("#gTrans")
    pg.click("#tOst"); pg.wait_for_selector("#gRm tr[data-i]")
    shot(pg, "343-em-remainder-form.png")
    pg.click("#rmX")
    pg.click("[data-tab='4']"); pg.wait_for_selector("#gRFilial")
    pg.click("#nEdit"); pg.wait_for_selector("input.em-cell")
    pg.locator("input.em-cell").first.fill("1.6930")
    shot(pg, "344-em-rates-filial-edit.png")
    pg.click("#nPost"); pg.wait_for_selector("input.em-cell", state="detached")
    expect(pg.locator("#gRFilial tr[data-i='0'] td").nth(2)).to_have_text("1,693")
    b.close()

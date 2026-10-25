"""Exchange Manager chunk 4 (Packages/ExchangeMGR-NBC) E2E + screenshots 345-350 (mock mode, fresh API process):
Əməliyyatlar search panel, Dövriyyə sub-tabs (Əməliyyatlara baxış, Kurslara baxış, Silinmiş, Toplam, Reyestr)."""
import os, sys
from playwright.sync_api import sync_playwright, expect
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n)), print("saved", n))

with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1600, "height": 1000})
    pg.on("dialog", lambda d: d.accept())
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    if not pg.locator("#tree .node", has_text="Exchange manager").last.is_visible():
        pg.locator("#tree .node", has_text="Transactions").first.click(); pg.wait_for_timeout(200)
    pg.locator("#tree .node", has_text="Exchange manager").last.click(); pg.wait_for_selector("#gMaster")
    pg.click("[data-tab='2']"); pg.wait_for_selector("#gTrans")
    pg.type("#srA", "50")                                           # Edit_Src_AmountChange2 -> Locate('debitamount', '50', partial)
    expect(pg.locator("#gTrans tr[data-i='1']")).to_have_class("sel")
    shot(pg, "345-em-search-panel.png")
    pg.click("[data-tab='6']"); pg.wait_for_selector("#trGo")
    pg.fill("#trB", "2026-10-01"); pg.dispatch_event("#trB", "change")
    pg.click("#trGo"); expect(pg.locator("#gTv tbody tr")).to_have_count(6)
    shot(pg, "346-em-turnover-search.png")
    pg.click("[data-sub='1']"); pg.click("#rtGo"); expect(pg.locator("#gTv tbody tr")).to_have_count(4)
    shot(pg, "347-em-turnover-rates.png")
    pg.click("[data-sub='2']"); pg.fill("#dlE", "2026-10-12"); pg.dispatch_event("#dlE", "change")
    pg.click("#dlGo"); expect(pg.locator("#gTv tbody tr")).to_have_count(2)
    shot(pg, "348-em-turnover-deleted.png")
    pg.click("[data-sub='3']"); pg.fill("#tpB", "2026-10-01"); pg.dispatch_event("#tpB", "change")
    pg.check("#tpCV"); pg.select_option("#tpV", "1"); pg.click("#tpGo"); expect(pg.locator("#gTv tbody tr")).to_have_count(3)
    shot(pg, "349-em-turnover-toplam.png")
    pg.click("[data-sub='4']"); pg.select_option("#rsV", "-1"); pg.select_option("#rsX", "1"); pg.click("#rsGo"); pg.wait_for_timeout(400)
    shot(pg, "350-em-turnover-reestr.png")
    b.close()

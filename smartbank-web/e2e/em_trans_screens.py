"""Exchange Manager chunk 2 (Packages/ExchangeMGR-NBC) E2E + screenshots 331-335 (mock mode, fresh API process):
Əlavə et menu, FormPurchase filled, FormSelling, saved purchase in the grid, confirmed row."""
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
    pg.click("#tAdd"); expect(pg.locator("#tMenu [data-op]")).to_have_count(2)
    shot(pg, "331-em-add-menu.png")
    pg.click("#tMenu [data-op='purchase']"); pg.wait_for_selector("#psCur")
    pg.select_option("#psCur", "1"); expect(pg.locator("#psCourse")).to_have_value("1.695000")
    pg.fill("#psAmt", "1234.5"); expect(pg.locator("#psEkv")).to_have_value("2092.48")
    for sel, v in [("#psCn", "Elvin"), ("#psCl", "Quliyev"), ("#psCf", "Rauf"), ("#psPas", "1234567"), ("#psCd", "2018-03-01"),
                   ("#psCc", "Pasport"), ("#psCg", "ASAN"), ("#psCo", "Azərbaycan")]:
        pg.fill(sel, v)
    shot(pg, "332-em-purchase-form.png")
    pg.click("#psRun"); pg.wait_for_selector("#psCur", state="detached")
    expect(pg.locator("#gTrans tr[data-i]")).to_have_count(4)
    pg.click("#gTrans tr[data-i='3']")
    shot(pg, "333-em-purchase-saved.png")
    pg.click("#tConf"); pg.wait_for_timeout(500)
    shot(pg, "334-em-confirmed.png")
    pg.click("#tAdd"); pg.click("#tMenu [data-op='selling']"); pg.wait_for_selector("#psCur")
    pg.select_option("#psCur", "45"); expect(pg.locator("#psCourse")).to_have_value("1.9950000")
    pg.fill("#psAmt", "200"); expect(pg.locator("#psEkv")).to_have_value("399")
    shot(pg, "335-em-selling-form.png")
    b.close()

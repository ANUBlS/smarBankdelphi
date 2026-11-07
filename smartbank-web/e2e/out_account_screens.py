"""Off-balance accounts (Packages/Out_account/ocx) E2E + screenshots (mock mode)."""
import os, sys
from playwright.sync_api import sync_playwright
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n), full_page=True), print("saved", n))
with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1440, "height": 900})
    pg.on("dialog", lambda d: d.accept())
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    pg.fill("#treeSearch", "Off-balance Accounts"); pg.wait_for_timeout(300)
    pg.locator("#tree .node[data-path='8.7']").click(); pg.wait_for_selector("#oaGrid tr[data-id]")
    pg.click("[data-a=filter]"); pg.wait_for_timeout(200)
    pg.check("[data-use=tipacc]"); pg.select_option("[data-val=tipacc]", "G"); pg.wait_for_timeout(500)
    assert pg.locator("#oaGrid tr[data-id]").count() == 2
    pg.wait_for_selector("#oaRests b"); shot(pg, "83-out-account-list.png")
    pg.uncheck("[data-use=tipacc]"); pg.wait_for_timeout(400)
    pg.locator("#oaGrid tr[data-id='9101']").dblclick(); pg.wait_for_selector("#oaf")
    pg.click("#flg"); pg.wait_for_selector("#fok"); shot(pg, "84-out-account-edit.png")
    pg.click("#fok"); pg.wait_for_timeout(300); pg.click("#oc")
    pg.locator("#oaGrid tr[data-id='9101']").click(); pg.click("[data-a=tr]"); pg.wait_for_selector("#iok")
    pg.fill("#is", "2026-10-01"); pg.click("#iok"); pg.wait_for_selector(".modal .grid tbody tr")
    shot(pg, "85-out-account-documents.png"); pg.click("#tok")
    pg.click("[data-a=states]"); pg.wait_for_selector("[data-sh=both]"); pg.click("[data-sh=both]"); pg.wait_for_timeout(200)
    shot(pg, "86-out-account-rests.png"); pg.click("#sok")
    # new account: auto number, save, then close it
    pg.click("[data-a=new]"); pg.wait_for_selector("#oaf")
    pg.select_option("[name=val_acc]", "0"); pg.select_option("[name=bal_cn1]", "9100"); pg.select_option("[name=kli_id]", "3")
    pg.select_option("[name=filial]", "102"); pg.click("#gen"); pg.wait_for_timeout(400)
    assert pg.input_value("[name=acc_no]").startswith("9100944"), pg.input_value("[name=acc_no]")
    assert pg.input_value("[name=name]") == "Mammadova Leyla"
    pg.click("#oaf button.btn:not(.secondary)"); pg.wait_for_timeout(600)
    pg.click("[data-a=close]"); pg.wait_for_timeout(600)
    print("ok")
    b.close()

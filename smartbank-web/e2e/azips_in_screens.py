"""AZIPS part 4b-2 E2E + screenshots: Təsdiq et (comitClick -> AddINTransNewExecute, UFX card credit via the mock UFX
client), Hesabi yoxla (Checkacc.pas), Transit hesablar (Tranzit_account.pas)."""
import os, sys
from playwright.sync_api import sync_playwright
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n), full_page=True), print("saved", n))
with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1440, "height": 1000})
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    pg.fill("#treeSearch", "AZIPS"); pg.wait_for_timeout(300)
    pg.locator("#tree .node[data-path='9.0']").click(); pg.wait_for_selector("#g_out tr")
    pg.click(".tabs button[data-tab='in']"); pg.wait_for_selector("#g_in tr[data-i='0']")
    row = lambda rid: pg.locator("#g_in tbody tr", has_text="AZIPS261013000" + str(rid)[-1])
    # Hesabi yoxla (right click on 5006)
    row(5006).click(button="right"); pg.wait_for_selector("#cab")
    pg.click("#cab"); pg.wait_for_timeout(400)
    assert pg.input_value("#ca2") == "SMART MMC"
    shot(pg, "122-azips-in-checkacc.png"); pg.click("#cax"); pg.wait_for_timeout(300)
    # Təsdiq et on the UFX card row 5005
    row(5005).click(); pg.click("#z_incommit"); pg.wait_for_selector("button[data-a='yes']")
    assert "1 sayda" in pg.inner_text(".modal p"); shot(pg, "123-azips-in-commit-confirm.png")
    pg.click("button[data-a='yes']"); pg.wait_for_selector("#mx")
    assert "uğurla" in pg.inner_text(".modal"); shot(pg, "124-azips-in-commit-ufx-ok.png"); pg.click("#mx")
    pg.wait_for_timeout(500)
    # card with a UFX error (mock 'Insufficient funds')
    row(5007).click(); pg.click("#z_incommit"); pg.wait_for_selector("button[data-a='yes']"); pg.click("button[data-a='yes']")
    pg.wait_for_selector("#mx"); assert "Insufficient funds" in pg.inner_text(".modal")
    shot(pg, "125-azips-in-commit-ufx-error.png"); pg.click("#mx"); pg.wait_for_timeout(300)
    # Transit hesablar
    pg.click("#z_tranzit"); pg.wait_for_selector("#g_tr tr[data-i='0']")
    shot(pg, "126-azips-tranzit.png"); pg.click("#trx")
    b.close()

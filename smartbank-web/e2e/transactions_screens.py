"""Transaction manager (Packages/TransactionManager) E2E + screenshots (mock mode, fresh API process)."""
import os, sys
from playwright.sync_api import sync_playwright, expect
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n)), print("saved", n))
with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1440, "height": 900})
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "TELLER"); pg.fill("#p", "Teller#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    pg.locator("#tree .node", has_text="Transactions").first.click()
    pg.locator("#tree .node", has_text="Transaction manager").first.click()
    pg.wait_for_selector("#trGrid tbody tr[data-id]"); pg.wait_for_timeout(300)
    expect(pg.locator("#trGrid tbody tr[data-id]")).to_have_count(8)
    expect(pg.locator("#trGrid tr.sel")).to_have_attribute("data-id", "6005")     # Refresh ends on the last row
    shot(pg, "40-transactions-main.png")
    # filter panel: untick USD and committed
    pg.click("[data-a=filter]"); pg.locator("#trFilter [data-cur='840']").uncheck(); pg.wait_for_timeout(300)
    pg.locator("#trFilter [data-st=committed]").uncheck(); pg.wait_for_timeout(400)
    expect(pg.locator("#trGrid tbody tr[data-id]")).to_have_count(3); shot(pg, "41-transactions-filter.png")
    pg.locator("#trFilter [data-cur='840']").check(); pg.locator("#trFilter [data-st=committed]").check(); pg.wait_for_timeout(400)
    pg.click("[data-a=filter]")
    # speed search on the debit account
    pg.fill("[data-ss=debitaccno]", "AZ12SMRT3801001944"); pg.press("[data-ss=debitaccno]", "Enter"); pg.wait_for_selector("#qy"); pg.click("#qy")
    pg.wait_for_timeout(200); expect(pg.locator("#trGrid tr.sel")).to_have_attribute("data-id", "5001")
    # reject the delayed 6002
    pg.locator("#trGrid tr[data-id='6002']").click(); pg.click("[data-a=reject]"); pg.wait_for_selector("#rr"); pg.fill("#rr", "Sənəd natamamdır")
    shot(pg, "42-transactions-reject.png"); pg.click("#ro"); pg.wait_for_timeout(500)
    pg.locator("#trGrid tr[data-id='6002']").click(); expect(pg.locator("#trDetail")).to_contain_text("") ; shot(pg, "43-transactions-rejected-detail.png")
    # delete a TrDelete=1 type -> message
    pg.locator("#trGrid tr[data-id='6004']").click(); pg.click("[data-a=delete]"); pg.wait_for_selector("[data-r=yes]"); pg.click("[data-r=yes]")
    pg.wait_for_selector("#ok"); shot(pg, "44-transactions-delete-blocked.png"); pg.click("#ok")
    # editor: insert USD -> AZN
    pg.click("[data-a=insert]"); pg.wait_for_selector("#tf")
    pg.select_option("#tf [name=debit_currency_id]", "840"); pg.select_option("#tf [name=credit_currency_id]", "944")
    pg.fill("#tf [name=debit_search]", "AZ12SMRT38010084"); pg.wait_for_timeout(300)
    pg.select_option("#tf [name=credit_id]", "1005"); pg.wait_for_timeout(300)
    pg.fill("#tf [name=debit_amount]", "100"); pg.wait_for_timeout(700)
    expect(pg.locator("#tf [name=lamount]")).to_have_value("170"); expect(pg.locator("#tf [name=credit_amount]")).to_have_value("170")
    pg.fill("#tf [name=destno]", "3"); expect(pg.locator("#tf [name=name]")).to_have_value("Mal üçün ödəniş")
    shot(pg, "45-transaction-editor.png")
    pg.click("#ts"); pg.wait_for_timeout(600); expect(pg.locator("#tf [name=lamount]")).to_have_value("0")   # ResetTransaction
    pg.keyboard.press("F3"); pg.wait_for_timeout(300); shot(pg, "46-transaction-destination-picker.png"); pg.keyboard.press("Escape")
    pg.wait_for_timeout(300)
    pg.click("#tx"); pg.wait_for_timeout(600); expect(pg.locator("#trGrid tbody tr[data-id]")).to_have_count(9)
    # step commit of the new + a too-large one -> 1 error message
    pg.click("[data-a=commission]"); pg.wait_for_selector(".modal tr[data-id]"); shot(pg, "47-transactions-commission.png"); pg.click("#cc")
    pg.wait_for_timeout(400)
    pg.locator("#trGrid [data-chk='6003']").check(); pg.locator("#trGrid [data-chk='6001']").check()
    pg.click("[data-a=commit]"); pg.click("#qy"); pg.wait_for_selector("#ok"); shot(pg, "48-transactions-commit-result.png"); pg.click("#ok")
    b.close()
print("TRANSACTIONS E2E OK")

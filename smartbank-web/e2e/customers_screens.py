"""Customers module (Packages/Customer_Operations) E2E + screenshots (mock mode)."""
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
    pg.locator("#tree .node", has_text="Customers").first.click()
    pg.locator("#tree .node", has_text="Customer operations").first.click()
    pg.wait_for_selector("#cGrid tbody tr"); pg.wait_for_selector("#tGrid tbody tr"); pg.wait_for_timeout(300)
    expect(pg.locator("#cGrid tbody tr")).to_have_count(6)
    shot(pg, "30-customers-main.png")
    # speed search by name (Enter), then 'search reached the end' prompt
    pg.fill("#EditName", "cas"); pg.press("#EditName", "Enter"); pg.wait_for_timeout(400)
    expect(pg.locator("#cGrid tr.sel")).to_contain_text("Caspian Trade LLC")
    expect(pg.locator("#aGrid tbody tr")).to_have_count(2)
    pg.locator("#aGrid tr", has_text="AZ12SMRT33010019440000000005").click(); pg.wait_for_timeout(300)
    shot(pg, "31-customers-search-accounts-transactions.png")
    pg.press("#EditName", "Enter"); pg.wait_for_selector(".modal"); shot(pg, "32-customers-search-end.png")
    pg.click("#qn")
    # account-number search
    pg.fill("#SearchAcc", "AZ12SMRT3001"); pg.press("#SearchAcc", "Enter"); pg.wait_for_timeout(400)
    expect(pg.locator("#cGrid tr.sel")).to_contain_text("SmartBank (own)")
    # new customer: validation in ToolButton4Click order
    pg.click("[data-a=new]"); pg.wait_for_selector("#cf"); pg.click("#csave"); pg.wait_for_selector("#cerr .alert")
    expect(pg.locator("#cerr")).to_contain_text("name"); shot(pg, "33-customer-new-validation.png")
    pg.fill("#cf [name=name]", "Black Sanction Ltd"); pg.fill("#cf [name=short_name]", "BSL")
    pg.click("[data-tab=reg]"); pg.fill("#cf [name=inn]", "1999999999"); pg.select_option("#cf [name=incorporation_cntr]", "31")
    pg.click("[data-tab=addr]"); pg.select_option("#cf [name=country_code]", "31"); pg.wait_for_timeout(300)
    pg.select_option("#cf [name=city]", "1"); pg.fill("#cf [name=address]", "Nizami 1"); pg.fill("#cf [name=tph_number]", "+994 12 000")
    pg.click("[data-tab=risk]"); pg.select_option("#cf [name=risk_categ]", "2"); pg.wait_for_timeout(300)
    pg.click("[data-tab=main]"); shot(pg, "34-customer-card.png")
    pg.click("#csave"); pg.wait_for_selector("#pclose"); shot(pg, "35-customer-pep-dialog.png")
    pg.click("#pclose"); pg.wait_for_timeout(300)
    pg.click("#csave"); pg.wait_for_selector(".modal .alert.error"); shot(pg, "36-customer-blacklist.png")
    pg.click("#qy"); pg.wait_for_timeout(700)
    expect(pg.locator("#cGrid tbody tr")).to_have_count(7)
    # new account for a customer
    pg.fill("#EditID", "2"); pg.press("#EditID", "Enter"); pg.wait_for_selector("#qy"); pg.click("#qy"); pg.wait_for_timeout(400)  # from current -> wraps
    pg.click("[data-a=newacc]"); pg.wait_for_selector("#naf"); pg.select_option("#naf [name=currency]", "944")
    pg.select_option("#naf [name=bal_cn]", "3801"); pg.click("#gen"); pg.wait_for_timeout(300)
    shot(pg, "37-customer-new-account.png"); pg.click("#nas"); pg.wait_for_timeout(500)
    expect(pg.locator("#aGrid tbody tr")).to_have_count(2)
    # account documents / states
    pg.fill("#EditID", "1"); pg.press("#EditID", "Enter"); pg.wait_for_selector("#qy"); pg.click("#qy"); pg.wait_for_timeout(400)
    pg.click("[data-a=docs]"); pg.wait_for_selector("#ds"); shot(pg, "38-customer-account-documents.png"); pg.click("#dok")
    # step commit: current committed row -> message; select delayed + rejected
    pg.locator("#tGrid tr[data-id='6003']").click(); pg.click("[data-a=commit]"); pg.wait_for_selector("#qy"); pg.click("#qy")
    pg.wait_for_selector("#ok"); shot(pg, "39-customer-commit-error.png"); pg.click("#ok")
    b.close()
print("CUSTOMERS E2E OK")

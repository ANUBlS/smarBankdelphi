"""E2E smoke test + screenshots (mock mode). Usage: python e2e/screenshots.py [base_url]"""
import sys, os
from playwright.sync_api import sync_playwright, expect

BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")


def shot(page, name):
    page.screenshot(path=os.path.join(OUT, name), full_page=False)
    print("saved", name)


with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1440, "height": 860})
    pg.goto(BASE); pg.wait_for_selector("#loginForm"); shot(pg, "01-login.png")
    pg.fill("#u", "TELLER"); pg.fill("#p", "wrong"); pg.click("#loginBtn")
    pg.wait_for_selector(".alert.error"); expect(pg.locator(".alert.error")).to_contain_text("ORA-01017"); shot(pg, "02-login-error.png")
    pg.fill("#p", "Teller#2026"); pg.click("#loginBtn")
    pg.wait_for_selector(".splash"); shot(pg, "03-splash.png")
    pg.wait_for_selector("#tree .node"); pg.wait_for_timeout(600); shot(pg, "04-main-tree.png")
    pg.click("#expAll"); pg.fill("#treeSearch", "cash"); pg.wait_for_timeout(200); shot(pg, "05-tree-search.png")
    pg.fill("#treeSearch", ""); pg.click("#expAll")
    pg.locator(".node", has_text="Account card").click()
    pg.wait_for_selector(".nm-ill"); expect(pg.locator("#content")).to_contain_text("Not migrated"); shot(pg, "06-not-migrated.png")
    pg.locator(".node", has_text="Balance").click(); pg.wait_for_timeout(300); shot(pg, "07-denied-node.png")
    pg.click("#userBtn"); pg.click("[data-act=company]"); pg.wait_for_selector(".company-list"); shot(pg, "08-company-picker.png")
    pg.locator(".company-list button", has_text="SmartBank Leasing").click(); expect(pg.locator("#hdrCompany")).to_have_text("SmartBank Leasing")
    pg.click("#userBtn"); pg.click("[data-act=password]"); pg.fill("[name=old_password]", "Teller#2026")
    pg.fill("[name=new_password]", "simple"); pg.fill("[name=retype_password]", "simple"); pg.click("#pf .btn:not(.secondary)")
    pg.wait_for_selector("#perr .alert"); expect(pg.locator("#perr")).to_contain_text("not complex"); shot(pg, "09-password-dialog.png")
    pg.click("#pc")
    pg.select_option("#lang", "az"); pg.wait_for_timeout(300); shot(pg, "10-azerbaijani.png"); pg.select_option("#lang", "en")
    pg.click("#userBtn"); pg.click("[data-act=logout]"); pg.wait_for_selector("#loginForm")
    # admin: login history
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    pg.click("#userBtn"); pg.click("[data-act=history]"); pg.wait_for_selector("#htable table"); pg.wait_for_timeout(300)
    shot(pg, "11-login-history.png")
    # idle warning (simulate: force last activity far in the past)
    pg.evaluate("window.SB.state.lastActivity = Date.now() - (window.SB.state.cfg ? 0 : 0) - (45*60-30)*1000")
    pg.wait_for_selector("#idleTxt", timeout=5000); shot(pg, "12-idle-warning.png")
    b.close()
print("E2E OK")

"""XÖHKS step 2 E2E + screenshots 143-146: new batch (TTransForm), beneficiary (TPaymentDetalsForm), templates, delete dialog."""
import os, sys
from playwright.sync_api import sync_playwright
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n), full_page=False), print("saved", n))
IBAN = "AZ77IBAZ38010019440000000777"


def until(pg, fn, ms=8000):          # CSP forbids wait_for_function (no eval) -> poll from Python
    for _ in range(ms // 100):
        try:
            if fn():
                return
        except Exception:
            pass
        pg.wait_for_timeout(100)
    raise AssertionError("timeout")
with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1440, "height": 1000})
    errs = []
    pg.on("pageerror", lambda e: errs.append(str(e)))
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    pg.fill("#treeSearch", "XÖHKS"); pg.wait_for_timeout(300)
    pg.locator("#tree .node", has_text="XÖHKS").last.click(); pg.wait_for_selector("#g_b tr[data-i='3']")
    pg.click("#x_bnew"); pg.wait_for_selector("#tf_kli")
    pg.fill("#tf_kli", "9002"); pg.press("#tf_kli", "Enter"); pg.wait_for_selector("#tf_acc option[value='504']", state="attached")
    pg.select_option("#tf_acc", "504"); until(pg, lambda: pg.input_value("#tf_name") == "KASPIAN SERVIS OMMC")
    shot(pg, "143-xohks-new-batch.png")
    pg.click("#tf_add"); pg.wait_for_selector("#pf_bank")
    pg.click("#pf_tpl"); pg.wait_for_selector("#g_tp tr[data-i='0']")
    shot(pg, "144-xohks-templates.png")
    pg.dblclick("#g_tp tr[data-i='0']"); until(pg, lambda: pg.input_value("#pf_name", timeout=200) == "NURLAN QASIMOV")
    pg.fill("#pf_amt", "250.5")
    shot(pg, "145-xohks-beneficiary.png")
    pg.click("#pf_fin"); pg.wait_for_selector("#pf_bank", state="detached")
    until(pg, lambda: pg.input_value("#tf_amt") == "250.5")
    pg.click("#tf_post"); pg.wait_for_selector("#tf_kli", state="detached")
    pg.wait_for_selector("#g_b tr[data-i='4']")
    pg.click("#g_b tr[data-i='4']"); pg.click("#g_b tr[data-i='3']", modifiers=["Control"])
    pg.click("#x_bdel"); pg.wait_for_selector("[data-b='all']")
    shot(pg, "146-xohks-delete-confirm.png")
    pg.click("[data-b='cancel']")
    assert not errs, errs
    print("ok")
    b.close()

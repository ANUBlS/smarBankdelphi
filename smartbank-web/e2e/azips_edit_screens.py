"""AZIPS (Packages/SWIFT_MANAGER_IBAN_NEW) part 2 E2E + screenshots: OUT_FORM (Yeni / Ctrl+N), MT103, MT103AZN, MT103Show (mock)."""
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
    pg.locator("#tree .node[data-path='9.0']").click(); pg.wait_for_selector("#g_out tr[data-i='0']")
    pg.keyboard.press("Control+n"); pg.wait_for_selector("#reciverbic")
    pg.fill("#reciverbic", "AIIBAZ2X"); pg.press("#reciverbic", "Tab"); pg.wait_for_timeout(600); assert pg.input_value('#Edit2') == 'AZER TURK BANK'
    shot(pg, "105-azips-new-header.png")
    pg.click(".modal .tabs button[data-t=x]")
    pg.fill("#Edit11_mf32a", "250.75")
    pg.focus("#CMF50"); pg.wait_for_selector("#CMF50 option:nth-child(2)", state="attached")
    pg.select_option("#CMF50", index=1); pg.wait_for_selector("[data-p=MF50K]:not([hidden])")
    pg.fill("#Edit7", "AZ41SMRT00000000000000001944"); pg.press("#Edit7", "Tab"); pg.wait_for_selector("#Edit3_MF50 option:nth-child(2)", state="attached")
    pg.select_option("#Edit3_MF50", index=1); pg.fill("#Memo2_MF50", "smart llc\n1234567890")
    pg.focus("#CMF59"); pg.wait_for_selector("#CMF59 option:nth-child(2)", state="attached")
    pg.select_option("#CMF59", index=1); pg.fill("#Edit1_MF59", "AZ12AIIB00000000000000000001"); pg.fill("#Memo2_MF59", "ali aliyev")
    pg.fill("#OF70_RichEdit", "SALARY OCTOBER"); pg.wait_for_timeout(400)
    shot(pg, "106-azips-new-text.png")
    pg.click("#Mtcreate"); pg.wait_for_selector("#reciverbic", state="detached"); pg.wait_for_timeout(500)
    # MT103 editor on the 'New created messages' grid
    pg.locator("#g_out tbody tr", has_text="9104").click(); pg.click("#z_edit"); pg.wait_for_selector("#MtCreate")
    shot(pg, "107-azips-edit-mt103.png")
    pg.click("#ax")
    pg.locator("#g_out tbody tr", has_text="9105").click(); pg.click("#z_edit"); pg.wait_for_selector("#Change1")
    shot(pg, "108-azips-edit-mt103azn.png")
    pg.fill("#DBEdit8", "821"); pg.click("#Change1"); pg.wait_for_selector("#Change1", state="detached")
    pg.locator("#g_out2 tbody tr", has_text="9103").click(); pg.click("#z_view"); pg.wait_for_selector(".modal h3")
    assert "MT103Show" in pg.inner_text(".modal h3")
    shot(pg, "109-azips-show-mt103.png")
    b.close()

"""XÖHKS step 3b E2E + screenshots 150-154: status images, TTransCodeForm tree, Faylı Hazırla (ready -> sending -> XML), Gedən fayl."""
import os, sys
from playwright.sync_api import sync_playwright
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n), full_page=False), print("saved", n))
with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1440, "height": 1000}, accept_downloads=True)
    errs = []
    pg.on("pageerror", lambda e: errs.append(str(e)))
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    pg.fill("#treeSearch", "XÖHKS"); pg.wait_for_timeout(300)
    pg.locator("#tree .node", has_text="XÖHKS").last.click(); pg.wait_for_selector("#g_b tr[data-i='0']")
    assert pg.locator("#g_b img[src*='status_']").count() > 0
    shot(pg, "150-xohks-status-images.png")
    pg.click("#x_bnew"); pg.wait_for_selector("#tf_kli")
    pg.fill("#tf_kli", "9002"); pg.press("#tf_kli", "Enter"); pg.wait_for_selector("#tf_acc option[value='504']", state="attached")
    pg.select_option("#tf_acc", "504"); pg.wait_for_timeout(500)
    pg.click("#tf_add"); pg.wait_for_selector("#pf_tcb")
    pg.click("#pf_tcb"); pg.wait_for_selector("#tc_t details")
    pg.locator("#tc_t details summary").first.click(); pg.locator("#tc_t div.tc-n").first.click()
    shot(pg, "151-xohks-transcode-tree.png")
    pg.click("#tc_ok"); pg.wait_for_selector("#tc_t", state="detached")
    assert pg.input_value("#pf_tc") == "101", pg.input_value("#pf_tc")
    pg.click("#pf_close"); pg.wait_for_timeout(400)
    if pg.locator("#tf_cancel").count(): pg.click("#tf_cancel"); pg.wait_for_timeout(400)
    pg.click("#x_pf"); pg.wait_for_selector("#pf_ready tr[data-i='0']")
    pg.click("#pf_to"); pg.wait_for_selector("#pf_send tr[data-i='0']")
    pg.click("#pf_newr"); pg.wait_for_timeout(400)
    shot(pg, "152-xohks-prepare-file.png")
    with pg.expect_download() as d:
        pg.click("#pf_mk")
    print("downloaded", d.value.suggested_filename)
    pg.wait_for_timeout(400)
    shot(pg, "153-xohks-file-created.png")
    pg.click("#pf_x"); pg.wait_for_timeout(400)
    pg.click("#x_sent"); pg.wait_for_selector("#g_sf")
    pg.fill("#sf_b", "2026-01-01"); pg.click("#sf_r"); pg.wait_for_timeout(500)
    shot(pg, "154-xohks-sent-files.png")
    assert not errs, errs
    b.close()

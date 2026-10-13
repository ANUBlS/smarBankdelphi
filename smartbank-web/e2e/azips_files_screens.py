"""AZIPS part 3 E2E + screenshots: 'Avtorizator' (CreateFileClick -> PACS0008Execute) on the Sending grid (mock)."""
import os, sys
from playwright.sync_api import sync_playwright
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n), full_page=True), print("saved", n))
with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1440, "height": 1000}, accept_downloads=True)
    pg.on("dialog", lambda d: d.accept())
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    pg.fill("#treeSearch", "AZIPS"); pg.wait_for_timeout(300)
    pg.locator("#tree .node[data-path='9.0']").click(); pg.wait_for_selector("#g_out3 tr[data-i='0']")
    pg.locator("#g_out3 tbody tr", has_text="9101").click()
    pg.locator("#g_out3 tbody tr", has_text="9109").click(modifiers=["Control"])
    shot(pg, "110-azips-sending-selected.png")
    pg.click("#z_file"); pg.wait_for_selector("#fprev")
    assert pg.locator("#fl a").count() == 2 and "camt.056.001.10" in pg.inner_text("#fprev")
    with pg.expect_download() as dl:
        pg.locator("#fl a", has_text="pacs09101").click()
    d = dl.value
    assert d.suggested_filename == "pacs09101.xml", d.suggested_filename
    data = open(d.path(), "rb").read()
    assert data.startswith(b'<?xml version="1.0" encoding="UTF-8"?> \r\n') and b"\r\n" in data
    shot(pg, "111-azips-files-created.png")
    b.close()

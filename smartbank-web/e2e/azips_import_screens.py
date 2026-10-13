"""AZIPS part 3b E2E + screenshots: 'Konvert' (ToolButton4Click -> konvert3Execute) with ONE uploaded .fin file (mock)."""
import os, sys
from playwright.sync_api import sync_playwright
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n), full_page=True), print("saved", n))
FIN = "\r\n".join([
    "{1:F01AIIBAZ2XAXXX0000000000}{2:O1031200261013CBARAZ2XAXXX00000000002610131200N}{4:",
    ":20:AZIPS2610130001", ":23B:CRED", ":32A:261013AZN1500,75", ":50K:/AZ21NABZ01350100000000001944", "ALIYEV ALI",
    ":59:/AZ77CBAR00000000000000000001", "MAMMADOV VALI", "1234567890/AZ", "210005 KAPITAL BAN", "AZ37NABZ0000",
    ":70:PAYMENT", "-}{5:{CHK:ABC}}"]) + "\r\n"
with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1440, "height": 1000})
    pg.on("dialog", lambda d: d.accept())
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    pg.fill("#treeSearch", "AZIPS"); pg.wait_for_timeout(300)
    pg.locator("#tree .node[data-path='9.0']").click(); pg.wait_for_selector("#g_out3 tr[data-i='0']")
    pg.click(".tabs button[data-tab='in']"); pg.wait_for_selector("#z_konv")
    pg.set_input_files("#z_konvf", files=[{"name": "in1.fin", "mimeType": "text/plain", "buffer": FIN.encode("cp1254")}])
    pg.wait_for_selector("#kx")
    assert "AZIPS2610130001" in pg.inner_text(".modal, body")
    shot(pg, "112-azips-konvert-result.png")
    pg.click("#kx"); pg.wait_for_selector("#g_in tbody tr", state="attached"); pg.wait_for_timeout(500)
    assert "AZIPS2610130001" in pg.inner_text("#g_in")
    shot(pg, "113-azips-incoming-after-import.png")
    b.close()

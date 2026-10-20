"""Cards ▸ Əməliyyat step 4b-4d E2E + screenshots 227-234: XML Göndər (cfile_addi), Dxxx, SMS, D File, Exchange file, Kliring, Limitlər."""
import base64, os, sys, tempfile
from playwright.sync_api import sync_playwright
sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "api"))
from tests import fo_files as FF  # noqa: E402
from tests.test_cards_caddi import XML  # noqa: E402
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n), full_page=False), print("saved", n))
errors = []
tmp = tempfile.mkdtemp()


def f(name, data):
    p = os.path.join(tmp, name); open(p, "wb").write(data); return p


with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1440, "height": 1000}, accept_downloads=True)
    pg.on("pageerror", lambda e: (errors.append(str(e)), print("pageerror:", e)))
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    pg.fill("#treeSearch", "Cards"); pg.wait_for_timeout(300)
    pg.locator("#tree .node", has_text="Cards").last.click(); pg.wait_for_selector("#g_c tr[data-i='0']")
    menu = lambda mi: (pg.click("#m2 summary"), pg.click(f"[data-mi={mi}]"))  # noqa: E731
    menu("cfile"); pg.wait_for_selector("#cf_g1"); pg.click("#cf_m"); pg.wait_for_selector("#ca_g1")
    pg.set_input_files("#ca_f", f("doc.xml", XML.encode())); pg.wait_for_selector("#ca_fn:has-text('doc.xml')")
    pg.click("#ca_b"); pg.wait_for_selector("#ca_g1 tbody tr[data-id='5']")
    shot(pg, "227-cards-cfile-xml-loaded.png")
    menu("dxxx"); pg.wait_for_selector("#fo_g1")
    pg.set_input_files("#fo_f", f("DTUR_XXX.293", FF.dxxx())); pg.wait_for_selector("#fo_fn:has-text('DTUR_XXX')")
    pg.click("#fo_r"); pg.wait_for_selector("#fo_rich span")
    shot(pg, "228-cards-dxxx-preview.png")
    pg.click("#fo_b"); pg.wait_for_selector("#fo_g1 tbody tr[data-id='3']")
    shot(pg, "229-cards-dxxx-tobase.png")
    menu("sms"); pg.wait_for_selector("#fo_g1")
    pg.set_input_files("#fo_f", f("SMS0001.293", FF.sms())); pg.wait_for_selector("#fo_fn:has-text('SMS0001')")
    pg.click("#fo_r"); pg.wait_for_timeout(400); pg.click("#fo_b"); pg.wait_for_selector("#fo_g1 tbody tr[data-id]")
    shot(pg, "230-cards-sms.png")
    menu("dfile"); pg.wait_for_selector("#fo_g1")
    pg.set_input_files("#fo_f", f("D5076001.293", FF.dfile())); pg.wait_for_selector("#fo_fn:has-text('D5076001')")
    pg.click("#fo_b"); pg.wait_for_timeout(600)
    shot(pg, "231-cards-dfile.png")
    menu("exchange"); pg.wait_for_selector("#fo_g1")
    pg.set_input_files("#fo_f", f("E0002.293", FF.exchange())); pg.wait_for_selector("#fo_fn:has-text('E0002')")
    pg.click("#fo_b"); pg.wait_for_selector("#fo_g1 tbody tr[data-id]")
    shot(pg, "232-cards-exchange.png")
    menu("kliring"); pg.wait_for_selector("#kl_g1"); pg.click("#kl_b"); pg.wait_for_selector("#kl_g1 tbody tr[data-id]")
    shot(pg, "233-cards-kliring.png")
    menu("limits"); pg.wait_for_selector("#li_g1 tbody tr")
    shot(pg, "234-cards-limits.png")
    b.close()
print("errors:", errors)
sys.exit(1 if errors else 0)

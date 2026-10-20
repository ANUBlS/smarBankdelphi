"""Cards step 4e-4f E2E + screenshots 235-241: Excel yükləmələr sub forms (Salary, NEW CARD, PROLONGATION, Account_close), Card Number Change
(Auto / Manual), Commission Our POS-ONUS."""
import datetime as dt, os, sys, tempfile
from openpyxl import Workbook
from playwright.sync_api import sync_playwright
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n), full_page=False), print("saved", n))
errors = []
tmp = tempfile.mkdtemp()


def xlsx(name, cells):
    w = Workbook(); s = w.active; s.title = "CARDS"
    for (r, c), v in cells.items():
        s.cell(r, c, v)
    p = os.path.join(tmp, name); w.save(p); return p


def line(ref, card, name, card2, acc):
    s = list(" " * 140)
    for pos, v in ((1, ref), (34, card), (51, name), (89, card2), (106, acc)):
        s[pos - 1:pos - 1 + len(v)] = v
    return "".join(s).rstrip()


with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1440, "height": 1000}, accept_downloads=True)
    pg.on("pageerror", lambda e: (errors.append(str(e)), print("pageerror:", e)))
    pg.on("dialog", lambda d: d.accept())
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    pg.fill("#treeSearch", "Cards"); pg.wait_for_timeout(300)
    pg.locator("#tree .node", has_text="Cards").last.click(); pg.wait_for_selector("#g_c tr[data-i='0']")
    menu = lambda mi: (pg.click("#m2 summary"), pg.click(f"[data-mi={mi}]"))  # noqa: E731
    yes = lambda: pg.locator(".modal [data-a=yes]").last.click()  # noqa: E731

    def sub(row_id):
        menu("excel"); pg.wait_for_selector("#ex_g"); pg.click(f"#ex_g tbody tr[data-id='{row_id}']"); pg.click("#ex_o"); pg.wait_for_selector("#xs_b")

    def upload(path):
        with pg.expect_file_chooser() as fc:
            pg.click("#xs_b")
        fc.value.set_files(path)

    sub(1)
    upload(xlsx("salary.xlsx", {(6, 3): "OKT-2026", (10, 2): "MAMMADOV ELCHIN", (10, 3): "38110019440000000001", (10, 4): 120.5, (10, 5): "AZN",
                                (10, 6): "38010019440000000001", (11, 2): "QULIYEV AYDIN", (11, 3): "38110019440000000004", (11, 4): 80, (11, 5): "AZN"}))
    pg.wait_for_selector("#xs_g1 tbody tr[data-id]"); pg.wait_for_timeout(300)
    shot(pg, "235-cards-xls-salary.png")
    pg.click("#xs_close"); sub(2)
    pg.fill("#xs_dt", (dt.date.today() + dt.timedelta(days=1)).isoformat())
    cells = {}
    for i, v in enumerate(["LEYLA", "KARIMOVA", "01.02.1995", "AZE3000001", "RESIDENT", "MOTHER", "0505550002", "VISA CLASSIC",
                           "38110019440000000006", "Baku", "TURANBANK"]):
        cells[(2, 2 + i)] = v
    upload(xlsx("new.xlsx", cells)); pg.wait_for_selector("#xs_g1 tbody tr[data-id]"); pg.wait_for_timeout(300)
    shot(pg, "236-cards-xls-newcard.png")
    pg.click("#xs_close"); sub(3)
    upload(xlsx("prol.xlsx", {(2, 1): "4169730000001111", (2, 2): dt.datetime(2029, 3, 31), (3, 1): "4169730000003333", (3, 2): "31.12.2028"}))
    pg.wait_for_selector("#xs_g1 tbody tr[data-id]"); pg.click("#xs_c"); pg.wait_for_timeout(500)
    shot(pg, "237-cards-xls-prolongation.png")
    pg.click("#xs_close"); sub(4)
    upload(xlsx("acc.xlsx", {(2, 1): "5239820000005555", (3, 1): "4169730000003333"})); pg.wait_for_selector("#xs_g1 tbody tr[data-id]")
    pg.wait_for_timeout(300)
    shot(pg, "238-cards-xls-accountclose.png")
    menu("cardnumber"); pg.wait_for_selector("#cn_g1")
    p_ = os.path.join(tmp, "CHG0001.txt")
    open(p_, "wb").write("\r\n".join([line("700501", "5239820000005555", "ISMAYILOV TURAL", "5239820000005599", "38110019440000000005"),
                                      line("799999", "4169730000001111", "NOBODY", "4169730000001199", "38110019440000000001")]).encode("cp1254"))
    pg.set_input_files("#cn_f", p_); pg.wait_for_selector("#cn_fn:has-text('CHG0001')")
    pg.click("#cn_b"); pg.wait_for_selector("#cn_g1 tbody tr[data-id]"); pg.wait_for_timeout(300)
    shot(pg, "239-cards-cardnumber-auto.png")
    pg.click("#cn_tm"); pg.wait_for_selector("#cn_e1"); pg.fill("#cn_e1", "700501"); pg.press("#cn_e1", "Enter"); pg.wait_for_timeout(600)
    shot(pg, "240-cards-cardnumber-manual.png")
    menu("poscomm"); pg.wait_for_selector("#po_g1 tbody tr[data-id]")
    pg.click("#po_g1 tbody tr[data-id='1']"); pg.click("#po_c"); pg.wait_for_selector(".modal [data-a=yes]"); yes(); pg.wait_for_timeout(700)
    shot(pg, "241-cards-pos-onus.png")
    b.close()
print("errors:", errors)
sys.exit(1 if errors else 0)

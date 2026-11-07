"""Cards ▸ Sazlama sub forms 3, 5-11, 13, 14 (cards_sett2.js) E2E + screenshots 214-223."""
import os, sys
from playwright.sync_api import sync_playwright
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n), full_page=False), print("saved", n))
FORMS = [(3, "crdtype", "#cg"), (5, "filialaccounts", "#fg"), (6, "domesticbank", "#dg"), (7, "banksettings", "#bs"), (8, "atmendpos", "#ag"),
         (9, "poscomission", "#pg"), (10, "unit155", "#ng"), (11, "cardbranch", "#cbg"), (13, "excsett", "#eg"), (14, "taxfilessettings", "#tg")]
errors = []
with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1440, "height": 1000})
    pg.on("pageerror", lambda e: (errors.append(str(e)), print("pageerror:", e)))
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    pg.fill("#treeSearch", "Cards"); pg.wait_for_timeout(300)
    pg.locator("#tree .node", has_text="Cards").last.click(); pg.wait_for_selector("#g_c tr[data-i='0']")
    pg.click("[data-ni=sett]"); pg.wait_for_selector("#st_g tbody tr[data-id]")
    for n, (fid, name, sel) in enumerate(FORMS, 214):
        pg.click(f"#st_g tbody tr[data-id='{fid}']"); pg.click("#st_open"); pg.wait_for_selector(sel)
        if name == "excsett":
            pg.select_option("#ef", "101"); pg.wait_for_timeout(400)
        if name == "taxfilessettings":
            pg.select_option("#tf", "101"); pg.select_option("#tv", "944"); pg.wait_for_timeout(400)
        if name == "cardbranch":
            pg.click("#cbg"); pg.keyboard.press("F11"); pg.wait_for_selector("#cbx:visible")
        if name == "crdtype":
            pg.fill("#c1", "MC STD"); pg.click("#ca"); pg.wait_for_timeout(400)        # missing boxes -> 'Xanalar tam doldurulmalıdır!'
        pg.wait_for_timeout(300)
        shot(pg, f"{n}-cards-sett-{name}.png")
        pg.locator(".modal [data-x]").last.click(); pg.wait_for_timeout(200)
    b.close()
print("errors:", errors)
sys.exit(1 if errors else 0)

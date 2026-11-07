"""E2E: ASAN Finance (Packages/ASANFinance) - screenshots 369-371 (mock mode, ASAN_MODE=mock)."""
import os, sys, re
from playwright.sync_api import sync_playwright
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n)), print("saved", n))


with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1600, "height": 960})
    pg.on("dialog", lambda d: d.accept())
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    loc = pg.locator("#tree .node").filter(has=pg.locator(".cap", has_text=re.compile("^ASAN Finance$")))
    if not loc.last.is_visible():
        pg.locator("#tree .node", has_text="Payments").first.click(); pg.wait_for_timeout(200)
    loc.last.click(); pg.wait_for_selector("#aPIN")
    pg.fill("#aPIN", "5zx7k2p"); pg.fill("#aPasp", "AA1234567"); pg.click("#aPersBtn"); pg.wait_for_timeout(600)
    assert pg.input_value("#aF_Surname") == "Həsənov"
    shot(pg, "369-asan-personal.png")
    pg.click("#aTabs .tab[data-t='2']"); pg.fill("#aE1", "5ZX7K2P"); pg.click("#aB1"); pg.wait_for_selector("#aGA tbody tr")
    shot(pg, "370-asan-workplaces.png")
    pg.click("#aTabs .tab[data-t='4']"); pg.fill("#aE3", "5ZX7K2P"); pg.click("#aB3"); pg.wait_for_selector("#aGF tbody tr")
    shot(pg, "371-asan-farm.png")
    b.close()

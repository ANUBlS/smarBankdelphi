"""RatesViewer / MemorialOrder E2E + screenshots 358-362 (mock mode)."""
import os, sys, re
from playwright.sync_api import sync_playwright, expect
BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:3000"
OUT = os.path.join(os.path.dirname(__file__), "..", "docs", "screenshots")
CHROME = os.getenv("CHROME_PATH", "/usr/bin/google-chrome")
shot = lambda pg, n: (pg.screenshot(path=os.path.join(OUT, n)), print("saved", n))


def node(pg, text, section):
    loc = pg.locator("#tree .node").filter(has=pg.locator(".cap", has_text=re.compile("^" + re.escape(text) + "$")))
    if not loc.last.is_visible():
        pg.locator("#tree .node", has_text=section).first.click(); pg.wait_for_timeout(200)
    loc.last.click()


with sync_playwright() as p:
    b = p.chromium.launch(executable_path=CHROME if os.path.exists(CHROME) else None, args=["--no-sandbox"])
    pg = b.new_page(viewport={"width": 1600, "height": 960})
    pg.goto(BASE); pg.wait_for_selector("#loginForm")
    pg.fill("#u", "ADMIN"); pg.fill("#p", "Admin#2026"); pg.click("#loginBtn"); pg.wait_for_selector("#tree .node")
    # Rates viewer
    node(pg, "Rates viewer", "Transactions"); pg.wait_for_selector("#rvGrid")
    assert pg.locator("#rvFilter").is_visible()
    shot(pg, "358-ratesviewer.png")
    pg.keyboard.press("Control+f"); pg.wait_for_timeout(200)
    assert not pg.locator("#rvFilter").is_visible()
    shot(pg, "359-ratesviewer-ctrlf.png")
    # Memorial order
    node(pg, "Memorial order", "Payments"); pg.wait_for_selector("#moGrid")
    assert pg.locator("#moDebAcc").is_disabled()
    pg.click("#moUseFilter"); assert not pg.locator("#moDebAcc").is_disabled()
    pg.click("#moSelf"); assert pg.locator("#moUser").is_disabled()
    shot(pg, "360-memorialorder.png")
    pg.click("#moTuning"); pg.wait_for_selector("#tGrid tr[data-i]")
    expect(pg.locator("#tGrid tr[data-i]")).to_have_count(5)
    pg.click("#tNav button[data-b='insert']"); pg.fill("#tVal", "1301")
    shot(pg, "361-mo-tuning-insert.png")
    pg.click("#tNav button[data-b='post']")
    expect(pg.locator("#tGrid tr[data-i]")).to_have_count(6)
    pg.click("#tNav button[data-b='edit']"); pg.fill("#tVal", "abc"); pg.click("#tNav button[data-b='post']")
    pg.wait_for_selector(".toast.error")
    shot(pg, "362-mo-tuning-post-error.png")
    pg.click("#tNav button[data-b='cancel']")
    pg.on("dialog", lambda d: d.accept())
    pg.click("#tNav button[data-b='delete']")
    expect(pg.locator("#tGrid tr[data-i]")).to_have_count(5)
    b.close()

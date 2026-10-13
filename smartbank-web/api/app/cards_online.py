"""Cards ▸ Prosedur ▸ Online Cards (cards_azericard onlinec.pas Tonline, MAINFORMImpl1 OnlineCards1Click :990, no right check) and
Prosedur ▸ Karta Mədaxil (card_ufx.pas TUFXFORM, K1Click :547, no right check) with its Arxiv (arxivufx.pas TUFX_ARXIV).

Tonline: DBGrid1 = DataMod_CARDS.online -> Online_Cards ('select * from card_online_app', Unit18.dfm). The dataset is never opened
(OnlineCards1Click's Open is commented out, not Active in the dfm), so the grid shows the persistent field columns and no rows.
Button1 'Kartı hazırla' (right card_madd) opens Tclients2 with Edit1 = 'ONLINE' (cards.form_open mode ONLINE; saving goes the NEW way,
Unitclient2.pas :682). Button2 'Sil' has no OnClick.

TUFXFORM: FormShow: card_main.card_ufx_proc (no commit), Card_inn ('select * from card_ufx order by id') Close / Open. Button1 'Yenilə':
Card_inn.Refresh. Button2 'Arxiv': TUFX_ARXIV: begdat / enddat keep their design-time dates (arxivufx.dfm Date = 43025 = 18.10.2017),
Button1 'Yenilə': card_uxfarxiv dat1 / dat2 := trunc(begdat / enddat), Open (Button3 'Yenilə' on Panel1 has no OnClick).
DBGrid1DrawColumnCell (both forms): column 1 'Status' draws ImageList1 STATUS 0 -> 13, 1 / 2 -> 3, 3 -> 0 (img/cards/ufx_status_N.png,
ufxarx_status_N.png, extracted from card_ufx.dfm / arxivufx.dfm); other values keep the previous ImageIndex (uninitialised in Delphi:
the web draws nothing)."""
from __future__ import annotations
import datetime as dt

from fastapi import APIRouter, Depends
from pydantic import BaseModel

from . import cards_sql as Q
from .cards import CLSID
from .customers import row

ONLINE_COLS = ["ID", "STATUS", "CARDHOLDER", "TITUL", "FNAME", "LNAME", "PASSPORT", "HOMEPHONE", "WORKPHONE", "COUNTRY", "CITY",
               "ADDRESS", "RESIDENT", "CURRENCY", "CARDTYPE", "COMPANY", "SECURITY", "URG", "WITHP"]      # Online_Cards persistent TFields
UFX_COLS = ["ID", "", "TRANID", "VALUTE", "AMOUNT", "CARDNUMBER", "CARD_NAME", "ACC_NO", "EX_ID", "FROMMODUL", "RRN", "OP_DATE", "INFO"]
UFX_TITLES = {"": "Status", "TRANID": "Tranzaksiya ID", "EX_ID": "Express_id", "OP_DATE": "Tarixi"}
STATUS_IMG = {0: 13, 1: 3, 2: 3, 3: 0}
ARX_DATES = (dt.date(2017, 10, 18), dt.date(2017, 10, 18))            # arxivufx.dfm begdat / enddat Date = 43025(.43...)


def _st(ws) -> dict:
    return ws.module_state.setdefault("cards_ufx", {})


def online_open(ws) -> dict:
    return {"cols": ONLINE_COLS, "rows": []}


def ufx_open(ws) -> dict:
    ws.conn.call_proc("card_main", "card_ufx_proc", [], commit=False)                 # FormShow
    s = _st(ws)
    s["open"] = True
    return _ufx_view(ws)


def _ufx_view(ws):
    rows = [row(r) for r in ws.conn.query(Q.text(Q.LINES_CARD_INN), {})]
    return {"cols": UFX_COLS, "titles": UFX_TITLES, "status_img": STATUS_IMG, "rows": rows}


def ufx_refresh(ws) -> dict:
    if not _st(ws).get("open"):
        raise LookupError("ufx")
    return _ufx_view(ws)


def arxiv_open(ws) -> dict:
    if not _st(ws).get("open"):
        raise LookupError("ufx")
    return {"cols": UFX_COLS, "titles": UFX_TITLES, "status_img": STATUS_IMG, "rows": [],
            "begdat": ARX_DATES[0].isoformat(), "enddat": ARX_DATES[1].isoformat()}


def arxiv_refresh(ws, d1: dt.date, d2: dt.date) -> dict:
    if not _st(ws).get("open"):
        raise LookupError("ufx")
    rows = [row(r) for r in ws.conn.query(Q.text(Q.LINES_CARD_UXFARXIV), {"dat1": d1, "dat2": d2})]
    return {"cols": UFX_COLS, "titles": UFX_TITLES, "status_img": STATUS_IMG, "rows": rows,
            "begdat": d1.isoformat(), "enddat": d2.isoformat()}


class ArxIn(BaseModel):
    begdat: dt.date
    enddat: dt.date


def make_router(current, require_module, err):
    r = APIRouter(prefix="/api/cards")
    g = require_module(CLSID)

    def _fe(fn, *a):
        try:
            return fn(*a)
        except LookupError:
            err(409, "error.bad_request")

    @r.post("/online/open")
    def _oo(ws=Depends(g)):
        return online_open(ws)

    @r.post("/ufx/open")
    def _uo(ws=Depends(g)):
        return ufx_open(ws)

    @r.post("/ufx/refresh")
    def _ur(ws=Depends(g)):
        return _fe(ufx_refresh, ws)

    @r.post("/ufx/arxiv/open")
    def _ao(ws=Depends(g)):
        return _fe(arxiv_open, ws)

    @r.post("/ufx/arxiv/refresh")
    def _ar(b: ArxIn, ws=Depends(g)):
        return _fe(arxiv_refresh, ws, b.begdat, b.enddat)

    return r

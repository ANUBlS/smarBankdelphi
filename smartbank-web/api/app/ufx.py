"""UFX71 fundstransfer web service (Packages/SWIFT_MANAGER_IBAN_NEW/UFX71.pas) behind an interface.

Delphi: UFX71.GetUFX7.fundstransfer(rbsnumber, MsgCode, LocalDt, Description, Currency, Amount): string
(SWIFT_MAINImpl1.pas:7211). UFX71.pas:303-345 GetUFX7 without arguments -> RIO.URL := defURL
'http://10.0.11.96:8080/UFXFundsTransfer/UFX7'; UFX71.pas:558-578: namespace 'http://webser/', UTF-8, ioDocument
(document/literal), SOAPAction '' , parameters unqualified (IS_UNQL), result element 'return'.

Modes (env):
  UFX_MODE=real   -> HTTP POST of the same SOAP 1.1 envelope to UFX_URL (default = Delphi defURL), timeouts
                     UFX_CONNECT_TIMEOUT / UFX_TIMEOUT (seconds), optional UFX_CA_FILE, UFX_CLIENT_CERT, UFX_CLIENT_KEY.
  UFX_MODE=mock   -> canned responses, never touches the network. Default when DB_MODE=mock.
A SOAP fault / HTTP error raises UfxError(text) - Delphi raises ERemotableException / ESOAPHTTPException, which aborts
AddINTransNewExecute (and comitClick before its Commit).
"""
from __future__ import annotations
import os
import ssl
import urllib.error
import urllib.request
import xml.etree.ElementTree as ET
from typing import Protocol
from xml.sax.saxutils import escape

DEF_URL = "http://10.0.11.96:8080/UFXFundsTransfer/UFX7"      # UFX71.pas:306
NS = "http://webser/"                                         # UFX71.pas:559
SOAP_ENV = "http://schemas.xmlsoap.org/soap/envelope/"
PARAMS = ("rbsnumber", "MsgCode", "LocalDt", "Description", "Currency", "Amount")   # UFX71.pas:293, 565-576


class UfxError(Exception):
    pass


class UfxClient(Protocol):
    def fundstransfer(self, rbsnumber: str, msg_code: str, local_dt: str, description: str, currency: str,
                      amount: str) -> str: ...


def envelope(*args: str) -> bytes:
    """The request Delphi's THTTPRIO writes for a document/literal call with unqualified parts."""
    parts = "".join(f"<{n}>{escape(str(v))}</{n}>" for n, v in zip(PARAMS, args))
    return ('<?xml version="1.0" encoding="UTF-8"?>'
            f'<SOAP-ENV:Envelope xmlns:SOAP-ENV="{SOAP_ENV}"><SOAP-ENV:Body>'
            f'<NS1:fundstransfer xmlns:NS1="{NS}">{parts}</NS1:fundstransfer>'
            '</SOAP-ENV:Body></SOAP-ENV:Envelope>').encode("utf-8")


def parse_response(body: bytes) -> str:
    """fundstransferResponse/return text ('' when the element is empty); SOAP Fault -> UfxError(faultstring)."""
    try:
        root = ET.fromstring(body)
    except ET.ParseError as e:
        raise UfxError(f"UFX: invalid response ({e})")
    for el in root.iter():
        if el.tag.rsplit("}", 1)[-1] == "Fault":
            fs = next((c.text for c in el.iter() if c.tag.rsplit("}", 1)[-1] == "faultstring"), None)
            raise UfxError(fs or "UFX: SOAP fault")
    for el in root.iter():
        if el.tag.rsplit("}", 1)[-1] == "return":
            return el.text or ""
    raise UfxError("UFX: no 'return' element in response")


class RealUfx:
    def __init__(self):
        self.url = os.getenv("UFX_URL", DEF_URL)
        self.timeout = float(os.getenv("UFX_TIMEOUT", "60"))
        self.ctx = None
        if self.url.lower().startswith("https"):
            self.ctx = ssl.create_default_context(cafile=os.getenv("UFX_CA_FILE") or None)
            if os.getenv("UFX_CLIENT_CERT"):
                self.ctx.load_cert_chain(os.getenv("UFX_CLIENT_CERT"), os.getenv("UFX_CLIENT_KEY") or None)

    def fundstransfer(self, *args: str) -> str:
        req = urllib.request.Request(self.url, data=envelope(*args), method="POST",
                                     headers={"Content-Type": "text/xml; charset=utf-8", "SOAPAction": '""'})
        try:
            with urllib.request.urlopen(req, timeout=self.timeout, context=self.ctx) as r:
                return parse_response(r.read())
        except urllib.error.HTTPError as e:          # SOAP faults come back as HTTP 500 with a Fault body
            body = e.read()
            if body:
                return parse_response(body)
            raise UfxError(f"UFX: HTTP {e.code}")
        except (urllib.error.URLError, OSError) as e:
            raise UfxError(f"UFX: {e}")


class MockUfx:
    """Canned responses (format 'RRN#text' as the real service, SWIFT_MAINImpl1.pas:7214-7216):
    card number ending 0002 -> 'Insufficient funds', 0003 -> 'Card not found', 0009 -> SOAP fault; else success."""
    calls: list = []

    def fundstransfer(self, *args: str) -> str:
        MockUfx.calls.append(list(args))
        card = str(args[0])
        if card.endswith("0009"):
            raise UfxError("java.io.IOException: Connection refused (mock fault)")
        if card.endswith("0002"):
            return "000000000002#Insufficient funds"
        if card.endswith("0003"):
            return "000000000003#Card not found"
        return "%012d#Successfully processed" % (len(MockUfx.calls))


def client() -> UfxClient:
    mode = os.getenv("UFX_MODE") or ("mock" if os.getenv("DB_MODE", "mock").lower() == "mock" else "real")
    return MockUfx() if mode.lower() == "mock" else RealUfx()

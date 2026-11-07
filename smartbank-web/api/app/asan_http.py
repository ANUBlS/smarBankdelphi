"""ASAN Finance HTTP service (prod.asanfinance.gov.az) behind an interface - Delphi TASANFinanceForm.CheckAsan
(ASANFinanceImpl.pas, TIdHTTP): header 'ApiKey:' + BankInfo.fond_reg_no, Cache-Control / Pragma no-cache, Connection
Keep-Alive, Content-Type 'application/json; charset=utf-8', ReadTimeout 3000 ms, HandleRedirects.
  GET  BASE + url + Fin                                    (EmployeeInfo, PensionInfo, FarmInfo, VoenInfo, Balance)
  GET  BASE + url + 'PinAndDocNumber?pin=' + Fin + '&docNumber=' + PaspNum   (Personalinfo)
  POST BASE + '/api/v1/Info/Expenses' body = the JSON text  (BalanceExp)
Modes (env): ASAN_MODE=real -> HTTP to ASAN_URL (default = the Delphi constant 'http://prod.asanfinance.gov.az');
ASAN_MODE=mock -> canned JSON, never touches the network (default when DB_MODE=mock).
An HTTP error / timeout raises AsanError(text) (Indy raises EIdHTTPProtocolException / EIdReadTimeout)."""
from __future__ import annotations
import json
import os
import urllib.error
import urllib.parse
import urllib.request

BASE = "http://prod.asanfinance.gov.az"          # ASANFinanceImpl.pas CheckAsan (hard-coded)
EXPENSES = "/api/v1/Info/Expenses"


class AsanError(Exception):
    pass


def base() -> str:
    return os.getenv("ASAN_URL") or BASE


class RealAsan:
    def _req(self, url, api_key, data=None):
        h = {"ApiKey": api_key or "", "Cache-Control": "no-cache", "Connection": "Keep-Alive", "Pragma": "no-cache",
             "Content-Type": "application/json; charset=utf-8"}
        rq = urllib.request.Request(url, data=data, headers=h, method="POST" if data is not None else "GET")
        try:
            with urllib.request.urlopen(rq, timeout=float(os.getenv("ASAN_TIMEOUT", "3"))) as r:
                return r.read().decode("utf-8", "replace")
        except urllib.error.HTTPError as e:
            raise AsanError(f"HTTP/1.1 {e.code} {e.reason}")
        except Exception as e:  # noqa: BLE001 - socket / timeout errors, as Indy's exception text
            raise AsanError(str(e) or e.__class__.__name__)

    def get(self, path_and_query: str, api_key: str) -> str:
        return self._req(base() + path_and_query, api_key)

    def post(self, body: str, api_key: str) -> str:
        return self._req(base() + EXPENSES, api_key, body.encode("utf-8"))


_OK = {"Code": 0, "Message": None}


class MockAsan:
    """Canned answers shaped like the JSON paths the Delphi JSON_TABLE / json_value queries read."""
    def get(self, pq: str, api_key: str) -> str:
        p = urllib.parse.urlsplit(pq)
        q = urllib.parse.parse_qs(p.query)
        pin = (q.get("pin") or [p.path.rsplit("/", 1)[-1]])[0]
        if pin.upper() == "ERR500":
            raise AsanError("HTTP/1.1 500 Internal Server Error")
        if pin.upper() == "BADPIN":
            return json.dumps({"Status": {"Code": 404, "Message": "Fiziki şəxs tapılmadı"}, "Response": None})
        if "Balance" in p.path:
            return json.dumps({"Status": {"Code": 0, "Message": None}, "Response": {"Balance": 1234.5}})
        if "PinAndDocNumber" in p.path:
            return json.dumps({"Status": {"Code": 0, "Message": None}, "Response": {
                "PIN": pin.upper(), "Citizenship": "Azərbaycan", "GivenOrganization": "DİN Bakı şəhəri", "MaritalStatus": "Evli",
                "ExpireDate": "15.03.2031", "GivenDate": "15.03.2021", "RegistrationAddress": "Bakı ş., Nəsimi r., Azadlıq pr. 10",
                "Gender": "Kişi", "BirthAddress": "Bakı", "BirthDate": "02.05.1985", "Patronymic": "Rauf oğlu", "Surname": "Həsənov",
                "Name": "Elçin", "DocumentNumber": (q.get("docNumber") or [""])[0], "MilitaryStatus": "Hərbi mükəlləfiyyətli",
                "BloodType": "II+", "EyeColor": "Qəhvəyi", "Height": "178",
                "Image": "/9j/4AAQSkZJRgABAQEASABIAAD/2wBDAP//////////////////////////////////////////////////////////////////////////////////////wgALCAABAAEBAREA/8QAFBABAAAAAAAAAAAAAAAAAAAAAP/aAAgBAQABPxA="}})
        if "Employee" in p.path:
            return json.dumps({"Status": [_OK], "Response": {"Active": [{"Employer": {"Voen": "1700054321", "Name": "Kənd MMC", "WorkerCount": "24",
                "LegalAddress": "Gəncə ş., Nizami küç. 5", "Phone": "+994222000000", "PropertyType": {"Description": "Özəl"}},
                "Employee": {"Name": "Elçin", "Surname": "Həsənov", "Patronymic": "Rauf", "Phone": "-", "WorkPlaceType": {"Description": "Əsas"},
                "WorkPlace": "Mühasibatlıq", "Position": "Mühasib", "PositionLabourContract": "Mühasib", "Salary": "1500",
                "WorkCasualType": {"Description": "Daimi"}, "SSN": "AAA123"},
                "Contract": {"BeginDate": "01.02.2020", "EndDate": None, "NextEndDate": None, "PeriodType": {"Description": "Müddətsiz"}, "Number": "17"}}],
                "Deactive": [{"Employer": {"Voen": "1400099999", "Name": "Köhnə MMC"}, "Employee": {"Position": "Kassir", "Salary": "800"},
                "Contract": {"BeginDate": "01.01.2015", "EndDate": "31.12.2019"}}]}})
        if "Pension" in p.path:
            return json.dumps({"Status": [_OK], "Response": [{"Name": "Elçin", "Surname": "Həsənov", "Patronymic": "Rauf", "BirthDate": "02.05.1985",
                "Allowance": {"BeginDate": "01.01.2024", "EndDate": "31.12.2026", "Type": {"Description": "Əlillik müavinəti"}, "Group": {"Description": "II qrup"}, "Amount": "250"},
                "Pension": {"Type": {"Label": "Yaşa görə", "Description": "Əmək pensiyası"}, "StartDate": "01.06.2025", "EndDate": None, "Amount": "420"}}]})
        if "Farm" in p.path:
            return json.dumps({"Status": [_OK], "Response": [{"Person": [{"Pin": pin.upper(), "FirstName": "Elçin", "LastName": "Həsənov", "FatherName": "Rauf", "BirthDate": "02.05.1985"}],
                "Farms": {"Id": "F-77", "Name": "Şəmkir rayonu", "Fields": [{"VillageName": "Zəyəm", "DocType": "Mülkiyyət", "FieldAmount": "3.5", "Unit": "ha",
                "Plants": [{"Name": "Buğda", "FieldAmount": "2", "Unit": "ha"}, {"Name": "Arpa", "FieldAmount": "1.5", "Unit": "ha"}]}]}}]})
        if "Voen" in p.path or "VOEN" in p.path:
            return json.dumps({"Status": [_OK], "Response": {"PayerType": {"Type": "2", "Description": "Hüquqi şəxs"},
                "LegalEntity": {"LegalAddress": "Gəncə ş., Nizami küç. 5"}, "VOENInfo": {"VOEN": pin, "CreateDate": "11.04.2011"},
                "Chief": {"Name": "Vüqar", "Surname": "Əliyev", "Patronymic": "Kamal"}}})
        return json.dumps({"Status": [{"Code": 1, "Message": "mock: unknown service"}]})

    def post(self, body: str, api_key: str) -> str:
        return json.dumps({"Status": [_OK], "Response": {"Expenses": [
            {"Value": "5ZX7K2P", "Date": "2026-10-10 11:20:00", "Service": "Personalinfo", "Amount": 0.2, "IpAddress": "10.0.11.21"},
            {"Value": "1700054321", "Date": "2026-10-11 09:05:00", "Service": "VoenInfo", "Amount": 0.1, "IpAddress": "10.0.11.21"}]}})


def client():
    mode = os.getenv("ASAN_MODE") or ("mock" if os.getenv("DB_MODE", "mock").lower() == "mock" else "real")
    return MockAsan() if mode == "mock" else RealAsan()

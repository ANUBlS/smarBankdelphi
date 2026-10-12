unit CCDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Db, OracleData;

type
  TCCDataMod = class(TDataModule)
    CM_CREDIT: TOraclePackage;
    Accounts: TOracleDataSet;
    AccountsDatSrc: TDataSource;
    AccountsBOOROWERID: TFloatField;
    AccountsNAME: TWideStringField;
    AccountsCREDITID: TFloatField;
    AccountsBOOROWERACCID: TFloatField;
    AccountsLOANACCID: TFloatField;
    AccountsDUELOANACCID: TFloatField;
    AccountsINTERESTACCID: TFloatField;
    AccountsDUEINTERESTACCID: TFloatField;
    AccountsPRIMARYRESERVEACCID: TFloatField;
    AccountsSECONDARYRESERVEACCID: TFloatField;
    AccountsSECONDARYPURRESERVEACCID: TFloatField;
    AccountsPRIMARYPURRESERVEACCID: TFloatField;
    AccountsBOOROWERACCNO: TWideStringField;
    AccountsLOANACCNO: TWideStringField;
    AccountsDUELOANACCNO: TWideStringField;
    AccountsINTERESTACCNO: TWideStringField;
    AccountsDUEINTERESTACCNO: TWideStringField;
    AccountsPRIMARYRESACCNO: TWideStringField;
    AccountsSECONDARYRESACCNO: TWideStringField;
    AccountsSECONDARYPURRESERVEACCNO: TWideStringField;
    AccountsPRIMARYPURRESERVEACCNO: TWideStringField;
    AccountsBOOROWERREST: TFloatField;
    AccountsLOANREST: TFloatField;
    AccountsDUELOANREST: TFloatField;
    AccountsINTERESTREST: TFloatField;
    AccountsDUEINTERESTREST: TFloatField;
    AccountsPRIMARYRESREST: TFloatField;
    AccountsSECONDARYRESREST: TFloatField;
    AccountsSECONDARYPURRESERVEREST: TFloatField;
    AccountsPRIMARYPURRESERVEREST: TFloatField;
    AccountsCOMMISSIONOBLIGATIONACCIDREST: TFloatField;
    AccountsDOUBLEPAYMENTACCID: TFloatField;
    AccountsINSURANCEACCID: TFloatField;
    AccountsCOMMISSIONOBLIGATIONACCID: TFloatField;
    AccountsTRANZITACCID: TFloatField;
    AccountsDOUBLEPAYMENTACCIDREST: TFloatField;
    AccountsINSURANCEACCIDREST: TFloatField;
    AccountsTRANZITACCIDREST: TFloatField;
    AccountsDOUBLEPAYMENTACCIDACCNO: TWideStringField;
    AccountsINSURANCEACCIDACCNO: TWideStringField;
    AccountsCOMMISSIONOBLIGATIONACCIDACCNO: TWideStringField;
    AccountsTRANZITACCIDACCNO: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CCDataMod: TCCDataMod;

implementation

{$R *.DFM}

uses
  sboapiDataModuleImpl;

end.

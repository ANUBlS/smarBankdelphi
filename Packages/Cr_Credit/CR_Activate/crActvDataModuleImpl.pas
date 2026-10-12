unit crActvDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Db, OracleData;

type
  TActvDataMod = class(TDataModule)
    CreditInfo: TOracleDataSet;
    DataSrcCreditInfo: TDataSource;
    ActivationPckg: TOraclePackage;
    ActvInfo: TOracleDataSet;
    ActvInfoACTVDATE: TDateTimeField;
    CreditInfoNAME: TWideStringField;
    CreditInfoVAL_NAME: TWideStringField;
    CreditInfoOBLIGATION: TFloatField;
    CreditInfoPLEDGEPRICE: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ActvDataMod: TActvDataMod;

implementation

{$R *.DFM}

uses
  sboapiDataModuleImpl;
  
end.

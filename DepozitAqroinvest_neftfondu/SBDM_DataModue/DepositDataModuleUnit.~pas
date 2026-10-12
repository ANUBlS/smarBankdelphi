unit DepositDataModuleUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TDepositDataModule = class(TDataModule)
    Deposits: TOracleDataSet;
    DataSrcDeposit: TDataSource;
    OverduePercents: TOracleDataSet;
    Percents: TOracleDataSet;
    DepositsID: TFloatField;
    DepositsCONTRACTNO: TStringField;
    DepositsOPENDATE: TDateTimeField;
    DepositsCLOSEDATE: TDateTimeField;
    DepositsAMOUNT: TFloatField;
    DepositsCONTRACTTYPE: TIntegerField;
    DepositsCLIENTTYPE: TFloatField;
    DepositsCONTRACTACCID: TFloatField;
    DepositsCLIENTACCID: TFloatField;
    DepositsINTERESTACCID: TFloatField;
    DepositsFACTICALDEBT: TFloatField;
    DepositsFACTICALINTERESTDEBT: TFloatField;
    DepositsCALCULATIONENABLED: TFloatField;
    DepositsLASTPROCESSDATE: TDateTimeField;
    DepositsCONTRACTACCNO: TStringField;
    DepositsCLIENTACCNO: TStringField;
    DepositsINTERESTACCNO: TStringField;
    DepositsCONTRACTCURRENCY: TStringField;
    DepositsCLIENTCURRENCY: TStringField;
    DepositsINTERESTCURRENCY: TStringField;
    DepositsCONTRACTACCNAME: TStringField;
    DepositsCLIENTACCNAME: TStringField;
    DepositsINTERESTACCNAME: TStringField;
    DepositsCONTRACTCURRENCYID: TFloatField;
    PercentsID: TFloatField;
    PercentsHDATE: TDateTimeField;
    PercentsINTEREST: TFloatField;
    OverduePercentsID: TFloatField;
    OverduePercentsHDATE: TDateTimeField;
    OverduePercentsOVERDUEINTEREST: TFloatField;
    DepositsSTATUS: TFloatField;
    DepositsLASTWCDATE: TDateTimeField;
    DepositsTOTALCALCEDINTEREST: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DepositDataModule: TDepositDataModule;

implementation

{$R *.DFM}

uses
   sboapiDataModuleImpl;

procedure TDepositDataModule.DataModuleCreate(Sender: TObject);
begin
  Deposits.SetVariable('OrderClause','ID');
  Deposits.Open;
  Percents.Open;
  OverduePercents.Open;
end;

procedure TDepositDataModule.DataModuleDestroy(Sender: TObject);
begin
   Deposits.CloseAll;
   Percents.CloseAll;
   OverduePercents.CloseAll;
end;

end.

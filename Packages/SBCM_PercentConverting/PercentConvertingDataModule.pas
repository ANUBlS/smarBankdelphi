unit PercentConvertingDataModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Db, OracleData;

type
  TDataModPercentConv = class(TDataModule)
    CalcedPercents: TOracleDataSet;
    DataSrcCalcedPercents: TDataSource;
    CalcedPercentsPack: TOraclePackage;
    CalcedPercentsCONTRACTID: TFloatField;
    CalcedPercentsCONTRACTCURRENCYID: TFloatField;
    CalcedPercentsCONTRACTCURRENCYNAME: TStringField;
    CalcedPercentsCONTRACTNO: TStringField;
    CalcedPercentsCONTRACTACCNO: TStringField;
    CalcedPercentsCONTRACTACCNAME: TStringField;
    CalcedPercentsFACTICALDEBT: TFloatField;
    CalcedPercentsFACTICALINTERESTDEBT: TFloatField;
    CalcedPercentsINTERESTBALANCE: TFloatField;
    CalcedPercentsCALCEDMAINDEBT: TFloatField;
    CalcedPercentsCALCEDOVERDUEDEBT: TFloatField;
    CalcedPercentsOVERDUEDEBT: TFloatField;
    CalcedPercentsOVERDUEINTERESTDEBT: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure CalcedPercentsAfterPost(DataSet: TDataSet);
    procedure CalcedPercentsBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModPercentConv: TDataModPercentConv;

implementation

uses   
    sboapiDataModuleImpl;

{$R *.DFM}

procedure TDataModPercentConv.DataModuleCreate(Sender: TObject);
begin
  with CalcedPercents  do
  begin
    SetVariable('ORDERCLAUSE','ContractCurrencyID,ContractNo');
    Open;
  end;
end;

procedure TDataModPercentConv.CalcedPercentsAfterPost(DataSet: TDataSet);
var
  SavedPos :TBookmark;
begin
  with  DataSet  do
  begin
     SavedPos :=GetBookmark;
     Refresh;
     GotoBookmark(SavedPos);
  end;
end;
procedure TDataModPercentConv.CalcedPercentsBeforeDelete(
  DataSet: TDataSet);
begin
  DataSet.Cancel;
  Abort;
end;

end.

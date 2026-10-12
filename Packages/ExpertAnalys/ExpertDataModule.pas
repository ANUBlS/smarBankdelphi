unit ExpertDataModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TExpertDataModul = class(TDataModule)
    Operations: TOracleDataSet;
    OperationsID: TFloatField;
    OperationsData: TDataSource;
    Operations_balance: TOracleDataSet;
    BalancesData: TDataSource;
    Currency: TOracleDataSet;
    Report: TOracleDataSet;
    Sysdat: TOracleDataSet;
    ReportOPERATIONID: TFloatField;
    ReportBAL_CN: TFloatField;
    ReportACC_ID: TFloatField;
    ReportVAL_ACC: TIntegerField;
    TrafficsData: TDataSource;
    Traffics: TOracleDataSet;
    TrafficsRecordNo: TIntegerField;
    Accounts: TOracleDataSet;
    Balances: TOracleDataSet;
    Schemas: TOracleDataSet;
    SchemasData: TDataSource;
    OperationsSCHEMAID: TFloatField;
    SchemasID: TFloatField;
    Operations_balanceID: TFloatField;
    Operations_balanceOPERATIONID: TFloatField;
    Operations_balanceBALANCE: TFloatField;
    Operations_balanceACCGROUP: TFloatField;
    Operations_balanceCLASS: TFloatField;
    TotalTraffics: TOracleDataSet;
    TotalTrafficsData: TDataSource;
    TotalTrafficsBAL_CN1: TFloatField;
    TotalTrafficsOSTAT: TFloatField;
    TotalTrafficsPOK_OSTAT: TFloatField;
    TotalTrafficsRecordN: TIntegerField;
    SchemaTraffics: TOracleDataSet;
    SchemaTrafficsData: TDataSource;
    SchemaTrafficsID: TFloatField;
    SchemaTrafficsOSTAT: TFloatField;
    SchemaTrafficsPOK_OSTAT: TFloatField;
    ReportSCHEMAID: TFloatField;
    ReportDecimalOstat: TFloatField;
    ReportDecimalPokOstat: TFloatField;
    TotalTrafficsDEBTTURNOVER: TFloatField;
    TotalTrafficsDEBTPOKTURNOVER: TFloatField;
    TotalTrafficsCREDITTURNOVER: TFloatField;
    TotalTrafficsCREDITPOKTURNOVER: TFloatField;
    SchemaTrafficsDEBTTURNOVER: TFloatField;
    SchemaTrafficsDEBTPOKTURNOVER: TFloatField;
    SchemaTrafficsCREDITTURNOVER: TFloatField;
    SchemaTrafficsCREDITPOKTURNOVER: TFloatField;
    DataBranch: TDataSource;
    Branch: TOracleDataSet;
    TrafficsBAL_CN: TFloatField;
    TrafficsVAL_ACC: TIntegerField;
    TrafficsBEGINREST: TFloatField;
    TrafficsBEGINLREST: TFloatField;
    TrafficsDEBTTURNOVER: TFloatField;
    TrafficsDEBTPOKTURNOVER: TFloatField;
    TrafficsCREDITTURNOVER: TFloatField;
    TrafficsCREDITPOKTURNOVER: TFloatField;
    TrafficsLASTREST: TFloatField;
    TrafficsLASTLREST: TFloatField;
    PeriodData: TOracleDataSet;
    AccFlags: TOracleDataSet;
    ReportLASTREST: TFloatField;
    ReportLASTLREST: TFloatField;
    SchemasSCHEMA: TWideStringField;
    OperationsOPERATION: TWideStringField;
    Operations_balanceACCNO: TWideStringField;
    Operations_balanceTIPACC: TWideStringField;
    ReportTYPE: TWideStringField;
    ReportACC_NO: TWideStringField;
    ReportNAME: TWideStringField;
    ReportVAL_NAME: TWideStringField;
    ReportOPERATION: TWideStringField;
    TrafficsTYPE: TWideStringField;
    TrafficsACC_NO: TWideStringField;
    TrafficsNAME: TWideStringField;
    TrafficsVAL_NAME: TWideStringField;
    TotalTrafficsBALNAME: TWideStringField;
    TotalTrafficsTYPE: TWideStringField;
    SchemaTrafficsOPERATION: TWideStringField;
    procedure ReportCalcFields(DataSet: TDataSet);
    procedure TrafficsRecordNoGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure SchemasAfterPost(DataSet: TDataSet);
    procedure TotalTrafficsRecordNGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ExpertDataModul: TExpertDataModul;

implementation

uses sboapiDataModuleImpl, ExpertAnalysImpl;

{$R *.DFM}

procedure TExpertDataModul.ReportCalcFields(DataSet: TDataSet);
begin
 with DataSet, ExpertAnalysX do
  begin
    FieldByName('LASTREST').AsFloat :=FieldByName('LASTREST').AsFloat / ExpertAnalysX.CEDecimal.Value;
    FieldByName('LASTLREST').AsFloat :=FieldByName('LASTLREST').AsFloat / ExpertAnalysX.CEDecimal.Value;
  end;
end;

procedure TExpertDataModul.TrafficsRecordNoGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
 Text :=IntToStr(Traffics.RecNo);
end;

procedure TExpertDataModul.SchemasAfterPost(DataSet: TDataSet);
begin
 DataSet.Refresh;
end;

procedure TExpertDataModul.TotalTrafficsRecordNGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
 Text :=IntToStr(TotalTraffics.RecNo);
end;

end.

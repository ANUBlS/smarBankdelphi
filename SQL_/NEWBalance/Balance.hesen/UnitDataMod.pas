unit UnitDataMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Oracle, OracleData;

type
  TDataModuleMain = class(TDataModule)
    ODSMain: TOracleDataSet;
    OraclePackage: TOraclePackage;
    DataSrcMain: TDataSource;
    DataSrcRate: TDataSource;
    ODSRate: TOracleDataSet;
    BranchDataSet: TOracleDataSet;
    BalanceGroups: TOracleDataSet;
    BalanceGroupsACCGROUP: TFloatField;
    BalanceGroupsBALANCENUMBER: TFloatField;
    ODSMainFDATE: TStringField;
    ODSMainFIRSTACTIVE: TFloatField;
    ODSMainFIRSTPASSIVE: TFloatField;
    ODSMainLDATE: TStringField;
    ODSMainLASTACTIVE: TFloatField;
    ODSMainLASTPASSIVE: TFloatField;
    ODSMainDTURNOVER: TFloatField;
    ODSMainKTURNOVER: TFloatField;
    ODSMainBAL_CN: TFloatField;
    ODSMainBALNAME: TStringField;
    ODSMainAccGroup: TIntegerField;
    AboutBank: TOracleDataSet;
    AboutBankFULLBANKNAME: TStringField;
    AboutBankLOGO: TBlobField;
    AboutBankMANAGERTITLE: TStringField;
    AboutBankACCOUNTANTTITLE: TStringField;
    OrDSFilialIDsBalance: TOracleDataSet;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleMain: TDataModuleMain;

implementation

{$R *.DFM}

uses  sboapiDataModuleImpl;

procedure TDataModuleMain.DataModuleCreate(Sender: TObject);
begin
  AboutBank.Open;
end;

procedure TDataModuleMain.DataModuleDestroy(Sender: TObject);
begin
   AboutBank.CloseAll;
end;

end.

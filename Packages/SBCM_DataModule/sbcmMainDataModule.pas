unit sbcmMainDataModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TMainDataModule = class(TDataModule)
    DataSrcContracts: TDataSource;
    Contracts: TOracleDataSet;
    DataSrcInterests: TDataSource;
    Interests: TOracleDataSet;
    DataSrcOverdueInterests: TDataSource;
    OverdueInterests: TOracleDataSet;
    DataSrcCategories: TDataSource;
    Categories: TOracleDataSet;
    DataSrcReliability: TDataSource;
    Reliability: TOracleDataSet;
    DataSrcPledgetypes: TDataSource;
    Pledges: TOracleDataSet;
    ReliabilityID: TIntegerField;
    ReliabilityRELIABILITY: TStringField;
    ReliabilityPERCENT: TIntegerField;
    DataSrcContractType: TDataSource;
    ContractType: TOracleDataSet;
    ContractsID: TFloatField;
    ContractsCONTRACTNO: TStringField;
    ContractsOPENDATE: TDateTimeField;
    ContractsCLOSEDATE: TDateTimeField;
    ContractsAMOUNT: TFloatField;
    ContractsCONTRACTTYPE: TIntegerField;
    ContractsPLEDGETYPE: TFloatField;
    ContractsRELIABILITYID: TIntegerField;
    ContractsCLIENTTYPE: TFloatField;
    ContractsCONTRACTACCID: TFloatField;
    ContractsCLIENTACCID: TFloatField;
    ContractsRESERVEACCID: TFloatField;
    ContractsINTERESTACCID: TFloatField;
    ContractsOVERDUEACCID: TFloatField;
    ContractsOVERDUEINTERESTACCID: TFloatField;
    ContractsFACTICALDEBT: TFloatField;
    ContractsFACTICALINTERESTDEBT: TFloatField;
    ContractsOVERDUEDEBT: TFloatField;
    ContractsOVERDUEINTERESTDEBT: TFloatField;
    ContractsSTOPCALCULATIONDATE: TDateTimeField;
    ContractsCALCULATIONENABLED: TFloatField;
    ContractsREGUIREDAMOUNTDEC: TFloatField;
    ContractsREGUIREDPERCENTDEC: TFloatField;
    ContractsLASTPROCESSDATE: TDateTimeField;
    ContractsCONTRACTACCNO: TStringField;
    ContractsCONTRACTACCNAME: TStringField;
    ContractsCONTRACTCURRENCYID: TFloatField;
    ContractsRESIDUARYAMOUNT: TFloatField;
    ContractsSTATUS: TFloatField;
    ContractsPLEDGEPRICE: TFloatField;
    ContractsMONTHDAY: TStringField;
    InterestsID: TFloatField;
    InterestsHDATE: TDateTimeField;
    InterestsINTEREST: TFloatField;
    OverdueInterestsID: TFloatField;
    OverdueInterestsHDATE: TDateTimeField;
    OverdueInterestsOVERDUEINTEREST: TFloatField;
    OverdueReliability: TOracleDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    IntegerField2: TIntegerField;
    ContractsOVERDUERELIABILITYID: TFloatField;
    ContractsOVERDUERESERVEACCID: TFloatField;
    ContractsCONTRACTCURRENCY: TStringField;
    ContractsINTERESTACCNO: TStringField;
    ContractsINTERESTBALANCE: TFloatField;
    ContractsCLIENTBALANCE: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainDataModule: TMainDataModule;

implementation

uses  sboapiDataModuleImpl;

{$R *.DFM}

{procedure Init;
begin
  MainDataModule :=TMainDataModule.Create(nil);
end;
procedure CleanUp;
begin
  MainDataModule.Free;
end;}
procedure TMainDataModule.DataModuleCreate(Sender: TObject);
begin
   Contracts.SetVariable('OrderKind','ID');
   Contracts.Open;
   Interests.Open;
   OverdueInterests.Open;
   Reliability.Open;
   Categories.Open;
   Pledges.Open;
   ContractType.Open;
   OverdueReliability.Open;
end;

procedure TMainDataModule.DataModuleDestroy(Sender: TObject);
begin
  Contracts.CloseAll;
  Interests.CloseAll;
  OverdueInterests.CloseAll;
  Reliability.CloseAll;
  Categories.CloseAll;
  Pledges.CloseAll;
  ContractType.CloseAll;
  OverdueReliability.CloseAll
end;

end.

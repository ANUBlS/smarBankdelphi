unit dmusaid_prognozImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  Tdmusaid_prognoz = class(TDataModule)
    Branches: TOracleDataSet;
    CreditTypes: TOracleDataSet;
    prog: TOracleDataSet;
    Branchesds: TDataSource;
    CreditTypesds: TDataSource;
    progds: TDataSource;
    BranchesID: TFloatField;
    BranchesNAME: TWideStringField;
    CreditTypesID: TFloatField;
    CreditTypesDESCRIPTION: TWideStringField;
    progTYPE: TFloatField;
    progBRANCHID: TFloatField;
    progCREDITTYPE: TFloatField;
    progPROGNOZ: TFloatField;
    usaidreport: TOraclePackage;
    Fcollection: TOracleDataSet;
    Fcollectionds: TDataSource;
    FcollectionID: TFloatField;
    FcollectionDESCRIPTION: TWideStringField;
    CatPds: TDataSource;
    PerPds: TDataSource;
    PledgesPds: TDataSource;
    valpds: TDataSource;
    RegionPds: TDataSource;
    ResPds: TDataSource;
    AnnIntPds: TDataSource;
    PeriodPds: TDataSource;
    CatP: TOracleDataSet;
    PerP: TOracleDataSet;
    PledgesP: TOracleDataSet;
    valp: TOracleDataSet;
    RegionP: TOracleDataSet;
    ResP: TOracleDataSet;
    AnnIntP: TOracleDataSet;
    CatPID: TFloatField;
    CatPSECTOR: TWideStringField;
    PerPID: TFloatField;
    PerPSECTOR: TWideStringField;
    PledgesPID: TFloatField;
    PledgesPSECTOR: TWideStringField;
    valpID: TIntegerField;
    valpSECTOR: TWideStringField;
    RegionPID: TFloatField;
    RegionPSECTOR: TWideStringField;
    ResPID: TFloatField;
    ResPSECTOR: TWideStringField;
    AnnIntPID: TFloatField;
    AnnIntPSECTOR: TWideStringField;
    PeriodPID: TFloatField;
    PeriodPSECTOR: TWideStringField;
    CollProg: TOracleDataSet;
    CollProgds: TDataSource;
    PeriodP: TOracleDataSet;
    CollProgCOLL_ID: TFloatField;
    CollProgDEP_ID: TFloatField;
    CollProgPROGNOZ: TFloatField;
    CollProgBRANCHID: TIntegerField;
    procedure DataModuleDestroy(Sender: TObject);
    procedure progAfterPost(DataSet: TDataSet);
    procedure BranchesdsDataChange(Sender: TObject; Field: TField);
    procedure CreditTypesdsDataChange(Sender: TObject; Field: TField);
    procedure FcollectiondsDataChange(Sender: TObject; Field: TField);
    procedure CatPdsDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmusaid_prognoz: Tdmusaid_prognoz;

implementation

{$R *.DFM}
uses sboapiDataModuleImpl, frmusaid_prognozImpl, frmcollprogImpl;

procedure Tdmusaid_prognoz.DataModuleDestroy(Sender: TObject);
begin
   Branches.close;
   CreditTypes.close;
end;

procedure Tdmusaid_prognoz.progAfterPost(DataSet: TDataSet);
begin
   prog.Refresh;
end;

procedure Tdmusaid_prognoz.BranchesdsDataChange(Sender: TObject;
  Field: TField);
begin
   if frmusaid_prognoz.ProgSetInt = 3 then
    frmcollprog.WaitFOp else
   frmusaid_prognoz.WaitForOp;
end;

procedure Tdmusaid_prognoz.CreditTypesdsDataChange(Sender: TObject;
  Field: TField);
begin
   if frmusaid_prognoz.ProgSetInt <> 3 then
   BranchesdsDataChange(sender,Field);
end;

procedure Tdmusaid_prognoz.FcollectiondsDataChange(Sender: TObject;
  Field: TField);
begin
   if frmusaid_prognoz.ProgSetInt = 3 then
   BranchesdsDataChange(sender,Field);

end;

procedure Tdmusaid_prognoz.CatPdsDataChange(Sender: TObject;
  Field: TField);
begin

  // if Assigned(frmcollprog) then
   frmcollprog.WaitFOp
end;

end.

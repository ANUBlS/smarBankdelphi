unit CorrectDatModImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TCorrectDatMod = class(TDataModule)
    Tranches: TOracleDataSet;
    Payments: TOracleDataSet;
    TranchesDatSrc: TDataSource;
    PaymentsDatSrc: TDataSource;
    CM_CORR_TRCH_PAY: TOraclePackage;
    PaymentsPAYDATE: TDateTimeField;
    PaymentsPAYEDAMT: TFloatField;
    PaymentsPAYEDINTAMT: TFloatField;
    PaymentsPAYEDDUEAMT: TFloatField;
    PaymentsPAYEDDUEINTAMT: TFloatField;
    TranchesTRANCHEDATE: TDateTimeField;
    TranchesTRANCHEAMOUNT: TFloatField;
    PaymentsID: TFloatField;
    procedure TranchesApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: String);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CorrectDatMod: TCorrectDatMod;

implementation

{$R *.DFM}

uses sboapiDataModuleImpl,CommonDecls;

procedure TCorrectDatMod.TranchesApplyRecord(Sender: TOracleDataSet;
  Action: Char; var Applied: Boolean; var NewRowId: String);

var
   P_CrdID :integer;
   P_TrancheDate :TDateTime;
   P_TrchAmount :Real;


begin

   with Sender do
   begin
     P_CrdID := Get_SelectedCrdID;
     ShowMessage(InttoStr(P_CrdID));
     P_TrchAmount := FieldByName('trancheamount').AsFloat;
     P_TrancheDate := FieldByName('TRANCHEDATE ').AsDateTime;
   end;


   with CM_CORR_TRCH_PAY do
   begin

   Case Action of

   'I' :CallProcedure('add_tranches',[P_CrdID,P_TrancheDate,P_TrchAmount]);
   'U' :CallProcedure('edit_tranches',[P_CrdID,P_TrancheDate,P_TrchAmount]);
   'D' :CallProcedure('del_tranches',[P_CrdID,P_TrancheDate,P_TrchAmount]);

   end;

   Applied := True;

   end;

end;

procedure TCorrectDatMod.DataModuleCreate(Sender: TObject);
begin
Payments.open
end;

end.

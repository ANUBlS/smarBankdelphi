unit TrancheAddFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, ActnList, Mask, DBCtrlsEh, DBLookupEh, ExtCtrls,
  CMCurrencyEdit, ComCtrls, DBCtrls;

type
  TTrchAddForm = class(TForm)
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    TrancheDatePckr: TDateTimePicker;
    TrancheSumEdit: TCMCurrencyEdit;
    CBPrcessTransactions: TCheckBox;
    Panel4: TPanel;
    StaticText3: TStaticText;
    AccountListCB: TDBLookupComboboxEh;
    ActionsList: TActionList;
    ActnProcessTranche: TAction;
    ActnCancelTranche: TAction;
    ButtonCommit: TButton;
    ButtonCancel: TButton;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    procedure ActnProcessTrancheExecute(Sender: TObject);
    procedure ActnProcessTrancheUpdate(Sender: TObject);
    procedure ActnCancelTrancheExecute(Sender: TObject);
    procedure TrancheSumEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TrchAddForm: TTrchAddForm;

implementation

uses TranceDataModuleImpl, CommonDecls;

{$R *.DFM}

procedure TTrchAddForm.ActnProcessTrancheExecute(Sender: TObject);
resourcestring
  rsTransactionsWillProcessed = 'Kredit tranşı ...';
var
  CrdID : Integer;
  TrchDate : TDateTime;
  CustAccID : Integer;
  TrchAmount : Real;
  TrProcess : Boolean;
  CommitTranche : Boolean;
begin
  CrdID := Get_SelectedCrdID;
  TrchDate := Integer(Trunc(TrancheDatePckr.DateTime));
  CustAccID := AccountListCB.ListSource.DataSet.FieldByName('ACCID').AsInteger;
  TrchAmount := TrancheSumEdit.Value;
  TrProcess := CBPrcessTransactions.Checked;

  with TrancheDataModule do
  CM_TRANCHE.CallProcedure('Tranche_Add',[
     'p_CreditID' ,CrdID ,
     'p_TrchDate' ,TrchDate ,
     'p_CustAccID' ,CustAccID ,
     'p_TrchAmount' ,TrchAmount ,
     'p_ProcessTransactions' ,TrProcess
  ]);

  try

    CommitTranche := TrDelayed_Show(Self,rsTransactionsWillProcessed);

    Update;

    with TrancheDataModule do
    CM_TRANCHE.CallProcedure('CommitTranche',[
       'DoCommit' , CommitTranche
    ]);

    if CommitTranche then
    Self.ModalResult := mrOk;
    Self.Update;
    
  except

    with TrancheDataModule do
    CM_TRANCHE.CallProcedure('CommitTranche',[
       'DoCommit' , False
    ]);

    raise;

  end;

end;

procedure TTrchAddForm.ActnProcessTrancheUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := TrancheSumEdit.Value > 0;
end;

procedure TTrchAddForm.ActnCancelTrancheExecute(Sender: TObject);
begin
  Close;
end;

procedure TTrchAddForm.TrancheSumEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ORD(KEY) = VK_RETURN then
  begin
    SelectNext(TrancheSumEdit,True,True);
    Key := #0;
  end;
end;

procedure TTrchAddForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ORD(Key) = VK_ESCAPE then
    ButtonCancel.Click;
end;

end.

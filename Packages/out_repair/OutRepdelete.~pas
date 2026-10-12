unit OutRepdelete;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls;

type
  TOutRep_delete = class(TForm)
    GroupBox1: TGroupBox;
    Bevel1: TBevel;
    chRate: TCheckBox;
    chProfit: TCheckBox;
    StaticText1: TStaticText;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    DelAnim: TAnimate;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
procedure DeleteTrans;
function ShowDeleteConfirm(Value: string): Boolean;
var
  OutRep_delete: TOutRep_delete;

implementation

{$R *.DFM}
 uses RepairNewDataModule,RepairNewEdit,Out_RepairImpl1;
function ShowDeleteConfirm(Value: string): Boolean;
var
 DelForm: TOutRep_delete;
begin
  DelForm:=TOutRep_delete.Create(Application);
  OutRep_delete:=DelForm;
 with DelForm do
 try
  ShowModal;
  if ModalResult=mrOk then
   Result:=True
  else Result:=False
 finally
  Release;
  OutRep_delete:=nil;
 end;
end;

procedure TOutRep_delete.Button1Click(Sender: TObject);

procedure ShowAvi(Value: Boolean);
begin
 try
 DelAnim.Active:=Value;
 DelAnim.Visible:=Value;
 except
  DelAnim.Destroy;
 end;
end;

begin
with Out_RepairFrm do
 begin
  ShowAvi(True);
  DeleteTrans;
  ShowAvi(False); end;
end;

procedure DeleteTrans;

function PrepareTransaction: TTransaction;
var
 ActTransaction :TTransaction;
begin
with OutRep_delete,RepDataModule.TransactionData,ActTransaction do
 begin
  Action:=acDelete;
  if not(chRate.Checked) then Mode:=2
  else if chProfit.Checked then Mode:=0
  else Mode:=1;
  Id:=FieldByName('ID').AsInteger;
  Date:=FieldByName('Transactiondate').AsDateTime;
  DebitId:=FieldByName('DebitID').AsInteger;
  CreditId:=FieldByName('CreditID').AsInteger;
  DebitRate:=FieldByName('DebitRate').AsCurrency;
  CreditRate:=FieldByName('CreditRate').AsCurrency;
  DebitAmmount:=FieldByName('DebitAmount').AsCurrency;;
  CreditAmmount:=FieldByName('CreditAmount').AsCurrency;;
  LAmmount:=FieldByName('LAmount').AsCurrency;;
  Name:=FieldByName('Name').AsString;
  DebitCurId:=FieldByName('DebitCurrencyID').AsInteger;
  CreditCurId:=FieldByName('CreditCurrencyID').AsInteger;
  InBalanceChar:=FieldByName('InBalanceChar').AsInteger;
  OutBalanceChar:=FieldByName('OutBalanceChar').AsInteger;
  Result:=ActTransaction;
 end;
end;

var
TempTrans: TTransaction;
Rec: Integer;
begin
with RepDataModule,TransactionData do
 begin
  Rec:=RecNo;
  try
  DisableControls;
  TempTrans:=PrepareTransaction;
  SaveTransaction(TempTrans);
  Refresh;
  Last;
  if Rec>RecordCount then
    Last else RecNo:=Rec;
  finally
   EnableControls;
  end;
 end;
end;

end.

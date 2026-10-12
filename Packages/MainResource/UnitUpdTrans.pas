unit UnitUpdTrans;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TFormUpdTrans = class(TForm)
    GroupBoxDebtAcc: TGroupBox;
    CBoxDebtAcc: TComboBox;
    GroupBoxCredAcc: TGroupBox;
    CBoxCredAcc: TComboBox;
    BitBtnOk: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure BitBtnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUpdTrans: TFormUpdTrans;

implementation

uses UnitData;

{$R *.DFM}

procedure TFormUpdTrans.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if (ORD(Key) =VK_ESCAPE) then Close;
end;

procedure TFormUpdTrans.FormActivate(Sender: TObject);
var
rec:integer;
begin
        DataModWares.ODSViewGr.Close;
        DataModWares.ODSViewGr.Open;

          CBoxDebtAcc.Clear;
          CBoxCredAcc.Clear;
      for rec := 1 to DataModWares.ODSViewGr.RecordCount do
      begin
        CBoxDebtAcc.Items.Add(DataModWares.ODSViewGr.FieldByName('Acc_No').AsString);
        CBoxCredAcc.Items.Add(DataModWares.ODSViewGr.FieldByName('Acc_No').AsString);
      DataModWares.ODSViewGr.Next;
      end;


            CBoxDebtAcc.Text:= DataModWares.ODSCalcWares.FieldByName('DebtAccNo').AsString;
            CBoxCredAcc.Text:= DataModWares.ODSCalcWares.FieldByName('CredAccNo').AsString;

end;


procedure TFormUpdTrans.BitBtnOkClick(Sender: TObject);
begin
   if  (CBoxCredAcc.Text<>'') and
   (CBoxDebtAcc.Text<>'') and ( not DataModWares.ODSCalcWares.IsEmpty )
   then
   begin

  DataModWares.SB_MAIN_RESOURCE.CallProcedure('update_wares_trans',[
                                     DataModWares.ODSCalcWares.FieldByName('id').AsFloat,
                                     Trim(CBoxDebtAcc.Text),
                                     Trim(CBoxCredAcc.Text)]);
             DataModWares.ODSCalcWares.Refresh;
         close;
   end
   else ShowMessage('Бош галан ханалар вар!');
end;

end.

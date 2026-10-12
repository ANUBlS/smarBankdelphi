unit UnitShowTrans;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGridEh, ComCtrls, StdCtrls, Buttons, DBGridEhGrouping, GridsEh;

type
  TFormShowTrans = class(TForm)
    DBGridEhShowTrans: TDBGridEh;
    BtnTrans: TBitBtn;
    ProgressBar: TProgressBar;
    BtnTransShow: TBitBtn;
    Memo1: TMemo;
    DateTimePicker1: TDateTimePicker;
    procedure BtnTransClick(Sender: TObject);
    procedure BtnTransShowClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridEhShowTransKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormShowTrans: TFormShowTrans;

implementation

uses UnitData, UnitUpdTrans,MainResourceImpl,sboapiDataModuleImpl, SBTranslateProc,
  UnitInsWares;

{$R *.DFM}

procedure TFormShowTrans.BtnTransClick(Sender: TObject);
var
    i:integer;
      v_debitid    :real;
      v_creditid   :real;
      v_amount     :real;
      v_trname     :string;


begin

DataModWares.lazy.Refresh;

  if DateTimePicker1.DateTime<>DataModWares.ODSCalcWares.FieldByName('trans_date').AsDateTime then

    begin

with DataModWares do
 begin
    case New_Or_Calc_Wares_Trans of
      1:begin
       if not ODSCalcWares.IsEmpty then

             begin

                  ProgressBar.Position:=0;
                  ODSCalcWares.First;
              for i:=1 to ODSCalcWares.RecordCount do
               begin
                     v_debitid  := ODSCalcWares.fieldbyname('debt_acc').AsFloat;
                     v_creditid := ODSCalcWares.fieldbyname('cred_acc').AsFloat;
                     v_amount   := ODSCalcWares.fieldbyname('debt_amount').AsFloat;
                     v_trname   := ODSCalcWares.fieldbyname('group_name').AsString;

                       ProgressBar.Position:=i*100 div ODSCalcWares.RecordCount;

                  SB_MAIN_RESOURCE.CallProcedure('settransaction',[
                        v_debitid,
                        v_creditid,
                        v_amount,
                        v_trname,
                        p_id
                  ]);

              ODSCalcWares.Next;
              end;

                     ODSCalcWares.Close;
                    ODSCalcWares.SQL.Clear;
                    ODSCalcWares.SQL.Add('delete from wares_all_trans');
                    ODSCalcWares.ExecSQL;
            ProgressBar.Position:=0;
            ShowMessage('Əməliyyatlar günün sənədlərinə göndərildi!');
                  close;


            end
         else
              ShowMessage('Heç bir sənəd yoxdur!');
    end;
  2,3,4:begin
            if not ODSCalcWares.IsEmpty then
             begin
                  ProgressBar.Position:=0;
                  ODSCalcWares.First;
                  for i:=1 to odscalcwares.RecordCount do
                  begin
                    v_debitid:=ODSCalcWares.fieldbyname('debt_acc').AsFloat;
                    v_creditid:=ODSCalcWares.fieldbyname('cred_acc').AsFloat;
                    v_amount:=ODSCalcWares.fieldbyname('debt_amount').AsFloat;
                    v_trname:=ODSCalcWares.fieldbyname('group_name').AsString;

                       ProgressBar.Position:=100 div ODSCalcWares.RecordCount;


                  SB_MAIN_RESOURCE.CallProcedure('set_transaction_new',[
                        v_debitid,
                        v_creditid,
                        v_amount,
                        v_trname,
                        p_id
                  ]);

                 odscalcwares.Next;
                 end;

                    ODSCalcWares.Close;
                    ODSCalcWares.SQL.Clear;
                    ODSCalcWares.SQL.Add('delete from wares_all_trans');
                    ODSCalcWares.ExecSQL;
            ProgressBar.Position:=0;
            ShowMessage('Əməliyyatlar günün sənədlərinə göndərildi!');

                  close;

            end
         else

              ShowMessage('Heç bir sənəd yoxdur!');

    end;
   end;
 end;
        

    end
    else
    begin
    BtnTrans.Enabled:=false;
    ShowMessage('Əməliyyatlar artıq günün sənədlərinə göndərilib!!!');

    end;

end;

procedure TFormShowTrans.BtnTransShowClick(Sender: TObject);

begin

         // MainResourceImpl.MainResource.RadioButton1.Checked:=false;


 case New_Or_Calc_Wares_Trans of
      1:begin
           DataModWares.SB_MAIN_RESOURCE.CallProcedure('wares_all_transaction',[]);
 with DataModWares do begin
        ODSCalcWares.Close;
           ODSCalcWares.SQL.Clear;
           ODSCalcWares.SQL.Add('select W.*,'+
            'SB_MAIN_RESOURCE.GetAccountNumber(W.debt_acc) as DebtAccNo,'+
            'SB_MAIN_RESOURCE.GetAccountNumber(W.cred_acc) as CredAccNo '+
               ' from wares_all_trans W');
   ODSCalcWares.Open;
   Refresh;


    //memo1.Text:=DataModWares.ODSCalcWares.SQL.Text ;
   end;

    end;
 2,3:begin
  with
    DataModWares.ODSCalcWares
     do
      begin
        Close;
          SQL.Clear;
             SQL.Add('select W.*,'+
            'SB_MAIN_RESOURCE.GetAccountNumber(W.debt_acc) as DebtAccNo,'+
            'SB_MAIN_RESOURCE.GetAccountNumber(W.cred_acc) as CredAccNo '+
               ' from wares_all_trans W');
      Open;
      Refresh;
   end;
  end;
  end;
end;

procedure TFormShowTrans.DBGridEhShowTransKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key=vk_up then
DateTimePicker1.Visible:=true;

if key =vk_down then
DateTimePicker1.Visible:=False;

end;

procedure TFormShowTrans.FormCreate(Sender: TObject);
begin
DataModWares.lazy.Refresh;
DateTimePicker1.DateTime:=DataModWares.lazy.FieldByName('in_date').AsDateTime;

    case New_Or_Calc_Wares_Trans of
      1:begin
 DataModWares.SB_MAIN_RESOURCE.CallProcedure('wares_all_transaction',[]);
with
    DataModWares.ODSCalcWares
     do
      begin
        Close;
          SQL.Clear;
             SQL.Add('select W.*,'+
            'SB_MAIN_RESOURCE.GetAccountNumber(W.debt_acc) as DebtAccNo,'+
            'SB_MAIN_RESOURCE.GetAccountNumber(W.cred_acc) as CredAccNo '+
               ' from wares_all_trans W');
      Open;
      Refresh;
   end;
   end;
   4:begin
 //DataModWares.SB_MAIN_RESOURCE.CallProcedure('wares_all_transaction',[]);
with
    DataModWares.ODSCalcWares
     do
      begin
        Close;
          SQL.Clear;
             SQL.Add('select W.*,'+
            'SB_MAIN_RESOURCE.GetAccountNumber(W.debt_acc) as DebtAccNo,'+
            'SB_MAIN_RESOURCE.GetAccountNumber(W.cred_acc) as CredAccNo '+
               ' from wares_all_trans W');
      Open;
      Refresh;
   end;
   end;
 2,3:begin
  DataModWares.SB_MAIN_RESOURCE.CallProcedure('wares_all_transaction2',[]);
with
    DataModWares.ODSCalcWares
     do
      begin
        Close;
         SQL.Clear;
             SQL.Add('select W.*,'+
            'SB_MAIN_RESOURCE.GetAccountNumber(W.debt_acc) as DebtAccNo,'+
            'SB_MAIN_RESOURCE.GetAccountNumber(W.cred_acc) as CredAccNo '+
               ' from wares_all_trans W');
      Open;
      Refresh;
   end;

   end;

   end;


   


   SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

end.

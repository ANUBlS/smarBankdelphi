unit UntAddGroups;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls,Db, ActnList;

type
  TFrmAddGroups = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    EGroupName: TEdit;
    StaticText1: TStaticText;
    Panel4: TPanel;
    StaticText2: TStaticText;
    EGroupAmortTAX: TEdit;
    StaticText3: TStaticText;
    EGroupAmortNB: TEdit;
    StaticText4: TStaticText;
    Panel5: TPanel;
    StaticText5: TStaticText;
    Panel6: TPanel;
    Panel8: TPanel;
    StaticText6: TStaticText;
    CBMainAccount: TComboBox;
    Panel9: TPanel;
    StaticText7: TStaticText;
    CBAmortAccount: TComboBox;
    Panel7: TPanel;
    Panel10: TPanel;
    StaticText8: TStaticText;
    CBExpAccount: TComboBox;
    Panel11: TPanel;
    StaticText9: TStaticText;
    CBSaleAccount: TComboBox;
    ActionList1: TActionList;
    ActionCommit: TAction;
    ActionCancel: TAction;
    Button1: TButton;
    Button2: TButton;
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure CBMainAccountChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ActionCommitExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionCommitUpdate(Sender: TObject);
    procedure EGroupAmortNBKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Fill;
  end;

var
  FrmAddGroups: TFrmAddGroups;

implementation

uses MFDataModule, UntMainFacilitiesImpl, UntAddWares;

{$R *.DFM}



procedure TFrmAddGroups.Fill;
begin
 With MainFDataModule.ODSAccounts do
 if not Active then 
 begin
  Open;
  First;
  While not EOF do
   begin
    CBMainAccount.Items.Add(FieldByName('Acc_no').AsString);
    CBExpAccount.Items.Add(FieldByName('Acc_no').AsString);
    CBAmortAccount.Items.Add(FieldByName('Acc_no').AsString);
    CBSaleAccount.Items.Add(FieldByName('Acc_no').AsString);
    Next;
   end;
 end;
end;

procedure TFrmAddGroups.FormActivate(Sender: TObject);
begin
 Fill;
 if MainFacilities.OpeartionMode = omAdd then
   FrmAddWares.CleanUp(Self)
 else
  if MainFacilities.OpeartionMode = omEdit then
   with MainFDataModule,ViewGroup,OPViewWares do
   begin
    EGroupName.Text :=FieldByName('Name').AsString;
    EGroupAmortNB.Text :=FieldByName('Amort').AsString;
    EGroupAmortTAX.Text :=FieldByName('TaxAmort').AsString;

    CBMainAccount.Text :=CallStringFunction('GetAccountNumber',[FieldByName('Main_Account').AsInteger]);
    CBMainAccount.Tag :=FieldByName('Main_Account').AsInteger;

    CBExpAccount.Text:=CallStringFunction('GetAccountNumber',[FieldByName('Exp_Account').AsInteger]);
    CBExpAccount.Tag:=FieldByName('Exp_Account').AsInteger;

    CBAmortAccount.Text:=CallStringFunction('GetAccountNumber',[FieldByName('Amort_Account').AsInteger]);
    CBAmortAccount.Tag:=FieldByName('Amort_Account').AsInteger;

    CBSaleAccount.Text:=CallStringFunction('GetAccountNumber',[FieldByName('Sale_Account').AsInteger]);
    CBSaleAccount.Tag:=FieldByName('Sale_Account').AsInteger;
   end;
end;

procedure TFrmAddGroups.SpeedButton1Click(Sender: TObject);
begin
 Close;
end;

procedure TFrmAddGroups.CBMainAccountChange(Sender: TObject);
begin
 with MainFDataModule.OPViewWares do
  begin
   (Sender as TComboBox).Tag:=CallIntegerFunction('GetAccountID',[(Sender as TComboBox).Text]);
  end;
end;

procedure TFrmAddGroups.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key = VK_ESCAPE) then Close;
end;

procedure TFrmAddGroups.ActionCommitExecute(Sender: TObject);
var
  SavePlace :integer;
begin
 case MainFacilities.OpeartionMode of
   omAdd :
          begin
           with MainFDataModule,ViewGroup,OPViewWares do
            begin
             CallProcedure('add_groups',[EGroupName.text,StrToInt(EGroupAmortNB.text),CBMainAccount.tag,CBExpAccount.tag,CBAmortAccount.tag,CBSaleAccount.tag,StrToInt(EGroupAmortTAX.text)]);
             DisableControls;
             Refresh;
             EnableControls;
            end;
          end;
   omEdit:
         begin
          with MainFDataModule.OPViewWares,MainFDataModule.ViewGroup do
           begin
             SavePlace :=FieldByName('ID').AsInteger;
             CallProcedure('upd_groups',[FieldByName('ID').AsInteger,EGroupName.text,StrToInt(EGroupAmortNB.text),CBMainAccount.tag,CBExpAccount.tag,CBAmortAccount.tag,CBSaleAccount.tag,StrToInt(EGroupAmortTAX.text)]);
             DisableControls;
             Refresh;
             Locate('ID',SavePlace,[loPartialKey]);
             EnableControls;
           end;
         end;
 end;
 Close;
end;

procedure TFrmAddGroups.ActionCancelExecute(Sender: TObject);
begin
 Close;
end;

procedure TFrmAddGroups.ActionCommitUpdate(Sender: TObject);
begin
 with (Sender as TAction) do
  Enabled :=
           (EGroupName.Text<>'')
           and (EGroupAmortNB.Text<>'')
           and (EGroupAmortTAX.Text<>'')
           and (CBMainAccount.Tag<>0)
end;

procedure TFrmAddGroups.EGroupAmortNBKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9',',','.',#8]) then
   key :=#0
end;

end.

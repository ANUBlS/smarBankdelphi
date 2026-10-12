unit UntFrmInfo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, DBCtrls, Mask, Buttons, ActnList;

type
  TFrmInfo = class(TForm)
    Panel1: TPanel;
    ActionList1: TActionList;
    ActionInsert: TAction;
    ActionUpdate: TAction;
    ActionDelete: TAction;
    Panel2: TPanel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    EIssuedBy: TEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    EPersonDoc: TEdit;
    EFromWhen: TEdit;
    Panel6: TPanel;
    Panel7: TPanel;
    StaticText5: TStaticText;
    Panel8: TPanel;
    StaticText6: TStaticText;
    ESeria: TEdit;
    EDocNumber: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBLookupCashInfo: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ActionInsertExecute(Sender: TObject);
    procedure ActionInsertUpdate(Sender: TObject);
    procedure ActionUpdateUpdate(Sender: TObject);
    procedure ActionDeleteExecute(Sender: TObject);
    procedure ActionUpdateExecute(Sender: TObject);
    procedure DBLookupCashInfoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmInfo: TFrmInfo;

implementation

uses CashDataModule, CashDeskImpl,SBTranslateProc,sboapiDataModuleimpl;

{$R *.DFM}

procedure TFrmInfo.FormCreate(Sender: TObject);
begin
CashDataMod.ODSCashInfo.Open;
CashDataMod.BrowseCashInfo.Open;
 SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TFrmInfo.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
Close;
end;

procedure TFrmInfo.FormActivate(Sender: TObject);
begin
 with CashDataMod.ODSCashInfo do
  begin
   EPersonDoc.Text :=FieldByName('Person_doc').AsString;
   EIssuedBy.Text :=FieldByName('IssuedBy').AsString;
   ESeria.Text :=FieldByName('Seria').AsString;
   EDocNumber.Text :=FieldByName('DocNumber').AsString;
   EFromWhen.Text :=FieldByName('FromWhen').AsString;
  end;
end;

procedure TFrmInfo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key = VK_ESCAPE) then Close;
end;

procedure TFrmInfo.ActionInsertExecute(Sender: TObject);
begin
 with CashDataMod do
  begin
   OPCash.CallProcedure('add_CashInfo',[ODSTransactionsViewer.FieldByName('ID').AsInteger,EPersonDoc.text,EIssuedBy.text,ESeria.text,EDocNumber.text,EFromWhen.text]);
   ODSCashInfo.Refresh;
   BrowseCashInfo.Refresh;
  end;
  Close;
end;

procedure TFrmInfo.ActionInsertUpdate(Sender: TObject);
begin
 (Sender as TAction).Enabled :=
                               CashDataMod.ODSCashInfo.IsEmpty;
end;


procedure TFrmInfo.ActionUpdateUpdate(Sender: TObject);
begin
 (Sender as TAction).Enabled :=
                               not CashDataMod.ODSCashInfo.IsEmpty;

end;

procedure TFrmInfo.ActionDeleteExecute(Sender: TObject);
var
   i:integer;
begin
 for i:=0 to  ComponentCount-1 do
  if (Components[i] is TEdit) then
    (Components[i] as TEdit).text :='';
 with CashDataMod do
  begin
   OPCash.CallProcedure('delete_CashInfo',[ODSTransactionsViewer.FieldByName('ID').AsInteger]);
   ODSCashInfo.Refresh;
   BrowseCashInfo.Refresh;
  end;
 Close; 
end;

procedure TFrmInfo.ActionUpdateExecute(Sender: TObject);
begin
 with CashDataMod do
  begin
   OPCash.CallProcedure('update_CashInfo',[ODSTransactionsViewer.FieldByName('ID').AsInteger,EPersonDoc.text,EIssuedBy.text,ESeria.text,EDocNumber.text,EFromWhen.text]);
   ODSCashInfo.Refresh;
   BrowseCashInfo.Refresh;
  end;
 Close;
end;
procedure TFrmInfo.DBLookupCashInfoClick(Sender: TObject);
begin
 with (Sender as TDBLookupComboBox), ListSource, DataSet do
  begin
   EIssuedBy.Text :=FieldByName('IssuedBy').AsString;
   EPersonDoc.Text :=FieldByName('Person_Doc').AsString;
   EFromWhen.Text := FieldByName('FromWhen').AsString;
   ESeria.Text :=FieldByName('Seria').AsString;
   EDocNumber.Text :=FieldByName('DocNumber').AsString;
  end;
end;

end.

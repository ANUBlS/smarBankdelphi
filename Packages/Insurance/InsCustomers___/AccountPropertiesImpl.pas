unit AccountPropertiesImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls, DBCtrls, Mask, Buttons, Db, HintBox,SBTranslateProc;

type
  TAccountPropertiesForm = class(TForm)
    AccountGB: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBEditAccNo: TDBEdit;
    DBEditCurrID: TDBEdit;
    DBLookupCurr: TDBLookupComboBox;
    DBEditBalance1: TDBEdit;
    DBLookupBalance1: TDBLookupComboBox;
    DTPOpenDate: TDateTimePicker;
    Label7: TLabel;
    Label12: TLabel;
    DBLookupPairAcc: TDBLookupComboBox;
    DBEditLimit: TDBEdit;
    DBLookupSimotchet: TDBLookupComboBox;
    DBEdit4: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    DBEditAccName: TDBEdit;
    DayStartStateGB: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    hbErrorBox: THintBox;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    procedure ButtonCommitClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure DBEditAccNoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    function  SaveAccData():Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AccountPropertiesForm: TAccountPropertiesForm;

implementation

uses  sboapiDataModuleImpl, InsDataModule ;

{$R *.DFM}

function TAccountPropertiesForm.SaveAccData():Boolean;
var
   dsState :   TDataSetState;
begin
  Result := True;
   with InsDataMod, ODSAccount do
    try
      dsState := State;
      Post;
      RefreshRecord;
      if dsState = dsInsert then
         OPCOMMON.CallProcedure('add_lazyrest', [ODSAccount.FieldByName('ID').asFloat])
    except
      on E:Exception do
      begin
        hbErrorBox.ShowMessage(E.Message);
        Result := False;
      end;  
    end;
end;

procedure TAccountPropertiesForm.ButtonCommitClick(Sender: TObject);
begin
 with InsDataMod do
   if ODSAccount.State in [dsEdit, dsInsert] then
       ODSAccountOPEN_DAT.Value :=  Int(DTPOpenDate.Date);
 if SaveAccData then
  ModalResult := mrOk
end;

procedure TAccountPropertiesForm.ButtonCancelClick(Sender: TObject);
begin
 ModalResult := mrCancel
end;


procedure TAccountPropertiesForm.DBEditAccNoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
     begin
       FindNextControl(ActiveControl,true,true,false).SetFocus;
       Key := #0
     end;
end;

procedure TAccountPropertiesForm.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
  with InsDataMod do
  if ( ODSAccount.state = dsEdit ) then
    DTPOpenDate.Date := ODSAccountOPEN_DAT.Value 
  else
   DTPOpenDate.Date :=  getsysdate();

end;

end.

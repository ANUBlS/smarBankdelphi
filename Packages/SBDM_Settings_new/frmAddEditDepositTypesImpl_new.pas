unit frmAddEditDepositTypesImpl_new;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, DBLookupEh, Mask, DBCtrlsEh, ExtCtrls, XFSCtrls;

type
  TfrmAddEditDepositTypes_new = class(TForm)
    ButtonOk: TButton;
    ButtonCancel: TButton;
    XFPanel1: TXFPanel;
    CheckBox2: TCheckBox;
    Panel1: TPanel;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    DBEditEh1: TDBEditEh;
    Label1: TLabel;
    Label3: TLabel;
    CheckBox1: TCheckBox;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonOkClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddEditDepositTypes_new: TfrmAddEditDepositTypes_new;

implementation

{$R *.dfm}
    uses frmDepositTypesImpl_new,SBTranslateProc,sboapiDataModuleimpl;
procedure TfrmAddEditDepositTypes_new.ButtonCancelClick(Sender: TObject);
begin
   with frmDepositTypes_new,DepositTypes do
        Cancel;
   Close;
end;

procedure TfrmAddEditDepositTypes_new.ButtonOkClick(Sender: TObject);
var
cari_meblege_bax,hesab_faiz_evvelceden_vermek:integer;

begin
if CheckBox2.Checked=true then
begin
  cari_meblege_bax:=1;
end;

if CheckBox2.Checked=false then
begin
  cari_meblege_bax:=0;
end;

if CheckBox1.Checked=true then
begin
 hesab_faiz_evvelceden_vermek:=1;
end;

if CheckBox1.Checked=false then
begin
 hesab_faiz_evvelceden_vermek:=0;
end;

   with frmDepositTypes_new do
   begin
    FAdditionalType := AddTypesForColl.FieldByName('addtypename').AsString;
    FWithdrawtype := AddTypesForWith.FieldByName('withdrtype').AsString;
    DepositTypes.FieldByName('PERCENT_RULE').AsInteger:=hesab_faiz_evvelceden_vermek;
    DepositTypes.FieldByName('AMOUNT_RULE').AsInteger:=cari_meblege_bax;
      DepositTypes.Post;
   end;
   ModalResult := MrOk;
end;

procedure TfrmAddEditDepositTypes_new.FormCanResize(Sender: TObject;
  var NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
 Resize := False
end;

procedure TfrmAddEditDepositTypes_new.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TfrmAddEditDepositTypes_new.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Ord(Key) = VK_ESCAPE then Close;
end;

end.

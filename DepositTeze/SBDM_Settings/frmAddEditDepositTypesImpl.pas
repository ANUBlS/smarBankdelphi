unit frmAddEditDepositTypesImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, DBLookupEh, Mask, DBCtrlsEh;

type
  TfrmAddEditDepositTypes = class(TForm)
    ButtonOk: TButton;
    ButtonCancel: TButton;
    DBEditEh1: TDBEditEh;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonOkClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddEditDepositTypes: TfrmAddEditDepositTypes;

implementation

{$R *.DFM}
uses frmDepositTypesImpl,SBTranslateProc,sboapiDataModuleimpl;

procedure TfrmAddEditDepositTypes.FormCanResize(Sender: TObject;
  var NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False
end;

procedure TfrmAddEditDepositTypes.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TfrmAddEditDepositTypes.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Ord(Key) = VK_ESCAPE then Close;
end;

procedure TfrmAddEditDepositTypes.ButtonOkClick(Sender: TObject);
begin
   with frmDepositTypes do
   begin
      FAdditionalType := AddTypesForColl.FieldByName('addtypename').AsString;
      FWithdrawtype := AddTypesForWith.FieldByName('withdrtype').AsString;
      DepositTypes.Post;
   end;
   ModalResult := MrOk;
end;

procedure TfrmAddEditDepositTypes.ButtonCancelClick(Sender: TObject);
begin
   with frmDepositTypes,DepositTypes do
        Cancel;
   Close;     
end;

end.

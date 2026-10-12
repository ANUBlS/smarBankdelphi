unit frmAddEditAccTurningImpl_new;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrlsEh, DBLookupEh, DBCtrls;

type
  TfrmAddEditAccTurning_new = class(TForm)
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CBBranch: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddEditAccTurning_new: TfrmAddEditAccTurning_new;

implementation

{$R *.dfm}
     uses frmAccountTurningImpl_new,SBTranslateProc,sboapiDataModuleimpl;
procedure TfrmAddEditAccTurning_new.Button1Click(Sender: TObject);
begin
   with frmAccountTurning_new do begin
        settings.FieldByName('CurrencyID').AsInteger := valute.FieldByName('Valute').AsInteger;
        settings.Post;
    end;
   Close;
end;

procedure TfrmAddEditAccTurning_new.Button2Click(Sender: TObject);
begin
     with frmAccountTurning_new,settings do
        Cancel;
   Close;
end;

procedure TfrmAddEditAccTurning_new.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False;
end;

procedure TfrmAddEditAccTurning_new.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TfrmAddEditAccTurning_new.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Ord(Key) = VK_ESCAPE then Close;
end;

end.

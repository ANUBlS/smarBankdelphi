unit IEAddEditFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NLSLocalizer, StdCtrls, Mask, DBCtrls, DBCtrlsEh, DBLookupEh;

type
  TFrmIEAddEdit = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    CBBranch: TDBLookupComboBox;
    Label1: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    procedure DBLookupComboboxEh1KeyValueChanged(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmIEAddEdit: TFrmIEAddEdit;

implementation

uses IETuningDataModuleImpl;

{$R *.DFM}

procedure TFrmIEAddEdit.DBLookupComboboxEh1KeyValueChanged(
  Sender: TObject);
begin
  with Sender as TDBLookupComboboxEh do
  UpdateData
end;

procedure TFrmIEAddEdit.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ORD(Key) = VK_ESCAPE then
  Button2.Click
end;

procedure TFrmIEAddEdit.Button2Click(Sender: TObject);
begin
  with IETuningDataMod.LinkValuesData do
  Cancel;
  ModalResult := mrOK;
end;

procedure TFrmIEAddEdit.Button1Click(Sender: TObject);
begin
  with IETuningDataMod.LinkValuesData do
  Post;
  ModalResult := mrOK;
end;

procedure TFrmIEAddEdit.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False
end;

end.

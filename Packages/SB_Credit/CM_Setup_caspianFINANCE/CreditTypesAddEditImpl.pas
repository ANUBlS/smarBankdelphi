unit CreditTypesAddEditImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NLSLocalizer, StdCtrls, Mask, DBCtrls, ExtCtrls, DBCtrlsEh, Buttons, DB;

type
  TFrmAddEditCrdType = class(TForm)
    Panel1: TPanel;
    DBEditDesc: TDBEdit;
    Label1: TLabel;
    BitBtnSave: TBitBtn;
    BitBtnCancel: TBitBtn;
    CheckBoxLine: TCheckBox;
    CheckBoxRen: TCheckBox;
    CheckBoxReserve: TCheckBox;
    CheckBoxCredCard: TCheckBox;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure CheckBoxLineClick(Sender: TObject);
    procedure CheckBoxRenClick(Sender: TObject);
    procedure CheckBoxReserveClick(Sender: TObject);
    procedure BitBtnSaveClick(Sender: TObject);
    procedure BitBtnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBoxCredCardClick(Sender: TObject);
  private
    { Private declarations }
  public
    FDataSet : TDataSet;
    { Public declarations }
  end;

var
  FrmAddEditCrdType: TFrmAddEditCrdType;

implementation

{$R *.DFM}

procedure TFrmAddEditCrdType.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False
end;

procedure TFrmAddEditCrdType.CheckBoxLineClick(Sender: TObject);
begin
  with Sender as TCheckBox , FDataSet do
  begin
    Edit;
    FieldByName('ITYPE').AsInteger := Word(Checked);
  end
end;

procedure TFrmAddEditCrdType.CheckBoxRenClick(Sender: TObject);
begin
  with Sender as TCheckBox , FDataSet do
  begin
    Edit;
    FieldByName('RENEWABLESTATUS').AsInteger := Word(Checked);
  end

end;

procedure TFrmAddEditCrdType.CheckBoxReserveClick(Sender: TObject);
begin
  with Sender as TCheckBox , FDataSet do
  begin
    Edit;
    FieldByName('ICLASS').AsInteger := Word(Checked);
  end
end;

procedure TFrmAddEditCrdType.BitBtnSaveClick(Sender: TObject);
begin
  FDataSet.Post;
  ModalResult := mrOk;
end;

procedure TFrmAddEditCrdType.BitBtnCancelClick(Sender: TObject);
begin
  FDataSet.Cancel;
  ModalResult := mrCancel;
end;

procedure TFrmAddEditCrdType.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FDataSet.State in [dsEdit,dsInsert] then
    FDataSet.Cancel;
end;

procedure TFrmAddEditCrdType.CheckBoxCredCardClick(Sender: TObject);
begin
  with Sender as TCheckBox , FDataSet do
  begin
    Edit;
    FieldByName('CARDTYPE').AsInteger := Word(Checked);
  end

end;

end.

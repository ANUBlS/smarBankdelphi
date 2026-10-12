unit cr_admUsersAddImplpas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrlsEh, DBLookupEh, ExtCtrls, Buttons, CheckLst,
  Evanescence, ActnList;

type
  TfrmUsersAdd = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    btnAdd: TSpeedButton;
    btnClose: TSpeedButton;
    lOtherUsers: TEvanescence;
    actnsUsers: TActionList;
    actUsersAdd: TAction;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCloseClick(Sender: TObject);
    procedure actUsersAddExecute(Sender: TObject);
    procedure lOtherUsersClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lOtherUsersKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsersAdd: TfrmUsersAdd;

implementation

uses cr_admDataModule;

{$R *.DFM}

procedure TfrmUsersAdd.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    actUsersAddExecute(Sender);
  if Key = VK_ESCAPE then
    btnCloseClick(Sender);
end;

procedure TfrmUsersAdd.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmUsersAdd.actUsersAddExecute(Sender: TObject);
var
  i         : Integer;
begin
  with lOtherUsers, admDM do begin
    for i:= 0 to Items.Count-1 do begin
      if Checked[i] then
        CR_ADMIN.CallProcedure('addcredituser',
                               [Items[i]]);
    end;
    RefreshDataSet(SmartUsersDataSet);
    RefreshDataSet(CredUsersDataSet);
    RefreshList;
  end;
end;

procedure TfrmUsersAdd.lOtherUsersClick(Sender: TObject);
begin
  actUsersAdd.Enabled := lOtherUsers.GetCheckedKeyList.Count > 0;
  //ShowMessage(IntToStr(lOtherUsers.GetCheckedKeyList.Count));
end;

procedure TfrmUsersAdd.FormCreate(Sender: TObject);
begin
  lOtherUsers.RefreshList;
end;

procedure TfrmUsersAdd.lOtherUsersKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then
    lOtherUsersClick(Sender);
end;

end.

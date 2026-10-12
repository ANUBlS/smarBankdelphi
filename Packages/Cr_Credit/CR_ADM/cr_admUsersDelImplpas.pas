unit cr_admUsersDelImplpas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrlsEh, DBLookupEh, Buttons, ExtCtrls, CheckLst,
  Evanescence, ActnList;

type
  TfrmUsersDel = class(TForm)
    Panel1: TPanel;
    btnDel: TSpeedButton;
    btnClose: TSpeedButton;
    lCredUsers: TEvanescence;
    actnsUsers: TActionList;
    actUsersDel: TAction;
    Label1: TLabel;
    procedure btnDelClick(Sender: TObject);
    procedure lCredUsersClick(Sender: TObject);
    procedure actUsersDelExecute(Sender: TObject);
    procedure lCredUsersKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCloseClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsersDel: TfrmUsersDel;

implementation

uses cr_admDataModule;

{$R *.DFM}

procedure TfrmUsersDel.btnDelClick(Sender: TObject);
begin
  with admDM do begin
    CR_ADMIN.CallProcedure('deluser', [CredUsersDataSetNAME.AsString]);
    RefreshDataSet(CredUsersDataSet);
    RefreshDataSet(SmartUsersDataSet);
  end; 
end;

procedure TfrmUsersDel.lCredUsersClick(Sender: TObject);
begin
  actUsersDel.Enabled := lCredUsers.GetCheckedKeyList.Count > 0;
end;

procedure TfrmUsersDel.actUsersDelExecute(Sender: TObject);
var
  i  : Integer;
begin
  with lCredUsers, admDM do begin
    for i:= 0 to Items.Count-1 do begin
      if Checked[i] then
        CR_ADMIN.CallProcedure('deluser',
                               [Items[i]]);
    end;
    RefreshDataSet(SmartUsersDataSet);
    RefreshDataSet(CredUsersDataSet);
    RefreshList;
  end;
end;

procedure TfrmUsersDel.lCredUsersKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then
    lCredUsersClick(Sender);
end;

procedure TfrmUsersDel.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmUsersDel.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    actUsersDelExecute(Sender);
  if Key = VK_ESCAPE then
    btnCloseClick(Sender);
end;

end.

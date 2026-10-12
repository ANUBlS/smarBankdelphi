unit admGroupAddImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, StdCtrls, Mask, DBCtrlsEh, DBLookupEh, Buttons,
  ActnList;

type
  TfrmGroupAdd = class(TForm)
    Panel1: TPanel;
    edGroupName: TEdit;
    cbGroupType: TDBLookupComboboxEh;
    edDescription: TEdit;
    btnAddGroup: TSpeedButton;
    btnClose: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    actsGroupAdd: TActionList;
    actAddGroup: TAction;
    procedure edGroupNameKeyPress(Sender: TObject; var Key: Char);
    procedure actAddGroupExecute(Sender: TObject);
    procedure edGroupNameChange(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edGroupNameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbGroupTypeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDescriptionKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGroupAdd: TfrmGroupAdd;

implementation

uses admDataModule,SBTranslateProc,sboapiDataModuleimpl;

{$R *.DFM}

procedure TfrmGroupAdd.edGroupNameKeyPress(Sender: TObject; var Key: Char);
begin
  //if not (Key in (['A'..'Z']+['a'..'z']+['0'..'9'])) then
   // Key := Char(nil);
end;

procedure TfrmGroupAdd.actAddGroupExecute(Sender: TObject);
begin
  with admDM, CM_ADMIN do begin
    CallProcedure('grmaddgroup', [edGroupName.Text,
                                  GroupTypeDataSetID.AsInteger,
                                  edDescription.Text]);
    RefreshDataSet(GroupsDataSet);
    RefreshDataSet(GroupTypeDataSet);
    edGroupName.Text := '';
    edDescription.Text := '';
  end;
end;

procedure TfrmGroupAdd.edGroupNameChange(Sender: TObject);
begin
  with admDM do
  actAddGroup.Enabled :=
    (edGroupName.Text <> '')
    and (GroupTypeDataSetID.AsInteger >= 0);
end;

procedure TfrmGroupAdd.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGroupAdd.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TfrmGroupAdd.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin      
  if Key = VK_ESCAPE then
    btnCloseClick(Sender);
end;

procedure TfrmGroupAdd.edGroupNameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //if Key = VK_RETURN then
   // cbGroupType.SetFocus;
end;

procedure TfrmGroupAdd.cbGroupTypeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ShowMessage(IntToStr(Key));
  //if Key = VK_RETURN then
   // edDescription.SetFocus;
end;

procedure TfrmGroupAdd.edDescriptionKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (actAddGroup.Enabled) then
    actAddGroupExecute(Sender);
end;

procedure TfrmGroupAdd.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_RETURN then
    SelectNext(ActiveControl, True, True);
end;

end.

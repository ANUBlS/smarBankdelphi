unit admexpertimpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, nlsDialogs,
  Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, CheckLst, Evanescence,
  ActnList, NLSLocalizer;

type
  TExpertDel = class(TForm)
    Localizer: TNLSLocalizer;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    btnCommit: TSpeedButton;
    btnClose: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    lAdditionGrants: TEvanescence;
    AUserGrants: TEvanescence;
    procedure SpeedButton1Click(Sender: TObject);
    procedure lAdditionGrantsClickCheck(Sender: TObject);
    procedure AUserGrantsClickCheck(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnCommitClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ExpertDel: TExpertDel;

implementation

uses admDataModule,sboapiDataModuleImpl;
{$R *.DFM}



procedure TExpertDel.SpeedButton1Click(Sender: TObject);
var
  i: Integer;
begin
  with admDM, lAdditionGrants do begin
    for i:=0 to KeyItems.Count-1 do
   // ShowMessage('dfgdg');
      if Checked[i] then begin
        CM_ADMIN.CallProcedure('addAdditionusergrant',[KeyItems[i] ,CredUsersDataSetSYSTEMID.AsInteger]);
      end;
    RefreshDataSet(AdditionDSet);
    RefreshDataSet(AdditionSrcGRDSet);
    lAdditionGrants.RefreshList;
    AUserGrants.RefreshList;
   SpeedButton1.Enabled:=false;
   SpeedButton2.Enabled:=false;
end;
end;
procedure TExpertDel.lAdditionGrantsClickCheck(Sender: TObject);
begin
if lAdditionGrants.GetCheckedKeyList.Count > 0 then
SpeedButton1.Enabled:=true;
end;

procedure TExpertDel.AUserGrantsClickCheck(Sender: TObject);
begin
if AUserGrants.GetCheckedKeyList.Count > 0 then
SpeedButton2.Enabled:=true;
end;

procedure TExpertDel.SpeedButton2Click(Sender: TObject);
var
  i: Integer;
begin
  with admDM, AUserGrants do begin
    for i:=0 to KeyItems.Count-1 do
   // ShowMessage('dfgdg');
      if Checked[i] then begin
        CM_ADMIN.CallProcedure('deluserAdditio',[KeyItems[i] ,CredUsersDataSetSYSTEMID.AsInteger]);
      end;
    RefreshDataSet(AdditionDSet);
    RefreshDataSet(AdditionSrcGRDSet);
    lAdditionGrants.RefreshList;
    AUserGrants.RefreshList;
   SpeedButton1.Enabled:=false;
   SpeedButton2.Enabled:=false;
end;


end;

procedure TExpertDel.btnCommitClick(Sender: TObject);
begin
  sboapiDataModule.SBSession.Commit;
end;

procedure TExpertDel.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TExpertDel.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    btnCloseClick(Sender);
end;

end.

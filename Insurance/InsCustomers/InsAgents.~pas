unit InsAgents;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, LDialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls,db, ImgList,
  ActnList, ComCtrls, ToolWin;

type
  TfrmAgents = class(TForm)
    GridAgents: TDBGrid;
    Panel2: TPanel;
    NEdit: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ActionList1: TActionList;
    AInsert: TAction;
    AEdit: TAction;
    ADelete: TAction;
    ACommit: TAction;
    ARefresh: TAction;
    ImageList1: TImageList;
    AExit: TAction;
    Panel1: TPanel;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure NEditKeyPress(Sender: TObject; var Key: Char);
    procedure btnCloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure AInsertExecute(Sender: TObject);
    procedure AEditExecute(Sender: TObject);
    procedure ADeleteExecute(Sender: TObject);
    procedure ARefreshExecute(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ACommitExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAgents: TfrmAgents;

implementation

uses InsDataModule;

{$R *.DFM}

procedure TfrmAgents.NEditKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then
     begin
        if HiWord(GetKeyState(VK_Shift))<>0 then
           with Sender as TControl do
           SelectNext(ActiveControl,False, True)
        else
           with Sender as TControl do
           SelectNext(ActiveControl,True, True);
        key:=#0;
     end;
end;

procedure TfrmAgents.btnCloseClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmAgents.FormActivate(Sender: TObject);
begin
     NEdit.SetFocus;
end;

procedure TfrmAgents.AInsertExecute(Sender: TObject);
begin
     with InsDataMod, ODSAgents do
       Insert;
     NEdit.SetFocus;  

end;

procedure TfrmAgents.AEditExecute(Sender: TObject);
begin
     if not InsDataMod.ODSAgents.Active then
      InsDataMod.ODSAgents.Edit;
end;

procedure TfrmAgents.ADeleteExecute(Sender: TObject);
begin
     if MessageDlg('Информасийа силинсин ?',mtConfirmation,[mbYes,mbNo,mbCancel],0)=mrYes then
     InsDataMod.ODSAgents.Delete;
end;

procedure TfrmAgents.ARefreshExecute(Sender: TObject);
begin
      InsDataMod.ODSAgents.Refresh;
end;

procedure TfrmAgents.BitBtn2Click(Sender: TObject);
begin
  with InsDataMod, ODSAgents do
    Close;
end;

procedure TfrmAgents.BitBtn1Click(Sender: TObject);
begin
  with InsDataMod, ODSAgents do
    if State in [dsInsert, dsEdit] then
       Post;
end;

procedure TfrmAgents.ACommitExecute(Sender: TObject);
begin
  with InsDataMod, ODSAgents do
    if State in [dsInsert, dsEdit] then begin
       Post;
       RefreshRecord;
    end;

end;

procedure TfrmAgents.FormCreate(Sender: TObject);
begin
  with InsDataMod, ODSAgents do
       Open;
end;

end.

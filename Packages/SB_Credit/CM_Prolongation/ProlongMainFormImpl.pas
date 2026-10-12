unit ProlongMainFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, ToolWin, ComCtrls, ActnList, ImgList, Grids,
  DBGridEh, CMExcelExport, DBGridEhGrouping, GridsEh;

type
  TProlongMainForm = class(TForm)
    Panel1: TPanel;
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    ActionList1: TActionList;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    DBGridEh1: TDBGridEh;
    StatusBar1: TStatusBar;
    ActnAddProlong: TAction;
    ActnDel: TAction;
    ActnExport: TAction;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ActnQuit: TAction;
    EExporter: TCMExcelExport;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActnQuitExecute(Sender: TObject);
    procedure ActnExportExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActnAddProlongExecute(Sender: TObject);
    procedure ActnDelExecute(Sender: TObject);
  private
    procedure ShowProlongForm;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ProlongMainForm: TProlongMainForm;

procedure InitPlugin(S : String); export;

implementation


 uses ProlongDataModuleImpl, CommonDecls, SbSystem, ProlongAddForm, MaxiImplpas;

{$R *.DFM}

procedure TProlongMainForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_RETURN then
    Close
end;

procedure TProlongMainForm.ShowProlongForm;
resourcestring
  rsFormCaption = '%s № li müqavilə . Restrukturizasiya';
var
  CreditID : Integer;
begin
  CreditID := get_SelectedCrdID;
  
  with ProlongDataMod do
  begin
    with ProlongsData do
    begin
      ClearVariables;
      SetVariable('CreditID',CreditID);
      Open;
    end;
    
    with CreditInfo do
    begin
      ClearVariables;
      SetVariable('ID',CreditID);
      Open;
    end;
  end;
  Caption := Format(rsFormCaption,[get_SelectedCrdNo]);
  ShowModal;
end;

procedure TProlongMainForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;
end;

procedure InitPlugin(S : String); export;
begin
  ProlongMainForm.ShowProlongForm
end;

procedure TProlongMainForm.FormCreate(Sender: TObject);
begin
  ProlongDataMod := TProlongDataMod.Create(Self);
  MaxiFrm:=TMaxiFrm.Create(self);
end;

procedure TProlongMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with ProlongDataMod do
  begin
    ProlongsData.Close;
    CreditInfo.Close;
  end;

 SafeRefresh(True,rmLocateAfterRefresh);

end;

procedure TProlongMainForm.ActnQuitExecute(Sender: TObject);
begin
  Close;
end;

procedure TProlongMainForm.ActnExportExecute(Sender: TObject);
begin
  with EExporter do
  begin
    Connect;
    ExportDataset (ProlongDataMod.ProlongsData, 'Prolongations', True)
  end;
end;

exports
  InitPlugin;

procedure TProlongMainForm.FormDestroy(Sender: TObject);
begin
  ProlongDataMod.Free;
end;

procedure TProlongMainForm.ActnAddProlongExecute(Sender: TObject);
begin

 if ProlongDataMod.CreditInfo.FieldByName('credittype').AsInteger=20 then
 MaxiFrm.ShowModal
 else
  with TfrmProlongAdd.Create(Self) do
  try

    ShowModal;
  finally
    Release;
  end;
end;

procedure TProlongMainForm.ActnDelExecute(Sender: TObject);
resourcestring
  rsSureWantDelete = 'Sonuncu prolongosiya silinsin ?';
var
  CreditID : Integer;
begin

  if MessageDlg(
       rsSureWantDelete,
       mtConfirmation,
       [mbYes,mbNo],
       0) <> mrYes
  then    Exit;

  CreditID := Get_SelectedCrdID;
   
  with ProlongDataMod.CM_PROLONGATION do
    CallProcedure('DelLastProlongation',[CreditID]);
    
  with ProlongDataMod do
  begin
    ProlongsData.Refresh;
    CreditInfo.Refresh;
  end;
  
end;

initialization
  ProlongMainForm := TProlongMainForm.Create(CommonApplication);

end.

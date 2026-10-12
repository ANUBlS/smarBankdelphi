unit frmProlongationImpl_new;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  Oracle, Db, OracleData, ComCtrls, ToolWin, ExtCtrls, CMExcelExport,
  ImgList, ActnList,  Grids, DBGridEh, StdCtrls;

type
  TfrmProlongation_new = class(TForm)
    ActionList1: TActionList;
    ActnAddProlong: TAction;
    ActnDel: TAction;
    ActnExport: TAction;
    ActnQuit: TAction;
    DBGridEh1: TDBGridEh;
    DepositInf: TOracleDataSet;
    DepositInfCLOSEDATE: TDateTimeField;
    EExporter: TCMExcelExport;
    ImageList1: TImageList;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton7: TToolButton;
    ToolButton6: TToolButton;
    prolongations: TOracleDataSet;
    prolongationsID: TFloatField;
    prolongationsID2: TFloatField;
    prolongationsHDATE: TDateTimeField;
    prolongationsOLDDATE: TDateTimeField;
    prolongationsNEWDATE: TDateTimeField;
    sbcm_prolongation: TOraclePackage;
    StatusBar1: TStatusBar;
    prolongationsDatSrc: TDataSource;
    sb_aca: TOraclePackage;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActnAddProlongExecute(Sender: TObject);
    procedure ActnDelExecute(Sender: TObject);
    procedure ActnExportExecute(Sender: TObject);
    procedure ActnDelUpdate(Sender: TObject);
    procedure ActnExportUpdate(Sender: TObject);
    procedure ActnQuitExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProlongation_new: TfrmProlongation_new;

    procedure exportproc(s:String);export;
implementation

{$R *.dfm}
   uses sboapiDataModuleImpl, frmAddProlongationImpl_new,CommonDeclsImpl_new,SBTranslateProc;

procedure exportproc(s:String);export;
var ContID :Integer;
begin
   ContID := Get_SelectedContID;
  with frmProlongation_new do
  begin
   with prolongations do
   begin
      if Active then CloseAll;
      SetVariable('ContractID',ContID);
      Open;
   end;


   with DepositInf do
   begin
      if Active then CloseAll;
      SetVariable('ContractID',ContID);
      Open;
   end;
  end;

   frmProlongation_new.ShowModal;
end;

exports
   exportproc;

procedure TfrmProlongation_new.ActnAddProlongExecute(Sender: TObject);
begin
 with frmProlongation_new,sb_aca do
begin
      CallProcedure('checkadvancedobjectaccess',['INSERT_SBCM_PROLONGATION']);
end;
frmAddProlongation_new.ShowModal;
end;

procedure TfrmProlongation_new.ActnDelExecute(Sender: TObject);
begin
 with frmProlongation_new,sb_aca do
begin
      CallProcedure('checkadvancedobjectaccess',['DELETE_SBCM_PROLONGATION']);
end;
   if MessageDlg('Silinməsinə Əminsinizmi?', mtInformation, [mbYes,mbNo],0) = mrNo then
      exit;

   with  sbcm_prolongation do
        CallProcedure('DelLastProlongation',[Get_SelectedContID]);

    prolongations.refresh;
    DepositInf.refresh;
end;

procedure TfrmProlongation_new.ActnDelUpdate(Sender: TObject);
begin
    with (Sender as TAction) do
          Enabled := prolongations.RecordCount > 0
end;

procedure TfrmProlongation_new.ActnExportExecute(Sender: TObject);
begin
 with frmProlongation_new,sb_aca do
begin
      CallProcedure('checkadvancedobjectaccess',['EXCEL_SBCM__PROLONGATION']);
end;
   with EExporter do
   begin
      Connect;
      ExportDataset(prolongations,'Prolonqasiya',True);
      Disconnect;
   end;
end;

procedure TfrmProlongation_new.ActnExportUpdate(Sender: TObject);
begin
    with (Sender as TAction) do
          Enabled := prolongations.RecordCount > 0
end;

procedure TfrmProlongation_new.ActnQuitExecute(Sender: TObject);
begin
   Close;
end;

procedure TfrmProlongation_new.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
 Resize  := False;
end;

procedure TfrmProlongation_new.FormCreate(Sender: TObject);
begin
   frmAddProlongation_new := TfrmAddProlongation_new.Create(Self);
   SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TfrmProlongation_new.FormDestroy(Sender: TObject);
begin
frmAddProlongation_new.Free;
end;

procedure TfrmProlongation_new.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if ord(Key) = VK_ESCAPE then  Close
end;
   initialization
   frmProlongation_new := TfrmProlongation_new.Create(CommonApplication);
end.

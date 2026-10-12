unit NewDepositsFrmProlongationImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, LDialogs,
  Oracle, Db, OracleData, ComCtrls, ToolWin, ExtCtrls, CMExcelExport,
  ImgList, ActnList,  Grids, DBGridEh, StdCtrls, DBGridEhGrouping, GridsEh;

type
  TNewDepositsFrmProlongation = class(TForm)
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
    ToolBar2: TToolBar;
    BtnCust: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    Köçermeler: TToolButton;
    ToolButton11: TToolButton;
    Əməliyyat: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
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
  NewDepositsFrmProlongation: TNewDepositsFrmProlongation;

    procedure exportproc(s:String);export;
implementation

{$R *.dfm}
uses sboapiDataModuleImpl, NewDepositsFrmAddProlongationImpl,NewCommonDeclsImpl,SBTranslateProc;

procedure exportproc(s:String);export;
var ContID :Integer;
    Contno :string;
begin
   ContID := Get_SelectedContID;
   Contno := Get_SelectedContNo;
  with NewDepositsFrmProlongation do
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
   NewDepositsFrmProlongation.Caption:='No-'+Contno+'Müqavilənin uzadılması';
   NewDepositsFrmProlongation.ShowModal;
end;

exports
   exportproc;

procedure TNewDepositsFrmProlongation.ActnAddProlongExecute(Sender: TObject);
begin
 with NewDepositsFrmProlongation,sb_aca do
 begin
   CallProcedure('checkadvancedobjectaccess',['INSERT_DM_PROLONGATION']);
 end;
 NewDepositsFrmAddProlongation.ShowModal;
end;

procedure TNewDepositsFrmProlongation.ActnDelExecute(Sender: TObject);
begin
 with NewDepositsFrmProlongation,sb_aca do
 begin
   CallProcedure('checkadvancedobjectaccess',['DELETE_DM_PROLONGATION']);
 end;
 if MessageDlg('Silinməsinə Əminsinizmi?', mtInformation, [mbYes,mbNo],0) = mrNo then
 exit;

 with  sbcm_prolongation do
      CallProcedure('DelProlongation',[prolongationsID.AsInteger]);

 prolongations.refresh;
 DepositInf.refresh;
end;

procedure TNewDepositsFrmProlongation.ActnDelUpdate(Sender: TObject);
begin
    with (Sender as TAction) do
          Enabled := prolongations.RecordCount > 0
end;

procedure TNewDepositsFrmProlongation.ActnExportExecute(Sender: TObject);
begin
 with NewDepositsFrmProlongation,sb_aca do
begin
      CallProcedure('checkadvancedobjectaccess',['EXCEL_DM__PROLONGATION']);
end;
   with EExporter do
   begin
      Connect;
      ExportDataset(prolongations,'Prolonqasiya',True);
      Disconnect;
   end;
end;

procedure TNewDepositsFrmProlongation.ActnExportUpdate(Sender: TObject);
begin
    with (Sender as TAction) do
          Enabled := prolongations.RecordCount > 0
end;

procedure TNewDepositsFrmProlongation.ActnQuitExecute(Sender: TObject);
begin
   Close;
end;

procedure TNewDepositsFrmProlongation.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
 Resize  := False;
end;

procedure TNewDepositsFrmProlongation.FormCreate(Sender: TObject);
begin
   NewDepositsFrmAddProlongation := TNewDepositsFrmAddProlongation.Create(Self);
   SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TNewDepositsFrmProlongation.FormDestroy(Sender: TObject);
begin
NewDepositsFrmAddProlongation.Free;
end;

procedure TNewDepositsFrmProlongation.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if ord(Key) = VK_ESCAPE then  Close
end;
   initialization
   NewDepositsFrmProlongation := TNewDepositsFrmProlongation.Create(CommonApplication);
end.

unit NewDepositsFrmStopcalculationImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, LDialogs,
  Oracle, Db, OracleData, ComCtrls, ToolWin, ExtCtrls, CMExcelExport,
  ImgList, ActnList,  Grids, DBGridEh, StdCtrls, DBGridEhGrouping, GridsEh;

type
  TNewDepositsFrmStopCalculation = class(TForm)
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
    stopcalculation: TOracleDataSet;
    stopcalculationID: TFloatField;
    stopcalculationID2: TFloatField;
    stopcalculationHDATE: TDateTimeField;
    stopcalculationOLDDATE: TDateTimeField;
    stopcalculationNEWDATE: TDateTimeField;
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
  NewDepositsFrmStopCalculation: TNewDepositsFrmStopCalculation;

    procedure exportproc(s:String);export;
implementation

{$R *.dfm}
uses sboapiDataModuleImpl, NewDepositsFrmAddStopcalculationImpl,NewCommonDeclsImpl,SBTranslateProc;

procedure exportproc(s:String);export;
var ContID :Integer;
    Contno :string;
begin
   ContID := Get_SelectedContID;
   Contno := Get_SelectedContNo;
  with NewDepositsFrmStopCalculation do
  begin
   with stopcalculation do
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
   NewDepositsFrmStopCalculation.Caption:='No-'+Contno+'Müqavilənin dayandırılması';
   NewDepositsFrmStopCalculation.ShowModal;
end;

exports
   exportproc;

procedure TNewDepositsFrmStopCalculation.ActnAddProlongExecute(Sender: TObject);
begin
 with NewDepositsFrmStopCalculation,sb_aca do
 begin
   CallProcedure('checkadvancedobjectaccess',['INSERT_STOPCALCULATION']);
 end;
 NewDepositsFrmAddStopCalculation.ShowModal;
end;

procedure TNewDepositsFrmStopCalculation.ActnDelExecute(Sender: TObject);
begin
 with NewDepositsFrmStopCalculation,sb_aca do
 begin
   CallProcedure('checkadvancedobjectaccess',['DELETE_STOPCALCULATION']);
 end;
 if MessageDlg('Silinməsinə Əminsinizmi?', mtInformation, [mbYes,mbNo],0) = mrNo then
 exit;

 with  sbcm_prolongation do
      CallProcedure('DelProlongation',[stopcalculationID.AsInteger]);

 stopcalculation.refresh;
 DepositInf.refresh;
end;

procedure TNewDepositsFrmStopCalculation.ActnDelUpdate(Sender: TObject);
begin
    with (Sender as TAction) do
          Enabled := stopcalculation.RecordCount > 0
end;

procedure TNewDepositsFrmStopCalculation.ActnExportExecute(Sender: TObject);
begin
 with NewDepositsFrmStopCalculation,sb_aca do
begin
      CallProcedure('checkadvancedobjectaccess',['EXCEL_STOPCALCULATION']);
end;
   with EExporter do
   begin
      Connect;
      ExportDataset(stopcalculation,'Müqavilənin Dayandırılması',True);
      Disconnect;
   end;
end;

procedure TNewDepositsFrmStopCalculation.ActnExportUpdate(Sender: TObject);
begin
    with (Sender as TAction) do
          Enabled := stopcalculation.RecordCount > 0
end;

procedure TNewDepositsFrmStopCalculation.ActnQuitExecute(Sender: TObject);
begin
   Close;
end;

procedure TNewDepositsFrmStopCalculation.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
 Resize  := False;
end;

procedure TNewDepositsFrmStopCalculation.FormCreate(Sender: TObject);
begin
   NewDepositsFrmAddStopCalculation := TNewDepositsFrmAddStopCalculation.Create(Self);
   SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TNewDepositsFrmStopCalculation.FormDestroy(Sender: TObject);
begin
NewDepositsFrmAddStopCalculation.Free;
end;

procedure TNewDepositsFrmStopCalculation.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if ord(Key) = VK_ESCAPE then  Close
end;
   initialization
   NewDepositsFrmStopCalculation := TNewDepositsFrmStopCalculation.Create(CommonApplication);
end.

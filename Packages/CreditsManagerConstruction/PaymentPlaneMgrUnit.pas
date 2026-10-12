unit PaymentPlaneMgrUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Db, OracleData, Grids, DBGrids, ExtCtrls,
  ComCtrls, ToolWin, ActnList, ImgList, CMExcelExport;

type
  TPaymentPlaneForm = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    ToolBarImages: TImageList;
    ActionList1: TActionList;
    ToolBar2: TToolBar;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    Panel1: TPanel;
    SchduleGrid: TDBGrid;
    BayerInfoDatSrc: TDataSource;
    BayerInfo: TOracleDataSet;
    Creditsinfo: TOracleDataSet;
    CreditsinfoDatSrc: TDataSource;
    PlanInfo: TOracleDataSet;
    PlanInfoDatSrc: TDataSource;
    PlanInfoID: TFloatField;
    PlanInfoID2: TFloatField;
    PlanInfoPAYMENTDATE: TDateTimeField;
    PlanInfoMAINAMT: TFloatField;
    PlanInfoINTAMT: TFloatField;
    ActnAdd: TAction;
    ActnEdit: TAction;
    ActnDelete: TAction;
    ActnRefresh: TAction;
    ActnClose: TAction;
    ActnExport: TAction;
    ToolBar1: TToolBar;
    ToolButton8: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ActnAunitet: TAction;
    PlanInfoSeqNo: TIntegerField;
    CreditsinfoCREDITAMOUNT: TFloatField;
    CreditsinfoINITIALAMOUNT: TFloatField;
    CreditsinfoOPENDATE: TDateTimeField;
    CreditsinfoCLOSEDATE: TDateTimeField;
    CreditsinfoINTERESTRATE: TFloatField;
    CreditsinfoPENALITYINTERESTRATE: TFloatField;
    CreditsinfoCLIENTID: TFloatField;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    ExportPaymentPlane: TCMExcelExport;
    ActnPrint: TAction;
    ExpPayPlaneData: TOracleDataSet;
    ExpPayPlaneDataPAYMENTDATE: TDateTimeField;
    ExpPayPlaneDataMAINAMT: TFloatField;
    ToolButton4: TToolButton;
    ToolButton3: TToolButton;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActnAddExecute(Sender: TObject);
    procedure PlanInfoSeqNoGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure PlanInfoApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: String);
    procedure ActnEditExecute(Sender: TObject);
    procedure ActnRefreshExecute(Sender: TObject);
    procedure ActnDeleteExecute(Sender: TObject);
    procedure ActnAunitetExecute(Sender: TObject);
    procedure ActnPrintExecute(Sender: TObject);
    procedure ActnCloseExecute(Sender: TObject);
    procedure SchduleGridKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    function CreditID:Longint;
    function MonthsBeetwean(D1,D2 : TDateTime) : Integer;
  end;

var
  PaymentPlaneForm: TPaymentPlaneForm;

implementation

{$R *.DFM}
uses DatModConstructionImpl,CreditsManagerForConstructionImpl,
     sboapiDataModuleImpl,PayPlanAddEditFormMgrUnit,AutoPayPlaneFormUnit,
  RepSeduleImpl, ReportImpl;


function TPaymentPlaneForm.MonthsBeetwean(D1,D2 : TDateTime) : Integer;  //D1<D2
    var
      TempDate : TDateTime;
    begin
      Result := 1;
      TempDate := D1;

      while IncMonth(TempDate,Result) <= D2 do
        INC(Result);

      if IncMonth(TempDate,Result) > D2 then
        Result := Result - 1;
end;


 function TPaymentPlaneForm.CreditID:Longint;
 begin
    result := DatModConstruction.Credits.FieldByName('ID').AsInteger;
 end;

procedure TPaymentPlaneForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False;
end;

procedure TPaymentPlaneForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if ord(key) = VK_ESCAPE then close;
end;

procedure TPaymentPlaneForm.FormCreate(Sender: TObject);
var CreditID,BayerID :Integer;
begin
//RepSedule:=TRepSedule.create(self);
    CreditID := DatModConstruction.Credits.FieldByName('ID').AsInteger;
    with Creditsinfo do
   begin
    close;
       SetVariable('CRDID',CreditID);
       Open;
       BayerID := FieldByName('ClientID').AsInteger;
   end;

 with BayerInfo do
   begin
    close;
     SetVariable('BID',BayerID);
     open;
   end;

   with PlanInfo do
   begin
      close;
      SetVariable('CrdID',CreditID);
      open;
   end;      
   PayPlanAddEditForm := TPayPlanAddEditForm.Create(Self);
end;

procedure TPaymentPlaneForm.FormDestroy(Sender: TObject);
begin
   BayerInfo.Close;
   Creditsinfo.close;
   PlanInfo.close;
end;

procedure TPaymentPlaneForm.ActnAddExecute(Sender: TObject);


var
  SavePlace : TBookmark;
begin
    with PlanInfo do begin
         Insert;
         FieldByName('ID#').AsInteger := CreditID;
         FieldByName('ID').AsInteger :=0;

   end;

   PayPlanAddEditForm.showmodal;

end;

procedure TPaymentPlaneForm.PlanInfoSeqNoGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
 Text := IntToStr(Sender.DataSet.RecNo);
end;

procedure TPaymentPlaneForm.PlanInfoApplyRecord(Sender: TOracleDataSet;
  Action: Char; var Applied: Boolean; var NewRowId: String);

var
  CreditID ,id: Integer;
  PayDate : TDateTime;
  Principial, Interest : Real;
begin
  Applied := True;
  with Sender do
  begin
    id := FieldByName('ID').AsInteger ;
    CreditID := FieldByName('ID#').AsInteger;
    PayDate := FieldByName('PaymentDate').AsDateTime;
    Principial := FieldByName('MainAmt').AsFloat;
    Interest := FieldByName('IntAmt').AsFloat;

  end;

  case Action of
    'I','U' :
       with  DatModConstruction,sbcm_construction do
       ID :=
       CallIntegerFunction('PaymentPlane_AddEdit',[
         'p_ID' , ID ,
         'p_CreditID' , CreditID ,
         'p_PayDate' , PayDate ,
         'p_Principial' , Principial ,
         'p_Interest' , Interest
       ]);

      'D': with  DatModConstruction,sbcm_construction do
       CallProcedure('DeletePaymentPlane',[
         'p_ID' , ID 
       ]);


    end; // Case


end;

procedure TPaymentPlaneForm.ActnEditExecute(Sender: TObject);
begin
    with PlanInfo do begin
         Edit;
  end;

   PayPlanAddEditForm.showmodal;

end;

procedure TPaymentPlaneForm.ActnRefreshExecute(Sender: TObject);
begin
   PlanInfo.Refresh;
end;

procedure TPaymentPlaneForm.ActnDeleteExecute(Sender: TObject);
var  I : Integer;
begin
  if MessageDlg(
                   'Silinməsinə əminsinizmi?',
                   mtConfirmation,
                   [mbYes,
                   mbNo],
                    0) = mrYes then
begin
  with SchduleGrid do
  for I := SelectedRows.Count-1  downto 0 do
  begin
    DataSource.DataSet.GotoBookmark(Pointer(SelectedRows[I]));
    DataSource.DataSet.Delete;
    DataSource.DataSet.Refresh
  end;
  end;
end;

procedure TPaymentPlaneForm.ActnAunitetExecute(Sender: TObject);
var D1,D2 :TDateTime;
begin
   D1 := Creditsinfo.FieldByName('OpenDate').AsDateTime;
   D2 := Creditsinfo.FieldByName('CloseDate').AsDateTime;
   AutoPayPlaneForm := TAutoPayPlaneForm.Create(Self);
   with AutoPayPlaneForm do begin
        DTPStartDate.DateTime := Creditsinfo.FieldByName('OpenDate').AsDateTime;
        AmountEdit.Text :=FloatToStr(Creditsinfo.FieldByName('CREDITAMOUNT').AsFloat);
        CmbBoxPeriodRate.ItemIndex:=0;
        NPeriodsEdit.Text := IntToStr(MonthsBeetwean(D1,D2));
        ShowModal;
   end;
end;

procedure TPaymentPlaneForm.ActnPrintExecute(Sender: TObject);
begin
 // if  Assigned(RepSedule) then
 // RepSedule:= TRepSedule.Create(nil);
   if not Assigned(RepSedule) then
    RepSedule:= TRepSedule.Create(application);
    with RepSedule,PlanInfo  do  begin
       ClearVariables;
       close;
       SetVariable('CrdID',DatModConstruction.Credits.FieldByName('ID').AsInteger);
       Open;
       end;
 with RepSedule,ReportPayShedData  do  begin
       ClearVariables;
       close;
       SetVariable('id',DatModConstruction.Credits.FieldByName('ID').AsInteger);
       Open;
     Preview;
   Refresh;
  end;


{   with ExpPayPlaneData do
   begin
      if Active then close;
      SetVariable('CrdID',CreditID);
      Open;
   end;
   with ExportPaymentPlane do
   begin
      Connect;
      ExportDataset(ExpPayPlaneData,'Ödəmə planı',true);
      Disconnect;
   end;   }
end;

procedure TPaymentPlaneForm.ActnCloseExecute(Sender: TObject);
begin
   Close
end;

procedure TPaymentPlaneForm.SchduleGridKeyPress(Sender: TObject;
  var Key: Char);
begin
 with SchduleGrid,SelectedRows,DataSource.DataSet do
  begin
    DisableControls;
    try
      First;
      while not Eof do
      begin
        CurrentRowSelected := True;
        Next;
      end;
    finally
      EnableControls;
    end;
  end;

end;

end.

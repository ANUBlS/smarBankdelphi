unit OrderImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, DB, OracleData, ComCtrls, ToolWin, StdCtrls, Mask,
  DBCtrls, ImgList, DBGrids, Buttons;

type
  TFrmOrder = class(TForm)
    ImageList1: TImageList;
    GroupBox1: TGroupBox;
    DBEdit1: TDBEdit;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    PaymentsDatSrc: TDataSource;
    Payments: TOracleDataSet;
    PaymentsID: TFloatField;
    PaymentsDDD: TWideStringField;
    PaymentsPAYDATE: TDateTimeField;
    PaymentsID2: TFloatField;
    PaymentsPAYAMT: TFloatField;
    PaymentsNAME: TWideStringField;
    DBGridEh1: TDBGridEh;
    BtnPrint: TBitBtn;
    BtnClose: TBitBtn;
    cc_buyer_flatsDataDatSrc: TDataSource;
    cc_buyer_flats: TOracleDataSet;
    cc_buyer_flatsADDRESS: TWideStringField;
    cc_buyer_flatsBLD_NAME: TWideStringField;
    cc_buyer_flatsID: TFloatField;
    cc_buyer_flatsFLATCODE: TWideStringField;
    ReportPayOrderData: TOracleDataSet;
    ReportPayOrderDataID: TFloatField;
    ReportPayOrderDataPAYDATE: TDateTimeField;
    ReportPayOrderDataPAYAMT: TFloatField;
    ReportPayOrderDataCONTAMOUNT: TFloatField;
    ReportPayOrderDataLOANACCNO: TWideStringField;
    ReportPayOrderDataCLIENTACCNO: TWideStringField;
    ReportPayOrderDataNAME: TWideStringField;
    ReportPayOrderDataOPENDATE: TDateTimeField;
    ReportPayOrderDataCCONTRACTNO: TWideStringField;
    ReportPayOrderDataVAL_NAME: TWideStringField;
    ReportPayOrderDataDUEINTERESTRATE: TFloatField;
    ReportPayOrderDataPERIOD: TFloatField;
    ReportPayOrderDataDatSrc: TDataSource;
    AboutBankDatSrc: TDataSource;
    AboutBank: TOracleDataSet;
    AboutBankFULLBANKNAME: TWideStringField;
    AboutBankLOGO: TBlobField;
    AboutBankINN: TWideStringField;
    AboutBankMANAGERTITLE: TWideStringField;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmOrder: TFrmOrder;

implementation

uses PayForm, cc_DataMod_CashOper, OrderPayRepFrm, CurrencyToHR_Azeri_Impl;

{$R *.dfm}

procedure TFrmOrder.BtnCloseClick(Sender: TObject);
begin
FrmOrder.Close;
end;

procedure TFrmOrder.BtnPrintClick(Sender: TObject);
begin
   with cc_buyer_flats do begin
       ClearVariables;
       CloseAll;
       SetVariable('PayID',Payments.FieldByName('ID').AsInteger);
       Open;
   end;

   with ReportPayOrderData do begin
       ClearVariables;
       CloseAll;
       SetVariable('PayID',Payments.FieldByName('ID').AsInteger);
       Open;
   end;
   AboutBank.open;
   if ReportPayOrderData.RecordCount > 0 then begin

   with OrderPayRep do  begin

   QRLabelAmount1.Caption :=CurrencyToHR_Azeri(Trunc(FrmOrder.ReportPayOrderData.FieldByName('payamt').AsFloat),0,[0]);
  QRLabelAmount2.Caption :=CurrencyToHR_Azeri(Trunc(FrmOrder.ReportPayOrderData.FieldByName('payamt').AsFloat),0,[0]);
  QRLabelAmount3.Caption :=CurrencyToHR_Azeri(Trunc(FrmOrder.ReportPayOrderData.FieldByName('payamt').AsFloat),0,[0]);

  if Length(currtostr(Frac(FrmOrder.ReportPayOrderData.FieldByName('payamt').AsFloat)))=1 then
   begin
  QRLabelAmount1.Caption :=QRLabelAmount1.Caption+' 0'+CurrToStr(Frac(FrmOrder.ReportPayOrderData.FieldByName('payamt').AsFloat))+' qəpik';
  QRLabelAmount2.Caption :=QRLabelAmount2.Caption+' 0'+CurrToStr(Frac(FrmOrder.ReportPayOrderData.FieldByName('payamt').AsFloat))+' qəpik';
  QRLabelAmount3.Caption :=QRLabelAmount3.Caption+' 0'+CurrToStr(Frac(FrmOrder.ReportPayOrderData.FieldByName('payamt').AsFloat))+' qəpik';
   end;
   if Length(currtostr(Frac(FrmOrder.ReportPayOrderData.FieldByName('payamt').AsFloat)))>1 then
   begin
  QRLabelAmount1.Caption :=QRLabelAmount1.Caption+'  '+CurrToStr(Frac(FrmOrder.ReportPayOrderData.FieldByName('payamt').AsFloat)*100)+' qəpik';
  QRLabelAmount2.Caption :=QRLabelAmount2.Caption+'  '+CurrToStr(Frac(FrmOrder.ReportPayOrderData.FieldByName('payamt').AsFloat)*100)+' qəpik';
  QRLabelAmount3.Caption :=QRLabelAmount3.Caption+'  '+CurrToStr(Frac(FrmOrder.ReportPayOrderData.FieldByName('payamt').AsFloat)*100)+' qəpik';
   end;
        ReportOrder.Preview;
   end;
   end;
end;

procedure TFrmOrder.FormCreate(Sender: TObject);
begin
OrderPayRep := TOrderPayRep.Create(Self);
end;

procedure TFrmOrder.ToolButton1Click(Sender: TObject);
begin
  Pay := TPay.Create(Self);
  //ShowMessage(inttostr(DataModule1.cc_contracts.FieldByName('ID').asinteger));
  DataMod_CCCashOper.main.Close;
  DataMod_CCCashOper.main.SetVariable('cid', DataMod_CCCashOper.cc_contracts.FieldByName('ID').asinteger);
  DataMod_CCCashOper.main.Open;
 // pay.memo1.Clear;
 // pay.Memo1.Lines.Add(main.SQL.Text);
  Pay.ShowModal;
end;

procedure TFrmOrder.ToolButton3Click(Sender: TObject);
var
  I : Integer;
  SelectedRowsCnt : Integer;
begin
   if MessageDlg(
       'Ödəniş ləğv olunsun?'
      ,mtWarning
      ,[mbYes,mbNo]
      ,0) = mrYes  then

       with DBGridEh1, DataSource.DataSet do
  begin

       SelectedRowsCnt := SelectedRows.Count;
       //ShowMessage(Payments.FieldByName('ID').AsString);
       if SelectedRowsCnt>1 then
           for I := 0 to SelectedRowsCnt - 1 do
      begin

      //  ShowMessage('aa');
        GotoBookmark(Pointer(SelectedRows[I]));

      with pay.sbcm_construction do
       CallProcedure('deletePayment',
                      ['p_PayID',Payments.FieldByName('ID').AsInteger]);
     end
     else
     Pay.sbcm_construction.CallProcedure('deletePayment',
                                        ['p_PayID',Payments.FieldByName('ID').AsInteger]);
{  with DatModConstruction,sbcm_construction do
       CallProcedure('deletePayment',
                      ['p_PayID',Payments.FieldByName('ID').AsInteger]);  }
  end;
   Payments.Refresh;

end;

end.

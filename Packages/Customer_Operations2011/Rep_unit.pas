unit Rep_unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls;

type
  TFormRep = class(TForm)
    QRep: TQuickRep;
    QRBandDetail: TQRBand;
    QRLabelAcc_No: TQRLabel;
    QRDBText_AccNo: TQRDBText;
    QRLabelAcc_Name: TQRLabel;
    QRDBTextAccMame: TQRDBText;
    QRD_Begin: TQRLabel;
    QRD_End: TQRLabel;
    QRShapeH: TQRShape;
    QRShapeV: TQRShape;
    QRLabelDat: TQRLabel;
    QRLabel_Val: TQRLabel;
    QRLabelPairAcc: TQRLabel;
    QRLabelDebt: TQRLabel;
    QRLabelCredit: TQRLabel;
    QRLabelDateInterval: TQRLabel;
    QRLabelVoin: TQRLabel;
    DBTextVoin: TQRDBText;
    QRLabelVal: TQRLabel;
    DBTextVal: TQRDBText;
    QRLabelLastOpDATE: TQRLabel;
    DBTextLastOpDate: TQRDBText;
    DBTextOpenDate: TQRDBText;
    QRLabelFirstOstat: TQRLabel;
    QRExprValBeg: TQRExpr;
    QRExprManBeg: TQRExpr;
    QRExprMezBeg: TQRExpr;
    DBTextApBeg: TQRDBText;
    QRLabelValBeg: TQRLabel;
    QRLabelManBeg: TQRLabel;
    QRRateBeg: TQRLabel;
    QRLabelMBeg: TQRLabel;
    QRLabelMEnd: TQRLabel;
    DBImageBank: TQRDBImage;
    QRDBTextBank: TQRDBText;
    QRSubDetail: TQRSubDetail;
    QRDBTextDat: TQRDBText;
    QRDBTextCurr: TQRDBText;
    QRDBTextPairAcc: TQRDBText;
    QRDBTextLDebit: TQRDBText;
    QRDBTextLKredit: TQRDBText;
    QRDBTextTey: TQRDBText;
    QRLabelSpec: TQRLabel;
    DBTextDebit: TQRDBText;
    DBTextKredit: TQRDBText;
    QRShapeGF: TQRShape;
    GroupFooterBand: TQRBand;
    QRExprSumLDebit: TQRExpr;
    QRExprSumLKredit: TQRExpr;
    QRExprSumKredit: TQRExpr;
    QRExprSumDebit: TQRExpr;
    QRShapeFooter: TQRShape;
    QRShapeBottom: TQRShape;
    QRLabelLastOstat: TQRLabel;
    QRExprValEnd: TQRExpr;
    QRExprManEnd: TQRExpr;
    QRExprMezEnd: TQRExpr;
    QRLabelCount: TQRLabel;
    QRExprCount: TQRExpr;
    DBTextApEnd: TQRDBText;
    QRLabelValEnd: TQRLabel;
    QRLabelManEnd: TQRLabel;
    QRRateEnd: TQRLabel;
    procedure QRBandDetailAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBandDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRep: TFormRep;

implementation

uses CO_datamod_impl, SBTranslateProc, sboapiDataModuleImpl;

{$R *.DFM}

procedure TFormRep.QRBandDetailAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  QRExprSumDebit.Reset;
  QRExprSumKredit.Reset;
  QRExprSumLDebit.Reset;
  QRExprSumLKredit.Reset;

end;

procedure TFormRep.QRBandDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

  if Sender.ControlCount = 0 then
    with QRBandDetail do
      While ControlCount > 0 do
        Controls[0].Parent := Sender;

        if QRD_Begin.Caption=QRD_End.Caption then
        QRD_End.Caption:='';

 QRLabelValBeg.Caption:= FormatFloat('#,##0.00',ABS(CO_Datamod.ODSMainState.FieldByName('Ostat').AsCurrency));
 QRLabelValEnd.Caption:= FormatFloat('#,##0.00',ABS(CO_Datamod.ODSMainState.FieldByName('EndOstat').AsCurrency));
 QRRateBeg.Caption:= FormatFloat('#,##0.0000',ABS(CO_Datamod.RatesDataSetBegin.FieldByName('Ostat').AsCurrency));
 QRRateEnd.Caption:= FormatFloat('#,##0.0000',ABS(CO_Datamod.RatesDataSet.FieldByName('Ostat').AsCurrency));

 if CO_Datamod.ODSMainState.FieldByName('CurrencyId').AsCurrency=0 then
   begin
     QRLabelManBeg.Enabled:=false;
     QRLabelManEnd.Enabled:=false;
     QRRateBeg.Enabled:=false;
     QRRateEnd.Enabled:=false;

   end
 else
   begin
     QRLabelManBeg.Enabled:=true;
     QRLabelManEnd.Enabled:=true;
     QRRateBeg.Enabled:=true;
     QRRateEnd.Enabled:=true;


     QRLabelManBeg.Caption:= FormatFloat('#,##0.00',ABS(CO_Datamod.ODSMainState.FieldByName('PokOstat').AsCurrency));
     QRLabelManEnd.Caption:= FormatFloat('#,##0.00',ABS(CO_Datamod.ODSMainState.FieldByName('EndPokOstat').AsCurrency));
   end    

end;

procedure TFormRep.QRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
SBTranslateProc.TranslateAllCompQuickRep(QRep,sboapiDataModule.OrPack_SL);
end;

end.

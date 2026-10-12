unit P_FormRepR_unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls;

type
  TP_FormRepR = class(TForm)
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
    QRLabelSpec: TQRLabel;
    QRSubDetail: TQRSubDetail;
    QRDBTextDat: TQRDBText;
    QRDBTextCurr: TQRDBText;
    QRDBTextPairAcc: TQRDBText;
    QRDBTextLDebit: TQRDBText;
    QRDBTextLKredit: TQRDBText;
    QRDBTextTey: TQRDBText;
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
    ChBand: TQRChildBand;
    DBTextDebit: TQRDBText;
    DBTextKredit: TQRDBText;
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
  P_FormRepR: TP_FormRepR;

implementation

Uses P_Datamod_Unit, sboapiDataModuleImpl, SBTranslateProc;
{$R *.DFM}

procedure TP_FormRepR.QRBandDetailAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  QRExprSumDebit.Reset;
  QRExprSumKredit.Reset;
  QRExprSumLDebit.Reset;
  QRExprSumLKredit.Reset;

end;

procedure TP_FormRepR.QRBandDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

  if Sender.ControlCount = 0 then
    with QRBandDetail do
      While ControlCount > 0 do
        Controls[0].Parent := Sender;

  if QRD_Begin.Caption = QRD_End.Caption then
    QRD_End.Caption := '';

  QRLabelValBeg.Caption := FormatFloat('#,##0.00',
    ABS(P_DataModule.ODSMainState.FieldByName('Ostat').AsCurrency));
  QRLabelValEnd.Caption := FormatFloat('#,##0.00',
    ABS(P_DataModule.ODSMainState.FieldByName('EndOstat').AsCurrency));
  QRRateBeg.Caption := FormatFloat('#,##0.000000',
    ABS(P_DataModule.RatesDataSetBegin.FieldByName('Ostat').AsFloat));
  QRRateEnd.Caption := FormatFloat('#,##0.000000',
    ABS(P_DataModule.RatesDataSet.FieldByName('Ostat').AsFloat));

  if P_DataModule.ODSMainState.FieldByName('CurrencyId').AsCurrency = 0 then
  begin
    QRLabelManBeg.Enabled := false;
    QRLabelManEnd.Enabled := false;
    QRRateBeg.Enabled := false;
    QRRateEnd.Enabled := false;

  end
  else
  begin
    QRLabelManBeg.Enabled := true;
    QRLabelManEnd.Enabled := true;
    QRRateBeg.Enabled := true;
    QRRateEnd.Enabled := true;

    QRLabelManBeg.Caption := FormatFloat('#,##0.00',
      ABS(P_DataModule.ODSMainState.FieldByName('PokOstat').AsCurrency));
    QRLabelManEnd.Caption := FormatFloat('#,##0.00',
      ABS(P_DataModule.ODSMainState.FieldByName('EndPokOstat').AsCurrency));
  end

end;

procedure TP_FormRepR.QRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  SBTranslateProc.TranslateAllCompQuickRep(QRep, sboapiDataModule.OrPack_SL);
end;

end.

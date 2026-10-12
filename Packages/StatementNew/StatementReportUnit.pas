unit StatementReportUnit;
                                         
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TStatementReport = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel9: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr7: TQRExpr;
    QRDBText14: TQRDBText;
    QRDBImage1: TQRDBImage;
    QRDBText17: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape3: TQRShape;
    QRDBText5: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText16: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText4: TQRDBText;
    ChildBand1: TQRChildBand;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    GroupFooterBand1: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr13: TQRExpr;
    QRExpr15: TQRExpr;
    QRDBText19: TQRDBText;
    QRLabel14: TQRLabel;
    QRExpr16: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRShape1: TQRShape;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRShape2: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel21: TQRLabel;
    QRExpr4: TQRExpr;
    QRRateEnd: TQRLabel;
    QRExpr6: TQRExpr;
    QRRateBeg: TQRLabel;
    QRShape4: TQRShape;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure DetailBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StatementReport: TStatementReport;

implementation

uses StatementImpl, StatementDataModule;

{$R *.DFM}

procedure TStatementReport.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//  if StatementDataMod.Extraction_ODSt.FieldByName('Currencyid').AsInteger<>0 then
//    if IStatementX.BeginDTPicker.DateTime <> StatementX.EndDTPicker.DateTime then
//      QRLabel7.Caption:= DateToStr(StatementX.EndDTPicker.Date)
//    else
//      QRLabel7.Enabled;
//  if StatementDataMod.Extraction_ODSt.FieldByName('Currencyid').AsInteger=0 then
//    QRExpr14.Enabled:= False;




  if Trunc(D1)=Trunc(D2) then
    QRLabel7.Enabled:= False
  else
    begin
      QRLabel7.Enabled:= True;
      QRLabel7.Caption:= DateToStr(D2);
    end;

    QRLabel22.Caption:= DateToStr(D1);

 QRLabel1.Caption:= FormatFloat('#,##0.00',ABS(StatementDataModNew.Extraction_ODSt.FieldByName('Ostat').AsCurrency));
 QRLabel8.Caption:= FormatFloat('#,##0.00',ABS(StatementDataModNew.Extraction_ODSt.FieldByName('EndOstat').AsCurrency));
 QRRateBeg.Caption:= FormatFloat('#,##0.0000',ABS(StatementDataModNew.RatesDataSetBegin.FieldByName('Ostat').AsCurrency));
 QRRateEnd.Caption:= FormatFloat('#,##0.0000',ABS(StatementDataModNew.RatesDataSet.FieldByName('Ostat').AsCurrency));
 if StatementDataModNew.Extraction_ODSt.FieldByName('Currencyid').AsCurrency=0 then
   begin
     QRLabel15.Enabled:=False;
     QRLabel21.Enabled:=False;
     QRRateBeg.Enabled:=False;
     QRRateEnd.Enabled:=False;
   end
 else
   begin
     QRRateBeg.Enabled:=True;
     QRRateEnd.Enabled:=True;
     QRLabel15.Enabled:=True;
     QRLabel21.Enabled:=True;
     QRLabel15.Caption:= FormatFloat('#,##0.00',ABS(StatementDataModNew.Extraction_ODSt.FieldByName('Pok_Ostat').AsCurrency));
     QRLabel21.Caption:= FormatFloat('#,##0.00',ABS(StatementDataModNew.Extraction_ODSt.FieldByName('EndPok_Ostat').AsCurrency));
   end


end;


procedure TStatementReport.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
{  if (StatementDataMod.ExtractionTrans_ODSt.FieldByName('DEBIT').AsCurrency =0) and (StatementDataMod.ExtractionTrans_ODSt.FieldByName('KREDIT').AsCurrency =0) then
    ChildBand1.Enabled:= False
  else }
    if ((StatementDataModNew.ExtractionTrans_ODSt.FieldByName('DEBIT').AsCurrency=0) and (StatementDataModNew.ExtractionTrans_ODSt.FieldByName('KREDIT').AsCurrency=0)) then
      ChildBand1.Enabled:= False
    else
      if (StatementDataModNew.ExtractionTrans_ODSt.FieldByName('PairCurrencyid').AsInteger=0) and (StatementDataModNew.Extraction_ODSt.FieldByName('Currencyid').AsInteger=0) then
        ChildBand1.Enabled:= False
      else
        ChildBand1.Enabled:= True;
  if (QRExpr11.Value.dblResult=0) and (QRExpr12.Value.dblResult=0) then
    begin
      QRExpr11.Enabled:= False;
      QRExpr12.Enabled:= False
    end
  else
  if (QRExpr2.Value.dblResult=QRExpr11.Value.dblResult) and (QRExpr1.Value.dblResult=QRExpr12.Value.dblResult) then
    begin
      QRExpr11.Enabled:= False;
      QRExpr12.Enabled:= False
    end
  else
    begin
      QRExpr11.Enabled:= True;
      QRExpr12.Enabled:= True
    end;
end;

procedure TStatementReport.DetailBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  QRExpr1.Reset;
  QRExpr2.Reset;
  QRExpr11.Reset;
  QRExpr12.Reset;
end;

end.

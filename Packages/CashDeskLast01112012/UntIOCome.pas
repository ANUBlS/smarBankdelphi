unit UntIOCome;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, OracleData;

type
  TIOCome = class(TQuickRep)
    SummaryBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    TitleBand1: TQRBand;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel4: TQRLabel;
    QRShape4: TQRShape;
    QRLabel9: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape6: TQRShape;
    QRDBText2: TQRDBText;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRDBText3: TQRDBText;
    QRLCurrency: TQRLabel;
    QRLVoin: TQRLabel;
    QRLIOCome: TQRLabel;
    QrlBankName: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel14: TQRLabel;
    QRExprAmmount: TQRExpr;
    QRShape14: TQRShape;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRShape11: TQRShape;
    QRDBText6: TQRDBText;
    QRShape16: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabelAmmount: TQRLabel;
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  IOCome: TIOCome;

implementation

uses CashDeskImpl,sboapiDataModuleImpl, CashDataModule, SBTranslateProc;

{$R *.DFM}

procedure TIOCome.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
 Tmp: string;
begin
 with FrmCashDesk, QRExprAmmount do
 begin
   CashDataMod.ODSValuteName.Close;
    CashDataMod.ODSValuteName.SetVariable('valute',CashDataMod.ODSTransactionsViewer.FieldByName('DCurrency').Value);
    CashDataMod.ODSValuteName.Open;
   if Round(100*Frac(Value.dblResult))>0 then
   Tmp:='-'+FloatToStr(Round(100*Frac(Value.dblResult)))+ CashDataMod.ODSValuteName. FieldByName('valu_bala').AsString//' г€пик'
  else Tmp:=EmptyStr;
  QRLabelAmmount.Caption :=GetCurrencyAz(Value.dblResult)+' '+DBLCCurrency.Text+Tmp;
 end;

end;

procedure TIOCome.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
SBTranslateProc.TranslateAllCompQuickRep(Self,sboapiDataModule.OrPack_SL);
end;

end.

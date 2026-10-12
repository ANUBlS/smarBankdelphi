unit UntBalanceRpt2;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, QRExport, DB;

type
  TBalanceRpt2 = class(TQuickRep)
    TitleBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape8: TQRShape;
    QRLCode: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    TargetDate: TQRLabel;
    QRCurr: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    SummaryBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr1: TQRExpr;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRTextFilter1: TQRTextFilter;
    QRImage1: TQRImage;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure TitleBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  BalanceRpt2: TBalanceRpt2;

implementation

{$R *.DFM}
 uses TB_DataModuleImpl,sboapiDataModuleImpl, SBTranslateProc;
procedure TBalanceRpt2.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
SBTranslateProc.TranslateAllCompQuickRep(Self,sboapiDataModule.OrPack_SL);
end;

procedure TBalanceRpt2.TitleBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  BS: TStream;
  WIC: TWICImage;
  Field: TField;
begin
  Field := out_balancedatamodule.BankInfo.FieldByName('LOGO');

  if (Field <> nil) and not Field.IsNull then
  begin
    WIC := TWICImage.Create;
    try
      // Dataset-dən Stream yaradılır
      BS := out_balancedatamodule.BankInfo.CreateBlobStream(Field, bmRead);
      try
        if (BS <> nil) and (BS.Size > 0) then
        begin
          BS.Position := 0;
          WIC.LoadFromStream(BS);

          // QRImage-i təmizləyib yeni şəkli çəkirik
          QRImage1.Picture.Graphic := WIC;
        end
        else
          QRImage1.Picture := nil;
      finally
        BS.Free;
      end;
    except
      QRImage1.Picture := nil;
    end;
    WIC.Free;
  end
  else
  begin
    QRImage1.Picture := nil;
  end;


end;

end.

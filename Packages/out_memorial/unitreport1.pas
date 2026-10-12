unit unitreport1;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls,db;

type
  Tmemorial_rpt1 = class(TQuickRep)
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape2: TQRShape;
    QRLabel5: TQRLabel;
    QRShape3: TQRShape;
    QRLabel6: TQRLabel;
    QRShape4: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel2: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText24: TQRDBText;
    QRExpr4: TQRExpr;
    QRDBText10: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRExpr2: TQRExpr;
    QRShape8: TQRShape;
    QRImage1: TQRImage;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private

  public

  end;

var
  memorial_rpt1: Tmemorial_rpt1;

implementation

uses memorial_datamod,sboapiDataModuleImpl, SBTranslateProc;

{$R *.DFM}

procedure Tmemorial_rpt1.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  BS: TStream;
  WIC: TWICImage;
  Field: TField;
begin
  Field := memorial_DataModule.BankInfo.FieldByName('LOGO');

  if (Field <> nil) and not Field.IsNull then
  begin
    WIC := TWICImage.Create;
    try
      // Dataset-dən Stream yaradılır
      BS := memorial_DataModule.BankInfo.CreateBlobStream(Field, bmRead);
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

procedure Tmemorial_rpt1.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
SBTranslateProc.TranslateAllCompQuickRep(Self,sboapiDataModule.OrPack_SL);
end;

end.

unit FPTurnOversReportImpl;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls,db;

type
  TTurnOversRpt = class(TQuickRep)
    QRLabel10: TQRLabel;
    SummaryBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRBand5: TQRBand;
    QRShape11: TQRShape;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel11: TQRLabel;
    lblBranch: TQRLabel;
    lblBeginDate: TQRLabel;
    lblEndDate: TQRLabel;
    lblCurrency: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText5: TQRDBText;
    QRImage1: TQRImage;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  TurnOversRpt: TTurnOversRpt;

implementation

uses TurnOversDataMod,sboapiDataModuleImpl, SBTranslateProc;
{$R *.DFM}

procedure TTurnOversRpt.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  BS: TStream;
  WIC: TWICImage;
  Field: TField;
begin
  Field := out_datamodule.BankInfo.FieldByName('LOGO');

  if (Field <> nil) and not Field.IsNull then
  begin
    WIC := TWICImage.Create;
    try
      // Dataset-dən Stream yaradılır
      BS := out_datamodule.BankInfo.CreateBlobStream(Field, bmRead);
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
SBTranslateProc.TranslateAllCompQuickRep(Self,sboapiDataModule.OrPack_SL);
end;

end.

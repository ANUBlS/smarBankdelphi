unit UnRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, DB, DBTables, ExtCtrls;

type
  TQRFormProv = class(TQuickRep)
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBImage1: TQRDBImage;
    QRDBText8: TQRDBText;
    SummaryBand1: TQRBand;
    QRExpr3: TQRExpr;
    QRLabel9: TQRLabel;
    QRLabel7: TQRLabel;
    QRRichText1: TQRRichText;
    QRLabel10: TQRLabel;
    QRDBText4: TQRDBText;
    QRExpr2: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel11: TQRLabel;
    QRDBText9: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QRFormProv: TQRFormProv;

implementation
uses TransactionsDocDataModUnit;
{$R *.DFM}

end.

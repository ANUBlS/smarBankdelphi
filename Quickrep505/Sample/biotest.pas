unit biotest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, QRCtrls, QuickRpt, ExtCtrls, QRPDFFilt;

type
  TBiorep = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRExpr1: TQRExpr;
    Query1: TQuery;
    QRLabel1: TQRLabel;
    QRPDFFilter1: TQRPDFFilter;
    PageHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRExpr2: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Biorep: TBiorep;

implementation

{$R *.dfm}

end.

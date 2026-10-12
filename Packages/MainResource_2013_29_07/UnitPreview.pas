unit UnitPreview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TFormPreview = class(TForm)
    QuickRep: TQuickRep;
    QRGroup: TQRGroup;
    QRBandDetail: TQRBand;
    QRDBTextDebt: TQRDBText;
    QRDBTextCred: TQRDBText;
    QRDBTextDate: TQRDBText;
    QRDBTextAmount: TQRDBText;
    QRLabelDebt: TQRLabel;
    QRLabelCred: TQRLabel;
    QRLabelDate: TQRLabel;
    QRLabelAmount: TQRLabel;
    QRShape: TQRShape;
    QRShapeD: TQRShape;
    QRShapeC: TQRShape;
    QRShapeT: TQRShape;
    QRShapeM: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape1: TQRShape;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPreview: TFormPreview;

implementation

{$R *.DFM}
uses UnitData;

end.

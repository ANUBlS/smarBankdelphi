unit card_states;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, QuickRpt, QRCtrls, ExtCtrls,SBTranslateProc,sboapiDataModuleImpl;

type
  Tcard_state = class(TForm)
    QRep: TQuickRep;
    QRBandDetail: TQRBand;
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
    QRLabelDateInterval: TQRLabel;
    QRLabelVal: TQRLabel;
    DBTextVal: TQRDBText;
    DBTextOpenDate: TQRDBText;
    QRLabelMBeg: TQRLabel;
    QRLabelMEnd: TQRLabel;
    DBImageBank: TQRDBImage;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRSubDetail: TQRSubDetail;
    QRDBTextDat: TQRDBText;
    QRDBTextCurr: TQRDBText;
    QRDBTextPairAcc: TQRDBText;
    QRDBTextLDebit: TQRDBText;
    QRDBTextTey: TQRDBText;
    QRLabelSpec: TQRLabel;
    QRShapeGF: TQRShape;
    GroupFooterBand: TQRBand;
    QRShapeBottom: TQRShape;
    bankinfo: TOracleDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  card_state: Tcard_state;

implementation

{$R *.dfm}

end.

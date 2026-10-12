unit BriefcaseQRepImpl;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, OracleData;

type
  TBriefcaseReportForm = class(TQuickRep)
    bndTop: TQRBand;
    lbMainTitle: TQRLabel;
    lbReportTitle: TQRLabel;
    OracleDataSet1: TOracleDataSet;
    QRBand1: TQRBand;
    QRGroup1: TQRGroup;
    OracleDataSet1CREDITID: TFloatField;
    OracleDataSet1DISTRICT: TStringField;
    OracleDataSet1VILLAGE: TStringField;
    OracleDataSet1AKTARGET: TStringField;
    OracleDataSet1AKPURPOSE: TStringField;
    OracleDataSet1CUSTID: TFloatField;
    OracleDataSet1CUSTNAME: TStringField;
    OracleDataSet1CREDITCOUNT: TFloatField;
    OracleDataSet1OUTSTANDCOUNT: TFloatField;
    OracleDataSet1FIRSTTRCHDATE: TDateTimeField;
    OracleDataSet1LASTDATE: TDateTimeField;
    OracleDataSet1GIVENAMOUNT: TFloatField;
    OracleDataSet1COMPUTEDPERCENT: TFloatField;
    OracleDataSet1OVERMAINDEBT: TFloatField;
    OracleDataSet1OVERPERCENTDEBT: TFloatField;
    OracleDataSet1INTERESTMAINDEBT: TFloatField;
    OracleDataSet1INTERESTPERCENTDEBT: TFloatField;
    OracleDataSet1CREDDEBTMAINDEBT: TFloatField;
    OracleDataSet1CREDDEBTPERCENTDEBT: TFloatField;
    OracleDataSet1CREDDEBTOVERMAINDEBT: TFloatField;
    OracleDataSet1CREDDEBTOVERPERCENTDEBT: TFloatField;
    QRGroup2: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText4: TQRDBText;
    QRExpr2: TQRExpr;
    QRDBText5: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRExpr3: TQRExpr;
    QRBand2: TQRBand;
    QRDBText6: TQRDBText;
    QRExpr4: TQRExpr;
  private

  public

  end;

var
  BriefcaseReportForm: TBriefcaseReportForm;

implementation

uses
  CMOracleAPIDataModuleImpl, BriefcaseQrepDataModuleImpl;

{$R *.DFM}

end.

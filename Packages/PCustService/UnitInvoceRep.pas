unit UnitInvoceRep;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, OracleData;

type
  TQRptInvoceRep = class(TQuickRep)
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    ods_cap: TOracleDataSet;
    ods_capINV_NUM: TWideStringField;
    ods_capINV_DATE: TDateTimeField;
    ods_capTRANS_ID: TFloatField;
    ods_capTRANS_DATE: TDateTimeField;
    ods_capPAR1: TWideStringField;
    ods_capPAR2: TWideStringField;
    ods_capPAR3: TWideStringField;
    ods_capPAR4: TWideStringField;
    ods_capPAR5: TWideStringField;
    ods_capPAR6: TWideStringField;
    ods_capPAR12: TFloatField;
    ods_capTARIF: TWideStringField;
    ods_capPAR11: TFloatField;
    ods_capPAR13: TFloatField;
    ods_capPAR7: TWideStringField;
    ods_capPAR8: TWideStringField;
    dsrc_cap: TDataSource;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  QRptInvoceRep:TQRptInvoceRep;
 
  
implementation

uses  SBTranslateProc, sboapiDataModuleImpl,Unitqaime;

{$R *.DFM}

procedure TQRptInvoceRep.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
 SBTranslateProc.TranslateAllCompQuickRep(Self, sboapiDataModule.OrPack_SL);
end;

end.

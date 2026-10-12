unit p_ImzaNumReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, OracleData;

type
  TP_CO_ImzaNumReport = class(TQuickRep)
    DetailBand1: TQRBand;
    QRDBImage1: TQRDBImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    Bankinfo: TOracleDataSet;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRShape40: TQRShape;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRShape42: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    DSCustomer_Info: TOracleDataSet;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    BankinfoTARIX: TWideStringField;
    BankinfoTAM_ADRESS: TWideStringField;
    BankinfoKOD_B: TFloatField;
    BankinfoBANK: TWideStringField;
    BankinfoAZ_NAME: TWideStringField;
    BankinfoKRNO: TWideStringField;
    BankinfoINN: TWideStringField;
    BankinfoSEHER: TWideStringField;
    BankinfoADRESS: TWideStringField;
    BankinfoSEDR: TWideStringField;
    BankinfoBUHALTR: TWideStringField;
    BankinfoTEL: TWideStringField;
    BankinfoFAX: TWideStringField;
    BankinfoSWIFT: TWideStringField;
    BankinfoTELEX: TWideStringField;
    BankinfoEMAIL: TWideStringField;
    BankinfoPOST_IN: TWideStringField;
    BankinfoKOD_FIL: TIntegerField;
    BankinfoFILIAL: TWideStringField;
    BankinfoADRES_FIL: TWideStringField;
    BankinfoTEL_FIL: TWideStringField;
    BankinfoFAX_FIL: TWideStringField;
    BankinfoSWIFT_FIL: TWideStringField;
    BankinfoTELEX_FIL: TWideStringField;
    BankinfoPOSTIN_FIL: TWideStringField;
    BankinfoSEHER_FIL: TWideStringField;
    BankinfoINN_FIL: TWideStringField;
    BankinfoKRNO_FIL: TWideStringField;
    BankinfoSEDRFIL: TWideStringField;
    BankinfoBUHAL_FIL: TWideStringField;
    BankinfoKOD_BFIL: TFloatField;
    BankinfoNB: TIntegerField;
    BankinfoVAL_MOV: TWideStringField;
    BankinfoLOGO: TBlobField;
    BankinfoLINK: TWideStringField;
    BankinfoSDV: TFloatField;
    BankinfoSVM: TFloatField;
    BankinfoBF: TFloatField;
    BankinfoMANAGERTITLE: TWideStringField;
    BankinfoACCOUNTANTTITLE: TWideStringField;
    BankinfoSVM_CURRENCYID: TFloatField;
    BankinfoCAPITAL: TFloatField;
    BankinfoASSISTANT: TWideStringField;
    BankinfoASSISTANTTITLE: TWideStringField;
    BankinfoREG_NO: TWideStringField;
    BankinfoLICENSE_NO: TWideStringField;
    BankinfoFOND_REG_NO: TWideStringField;
    BankinfoLICENSE_FIL: TWideStringField;
    DSCustomer_InfoNAME: TWideStringField;
    DSCustomer_InfoID: TIntegerField;
    DSCustomer_InfoIDCUST: TFloatField;
    DSCustomer_InfoPASPORT: TWideStringField;
    DSCustomer_InfoPHONE_H: TWideStringField;
    DSCustomer_InfoPHONE_M: TWideStringField;
    DSCustomer_InfoADDRESS: TWideStringField;
    DSCustomer_InfoPASPPLACE: TWideStringField;
    DSCustomer_InfoPASPDATE: TDateTimeField;
    DSCustomer_InfoACC_NO: TWideStringField;
    DSCustomer_InfoINN: TWideStringField;
    DSCustomer_InfoOPEN_DAT: TDateTimeField;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);

  private

  public

  end;

var
  P_CO_ImzaNumReport: TP_CO_ImzaNumReport;

implementation

uses P_Datamod_Unit, sboapiDataModuleImpl, SBTranslateProc;

{$R *.DFM}

procedure TP_CO_ImzaNumReport.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  SBTranslateProc.TranslateAllCompQuickRep(Self, sboapiDataModule.OrPack_SL);

end;

end.

unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Db, OracleData;

type
  TDM = class(TDataModule)
    ODSPayments: TOracleDataSet;
    DSPayments: TDataSource;
    dsfilials: TOracleDataSet;
    dsfilialsID: TFloatField;
    dsfilialsNAME: TWideStringField;
    dsfilialsKOD_FILIAL: TWideStringField;
    dtfilials: TDataSource;
    ods_rep: TOracleDataSet;
    Dat: TOracleDataSet;
    DatTEK_DAT: TDateTimeField;
    sb_trans: TOraclePackage;
    OraclePackage1: TOraclePackage;
    pack: TOraclePackage;
    Sb_aca: TOraclePackage;
    ods_repID: TFloatField;
    ods_repAMOUNT: TFloatField;
    ods_repBANK_ACC: TWideStringField;
    ods_repBANK_BIC: TWideStringField;
    ods_repBANK_CODE: TWideStringField;
    ods_repBANK_NAME: TWideStringField;
    ods_repBANK_TIN: TWideStringField;
    ods_repCURRENCY: TWideStringField;
    ods_repDESCREPTION: TWideStringField;
    ods_repPAY_DATE: TDateTimeField;
    ods_repRECEIVER_BANK_ACC: TWideStringField;
    ods_repRECEIVER_BANK_BIC: TWideStringField;
    ods_repRECEIVER_BANK_CODE: TWideStringField;
    ods_repRECEIVER_BANK_NAME: TWideStringField;
    ods_repRECEIVER_BANK_TIN: TWideStringField;
    ods_repRECEIVER_TIN: TWideStringField;
    ods_repTRANSACTION_TYPE: TWideStringField;
    ods_repCLI_ID: TWideStringField;
    ods_repSTATUS: TWideStringField;
    ods_repPIN1: TIntegerField;
    ods_repPIN2: TIntegerField;
    ods_repTRANS_ID: TWideStringField;
    ods_repSUSDAT: TDateTimeField;
    ods_repGONDEREN_ACC: TWideStringField;
    ods_repALAN_ACC: TWideStringField;
    ods_repALAN_NAME: TWideStringField;
    ods_repGONDEREN_NAME: TWideStringField;
    ods_repALAN_INN: TWideStringField;
    ods_repGONDEREN_INN: TWideStringField;
    ods_repTEYNAT: TWideStringField;
    ods_repNOTE: TWideStringField;
    ods_repAMOUNT_YAZI: TWideStringField;
    ODSPaymentsID: TFloatField;
    ODSPaymentsAMOUNT: TFloatField;
    ODSPaymentsBANK_ACC: TWideStringField;
    ODSPaymentsBANK_BIC: TWideStringField;
    ODSPaymentsBANK_CODE: TWideStringField;
    ODSPaymentsBANK_NAME: TWideStringField;
    ODSPaymentsBANK_TIN: TWideStringField;
    ODSPaymentsCURRENCY: TWideStringField;
    ODSPaymentsDESCREPTION: TWideStringField;
    ODSPaymentsPAY_DATE: TDateTimeField;
    ODSPaymentsRECEIVER_BANK_ACC: TWideStringField;
    ODSPaymentsRECEIVER_BANK_BIC: TWideStringField;
    ODSPaymentsRECEIVER_BANK_CODE: TWideStringField;
    ODSPaymentsRECEIVER_BANK_NAME: TWideStringField;
    ODSPaymentsRECEIVER_BANK_TIN: TWideStringField;
    ODSPaymentsRECEIVER_TIN: TWideStringField;
    ODSPaymentsTRANSACTION_TYPE: TWideStringField;
    ODSPaymentsCLI_ID: TWideStringField;
    ODSPaymentsSTATUS: TWideStringField;
    ODSPaymentsPIN1: TIntegerField;
    ODSPaymentsPIN2: TIntegerField;
    ODSPaymentsTRANS_ID: TWideStringField;
    ODSPaymentsSUSDAT: TDateTimeField;
    ODSPaymentsTR_TYPE: TWideStringField;
    ODSPaymentsGONDEREN_ACC: TWideStringField;
    ODSPaymentsALAN_ACC: TWideStringField;
    ODSPaymentsALAN_NAME: TWideStringField;
    ODSPaymentsGONDEREN_NAME: TWideStringField;
    ODSPaymentsALAN_INN: TWideStringField;
    ODSPaymentsGONDEREN_INN: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses Payments_TLB, PaymentsImpl1, Unit1, sboapiDataModuleImpl,UnitPaymentsProperties;

{$R *.DFM}

end.

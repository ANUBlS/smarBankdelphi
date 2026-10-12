unit frmUntimelyEtMoneyImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Oracle, DBCtrlsEh, DBCtrls, ComCtrls, StdCtrls, Mask, DBLookupEh,
  ExtCtrls, OracleData;

type
  TfrmUntimelyEtMoney__new = class(TForm)
    Button1: TButton;
    Button2: TButton;
    CreditAccs: TOracleDataSet;
    CreditAccsID: TFloatField;
    CreditAccsACC_NO: TWideStringField;
    CreditAccsNAME: TWideStringField;
    DepositAccno: TOracleDataSet;
    DepositAccnoID: TFloatField;
    DepositAccnoACC_NO: TWideStringField;
    DepositAccnoVAL_NAME: TWideStringField;
    DepositInfo: TOracleDataSet;
    DepositInfoNAME: TWideStringField;
    DepositInfoOPENDATE: TDateTimeField;
    DepositInfoCLOSEDATE: TDateTimeField;
    DepositInfoANNUALINT: TWideStringField;
    DepositInfoOVERDUEANNUALINT: TFloatField;
    DepositInfoCONTRACTACCNO: TWideStringField;
    DepositInfoCLIENTACCNO: TWideStringField;
    DepositInfoINTERESTACCNO: TWideStringField;
    DepositInfoFACTICALDEBT: TFloatField;
    DepositInfoFACTICALINTERESTDEBT: TFloatField;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    StaticText1: TStaticText;
    AccountListCB: TDBLookupComboboxEh;
    DBEditEh8: TDBEditEh;
    Panel16: TPanel;
    StaticText13: TStaticText;
    DTPBankDate: TDateTimePicker;
    Panel5: TPanel;
    Panel8: TPanel;
    StaticText2: TStaticText;
    DBEditEh3: TDBEditEh;
    Panel9: TPanel;
    StaticText6: TStaticText;
    DBEditEh4: TDBEditEh;
    Panel10: TPanel;
    Panel11: TPanel;
    StaticText7: TStaticText;
    DBEditEh5: TDBEditEh;
    Panel12: TPanel;
    StaticText8: TStaticText;
    DBEditEh6: TDBEditEh;
    Panel13: TPanel;
    Panel14: TPanel;
    StaticText9: TStaticText;
    DTPCalcPercent: TDateTimePicker;
    Panel15: TPanel;
    StaticText10: TStaticText;
    DBEditEh1: TDBEditEh;
    Panel6: TPanel;
    StaticText3: TStaticText;
    DBEdit2: TDBEdit;
    Panel7: TPanel;
    StaticText5: TStaticText;
    DBDateTimeEditEh3: TDBDateTimeEditEh;
    StaticText4: TStaticText;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    StaticText11: TStaticText;
    StaticText12: TStaticText;
    DBEditEh2: TDBEditEh;
    DBEditEh7: TDBEditEh;
    sbcm_payment: TOraclePackage;
    DSDepositAccno: TDataSource;
    CreditAccsDatSrc: TDataSource;
    DepositInfoDatSrc: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUntimelyEtMoney__new: TfrmUntimelyEtMoney__new;

implementation

{$R *.dfm}

end.

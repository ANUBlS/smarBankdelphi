unit TranceDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TTrancheDataModule = class(TDataModule)
    CreditInfo: TOracleDataSet;
    DataSrcCreditInfo: TDataSource;
    TrancheAccounts: TOracleDataSet;
    DataSrcTrancheAccounts: TDataSource;
    CreditInfoID: TFloatField;
    CreditInfoNUMBEROFCREDIT: TWideStringField;
    CreditInfoCREDITLINEAMOUNT: TFloatField;
    CreditInfoNAME: TWideStringField;
    CreditInfoCURRENCY: TFloatField;
    CreditInfoBOOROWERID: TFloatField;
    CustAccount: TOracleDataSet;
    CustAccountBOOROWERACCID: TFloatField;
    CreditInfoVAL_NAME: TWideStringField;
    CreditInfoOBLIGATION: TFloatField;
    CM_TRANCHE: TOraclePackage;
    TranchesData: TOracleDataSet;
    DataSrcTranches: TDataSource;
    TranchesDataID: TFloatField;
    TranchesDataCREDITID: TFloatField;
    TranchesDataTRANCHEDATE: TDateTimeField;
    TranchesDataTRANCHEAMOUNT: TFloatField;
    DataSourc: TDataSource;
    OracleDataSet_: TOracleDataSet;
    active: TOracleDataSet;
    activeCREDITTYPE: TFloatField;
    OracleDataSet: TOracleDataSet;
    TrancheAccountsACCID: TFloatField;
    TrancheAccountsKLI_ID: TFloatField;
    TrancheAccountsACCOUNTNUMBER: TWideStringField;
    TrancheAccountsACCOUNTNAME: TWideStringField;
    OraclePackage1: TOraclePackage;
    ods_hesab: TOracleDataSet;
    dsrc_hesab: TDataSource;
    ods_hesabID: TFloatField;
    ods_hesabACC_NO: TWideStringField;
    activeCURRENCY: TFloatField;
    activeBRANCHID: TFloatField;
    Ods_vender: TOracleDataSet;
    FloatField1: TFloatField;
    WideStringField1: TWideStringField;
    Dsrc_vender: TDataSource;
    Ods_subsidya: TOracleDataSet;
    FloatField2: TFloatField;
    WideStringField2: TWideStringField;
    Dsrc_subsidya: TDataSource;
    Ods_CrMehsul: TOracleDataSet;
    Ods_CrMehsulCR_TYPE: TFloatField;
    ods_hesabSgorta: TOracleDataSet;
    FloatField3: TFloatField;
    WideStringField3: TWideStringField;
    dsrc_hesabSgorta: TDataSource;
    activeSUBSIDY: TFloatField;
    Ods_CrMehsulSUBSIDY: TFloatField;
    cm_reserve_count_new: TOraclePackage;
    procedure ss(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TrancheDataModule: TTrancheDataModule;

implementation

{$R *.DFM}

uses
  sboapiDataModuleImpl;

procedure TTrancheDataModule.ss(Sender: TObject);
begin
OracleDataSet.Open;
end;

procedure TTrancheDataModule.DataModuleDestroy(Sender: TObject);
begin
OracleDataSet.closeall
end;

end.

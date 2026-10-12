unit UAStateDModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TAccountStateDModule = class(TDataModule)
    AccState: TDataSource;
    AccStateData: TOracleDataSet;
    AccStateDataACCID: TFloatField;
    AccStateDataAMOUNT: TFloatField;
    AccStateDataLAMOUNT: TFloatField;
    AccStateDataDEBITTURNOVER: TFloatField;
    AccStateDataDEBITLTURNOVER: TFloatField;
    AccStateDataCREDITTURNOVER: TFloatField;
    AccStateDataCREDITLTURNOVER: TFloatField;
    AccStateDataARCHIVEDATE: TDateTimeField;
    Account: TOracleDataSet;
    AccountID: TFloatField;
    AccountKLI_ID: TFloatField;
    AccountOP_ID: TFloatField;
    AccountACC_NO: TStringField;
    AccountVAL_ACC: TIntegerField;
    AccountNAME: TStringField;
    AccountOPEN_DAT: TDateTimeField;
    AccountCLOSE_DAT: TDateTimeField;
    AccountSTATUS: TFloatField;
    AccountBAL_CN1: TFloatField;
    AccountBAL_CN2: TFloatField;
    AccountBAL_CN3: TFloatField;
    AccountBAL_CN4: TFloatField;
    AccountFILIAL: TIntegerField;
    AccountSIM_OTCET: TFloatField;
    AccountTIPACC: TStringField;
    AccountLIMIT: TFloatField;
    AccountOLD_ACC_NO: TStringField;
    AccountPAIR_ACC: TFloatField;
    AccountINSIDER: TStringField;
    AccountData: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AccountStateDModule: TAccountStateDModule;

implementation

uses UAccountState,sboapidatamoduleimpl;

{$R *.DFM}

end.

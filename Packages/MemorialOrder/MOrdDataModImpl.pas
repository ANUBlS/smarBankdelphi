unit MOrdDataModImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TMOrdDataMod = class(TDataModule)
    DataSrcTransactions: TDataSource;
    Transactions: TOracleDataSet;
    CurrencysData: TOracleDataSet;
    DataSrcCurrencys: TDataSource;
    DataSrcBranches: TDataSource;
    Branches: TOracleDataSet;
    BankInfo: TOracleDataSet;
    Memorial: TOracleDataSet;
    DataSrcMemorial: TDataSource;
    MemorialBALANCE: TFloatField;
    BankInfoBANKLNAME: TWideStringField;
    BankInfoTAXID: TWideStringField;
    BankInfoMANAGERTITLE: TWideStringField;
    BankInfoACCOUNTANTTITLE: TWideStringField;
    BankInfoMANAGER: TWideStringField;
    BankInfoACCOUNTANT: TWideStringField;
    CurrencysDataCURRENCYID: TIntegerField;
    CurrencysDataCURRENCYLNAME: TWideStringField;
    BranchesBRANCHID: TFloatField;
    BranchesBRANCHNAME: TWideStringField;
    Sysdat: TOracleDataSet;
    SysdatTEK_DAT: TDateTimeField;
    DataSrcUsers: TDataSource;
    Users: TOracleDataSet;
    UsersUSERID: TFloatField;
    UsersUSERNAME: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MOrdDataMod: TMOrdDataMod;

implementation

{$R *.DFM}

uses
  sboapiDataModuleImpl;

procedure TMOrdDataMod.DataModuleCreate(Sender: TObject);
begin
  CurrencysData.Open;
  BankInfo.Open;
  Sysdat.Open;
  Branches.Open;
  Memorial.Open;
end;

procedure TMOrdDataMod.DataModuleDestroy(Sender: TObject);
begin
  CurrencysData.CloseAll;
  BankInfo.CloseAll;
  Sysdat.CloseAll;
  Branches.CloseAll;
  Memorial.CloseAll;
end;

end.

unit BanksDataModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TDataModuleBanks = class(TDataModule)
    DSBanks: TDataSource;
    Banks: TOracleDataSet;
    BanksID: TFloatField;
    BanksKRNO: TWideStringField;
    BanksNAME: TWideStringField;
    BanksINN: TWideStringField;
    BanksSWIFT: TWideStringField;
    BanksBANKCODE: TWideStringField;
    BanksSUBKRNO: TWideStringField;
    BanksBANK_KOD: TFloatField;
    BanksLICENSE_DATE: TDateTimeField;
    BanksTAX_REGCODE: TWideStringField;
    BanksOURS: TFloatField;
    BanksVAL_CODE: TWideStringField;
    procedure BanksAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleBanks: TDataModuleBanks;

implementation
uses sboapiDataModuleImpl;
{$R *.DFM}

procedure TDataModuleBanks.BanksAfterPost(DataSet: TDataSet);
Var
   BankCode: Longint;
begin
 with DataSet do
  begin
   BankCode :=FieldByName('BankCode').AsInteger;
   try
    DisableControls;
    Refresh;
    Locate('BankCode',BankCode,[]);
   finally
    EnableControls;
   end;
  end;
end;

end.

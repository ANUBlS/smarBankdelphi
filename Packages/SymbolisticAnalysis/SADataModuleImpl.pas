unit SADataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TSADataModule = class(TDataModule)
    AccountFlags: TOracleDataSet;
    DataSrcAccountFlags: TDataSource;
    AccountFlagsSYMBOL: TStringField;
    AccountFlagsNAME: TStringField;
    AccountFlagsDESCRIPTION: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SADataModule: TSADataModule;

implementation

{$R *.DFM}

uses sboapiDataModuleImpl;

procedure TSADataModule.DataModuleCreate(Sender: TObject);
begin
  AccountFlags.Open;
end;

end.

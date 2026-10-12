unit AccountSFDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TAccountSFDataModule = class(TDataModule)
    EnabledFieldsData: TOracleDataSet;
    EnabledFieldsDataSEQNO: TFloatField;
    EnabledFieldsDataFIELDDESC: TWideStringField;
    DSEnabledFieldsData: TDataSource;
    EnabledFieldsDataFIELDNAME: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AccountSFDataModule: TAccountSFDataModule;

implementation

{$R *.DFM}

uses sboapiDataModuleImpl;

procedure TAccountSFDataModule.DataModuleCreate(Sender: TObject);
begin
  EnabledFieldsData.Open;
end;

procedure TAccountSFDataModule.DataModuleDestroy(Sender: TObject);
begin
  EnabledFieldsData.CloseAll;
end;

end.

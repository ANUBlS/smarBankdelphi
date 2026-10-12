unit SFDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TSFDataModule = class(TDataModule)
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
  SFDataModule: TSFDataModule;

implementation

{$R *.DFM}

uses sboapiDataModuleImpl;

procedure TSFDataModule.DataModuleCreate(Sender: TObject);
begin
  EnabledFieldsData.Open;
end;

procedure TSFDataModule.DataModuleDestroy(Sender: TObject);
begin
  EnabledFieldsData.CloseAll;
end;

end.

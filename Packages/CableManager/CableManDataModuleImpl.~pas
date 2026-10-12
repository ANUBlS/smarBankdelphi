unit CableManDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TDataModCable = class(TDataModule)
    odsAbonents: TOracleDataSet;
    dsAbonents: TDataSource;
    CABLE: TOraclePackage;
    odsEngineers: TOracleDataSet;
    odsStatuses: TOracleDataSet;
    odsDocTypes: TOracleDataSet;
    dsDocTypes: TDataSource;
    dsStatuses: TDataSource;
    dsEngineers: TDataSource;
    odsContacts: TOracleDataSet;
    dsContacts: TDataSource;
    odsServs: TOracleDataSet;
    dsServs: TDataSource;
    dsValutes: TDataSource;
    odsPacks: TOracleDataSet;
    dsPacks: TDataSource;
    odsValutes: TOracleDataSet;
    odsServices: TOracleDataSet;
    dsServices: TDataSource;
    odsAccs: TOracleDataSet;
    dsAccs: TDataSource;
    OrDS_fullContracts: TOracleDataSet;
    DS_fullContracts: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModCable: TDataModCable;

implementation

uses sboapidatamoduleimpl;

{$R *.DFM}

procedure TDataModCable.DataModuleCreate(Sender: TObject);
var
 i: Integer;
begin
  for i:=0 to componentcount-1 do
    if (components[i] is toracledataset )and (components[i].tag=1 )then begin
      (components[i] as toracledataset).open;
    end;
  
end;

end.

unit BriefcaseDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TBriefcaseDataMod = class(TDataModule)
    ReportNameDataSet: TOracleDataSet;
    ReportNameDataSrc: TDataSource;
    BPTypesDataSet: TOracleDataSet;
    BPTypesDataSrc: TDataSource;
    DistrictsDataSet: TOracleDataSet;
    DistrictsDataSrc: TDataSource;
    VillagesDataSet: TOracleDataSet;
    VillagesDataSrc: TDataSource;
    UsersDataSet: TOracleDataSet;
    UsersDataSrc: TDataSource;
    CustomersDataSet: TOracleDataSet;
    CustomersDataSrc: TDataSource;
    BPPurposesDataSet: TOracleDataSet;
    BPPurposesDataSrc: TDataSource;
    ExportDataSet: TOracleDataSet;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BriefcaseDataMod: TBriefcaseDataMod;

implementation

{$R *.DFM}

uses
  CMOracleAPIDataModuleImpl, BriefcaseImpl;

procedure TBriefcaseDataMod.DataModuleCreate(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to ComponentCount-1 do
    if Components[i].Tag = 1 then
      if not (Components[i] as TDataSet).Active then
        (Components[i] as TDataSet).Open;
end;

end.

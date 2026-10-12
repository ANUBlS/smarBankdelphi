unit TrancheScheduleDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TTrancheSheduleDataMod = class(TDataModule)
    AboutContractDataSet: TOracleDataSet;
    AboutContractsDataSrc: TDataSource;
    TrancheScheduleDataSet: TOracleDataSet;
    TrancheScheduleDataSrc: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TrancheSheduleDataMod: TTrancheSheduleDataMod;

implementation

{$R *.DFM}
        
uses
  CMOracleAPIDataModuleImpl;
  
procedure TTrancheSheduleDataMod.DataModuleCreate(Sender: TObject);
var i: Integer;
begin
  for i:=0 to ComponentCount-1 do
    if Components[i].Tag = 1 then
      (Components[i] as TDataSet).Open;
end;

end.

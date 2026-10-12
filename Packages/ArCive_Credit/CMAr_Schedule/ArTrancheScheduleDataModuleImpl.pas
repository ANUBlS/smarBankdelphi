unit ArTrancheScheduleDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TArTrancheSheduleDataMod = class(TDataModule)
    AboutContractDataSet: TOracleDataSet;
    AboutContractsDataSrc: TDataSource;
    TrancheScheduleDataSet: TOracleDataSet;
    TrancheScheduleDataSrc: TDataSource;
    CM_SCHEDULE: TOraclePackage;
    TrancheScheduleDataSetID: TFloatField;
    TrancheScheduleDataSetCREDITID: TFloatField;
    TrancheScheduleDataSetTRCHDATE: TDateTimeField;
    TrancheScheduleDataSetTRCHAMOUNT: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ArTrancheSheduleDataMod: TArTrancheSheduleDataMod;

implementation

{$R *.DFM}
        
uses
  sboapiDataModuleImpl;
  
procedure TArTrancheSheduleDataMod.DataModuleCreate(Sender: TObject);
var i: Integer;
begin
  for i:=0 to ComponentCount-1 do
    if Components[i].Tag = 1 then
      (Components[i] as TDataSet).Open;
end;

end.

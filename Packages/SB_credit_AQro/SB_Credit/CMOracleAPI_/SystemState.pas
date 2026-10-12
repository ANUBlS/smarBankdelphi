unit SystemState;

interface

function Get_CurrentDate : TDateTime;
function Get_PrevDate : TDateTime;
function Get_BranchID : Integer;

implementation

uses
  CMOracleAPIDataModuleImpl;

function Get_CurrentDate : TDateTime;
begin
  Result := CMDataModule.CurrentDate;
end;

function Get_PrevDate : TDateTime;
begin
  Result := CMDataModule.PrevDate;
end;

function Get_BranchID : Integer;
begin
  Result := CMDataModule.BranchID;
end;


end.

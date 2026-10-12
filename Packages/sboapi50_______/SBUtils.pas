unit SBUtils;

interface

uses Bde;

function SB_GetDatabaseHandle: HDBIDB;

implementation

uses sboapiDataModuleImpl;

function SB_GetDatabaseHandle: HDBIDB;
begin
  Result := sboapiDataModule.Database.Handle;
end;

end.

unit DataModuleStoredPrograms;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TDataModuleRefer = class(TDataModule)
    ReferPackage: TOraclePackage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleRefer: TDataModuleRefer;

implementation

uses  sboapiDataModuleImpl;

{$R *.DFM}
{procedure  Init;
begin
  DataModuleRefer :=TDataModuleRefer.Create(nil);
end;
procedure CleanUp;
begin
  DataModuleRefer.Free;
end;
initialization
  Init;
finalization
  CleanUp;}
end.

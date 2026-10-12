unit sbovclDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Db, OracleData;

type
  TsbovclDataModule = class(TDataModule)
    SBConfig: TOraclePackage;
    ReadSectionQuery: TOracleQuery;
    ResultQuery: TOracleQuery;
    ReadSectionValuesQuery: TOracleQuery;
    SectionsData: TOracleDataSet;
    URep: TOraclePackage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  sbovclDataModule: TsbovclDataModule = nil;

procedure sbovcl_InitDataModule;

implementation

{$R *.DFM}

uses sboapiDataModuleImpl;

procedure sbovcl_InitDataModule;
begin
  if not Assigned(sbovclDataModule) then
    sbovclDataModule := TsbovclDataModule.Create(nil);
end;

initialization
//  if not FindCmdLineSwitch('REGSERVER',['-','/'],True) then
finalization
  if Assigned(sbovclDataModule) then
    sbovclDataModule.Free;
end.

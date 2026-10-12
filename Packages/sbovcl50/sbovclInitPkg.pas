unit sbovclInitPkg;

interface

procedure sbovcl_Initialize();

implementation

uses sbovclDataModuleImpl;

procedure sbovcl_Initialize();
begin
  sbovcl_InitDataModule();
end;

end.

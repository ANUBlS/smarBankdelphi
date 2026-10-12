unit sbovcl50InitPkg;

interface

procedure sbovcl50Initialize();

implementation

uses sbovclDataModuleImpl;

procedure sbovcl50Initialize();
begin
  sbovcl_InitDataModule();
end;

end.

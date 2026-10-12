unit SBSettings;

interface

uses SBSrvIntf;

function Sb_GetOption(const OptionName: String): Variant;

implementation

uses sboapiDataModuleImpl;

function Sb_GetOption(const OptionName: String): Variant;
begin
  with sboapiDataModule.SBSettings do
    Result := CallStringFunction(sPN_GetOption, [OptionName]); 
end;

end.

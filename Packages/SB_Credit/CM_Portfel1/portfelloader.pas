unit portfelloader;

interface

procedure InitPlugin(S : string);export;

implementation

uses PortfelUnit, CommonDecls;

procedure ShowPortfel;
begin
  with TPortfelForm.Create(CommonApplication) do
  try
    ShowModal;
  finally
    Release;
  end;
end;

procedure InitPlugin(S:string);export;
begin
  ShowPortfel;
end;

exports
  InitPlugin;
  
end.
 
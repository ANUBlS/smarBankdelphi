program QRPLoader;

uses
  Forms,
  QuickRepImpl in 'QuickRepImpl.pas' {QuickReport2: TQuickRep};

{$R *.RES}

begin
  Application.Initialize;
  with TQuickReport2.Create(nil) do
  try
    PreviewModal;
  finally
    Free;
  end;
  Application.Run;
end.

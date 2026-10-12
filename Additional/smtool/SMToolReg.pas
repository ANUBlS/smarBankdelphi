unit SMToolReg;

interface

uses Classes;

procedure Register;

implementation

uses SMToolDecls, DockSite, RtFloatWindow, DtFloatWindow, FloatWindow;

procedure Register;
begin
  RegisterComponents(
    ControlsRegPage,
      [   TDockSite,
          TRtFloatWindow,
          TDtFloatWindow,
          TFloatWindow]);
end;

end.

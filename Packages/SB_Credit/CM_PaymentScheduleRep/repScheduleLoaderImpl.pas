unit repScheduleLoaderImpl;

interface

uses
  SysUtils, repScheduleMainFormImpl,  CommonDecls;

procedure InitPlugin(S : String);export;

implementation

procedure ShowPaymentForm;
begin
  with TScheduleForm.Create(CommonApplication) do
  try
    ShowPaymentSchedule;
  finally
    Release
  end;
end;



procedure InitPlugin(S : String);export;
const
  SPaymentSchedule = 'PAYMENTREP';
begin
  if uppercase(S) = SPaymentSchedule then
    ShowPaymentForm;
end;

exports
  InitPlugin;
{var
  S,P,X : Real;
  N : Word;
begin
  S := 3450;
  P := 25;
  N := 18;
  x := S * Power((1+P/12/100),N)*P/12/100/(Power((1+P/12/100),N)-1);
  ShowMessage(FloatToStr(x))
end;}
end.

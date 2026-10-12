library CalendarLmp;

uses
  ComServ,
  CalendarLmp_TLB in 'CalendarLmp_TLB.pas',
  CalendarImpl in 'CalendarImpl.pas' {Calendar: TActiveForm} {Calendar: CoClass},
  CalendarDatamodLmpl in 'CalendarDatamodLmpl.pas' {CalendarDataMod: TDataModule},
  AddHolidayLmpl in 'AddHolidayLmpl.pas' {AddHoliday};

{$E ocx}

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.

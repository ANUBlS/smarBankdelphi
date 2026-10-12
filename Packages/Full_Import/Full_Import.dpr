library Full_Import;

uses
  ComServ,
  Full_import_TLB in 'Full_import_TLB.pas',
  Full_ImportForm in 'Full_ImportForm.pas' {Full_ImportImpl: TActiveForm} {Full_ImportImpl: CoClass},
  Unit_Form_columun in 'Unit_Form_columun.pas' {Form_column},
  Form_ExcelSheetsUnit in 'Form_ExcelSheetsUnit.pas' {Form_ExcelSheets};

{$E ocx}

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer,
  DllInstall;

{$R *.TLB}

{$R *.RES}

begin
end.

program DefIntCalc;

uses
  Forms,
  IntCalcDataModImpl in 'IntCalcDataModImpl.pas' {DefineCalcDatMod: TDataModule},
  InterestsCalcUnit in 'InterestsCalcUnit.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDefineCalcDatMod, DefineCalcDatMod);
  Application.Run;
end.

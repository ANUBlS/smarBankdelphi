unit crSetupLoader;

interface

uses
  Windows, Sysutils;

procedure InitPlugin(S : String);export;

implementation

uses
 crReferencesImpl, crCommonDecls, crVilibleFieldsListImpl,
  crAccGroupsImpl, crIETuningFormImpl, crTrDescTuningFormImpl,
  crCreditTypesReferImpl,cruUsrGrCatImpl,crPledgImpl,crOtherSetupImpl,crFrmSiqortaimpl,
  crexpertImpl;



procedure showOther;
begin
  with TFrmOtherSetup.Create(CommonApplication) do
   try
      ShowModal
  finally
    Release
end;
end;

procedure ShowUsrGr;
begin
  with TUsrGrMainForm.Create(CommonApplication) do
   try
      ShowModal
  finally
    Release
end;
end;

Procedure ShowPledgs;
begin
  with TPledgForm.Create(CommonApplication) do
   try
      ShowModal
  finally
    Release
end;
end;


procedure ShowSetup;
begin
  with TMainReferForm.Create(CommonApplication) do
  try
    ShowModal
  finally
    Release
  end;
end;

procedure ShowVFSetup;
begin
  with TVFListForm.Create(CommonApplication) do
  try
    ShowModal
  finally
    Release
  end;
end;

procedure ShowAGSetup;
begin
  with TAccGrpForm.Create(CommonApplication) do
  try
    ShowModal
  finally
    Release
  end;
end;

procedure ShowIESetup;
begin
  IETuningForm.ShowModal
end;

procedure ShowTrDescTuningForm;
begin
  with TTrDescTuningForm.Create(CommonApplication) do
  try
    ShowModal
  finally
    Release
  end;
end;
procedure ShowFrmSiqorta;
begin
  with TFrmSiqorta.Create(CommonApplication) do
  try
    showmodal;
  finally
    Release;
  end;
end;

procedure ShowFrmExpert;
begin
  with TExpert.Create(CommonApplication) do
  try
    showmodal;
  finally
    Release;
  end;
end;
procedure ShowCredTypesSetup;
begin
  with TCreditTypeTuning.Create(CommonApplication) do
  try
    ShowCredTypesSetup;
  finally
    Release;
  end;
end;


procedure InitPlugin(S : String);export;
const
  SPpShowSetup = 'TreeSetup';
  SPpShowVFList = 'VFSetup';
  SPpShowAGSetup = 'AccGrSetup';
  SPpShowIESetup = 'ShowIESetup';
  SPpTrDescTuning = 'TrDescTuning';
  SPpCreditTypesTuning = 'CreditTypesTuning';
  SPShowUsrGr = 'USERGROUP';
  SPSHOWPlegs='PLEDGS';
  SPshowOther='showOther';
  SPShowFrmSiqorta='FrmSiqorta' ;
  SPShowFrmExpert='Expert' ;
begin


   // if S=SPpCreditTypesTuning then
   // ShowCredTypesSetup else

  if S=SPShowUsrGr  then
  ShowUsrGr else
  if S = SPpShowSetup then
  ShowSetup else
  if S = SPpShowVFList then
  ShowVFSetup else
  if S = SPpShowAGSetup then
  ShowAGSetup else
  if S = SPpShowIESetup then
  ShowIESetup else
  if S = SPpTrDescTuning then
  ShowTrDescTuningForm else
    if S=SPSHOWPlegs then
   ShowPledgs else

   if S=SPShowFrmSiqorta then
   ShowFrmSiqorta else

    if S=SPShowFrmExpert then
    ShowFrmExpert else
  if S = SPshowOther then
  showOther  else
  ShowCredTypesSetup;
end;

exports
  InitPlugin;

end.

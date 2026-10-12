unit ReferLoader;

interface
uses
  Windows, Sysutils;


 procedure exportproc(s:String);export;
implementation

uses CommonDeclsImpl,frmReferencesImpl,
     frmAccGroupsImpl,frmCategoriesImpl,
     frmDepositTypesImpl,frmAccountTurningImpl;

procedure shfrmReferences;
begin
  with TfrmReferences.Create(CommonApplication) do
  try
   ShowModal
  finally
    Release
  end;
end;

procedure shfrmAccGroups;
begin
   with TfrmAccGroups.Create(CommonApplication) do
  try
   ShowModal
  finally
    Release
  end;
end;


procedure shfrmCategories;
begin
 with TfrmCategories.Create(CommonApplication) do
  try
   ShowModal
  finally
    Release
  end;
end;

procedure shfrmDepositTypes;
begin
  with TfrmDepositTypes.Create(CommonApplication) do
  try
   ShowModal
  finally
    Release
  end;
end;
   //frmDepositTypes := TfrmDepositTypes.Create(CommonApplication);
  // frmDepositTypes.ShowModal;



procedure shfrmAccountTurning;
begin
  with TfrmAccountTurning.Create(CommonApplication) do
  try
   ShowModal
  finally
    Release
  end;

end;



procedure exportproc(s:String);export;
const
rs_shReferences = 'showrefer';
rs_shAccGroups = 'showcccgroups';
rs_shCategories = 'showcategories';
rs_shDepositTypes = 'showdeposittypes';
rs_shAccountTurning = 'showaccountturning';

begin
   if s = rs_shReferences then
      shfrmReferences;

   if s = rs_shAccGroups then
      shfrmAccGroups;

   if s = rs_shCategories then
      shfrmCategories;

   if s = rs_shDepositTypes then
      shfrmDepositTypes;


   if s = rs_shAccountTurning then
      shfrmAccountTurning;

end;
exports
   exportproc;
end.

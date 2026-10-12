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
   frmReferences := TfrmReferences.Create(CommonApplication);
   frmReferences.ShowModal;
end;

procedure shfrmAccGroups;
begin
   frmAccGroups := TfrmAccGroups.Create(CommonApplication);
   frmAccGroups.ShowModal;
end;


procedure shfrmCategories;
begin
   frmCategories := TfrmCategories.Create(CommonApplication);
   frmCategories.ShowModal;
end;

procedure shfrmDepositTypes;
begin
   frmDepositTypes := TfrmDepositTypes.Create(CommonApplication);
   frmDepositTypes.ShowModal;
end;


procedure shfrmAccountTurning;
begin
   frmAccountTurning := TfrmAccountTurning.Create(CommonApplication);
   frmAccountTurning.ShowModal;
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

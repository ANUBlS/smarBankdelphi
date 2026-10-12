unit ReferLoader_new;

interface
uses
  Windows, Sysutils;


 procedure exportproc(s:String);export;
implementation

uses CommonDeclsImpl_new,frmReferencesImpl_new,
     frmAccGroupsImpl_new,frmCategoriesImpl_new,
     frmDepositTypesImpl_new,frmAccountTurningImpl_new;

procedure shfrmReferences;
begin
   frmReferences_new := TfrmReferences_new.Create(CommonApplication);
   frmReferences_new.ShowModal;
end;

procedure shfrmAccGroups;
begin
   frmAccGroups_new:= TfrmAccGroups_new.Create(CommonApplication);
   frmAccGroups_new.ShowModal;
end;


procedure shfrmCategories;
begin
   frmCategories_new := TfrmCategories_new.Create(CommonApplication);
   frmCategories_new.ShowModal;
end;

procedure shfrmDepositTypes;
begin
   frmDepositTypes_new := TfrmDepositTypes_new.Create(CommonApplication);
   frmDepositTypes_new.ShowModal;
end;


procedure shfrmAccountTurning;
begin
   frmAccountTurning_new := TfrmAccountTurning_new.Create(CommonApplication);
   frmAccountTurning_new.ShowModal;
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

unit NewDepositsReferLoader;

interface
uses
  Windows, Sysutils;


 procedure exportproc(s:String);export;
implementation

uses NewCommonDeclsImpl,NewDepositsFrmReferencesImpl,
     NewDepositsFrmAccGroupsImpl,NewDepositsFrmCategoriesImpl,
     NewDepositsFrmDepositTypesImpl,NewDepositsFrmAccountTurningImpl;

procedure shfrmReferences;
begin
   NewDepositsFrmReferences := TNewDepositsFrmReferences.Create(CommonApplication);
   NewDepositsFrmReferences.ShowModal;
end;

procedure shfrmAccGroups;
begin
   NewDepositsFrmAccGroups:= TNewDepositsFrmAccGroups.Create(CommonApplication);
   NewDepositsFrmAccGroups.ShowModal;
end;


procedure shfrmCategories;
begin
   NewDepositsFrmCategories := TNewDepositsFrmCategories.Create(CommonApplication);
   NewDepositsFrmCategories.ShowModal;
end;

procedure shfrmDepositTypes;
begin
   NewDepositsFrmDepositTypes := TNewDepositsFrmDepositTypes.Create(CommonApplication);
   NewDepositsFrmDepositTypes.ShowModal;
end;


procedure shfrmAccountTurning;
begin
   NewDepositsFrmAccountTurning := TNewDepositsFrmAccountTurning.Create(CommonApplication);
   NewDepositsFrmAccountTurning.ShowModal;
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

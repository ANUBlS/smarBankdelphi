unit PlugAccCheck;

interface

 uses ComObj;

 const

 AccPlug ='{74AE86C2-7769-4C28-AA04-0C82FBF8638C}';

 procedure CheckPlugAccess(var Plug: TGuid);

implementation

 uses sboapiDataModuleImpl;

 procedure CheckPlugAccess(var Plug: TGuid);
 begin

  if GuidToString(Plug)='{53E4AB09-4BA7-11D6-B271-00C0262B568B}' then
    Plug:=StringTOGuid(AccPlug);
   sboapiDataModule.SBAca.CallBooleanFunction('checkmodright',[GuidToString(Plug)]);

 //  if not(sboapiDataModule.SBAca.CallBooleanFunction('checkmodright',[GuidToString(Plug)])) then
//    Plug:=StringTOGuid(AccPlug);


 end;

end.

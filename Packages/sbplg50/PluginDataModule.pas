unit PluginDataModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle,ComObj;

 const
 AccPlug ='{74AE86C2-7769-4C28-AA04-0C82FBF8638C}';

type
  TPlugDataModule = class(TDataModule)
    SBAca: TOraclePackage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PlugDataModule: TPlugDataModule= nil;

 procedure CheckPlugAccess(var Plug: TGuid);
 procedure sbovcl_InitDataModule;

implementation
{$R *.DFM}

 uses sboapiDataModuleImpl;

 procedure CheckPlugAccess(var Plug: TGuid);
 begin
  if GuidToString(Plug)='{53E4AB09-4BA7-11D6-B271-00C0262B568B}' then
    Plug:=StringTOGuid(AccPlug);
 PlugDataModule.SBAca.CallBooleanFunction('checkmodright',['zaza']);
 //  if not(sboapiDataModule.SBAca.CallBooleanFunction('checkmodright',[GuidToString(Plug)])) then
//    Plug:=StringTOGuid(AccPlug);
 end;

procedure sbovcl_InitDataModule;
begin
  if not Assigned(PlugDataModule) then
    PlugDataModule := TPlugDataModule.Create(nil);
end;

initialization
finalization
  if Assigned(PlugDataModule) then
    PlugDataModule.Free;
end.


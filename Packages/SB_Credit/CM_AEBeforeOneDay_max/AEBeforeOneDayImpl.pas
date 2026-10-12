unit AEBeforeOneDayImpl;

interface

uses  Windows, Messages, SysUtils, Classes, NLSDialogs, DB, Controls;

procedure InitPlugin(S : String); export;

implementation
uses Systemstate, CommonDecls;

procedure ShowExp(Dat :TDateTime);
Var
    ApplicationDir :String;
    PluginHandle : THANDLE;
    ShowExpires : procedure(Dat :TDateTime);
begin
  // Dat := Integer(Trunc(Get_CurrentDate))+1;

    ApplicationDir := ExtractFilePath(CommonApplication.ExeName);
    PluginHandle := LoadPackage(ApplicationDir+'CM_AutoExpiresAll.bpl');

    //if PluginHandle >0 then begin
       @ShowExpires := GetProcAddress(PluginHandle,'ShowExpires');
       ShowExpires(Dat);
    //end;


end;

procedure InitPlugin(S : String); export;
const
   cs_BeforeExp = 'BeforeExp';
   cs_AfterExp = 'AfterExp';

var CtrlDat :TDateTime;
begin

  if S =  cs_BeforeExp then  CtrlDat := Integer(Trunc(Get_CurrentDate))+1;
  if S =  cs_AfterExp then  CtrlDat := Get_PrevDate;

  ShowExp(CtrlDat);
end;

exports
  InitPlugin;

end.

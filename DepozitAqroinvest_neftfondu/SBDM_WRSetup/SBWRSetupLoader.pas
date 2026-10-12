unit SBWRSetupLoader;

interface

uses SysUtils,Windows;

procedure exportproc(S:String);export;

implementation

uses CommonDeclsImpl,SBWRBookmarksTuning{,SBDMAgreeUnit};

procedure shSBWRBookmarkSetup;
begin
   with TSBWRBookmarkSetup.Create(CommonApplication) do
     try
       ShowModal;
     finally
       Release;

   end;

   {SBWRBookmarkSetup := TSBWRBookmarkSetup.Create(CommonApplication);
   SBWRBookmarkSetup.ShowModal;}
end;

{procedure shAgreeForm;
begin
   AgreeForm := TAgreeForm.Create(CommonApplication);
   AgreeForm.ShowModal;
end; }


procedure exportproc(S:String);export;
const
   cs_SBWRBookmarkSetup = 'showSBWRBookmarkSetup';
   cs_AgreeForm = 'showPrintContract';
begin
   if S =   cs_SBWRBookmarkSetup then
      shSBWRBookmarkSetup;
   {if S  =  cs_AgreeForm then
      shAgreeForm; }

end;

exports
   exportproc;
end.

unit crWRSetupLoader;
 
interface


procedure InitPlugin(S : String);export;

implementation

uses
  crCommonDecls,crWRBookmarksTuning, crWRTemplatesTuning,crTemplateAddEditUnt,
 crBookmarkAddEditunt;



  procedure ShowWRTemplateSetup;
  begin
     with TWRTemplateSetup.Create(CommonApplication) do
     try
       ShowModal;
     finally
       Release;
  end;

end;

  procedure ShowWRBookmarkSetup;
  begin
     with TWRBookmarkSetup.Create(CommonApplication) do
     try
       Showmodal;
     finally
       Release;
    end;
 end;

procedure InitPlugin(S : String);export;
const

  SWRTemplateSetup = 'WRTemplateSetup';
  SWRBookmarkSetup ='WRBookmarkSetup';

begin
  if S = SWRTemplateSetup then
     ShowWRTemplateSetup;

  if S=SWRBookmarkSetup then
     ShowWRbookmarkSetup;

end;

exports
  InitPlugin;

end.

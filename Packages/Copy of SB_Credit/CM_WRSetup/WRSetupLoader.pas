unit WRSetupLoader;
 
interface


procedure InitPlugin(S : String ;mehid:integer);export;
var      meh :integer;
implementation

uses
  CommonDecls,WRBookmarksTuning, WRTemplatesTuning,TemplateAddEditUnt,
 BookmarkAddEditunt,Messages,Dialogs;



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

procedure InitPlugin(S : String; mehid:integer);export;
const

  SWRTemplateSetup = 'WRTemplateSetup';
  SWRBookmarkSetup ='WRBookmarkSetup';

begin
 meh:= mehid;

  if S = SWRTemplateSetup then
     ShowWRTemplateSetup;

  if s='WRBookmarkSetup' then
     ShowWRbookmarkSetup;

end;

exports
  InitPlugin;

end.

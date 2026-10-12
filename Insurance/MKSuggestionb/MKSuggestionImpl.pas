unit MKSuggestionImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, INSWordExporter, PlgModalContainer, Grids, DBGrids, DBCtrls,
  StdCtrls, XFSCtrls, Mask, Oracle, DB, OracleData, Buttons, ExtCtrls;

type
  TfmMKSuggestion = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMKSuggestion: TfmMKSuggestion;
procedure InitPlugin(s:string);export;
implementation

{$R *.dfm}

procedure InitPlugin(s:string);export;
begin
   fmMKSuggestion.ShowModal;
end;
exports
     InitPlugin;

initialization
 fmMKSuggestion := TfmMKSuggestion.Create(Application);
end.

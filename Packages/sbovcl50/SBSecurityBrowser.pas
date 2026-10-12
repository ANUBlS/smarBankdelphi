unit SBSecurityBrowser;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB;

type
  TSBSecurityBrowser = class(TCommonDialog)
  private
    { Private declarations }
    FDataField: String;
    FDataSource: TDataSource;
  protected
    { Protected declarations }
  public
    { Public declarations }
    function Execute: Boolean; override;
  published
    { Published declarations }
    property DataSource: TDataSource read FDataSource;
    property DataField: String read FDataField;
  end;

implementation

uses SecurityBrowserImpl;

function TSBSecurityBrowser.Execute: Boolean;
begin
  with TSecurityBrowserForm.Create(Self) do
  try
    ShowModal;
    Result := Commited;
  finally
    Release;
  end;
end;

end.

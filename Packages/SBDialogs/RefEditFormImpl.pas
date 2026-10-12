unit RefEditFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, ToolWin, ComCtrls, Grids, DBGrids;

type
  TRefEditForm = class(TForm)
    ToolBar1: TToolBar;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
    function Edit(const RefName: String): Boolean;
    procedure View: 
  end;

var
  RefEditForm: TRefEditForm;

implementation

{$R *.DFM}

function TRefEditForm.Edit(const RefName: String): Boolean;
begin
end;

end.

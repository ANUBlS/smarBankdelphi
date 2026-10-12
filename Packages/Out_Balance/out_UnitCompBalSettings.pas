unit UnitCompBalSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids;

type
  TFrmCompBalSettings = class(TForm)
    DBGrid1: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCompBalSettings: TFrmCompBalSettings;

implementation

uses UnitDataMod;
{$R *.DFM}

end.

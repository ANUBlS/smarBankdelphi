unit Azipstemp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitdatamod, Grids, DBGrids;

type
  Ttemplates = class(TForm)
    DBGrid1: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  templates: Ttemplates;

implementation

{$R *.dfm}

end.

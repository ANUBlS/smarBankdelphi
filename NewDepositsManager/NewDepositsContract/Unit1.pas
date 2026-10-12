unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, HintBox, StdCtrls, Buttons, ExtCtrls, XFSCtrls, Grids, XDBGrids;

type
  TForm1 = class(TForm)
    XFPanel1: TXFPanel;
    XDBGrid1: TXDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses   NewDepositsContractImpl;

end.

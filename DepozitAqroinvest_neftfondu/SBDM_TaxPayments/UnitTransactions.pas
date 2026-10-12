unit UnitTransactions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, XDBGrids, ExtCtrls;

type
  TFormTransactions = class(TForm)
    Panel1: TPanel;
    XDBGrid1: TXDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTransactions: TFormTransactions;

implementation

{$R *.dfm}

end.

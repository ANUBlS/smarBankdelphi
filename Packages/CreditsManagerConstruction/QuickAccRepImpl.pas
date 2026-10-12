unit QuickAccRepImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt;

type
  TQuickAccRep = class(TForm)
    QuickRep1: TQuickRep;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QuickAccRep: TQuickAccRep;

implementation

  uses DatModConstructionImpl;

{$R *.dfm}

end.

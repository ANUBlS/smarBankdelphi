unit UnitProgress;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls;

type
  TFrmProgress = class(TForm)
    PrBarChild: TProgressBar;
    PrBarMain: TProgressBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProgress: TFrmProgress;

implementation

{$R *.DFM}

end.

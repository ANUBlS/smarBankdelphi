unit ReserveProgressFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, NLSLocalizer;

type
  TProgressForm = class(TForm)
    ProgressShower: TProgressBar;
    NLSLocalizer1: TNLSLocalizer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ProgressForm: TProgressForm;

implementation

{$R *.DFM}

end.

unit AEProgressFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, NLSLocalizer;

type
  TAEProgressForm = class(TForm)
    ProgressShower: TProgressBar;
    NLSLocalizer1: TNLSLocalizer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AEProgressForm: TAEProgressForm;

implementation

{$R *.DFM}

end.

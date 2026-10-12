unit AKProgressFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NLSLocalizer, ComCtrls;

type
  TAKProgressForm = class(TForm)
    ProgressBar: TProgressBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AKProgressForm: TAKProgressForm;

implementation

{$R *.DFM}

end.

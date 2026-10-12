unit newProgressimpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls;

type
  TnewProgressForm = class(TForm)
    ProgressShower: TProgressBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  newProgressForm: TnewProgressForm;

implementation

{$R *.dfm}

end.

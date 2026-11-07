unit MISProgressFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  TMISProgressForm = class(TForm)
    ProgressShower: TProgressBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MISProgressForm: TMISProgressForm;

implementation

{$R *.DFM}

end.

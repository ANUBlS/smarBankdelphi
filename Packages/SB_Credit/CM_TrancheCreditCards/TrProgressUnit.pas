unit TrProgressUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls;

type
  TTrProgressForm = class(TForm)
    TrPrB: TProgressBar;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TrProgressForm: TTrProgressForm;

implementation

{$R *.DFM}

procedure TTrProgressForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if ord(Key) = vK_ESCAPE then close;
end;

end.

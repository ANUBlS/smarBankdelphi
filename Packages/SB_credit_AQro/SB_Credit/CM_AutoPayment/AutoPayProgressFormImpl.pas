unit AutoPayProgressFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  StdCtrls, ComCtrls, NLSLocalizer;

type
  TProgressForm = class(TForm)
    ProgressShower: TProgressBar;
    NLSLocalizer1: TNLSLocalizer;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    FCancelOrder : Boolean;
    FCancelGranted : Boolean;
    { Public declarations }
  end;

var
  ProgressForm: TProgressForm;

implementation

{$R *.DFM}

procedure TProgressForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
//  CanClose := FCancelGranted;
end;

procedure TProgressForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_ESCAPE then
    FCancelOrder := True;
end;

end.

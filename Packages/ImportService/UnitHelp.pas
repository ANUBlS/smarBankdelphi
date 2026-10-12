unit UnitHelp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TFormHelp = class(TForm)
    ImageHelp: TImage;
    BtnOK: TBitBtn;
    procedure BtnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHelp: TFormHelp;

implementation

{$R *.DFM}

procedure TFormHelp.BtnOKClick(Sender: TObject);
begin
  Close;
end;

end.

unit UnitWorMessa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFormWorMessag = class(TForm)
    Label1: TLabel;
    Timer1: TTimer;
    Memo1: TMemo;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormWorMessag: TFormWorMessag;

implementation

{$R *.dfm}

procedure TFormWorMessag.Timer1Timer(Sender: TObject);
begin
FormWorMessag.Timer1.Enabled:=false;
       FormWorMessag.Close;
end;

end.

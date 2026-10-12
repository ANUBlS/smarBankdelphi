unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm10 = class(TForm)
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Panel1: TPanel;
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

uses MainResourceImpl;

{$R *.dfm}

procedure TForm10.RadioButton1Click(Sender: TObject);
begin
MainResource:=TMainResource.Create(self);
MainResource.GBoxNB.Visible:=(MainResource.RButtonNB.Checked=true);
MainResource.GBoxNL.Visible:=false;
MainResource.ShowModal;
end;

procedure TForm10.RadioButton2Click(Sender: TObject);
begin
MainResource:=TMainResource.Create(self);
MainResource.GBoxNL.Visible:=(MainResource.RButtonNL.Checked=true);
MainResource.GBoxNB.Visible:=false;
MainResource.ShowModal;
end;

end.

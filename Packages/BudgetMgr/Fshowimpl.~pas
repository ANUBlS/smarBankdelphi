unit Fshowimpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFrmshow = class(TForm)
    FrMsg: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmshow: TFrmshow;

implementation
uses Dmbudgetimpl,sboapiDataModuleImpl ;
{$R *.DFM}

procedure TFrmshow.Button1Click(Sender: TObject);
begin
  if Button2.Visible=False then
    BtnYes:= 0
  else
    BtnYes:= 1;
  Close;
end;

procedure TFrmshow.Button2Click(Sender: TObject);
begin
BtnYes:= 0;
  Close;
end;

end.

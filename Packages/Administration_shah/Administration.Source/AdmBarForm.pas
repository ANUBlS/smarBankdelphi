unit AdmBarForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, ExtCtrls, Gauges;

 type
  TBarForm = class(TForm)
    Panel1: TPanel;
    BarTitle: TGroupBox;
    BarCaption: TLabel;
    Bar: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDeactivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure WMUser(var Message: TMessage); message WM_USER;
  public
    CanCloseBarForm: Boolean;
    procedure Execute(Header,Title,Caption: string;BarStep,BarMax : Integer);
  end;
var
  BarForm: TBarForm;

implementation

{$R *.DFM}

procedure TBarForm.FormCreate(Sender: TObject);
begin
 CanCloseBarForm:=False;
 Bar.Step:=1;
end;

procedure TBarForm.WMUser(var Message: TMessage);
begin
 Bar.StepIt;;
 CanCloseBarForm:=Bar.Position=Bar.Max;
end;

procedure TBarForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
CanClose:=CanCloseBarForm;
end;


procedure TBarForm.Execute(Header,Title,Caption: string;BarStep,BarMax : Integer);
begin
 Caption:=Header;
 BarTitle.Caption:=Title;
 BarCaption.Caption:=Caption;
 Bar.Step:=BarStep;
 Bar.Max:=BarMax;
 Show;
end;

procedure TBarForm.FormDeactivate(Sender: TObject);
begin
with TForm(self) do
  if Visible then
   begin
    SetFocus;
    Beep;
   end;
end;

procedure TBarForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if CanCloseBarForm then
  begin
   Close;
   Release;
  end;
end;

end.


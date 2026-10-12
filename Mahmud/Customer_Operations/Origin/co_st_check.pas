unit co_st_check;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TCO_St_Form = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Chck2: TRadioButton;
    Chck1: TRadioButton;
    procedure Button1Click(Sender: TObject);
     procedure WMNCACTIVATE(var message: TWMNCActivate); message WM_NCACTIVATE;
    procedure WMNCPaint(var message : TWMNCPaint); message WM_NCPAINT;
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CO_St_Form: TCO_St_Form;

implementation

uses co_statement_impl, CO_datamod_impl;

{$R *.DFM}

procedure TCO_St_Form.WMNCACTIVATE(var message:TWMNCActivate);
var
 S:TWMNCPaint;
begin
inherited;
WMNCPaint(s);
end;

procedure TCO_St_Form.WMNCPaint(var message: TWMNCPaint);
const Capt = 'Сечим';
var dc : hDc;
begin
inherited;
Caption:='';
dc := GetWindowDC(Handle);
        SetBkMode(dc,Transparent);
        SetTextColor(dc,clWhite);
        SelectObject(dc, Font.Handle);
        TextOut(dc, 23,6,Capt,Length(Capt));
end;
procedure TCO_St_Form.Button1Click(Sender: TObject);
begin
try
CO_Statement_Form :=TCO_Statement_Form.Create(self);
  CO_Statement_Form.Showmodal;
    finally
     CO_Statement_Form.Release;
      end;
       close;
        end;

procedure TCO_St_Form.Label1Click(Sender: TObject);
begin
Chck1.checked :=true;
end;

procedure TCO_St_Form.Label2Click(Sender: TObject);
begin
Chck2.checked :=true;
end;

procedure TCO_St_Form.FormActivate(Sender: TObject);
begin
chck1.checked :=true;
end;

end.

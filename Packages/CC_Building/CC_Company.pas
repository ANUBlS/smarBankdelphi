unit CC_Company;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  StdCtrls, Buttons, ExtCtrls, NLSLocalizer;

type
  TCC_Add_Company = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    NLSLocalizer1: TNLSLocalizer;
    Button1: TButton;
    EditCompany: TEdit;
    procedure WMNCACTIVATE(var message:TWMNCActivate);
    procedure WMNCPaint(var message: TWMNCPaint);
    procedure EditCompanyKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1KeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CC_Add_Company: TCC_Add_Company;

implementation

uses CC_Datamodule;

{$R *.DFM}

procedure TCC_Add_Company.WMNCACTIVATE(var message:TWMNCActivate);
var
 S:TWMNCPaint;
begin
inherited;
WMNCPaint(s);
end;

procedure TCC_Add_Company.WMNCPaint(var message: TWMNCPaint);
const Capt = 'Щесабын Ямялиййатлары';
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

procedure TCC_Add_Company.EditCompanyKeyPress(Sender: TObject;
  var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;


  end;
end;

procedure TCC_Add_Company.Button1Click(Sender: TObject);
begin
  if EditCompany.text='' then Showmessage('Компанийанын адыны дахил един!');
  if EditCompany.text<>'' then CC_datamod.CC_OP.CallProcedure('add_Companies',[Editcompany.text]);
  CC_DataMod.CC_Company.refresh;
  EditCompany.text :='';
  EditCompany.SetFocus;
end;

procedure TCC_Add_Company.FormActivate(Sender: TObject);
begin
  EditCompany.SetFocus;
end;

procedure TCC_Add_Company.Button1KeyPress(Sender: TObject; var Key: Char);
begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;
end;
     end;
end.

unit CC_Edit_Company;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, NLSLocalizer;

type
  TCC_Update_Company = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EditCompany: TEdit;
    GroupBox2: TGroupBox;
    NLSLocalizer1: TNLSLocalizer;
    Button1: TButton;
//    procedure BitBtn2Click(Sender: TObject);
    procedure WMNCACTIVATE(var message:TWMNCActivate);
    procedure WMNCPaint(var message: TWMNCPaint);
    procedure FormActivate(Sender: TObject);
    procedure EditCompanyKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
   // procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CC_Update_Company: TCC_Update_Company;

implementation

uses CC_Datamodule;

{$R *.DFM}

procedure TCC_Update_Company.WMNCACTIVATE(var message:TWMNCActivate);
var
 S:TWMNCPaint;
begin
inherited;
WMNCPaint(s);
end;

procedure TCC_Update_Company.WMNCPaint(var message: TWMNCPaint);
const Capt = 'Ўирк€т';
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


procedure TCC_Update_Company.FormActivate(Sender: TObject);
begin
EditCompany.text :=CC_DataMod.CC_Company.fieldbyname('comp_name').asstring;
end;

procedure TCC_Update_Company.EditCompanyKeyPress(Sender: TObject;
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
procedure TCC_Update_Company.Button1Click(Sender: TObject);
var
  p_Name :string;
  p_ID   :integer;
begin
  p_id :=CC_DataMod.CC_Company.FieldByName('ID').AsInteger;
  p_name :=EditCompany.Text;
  CC_DataMod.CC_OP.CallProcedure('upd_Companies',[p_ID,p_Name]);
  CC_DataMod.CC_Company.Close;
  CC_DataMod.CC_Company.Open;
  Close;
end;

end.

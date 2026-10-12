unit CC_info_house;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  StdCtrls, ExtCtrls, Buttons, NLSLocalizer;

type
  TCC_Add_House = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Editname: TEdit;
    Label1: TLabel;
    Editadress: TEdit;
    Label2: TLabel;
    Editentrance: TEdit;
    Label4: TLabel;
    Editflat: TEdit;
    Label5: TLabel;
    ac_groupbox: TGroupBox;
    Editid: TEdit;
    NLSLocalizer1: TNLSLocalizer;
    Button1: TButton;
    Button2: TButton;
    EditFloor: TEdit;
    Label3: TLabel;
    procedure FormActivate(Sender: TObject);
   procedure WMNCACTIVATE(var message:TWMNCActivate);
   procedure WMNCPaint(var message: TWMNCPaint);
    procedure EditnameKeyPress(Sender: TObject; var Key: Char);
    procedure EditadressKeyPress(Sender: TObject; var Key: Char);
    procedure EditentranceKeyPress(Sender: TObject; var Key: Char);
    procedure EditflatKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
//    procedure EditadressKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CC_Add_House: TCC_Add_House;

implementation

uses CC_Datamodule, CC_Edit_Company;

{$R *.DFM}

procedure TCC_Add_House.WMNCACTIVATE(var message:TWMNCActivate);
var
 S:TWMNCPaint;
begin
inherited;
WMNCPaint(s);
end;

procedure TCC_Add_House.WMNCPaint(var message: TWMNCPaint);
const Capt = 'Ѕина';
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

procedure TCC_Add_House.FormActivate(Sender: TObject);
begin
CC_Add_House.editid.text:=CC_Datamod.CC_Company.fieldbyname('id').asstring;

end;

procedure TCC_Add_House.EditnameKeyPress(Sender: TObject; var Key: Char);
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
procedure TCC_Add_House.EditadressKeyPress(Sender: TObject; var Key: Char);

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



procedure TCC_Add_House.EditentranceKeyPress(Sender: TObject;
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
  if not (key in ['а'..'€','ј'..'я','A'..'Z','а'..'z']) then
    key :=#0;

end;
   end;


procedure TCC_Add_House.EditflatKeyPress(Sender: TObject; var Key: Char);
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


procedure TCC_Add_House.Button1Click(Sender: TObject);
begin
{  if EditEntrance.Text ='' then ShowMessage('Ѕинанын эириш сайыны дахил един!');
  if EditFlat.Text ='' then ShowMessage('Ѕинанын м€нзил є дахил един!');
  if EditFloor.Text ='' then ShowMessage('Ѕинанын м€рт€б€ є дахил един!');}
  if (Editname.Text <>'') and   (Editadress.Text <>'') then
  begin
   CC_datamod.CC_OP.CallProcedure('add_Buildings',[strtoint(Editid.text),
                                                Editname.text,
                                                Editadress.text,
                                                strtoint(EditFloor.text),
                                                strtoint(Editentrance.text),
                                                strtoint(Editflat.text)]);
CC_DataMod.CC_building.close;
CC_DataMod.CC_building.open;
Editname.Text :='';
Editadress.text :='';
Editentrance.text :='';
Editflat.text :='';
EditFloor.text :='';
Editname.SetFocus;
end
else
ShowMessage('јды в€ ÷нван с€тирл€рини долдурун!')
end;
procedure TCC_Add_House.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key) = VK_ESCAPE then close;
end;

procedure TCC_Add_House.Button2Click(Sender: TObject);
begin
close;

end;

end.

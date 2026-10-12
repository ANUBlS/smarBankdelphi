unit CC_Edit_Flat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, NLSLocalizer;

type
  TCC_Update_flats = class(TForm)
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    NLSLocalizer1: TNLSLocalizer;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Editno: TEdit;
    Editfloor: TEdit;
    Editroom: TEdit;
    Editarea: TEdit;
    Editprice1: TEdit;
    Editpricegen: TEdit;
    Editentrance: TEdit;
    Button1: TButton;
    Button2: TButton;
    EditCode: TEdit;
    Label8: TLabel;
  //  procedure BitBtn1Click(Sender: TObject);
    procedure WMNCACTIVATE(var message:TWMNCActivate);
    procedure WMNCPaint(var message: TWMNCPaint);
    procedure FormActivate(Sender: TObject);
    procedure EditnoKeyPress(Sender: TObject; var Key: Char);
    procedure EditentranceKeyPress(Sender: TObject; var Key: Char);
    procedure EditfloorKeyPress(Sender: TObject; var Key: Char);
    procedure EditroomKeyPress(Sender: TObject; var Key: Char);
    procedure EditareaKeyPress(Sender: TObject; var Key: Char);
    procedure Editprice1KeyPress(Sender: TObject; var Key: Char);
    procedure EditpricegenKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CC_Update_flats: TCC_Update_flats;

implementation

uses CC_Datamodule;

{$R *.DFM}

procedure TCC_Update_flats.WMNCACTIVATE(var message:TWMNCActivate);
var
 S:TWMNCPaint;
begin
inherited;
WMNCPaint(s);
end;

procedure TCC_Update_flats.WMNCPaint(var message: TWMNCPaint);
const Capt = 'ўесабын ям€лиййатлары';
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


procedure TCC_Update_flats.FormActivate(Sender: TObject);
begin
EditCode.SetFocus;
EditCode.Text:=CC_DataMod.CC_Buyer_Flat.fieldbyname('code').asstring;
EditNo.text :=CC_DataMod.CC_Buyer_Flat.fieldbyname('flatnumber').asstring;
EditEntrance.text :=CC_DataMod.CC_Buyer_Flat.fieldbyname('entrance').asstring;
EditFloor.text :=CC_DataMod.CC_Buyer_Flat.fieldbyname('ffloor').asstring;
EditRoom.text :=CC_DataMod.CC_Buyer_Flat.fieldbyname('rooms').asstring;
EditArea.text :=CC_DataMod.CC_Buyer_Flat.fieldbyname('area').asstring;
EditPrice1.text :=CC_DataMod.CC_Buyer_Flat.fieldbyname('price1').asstring;
EditPricegen.text :=CC_DataMod.CC_Buyer_Flat.fieldbyname('pricegen').asstring;

end;

procedure TCC_Update_flats.EditnoKeyPress(Sender: TObject; var Key: Char);
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

procedure TCC_Update_flats.EditentranceKeyPress(Sender: TObject;
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

procedure TCC_Update_flats.EditfloorKeyPress(Sender: TObject;
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

procedure TCC_Update_flats.EditroomKeyPress(Sender: TObject;
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

procedure TCC_Update_flats.EditareaKeyPress(Sender: TObject;
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

procedure TCC_Update_flats.Editprice1KeyPress(Sender: TObject;
  var Key: Char);

  var
 Calc:real;
 begin
if ORD(Key) = VK_RETURN then
  begin
  if Sender is TWinControl then
  with Sender as TWinControl do
  case Tag of
    1 : SelectNext(Sender as TWinControl ,True ,True);
    end;
    Key := #0;

  Calc:=(strtofloat(Editarea.Text)*  strtofloat(Editprice1.text));
  Editpricegen.Text:=floattostr(Calc);
end;
end;



procedure TCC_Update_flats.EditpricegenKeyPress(Sender: TObject;
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

procedure TCC_Update_flats.Button1Click(Sender: TObject);

var
p_FlatCode,p_flatnumber:string;
 p_entrance,p_ffloor,p_rooms,p_area,p_price1,p_pricegen,p_buyer,p_id,p_bld_id : integer;
begin
p_FlatCode  :=EditCode.text;
p_flatnumber :=Editno.text;
p_entrance :=strtoint(Editentrance.text);
p_ffloor :=strtoint(EditFloor.text);
p_rooms :=strtoint(Editroom.text);
p_area :=strtoint(Editarea.text);
p_price1 :=strtoint(Editprice1.text);
p_pricegen :=strtoint(Editpricegen.text);

p_id :=CC_Datamod.CC_Buyer_Flat.fieldbyname('id').asinteger;
p_bld_id :=CC_Datamod.CC_Buyer_Flat.fieldbyname('bld_id').asinteger;

CC_Datamod.CC_OP.CallProcedure('upd_Flats',[   p_id,
                                                p_bld_id,
                                                p_FlatCode,
                                                p_flatnumber,
                                                p_entrance,
                                                p_ffloor,
                                                p_rooms,
                                                p_area,
                                                p_price1,
                                                p_pricegen,
                                                p_buyer
                                               ]); //TKenan--Good Luck!

CC_DataMod.CC_Buyer_Flat.close;
CC_DataMod.CC_Buyer_Flat.open;
close;

end;

procedure TCC_Update_flats.Button2Click(Sender: TObject);
begin
close;
end;

end.

unit CC_Edit_House;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, NLSLocalizer;

type
  TCC_Update_House = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Editname: TEdit;
    Editadress: TEdit;
    Editentrance: TEdit;
    Editflat: TEdit;
    ac_groupbox: TGroupBox;
    NLSLocalizer1: TNLSLocalizer;
    Button1: TButton;
    Button2: TButton;
    EditFloor: TEdit;
    Label3: TLabel;
 //   procedure BitBtn1Click(Sender: TObject);
    procedure WMNCACTIVATE(var message:TWMNCActivate);
    procedure WMNCPaint(var message: TWMNCPaint);
    procedure FormActivate(Sender: TObject);
    procedure EditnameKeyPress(Sender: TObject; var Key: Char);
    procedure EditadressKeyPress(Sender: TObject; var Key: Char);
    procedure EditentranceKeyPress(Sender: TObject; var Key: Char);
    procedure EditflatKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CC_Update_House: TCC_Update_House;

implementation

uses CC_Datamodule;

{$R *.DFM}

procedure TCC_Update_House.WMNCACTIVATE(var message:TWMNCActivate);
var
 S:TWMNCPaint;
begin
inherited;
WMNCPaint(s);
end;

procedure TCC_Update_House.WMNCPaint(var message: TWMNCPaint);
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



procedure TCC_Update_House.FormActivate(Sender: TObject);
begin
EditName.text :=CC_DataMod.CC_building.fieldbyname('bld_name').asstring;
EditAdress.text :=CC_DataMod.CC_building.fieldbyname('address').asstring;
EditFloor.text :=CC_DataMod.CC_building.fieldbyname('floors').asstring;
EditEntrance.text :=CC_DataMod.CC_building.fieldbyname('entrances').asstring;
EditFlat.text :=CC_DataMod.CC_building.fieldbyname('flats').asstring;

end;

procedure TCC_Update_House.EditnameKeyPress(Sender: TObject;
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

procedure TCC_Update_House.EditadressKeyPress(Sender: TObject;
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

procedure TCC_Update_House.EditentranceKeyPress(Sender: TObject;
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

procedure TCC_Update_House.EditflatKeyPress(Sender: TObject;
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

procedure TCC_Update_House.Button1Click(Sender: TObject);
var
p_bld_name,p_adress :string;
p_floor,p_entrances,p_flats,p_id,p_comp_id:integer;
begin
p_bld_name :=Editname.text;
p_adress :=Editadress.Text;
p_entrances :=strtoint(Editentrance.Text);
p_floor  :=strtoint(EditFloor.Text);
p_flats :=strtoint(Editflat.Text);
p_id :=CC_Datamod.CC_Building.fieldbyname('id').asinteger;
p_comp_id :=CC_Datamod.CC_Building.fieldbyname('comp_id').asinteger;
CC_DataMod.CC_OP.CallProcedure('upd_Buildings',[
                                                    p_id,
                                                    p_comp_id,
                                                   p_bld_name,
                                                   p_adress,
                                                   p_floor,
                                                   p_entrances,
                                                   p_flats]);
CC_DataMod.CC_building.close;
CC_DataMod.CC_building.open;

close;

end;

procedure TCC_Update_House.Button2Click(Sender: TObject);
begin
close;
end;

end.

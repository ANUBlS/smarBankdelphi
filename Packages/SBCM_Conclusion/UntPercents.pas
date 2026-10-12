unit UntPercents;

interface

uses
  Windows, Menus, StdCtrls, ComCtrls, Controls, Buttons, Classes, Forms, SysUtils,UntContractConclusion;

type
  TFrmPercents = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    BtnClose: TButton;
    PercentsList: TListBox;
    GroupBox1: TGroupBox;
    FloatablePercentsEdit: TEdit;
    DTPCurrentDate: TDateTimePicker;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    SBNew: TSpeedButton;
    PopupMenu: TPopupMenu;
    miDelete: TMenuItem;
    miClear: TMenuItem;
    miNone: TMenuItem;
    procedure SBNewClick(Sender: TObject);
    procedure PercentsListContextPopup(Sender: TObject;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure miDeleteClick(Sender: TObject);
    procedure miClearClick(Sender: TObject);
    procedure FloatablePercentsEditKeyPress(Sender: TObject;
      var Key: Char);
  private
    { Private declarations }
  public
    FParentButtonTag :Integer;
    { Public declarations }
  end;

var
  FrmPercents: TFrmPercents;

implementation

uses  StoredProgramsUnit;

{$R *.DFM}

function  GetMode(Value :Integer):TPercentMode;
begin
    if  Value = 0  then
     Result :=pmNormal
    else
     Result :=pmOverdue;
end;
procedure TFrmPercents.SBNewClick(Sender: TObject);
var
   Mode :TPercentMode;
begin
 try
  Mode :=GetMode(FParentButtonTag);
  with FrmContract,PercentsList.Items do
  begin
     Push(FloatablePercent,StrToFloat(FloatablePercentsEdit.Text),Mode);
     Push(FloatableDate,Trunc(DTPCurrentDate.DateTime),Mode);
     Add(FormatDateTime('dd-mm-yyyy',DTPCurrentDate.DateTime)+Format('  : %s ',[FloatablePercentsEdit.Text])+'%-ля');
  end;
 except
   Beep;
     //Make Sure Application not  aborted if  raise Convertion Error
 end;
end;

procedure TFrmPercents.PercentsListContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
   Index :Integer;
begin
  Index :=PercentsList.ItemAtPos(MousePos,True);
  if  Index<>-1 then
   PercentsList.ItemIndex :=Index
  else
   Handled :=True;
end;
procedure TFrmPercents.FormShow(Sender: TObject);
var
   Mode :TPercentMode;
   Idx  :Integer;
begin
  DTPCurrentDate.DateTime :=GetBankDate; 
  Mode :=GetMode(FParentButtonTag);
  with   FrmContract,PercentsList.Items  do
  begin
    Clear;
    FloatablePercentsEdit.Text :='0.00';
    for  Idx :=0  to  High(FloatableDate[Mode])  do
      Add(FormatDateTime('dd-mm-yyyy',FloatableDate[Mode][Idx])+Format('  : %s ',[FloatToStr(FloatablePercent[Mode][Idx])])+'%-ля');
  end
end;

procedure TFrmPercents.miDeleteClick(Sender: TObject);
var
   Mode  :TPercentMode;
begin
  Mode :=GetMode(FParentButtonTag);
  with   FrmContract,PercentsList  do
  begin
      Pop(FloatableDate,ItemIndex,Mode);
      Pop(FloatablePercent,ItemIndex,Mode);
      Items.Delete(ItemIndex);
  end;
end;

procedure TFrmPercents.miClearClick(Sender: TObject);
var
  Mode :TPercentMode;
begin
  Mode :=GetMode(FParentButtonTag);
  with   FrmContract,PercentsList  do
  begin
     SetLength(FloatableDate[Mode],0);
     SetLength(FloatablePercent[Mode],0);
     Items.Clear;
   end;
end;

{procedure  Init;
begin
  FrmPercents :=TFrmPercents.Create(nil);
end;
procedure  CleanUp;
begin
   FrmPercents.Free;
end;}

procedure TFrmPercents.FloatablePercentsEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if  not (Key in  ['0'..'9',#8,Chr(VK_DELETE),'.']) then
      Key :=#0
end;

{initialization
  Init;
finalization
  CleanUp;}
end.

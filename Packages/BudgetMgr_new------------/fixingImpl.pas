unit fixingImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids;

type
  TFixingFrm = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure Button4Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FixingFrm: TFixingFrm;

implementation
 uses DmBudcetImpl , FIXINGAddImpl;
{$R *.dfm}

procedure TFixingFrm.Button1Click(Sender: TObject);
begin
 DmBudcet.FIXINGDSet.Insert;
    if not Assigned(FIXINGAddFrm) then
      FIXINGAddFrm:= TFIXINGAddFrm.Create(application);
      FIXINGAddFrm.ShowModal ;
end;

procedure TFixingFrm.Button2Click(Sender: TObject);
begin
  DmBudcet.FIXINGDSet.edit;
    if not Assigned(FIXINGAddFrm) then
      FIXINGAddFrm:= TFIXINGAddFrm.Create(application);
      FIXINGAddFrm.ShowModal ;
end;

procedure TFixingFrm.Button3Click(Sender: TObject);
begin
if MessageDlg(' Silinəcək !'#13' Əminsinizmi?',
    mtWarning, [mbYes, mbCancel], 0)= mrYes then
    DmBudcet.FIXINGDSet.Delete;
end;

procedure TFixingFrm.Button4Click(Sender: TObject);
begin
close
end;

procedure TFixingFrm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize:=false
end;

procedure TFixingFrm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ORD(Key) = VK_ESCAPE then
    Close else
end;

end.

unit FrmItemaddImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls;

type
  TFrmItemadd = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Ok: TButton;
    Cancel: TButton;
    GroupBox1: TGroupBox;
    DBMemo1: TDBMemo;
    GroupBox2: TGroupBox;
    DBMemo2: TDBMemo;
    GroupBox3: TGroupBox;
    DBMemo3: TDBMemo;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure CancelClick(Sender: TObject);
    procedure OkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmItemadd: TFrmItemadd;

implementation

{$R *.dfm}
 uses Dmbudgetimpl;
procedure TFrmItemadd.CancelClick(Sender: TObject);
begin
close
end;

procedure TFrmItemadd.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize:=false;
end;

procedure TFrmItemadd.OkClick(Sender: TObject);
begin
DMBudget.AddItems.Post;
close;
end;

end.

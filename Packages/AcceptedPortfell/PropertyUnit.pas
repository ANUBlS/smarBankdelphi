unit PropertyUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Grids, DBGrids;

type
  TPropertyfrm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Button3: TButton;
    Button4: TButton;
    DBGrid1: TDBGrid;
    Label6: TLabel;
    DBMemo1: TDBMemo;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Propertyfrm: TPropertyfrm;

implementation

uses Datamodunit;

{$R *.dfm}

procedure TPropertyfrm.Button1Click(Sender: TObject);
begin
DataMod.Maincrpt_one.Insert;
DataMod.Maincrpt_one.FieldByName('id').AsFloat:=  DataMod.maincrprt.FieldByName('prtid').AsFloat;
end;

procedure TPropertyfrm.Button3Click(Sender: TObject);
begin
close;
end;

procedure TPropertyfrm.Button4Click(Sender: TObject);
begin


DataMod.Maincrpt_one.Edit;
DataMod.Maincrpt_one.FieldByName('id').AsFloat:=  DataMod.maincrprt.FieldByName('prtid').AsFloat;
DataMod.Maincrpt_one.FieldByName('PROPERTY').AsString:=  DBEdit1.Text;
DataMod.Maincrpt_one.FieldByName('PROP_DESC').AsString:=  DBEdit2.Text;
DataMod.Maincrpt_one.FieldByName('PROP_ADDRESS').AsString:=  DBEdit5.Text;
DataMod.Maincrpt_one.FieldByName('PORP_PASSPORT').AsString:= DBEdit4.Text;
DataMod.Maincrpt_one.FieldByName('PROP_PRICE').AsString:=  DBEdit3.Text;
DataMod.Maincrpt_one.FieldByName('PROP_info').AsString:=  DBMemo1.Text;


DataMod.Maincrpt_one.Post;
end;

procedure TPropertyfrm.FormShow(Sender: TObject);
begin
DataMod.Maincrpt_one.Close;
DataMod.Maincrpt_one.SetVariable('prts',DataMod.maincrprt.FieldByName('prtid').AsString);
DataMod.Maincrpt_one.Open;



end;

end.

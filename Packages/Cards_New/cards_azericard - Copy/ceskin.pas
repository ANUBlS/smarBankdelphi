unit ceskin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, SearchEdit;

type
  TCeskform = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    SearchEdit1: TSearchEdit;
    Label3: TLabel;
    procedure SearchEdit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ceskform: TCeskform;

implementation

uses Unit2;

{$R *.DFM}

procedure TCeskform.SearchEdit1Change(Sender: TObject);
begin
if SearchEdit1.Text='' then
  begin
   DBEdit1.Clear;
   DBEdit2.Clear;
  end;
swdatamodule.sw_customers.Locate
   ('id',SWDataModule.Account.Fieldbyname('KLI_ID').asinteger,[]);
end;

end.

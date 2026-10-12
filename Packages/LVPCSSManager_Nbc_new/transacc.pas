unit transacc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Data_Unit, ExtCtrls, Grids, DBGrids, StdCtrls;

type
  Ttrans_acc = class(TForm)
    Button2: TButton;
    Button1: TButton;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button3: TButton;
    Button4: TButton;
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  trans_acc: Ttrans_acc;

implementation

{$R *.dfm}

procedure Ttrans_acc.Button3Click(Sender: TObject);
var
  value1,value2 : string;
begin
//SWDataModule.Tranzit.insert;

InputQuery('Tranzit Hesablar', 'Əsas hesab', value1)  ;
InputQuery('Tranzit Hesablar', 'Tranzit hesab', value2)  ;

DataMod.ins.CallProcedure('xs_trans',[value1,value2]);

ShowMessage('Tranzit hesab əlavə olundu');
 DataMod.xs_tranzit.Refresh;
end;

procedure Ttrans_acc.Button4Click(Sender: TObject);
begin
 if MessageDlg('Tranzit hesabi siyahıdan silim?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then DataMod.xs_tranzit.Delete;
end;

procedure Ttrans_acc.FormShow(Sender: TObject);
begin
 DataMod.xs_tranzit.Open;
end;

end.

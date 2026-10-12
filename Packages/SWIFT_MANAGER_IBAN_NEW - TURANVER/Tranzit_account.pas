unit Tranzit_account;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unit2, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TTranzit_Acc = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Tranzit_Acc: TTranzit_Acc;

implementation

{$R *.dfm}

procedure TTranzit_Acc.Button1Click(Sender: TObject);
var
  value1,value2 : string;
begin
//SWDataModule.Tranzit.insert;

InputQuery('Tranzit Hesablar', 'Əsas hesab', value1)  ;
InputQuery('Tranzit Hesablar', 'Tranzit hesab', value2)  ;

SWDataModule.sw_in_insert.CallProcedure('sw_tranzit_insert',[value1,value2]);

ShowMessage('Tranzit hesab əlavə olundu');
 SWDataModule.Tranzit.Refresh;
end;

procedure TTranzit_Acc.Button2Click(Sender: TObject);
begin
          if MessageDlg('Tranzit hesabi siyahıdan silim?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then SWDataModule.Tranzit.Delete;
end;

procedure TTranzit_Acc.Button3Click(Sender: TObject);
begin
//SWDataModule.Tranzit.post;
end;

procedure TTranzit_Acc.FormActivate(Sender: TObject);
begin
SWDataModule.Tranzit.Open;
end;

end.

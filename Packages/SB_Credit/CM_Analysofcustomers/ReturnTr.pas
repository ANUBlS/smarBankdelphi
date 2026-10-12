unit ReturnTr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, CustAnalysDataModuleImpl, Menus;

type
  TFormReturns = class(TForm)
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    mliyyatlvet1: TMenuItem;
    procedure mliyyatlvet1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormReturns: TFormReturns;

implementation

{$R *.dfm}

procedure TFormReturns.FormShow(Sender: TObject);
begin
CustAnalysDataModule.Returntrans.Active:=true;

end;

procedure TFormReturns.mliyyatlvet1Click(Sender: TObject);
var trid  :Integer;
begin
    CustAnalysDataModule.OraclePackage2.CallProcedure('transaction_delete',[DBGrid1.DataSource.DataSet.FieldByName('transid').AsInteger]);
  ShowMessage('Əməliyyat ləğv edildi !!');
  DBGrid1.DataSource.DataSet.Refresh;
end;

end.

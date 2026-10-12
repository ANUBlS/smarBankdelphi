unit Transctionslist;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, BalanceAnalys_TLB, StdVcl, ExtCtrls, ComCtrls, Buttons,
  Grids, DBGrids, StdCtrls, CheckLst, DBCtrls, Menus, ActnList, ImgList,
  ExcelExporter, Db, OracleData, Mask;

type
  TTransactionLists = class(TForm)
    gridtransactions: TDBGrid;
    ExcelExporter: TExcelExporter;
    PopupMenu1: TPopupMenu;
    ExcelExport1: TMenuItem;
    procedure ExcelExport1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TransactionLists: TTransactionLists;

implementation

uses DataModuleBalance;

{$R *.dfm}

procedure TTransactionLists.ExcelExport1Click(Sender: TObject);
var
   FAfterScroll: TDataSetNotifyEvent;
begin
 with ExcelExporter do
  begin
   ExportSource :=gridtransactions.DataSource;
   FAfterScroll :=ExportSource.DataSet.AfterScroll;
   ExportSource.DataSet.AfterScroll :=Nil;
   ExportSource.DataSet.Last;
   try
    Report;
   finally
    ExportSource.DataSet.AfterScroll :=FAfterScroll;
   end;
  end;

end;

end.

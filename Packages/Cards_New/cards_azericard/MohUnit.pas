unit MohUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, ComCtrls, ToolWin, ExtCtrls, Db, OracleData,
  CMExcelExport, ImgList, Oracle, NLSLocalizer;

type
  TKorrMoh = class(TForm)
    ImageList1: TImageList;
    CMExcelExport1: TCMExcelExport;
    DataSource1: TDataSource;
    OracleDataSet1: TOracleDataSet;
    Panel3: TPanel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton20: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton17: TToolButton;
    ToolButton3: TToolButton;
    ToolButton6: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    ToolButton7: TToolButton;
    OraclePackage1: TOraclePackage;
    NLSLocalizer1: TNLSLocalizer;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KorrMoh: TKorrMoh;

implementation

{$R *.DFM}

procedure TKorrMoh.ToolButton1Click(Sender: TObject);
begin
OracleDataSet1.Open;
end;

procedure TKorrMoh.ToolButton14Click(Sender: TObject);
begin
OracleDataSet1.close;
end;

procedure TKorrMoh.ToolButton6Click(Sender: TObject);
begin
  if not CMExcelExport1.Connected then CMExcelExport1.Connect;
  CMExcelExport1.ExportDataset(dbgrid1.datasource.dataset,'Korr',true,true);
  CMExcelExport1.Disconnect;
end;

procedure TKorrMoh.ToolButton7Click(Sender: TObject);
var
i:integer;
begin
OracleDataSet1.Close;
OracleDataSet1.Open;
OracleDataSet1.First;
  ToolButton7.Enabled:=False;
for i:=1 to OracleDataSet1.RecordCount do
begin
OraclePackage1.CallProcedure('mohset',[OracleDataSet1.fieldbyname('HESAB').asstring,
                                       OracleDataSet1.fieldbyname('VERILECEK_MEBLEQ').asFLOAT]);
                                       OracleDataSet1.Next;

                                       ToolButton7.Enabled:=TRUE;

                                       end;
                                       ShowMessage('Mohkemlendirme verildi!');
                                       OracleDataSet1.refresh;

end;

end.

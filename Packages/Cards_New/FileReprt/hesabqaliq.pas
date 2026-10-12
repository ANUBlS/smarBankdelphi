unit hesabqaliq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, ComCtrls, ToolWin, ExtCtrls, Db, OracleData,
  CMExcelExport, ImgList;

type
  Thesab = class(TForm)
    ImageList1: TImageList;
    CMExcelExport1: TCMExcelExport;
    OracleDataSet1: TOracleDataSet;
    DataSource1: TDataSource;
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
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  hesab: Thesab;

implementation

{$R *.DFM}
       Uses SBTranslateProc,sboapiDataModuleImpl;
procedure Thesab.ToolButton1Click(Sender: TObject);
begin
OracleDataSet1.close;
OracleDataSet1.Open;
end;

procedure Thesab.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure Thesab.ToolButton14Click(Sender: TObject);
begin
OracleDataSet1.close;
end;

procedure Thesab.ToolButton6Click(Sender: TObject);
begin

OracleDataSet1.open;
   with CMExcelExport1 do
   begin
      Connect;
      ExportDataset( OracleDataSet1,'FileReport',True);
      Disconnect;
   end;
   {
 if not CMExcelExport1.Connected then CMExcelExport1.Connect;
  CMExcelExport1.ExportDataset(dbgrid1.datasource.dataset,'FileReport',true,true);
  CMExcelExport1.Disconnect;
}end;

end.

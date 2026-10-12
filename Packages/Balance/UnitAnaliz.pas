unit UnitAnaliz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Buttons, Mask, ExtCtrls, Grids, DBGrids, Menus, Db,
  OracleData, ExcelExporter;

type
  TFrmAnaliz = class(TForm)
    GroupBox2: TGroupBox;
    DBGridBalance: TDBGrid;
    Panel2: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    DBNavigator: TDBNavigator;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    Panel3: TPanel;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBGrid2: TDBGrid;
    DBGrid1: TDBGrid;
    DataSrcAcc: TDataSource;
    ODSAcc: TOracleDataSet;
    DataSrcTurnOver: TDataSource;
    ODSTurnOver: TOracleDataSet;
    ODSSum: TOracleDataSet;
    DataSrcSum: TDataSource;
    DataSrcBalance: TDataSource;
    ODSBalance: TOracleDataSet;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    ODSBalanceFDATE: TWideStringField;
    ODSBalanceFIRSTACTIVE: TFloatField;
    ODSBalanceFIRSTPASSIVE: TFloatField;
    ODSBalanceLDATE: TWideStringField;
    ODSBalanceLASTACTIVE: TFloatField;
    ODSBalanceLASTPASSIVE: TFloatField;
    ODSBalanceDTURNOVER: TFloatField;
    ODSBalanceKTURNOVER: TFloatField;
    ODSBalanceBAL_CN: TFloatField;
    ODSBalanceBALNAME: TWideStringField;
    ODSSumSUMFA: TFloatField;
    ODSSumSUMFP: TFloatField;
    ODSSumSUMLA: TFloatField;
    ODSSumSUMLP: TFloatField;
    ODSSumSUMD: TFloatField;
    ODSSumSUMK: TFloatField;
    ODSAccSUMCURRDATEFACTIVE: TFloatField;
    ODSAccSUMCURRDATEFPASSIVE: TFloatField;
    ODSAccSUMDTURN: TFloatField;
    ODSAccSUMKTURN: TFloatField;
    ODSAccSUMCURRDATELACTIVE: TFloatField;
    ODSAccSUMCURRDATELPASSIVE: TFloatField;
    ODSAccACCOUNTANT: TWideStringField;
    Panel1: TPanel;
    DBEdit1: TDBEdit;
    ODSTurnOverDEBITOR: TWideStringField;
    ODSTurnOverKREDITOR: TWideStringField;
    ODSTurnOverDCURRENCY: TFloatField;
    ODSTurnOverCCURRENCY: TIntegerField;
    ODSTurnOverAMMOUNT: TFloatField;
    ODSTurnOverLAMMOUNT: TFloatField;
    ODSTurnOverDAT: TDateTimeField;
    ODSTurnOverNAME: TWideStringField;
    ODSAccNAME: TWideStringField;
    BalanceExporter: TExcelExporter;
    ExportPopupMenu: TPopupMenu;
    miExporttoExcel: TMenuItem;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ODSBalanceAfterScroll(DataSet: TDataSet);
    procedure ODSAccAfterScroll(DataSet: TDataSet);
    procedure miExporttoExcelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAnaliz: TFrmAnaliz;

implementation

uses BalanceImplUnit, sboapiDataModuleImpl, SBTranslateProc;

{$R *.DFM}

var
  DoScroll: Boolean;

procedure TFrmAnaliz.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    BitBtn1.Click
end;

procedure TFrmAnaliz.ODSBalanceAfterScroll(DataSet: TDataSet);
Var
  GetAccountList: WideString;
begin

  GetAccountList := FrmBalance.sb_GetAccountList
    (Trunc(FrmBalance.DTPBegin.DateTime), Trunc(FrmBalance.DTPBegin.DateTime),
    FrmBalance.ComboBoxPlan.ItemIndex + 1,
    FrmBalance.Rate[FrmBalance.CmbBoxRate.ItemIndex],
    FrmBalance.CmbBoxFormat.ItemIndex, ODSBalance.FieldByName('BAL_CN').Value);
  if DoScroll then
  begin
    FrmBalance.sb_OpenDataSet(ODSAcc, 'AStrParam', GetAccountList);
    if ODSAcc.FieldByName('Accountant').IsNull then
      ODSTurnOver.Close;
  end;
end;

procedure TFrmAnaliz.ODSAccAfterScroll(DataSet: TDataSet);
begin
  if DoScroll then
    FrmBalance.sb_OpenDataSet(ODSTurnOver, 'AStrParam',
      FrmBalance.sb_GetAccTurn(Trunc(FrmBalance.DTPBegin.DateTime),
      Trunc(FrmBalance.DTPEnd.DateTime), ODSAcc.FieldByName('Accountant')
      .AsString));

end;

procedure TFrmAnaliz.miExporttoExcelClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  DoScroll := False;
  try
    BalanceExporter.Report;
  finally
    Screen.Cursor := crDefault;
    DoScroll := True;
  end;
end;

procedure TFrmAnaliz.FormShow(Sender: TObject);
begin
  DoScroll := True;
end;

procedure TFrmAnaliz.FormCreate(Sender: TObject);
begin
  DoScroll := True;
  SBTranslateProc.TranslateAllCompForms(Self, sboapiDataModule.OrPack_SL);
end;

end.

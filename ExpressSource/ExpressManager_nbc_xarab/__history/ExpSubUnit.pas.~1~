unit ExpSubUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBViewComboBox, SearchEdit, Grids, DBGrids, Buttons, ExtCtrls,
  NLSLocalizer, DB, OracleData
 ;

type
  TExpSubForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    DBViewComboBox1: TDBViewComboBox;
    DBViewComboBox2: TDBViewComboBox;
    Label2: TLabel;
    Label3: TLabel;
    SearchEdit1: TSearchEdit;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    SearchEdit2: TSearchEdit;
    SpeedButton2: TSpeedButton;
    Label5: TLabel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    DBGrid2: TDBGrid;
    ExpCashboxAccDataSet: TOracleDataSet;
    ExpCashboxAccDataSetID: TFloatField;
    ExpCashboxAccDataSetACC_ID: TFloatField;
    ExpCashboxAccDataSetVALUTE: TIntegerField;
    ExpCashboxAccDataSetBRANCHID: TFloatField;
    ExpCashboxAccDataSetVAL_NAME: TWideStringField;
    ExpCashboxAccDataSetACC_NO: TWideStringField;
    ExpCashboxAccDataSetNAME: TWideStringField;
    ExpCashboxAccDataSource: TDataSource;
    ExpTransitAccDataSet: TOracleDataSet;
    ExpTransitAccDataSource: TDataSource;
    AccountDataSet: TOracleDataSet;
    AccountDataSource: TDataSource;
    FilialDataSet: TOracleDataSet;
    FilialDataSource: TDataSource;
    ValyutaDataSet: TOracleDataSet;
    ValyutaDataSource: TDataSource;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ExpSubForm: TExpSubForm;

implementation
uses ExpDataModuleUnit;

{$R *.DFM}

procedure TExpSubForm.SpeedButton1Click(Sender: TObject);
begin
  if SearchEdit1.Text = '' then exit;
  ExpDataModule.Repair.CallProcedure('Exp_cashboxaccount_add',[ValyutaDataSet.fieldbyname('VALUTE').asinteger,
                                                               AccountDataSet.fieldbyname('id').asinteger,
                                                                FilialDataSet.fieldbyname('id').asinteger]);
  SearchEdit1.clear;
  ExpCashboxAccDataSet.Refresh;
end;

procedure TExpSubForm.SpeedButton2Click(Sender: TObject);
begin
  if SearchEdit2.Text = '' then exit;
  ExpDataModule.Repair.CallProcedure('Exp_transitaccount_add',   [ValyutaDataSet.fieldbyname('VALUTE').asinteger,
                                                                  AccountDataSet.fieldbyname('id').asinteger,
                                                                  FilialDataSet.fieldbyname('id').asinteger]);
  SearchEdit2.clear;
  ExpTransitAccDataSet.Refresh;
end;

procedure TExpSubForm.DBGrid1DblClick(Sender: TObject);
begin
  ExpDataModule.Repair.CallProcedure('Exp_cashboxaccount_del',[ExpCashboxAccDataSet.FieldByName('id').AsInteger]);
  ExpCashboxAccDataSet.Refresh;
end;



procedure TExpSubForm.DBGrid2DblClick(Sender: TObject);
begin
  ExpDataModule.Repair.CallProcedure('Exp_transitaccount_del',[ExpTransitAccDataSet.FieldByName('id').AsInteger]);
  ExpTransitAccDataSet.Refresh;
end;

procedure TExpSubForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ExpCashboxAccDataSet.Close;
  ExpTransitAccDataSet.Close;
  FilialDataSet.Close;
  ValyutaDataSet.Close;
  AccountDataSet.Close;
end;

procedure TExpSubForm.FormShow(Sender: TObject);
begin
  IF not (ExpCashboxAccDataSet.Active) then ExpCashboxAccDataSet.Open;
  IF not (ExpTransitAccDataSet.Active) then ExpTransitAccDataSet.Open;
  IF not (FilialDataSet.Active) then FilialDataSet.Open;
  IF not (ValyutaDataSet.Active)then ValyutaDataSet.Open;
  IF not (AccountDataSet.Active)then AccountDataSet.Open;
  SearchEdit1.Clear;
  SearchEdit2.Clear;
  DBViewComboBox1.ItemIndex:=0;
  DBViewComboBox2.ItemIndex:=0;
end;

end.

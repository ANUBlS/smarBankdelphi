unit account_admin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, StdCtrls, SearchEdit, DBViewComboBox, Grids, DBGrids,
  Buttons, ExtCtrls,sboapiDataModuleImpl;

type
  TAcccount = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SpeedButton3: TSpeedButton;
    DBGrid2: TDBGrid;
    ComFilial1: TDBViewComboBox;
    Combo_valute1: TComboBox;
    SearchXsAccount: TSearchEdit;
    Valute_ID1: TListBox;
    OracleDataSet1: TOracleDataSet;
    DataSource1: TDataSource;
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Acccount: TAcccount;

implementation
uses data_unit,Properties_Unit;
{$R *.DFM}

procedure TAcccount.SpeedButton3Click(Sender: TObject);
begin
  if SearchXsAccount.Text = '' then exit;
  PropertiesForm.PackConfig.CallProcedure('xs_accounts_fadd',[strtoint(valute_id1.items[combo_valute1.itemindex]),
                                               DataMod.DataAccount.fieldbyname('id').asinteger,
                                               PropertiesForm.DataFilial.fieldbyname('id').asinteger]);
  SearchXsAccount.clear;
  OracleDataSet1.Refresh;
end;

end.

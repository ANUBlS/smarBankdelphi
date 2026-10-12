unit ConfigUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBViewComboBox, Db, OracleData, SearchEdit,
  Grids, DBGrids, DBCtrls;

type
  TFormConfig = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    DS_AccountPrincipial: TDataSource;
    DS_AccountRevenue: TDataSource;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    AccountRevenue: TOracleDataSet;
    AccountPrincipial: TOracleDataSet;
    Panel4: TPanel;
    Principial: TSearchEdit;
    DBViewComboBox1: TDBViewComboBox;
    P_ComboDC: TComboBox;
    SpeedButton1: TSpeedButton;
    Panel5: TPanel;
    SpeedButton2: TSpeedButton;
    Revenue: TSearchEdit;
    DBViewComboBox3: TDBViewComboBox;
    R_ComboDC: TComboBox;
    R_ComboBranch: TDBViewComboBox;
    DBGrid2: TDBGrid;
    CheckBox1: TCheckBox;
    P_ComboBranch: TDBViewComboBox;
    GroupBox3: TGroupBox;
    CheckBox2: TCheckBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConfig: TFormConfig;

implementation
uses DataModuleUnit;
{$R *.DFM}

procedure TFormConfig.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormConfig.SpeedButton1Click(Sender: TObject);
begin
  if (P_ComboDC.ItemIndex = -1)or
     (DBViewComboBox1.ItemIndex = -1)or
     (Principial.Text ='') then Exit;

  with DataModWU do
  begin
     TempPack.CallProcedure('wu_accounts_add', [DataAccount.FieldByName('id').AsInteger,
                                                DataValute.FieldByName('Valute').AsInteger,
                                                Copy(P_ComboDC.Items[P_ComboDC.ItemIndex],0,1),
                                                0,
                                                DataBranch.FieldByName('branchID').AsInteger]);
  end;

  Principial.Clear;
  Revenue.Clear;
  P_ComboDC.ItemIndex := 0;
  R_ComboDC.ItemIndex := 0;
  P_ComboBranch.ItemIndex :=-1;
  R_ComboBranch.ItemIndex :=-1;
  DBViewComboBox1.ItemIndex :=-1;
  DBViewComboBox3.ItemIndex :=-1;
  AccountPrincipial.Refresh;
end;

procedure TFormConfig.SpeedButton2Click(Sender: TObject);
begin
  if (R_ComboDC.ItemIndex = -1)or
     (DBViewComboBox3.ItemIndex = -1)or
     (Revenue.Text ='') then Exit;

  with DataModWU do
  begin
     TempPack.CallProcedure('wu_accounts_add', [DataAccount.FieldByName('id').AsInteger,
                                                DataValute.FieldByName('Valute').AsInteger,
                                                Copy(R_ComboDC.Items[R_ComboDC.ItemIndex],0,1),
                                                1,
                                                DataBranch.FieldByName('BRANCHID').AsInteger]);
  end;
  Revenue.Clear;
  P_ComboDC.ItemIndex := 0;
  R_ComboDC.ItemIndex := 0;
  P_ComboBranch.ItemIndex :=-1;
  R_ComboBranch.ItemIndex :=-1;
  DBViewComboBox1.ItemIndex :=-1;
  DBViewComboBox3.ItemIndex :=-1;
  AccountRevenue.Refresh;
end;

procedure TFormConfig.CheckBox1Click(Sender: TObject);
begin
   with DataModWU do
   begin
    TempPack.CallProcedure('PrincipialTrans', [Ord(TCheckBox(Sender).Checked)]);
    DataConfig.Refresh;
   end;
end;

end.

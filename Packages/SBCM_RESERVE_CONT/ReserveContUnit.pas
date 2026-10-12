unit ReserveContUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, Db, OracleData, DBTables,
  DBViewComboBox, CurrencyEdit;

type
  TFrmReserveCont = class(TForm)
    CBUpdEReserve: TCheckBox;
    CBUpdateReliability: TCheckBox;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    StaticText2: TStaticText;
    DBEdit3: TDBEdit;
    GroupBox4: TGroupBox;
    StaticText4: TStaticText;
    DBEdit1: TDBEdit;
    GroupBox7: TGroupBox;
    StaticText7: TStaticText;
    DBEdit7: TDBEdit;
    BtnApplyExpire: TButton;
    BtnCancel: TButton;
    cbUseTransactions: TCheckBox;
    Panel3: TPanel;
    GroupBox5: TGroupBox;
    StaticText5: TStaticText;
    DBEdit5: TDBEdit;
    GroupBox8: TGroupBox;
    StaticText8: TStaticText;
    ExpiredDebtEdit: TCurrencyEdit;
    GroupBox10: TGroupBox;
    StaticText10: TStaticText;
    DBEdit6: TDBEdit;
    Panel4: TPanel;
    GroupBox12: TGroupBox;
    StaticText11: TStaticText;
    DBEdit8: TDBEdit;
    DBEdit11: TDBEdit;
    GroupBox14: TGroupBox;
    StaticText13: TStaticText;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    GroupBox6: TGroupBox;
    StaticText6: TStaticText;
    CBReliabilityPercent: TDBViewComboBox;
    CBOverdueReliabilityPercent: TDBViewComboBox;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    StaticText1: TStaticText;
    DBEdit2: TDBEdit;
    GroupBox3: TGroupBox;
    StaticText3: TStaticText;
    FacticalDebtEdit: TCurrencyEdit;
    GroupBox9: TGroupBox;
    StaticText9: TStaticText;
    DBEdit4: TDBEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReserveCont: TFrmReserveCont;

implementation

{$R *.DFM}

uses
  sboapiDataModuleImpl, ReserveDataModUnit;

procedure TFrmReserveCont.FormCreate(Sender: TObject);
begin
  DataModReserve := TDataModReserve.Create(Self);
end;

end.

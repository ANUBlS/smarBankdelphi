unit SettingsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, Grids, DBGrids, StdCtrls;

type
  TSettingFrm = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    procedure DBLookupComboBox2CloseUp(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SettingFrm: TSettingFrm;

implementation

uses Datamodunit;

{$R *.dfm}

procedure TSettingFrm.Button1Click(Sender: TObject);
begin
DataMod.configs.Open;
DataMod.configs.insert;
DataMod.configs.FieldByName('account_a').AsInteger:=DBLookupComboBox3.KeyValue;
DataMod.configs.FieldByName('branch').AsInteger:=DBLookupComboBox1.KeyValue;
DataMod.configs.FieldByName('valute').AsInteger:=DBLookupComboBox2.KeyValue;
DataMod.configs.post;

 DataMod.configs.close;

 DataMod.configs.open;


end;

procedure TSettingFrm.DBLookupComboBox2CloseUp(Sender: TObject);
begin
DataMod.tranzit_acc.CloseAll;
DataMod.tranzit_acc.SetVariable('vfil',DBLookupComboBox1.KeyValue);
DataMod.tranzit_acc.SetVariable('vval',DBLookupComboBox2.KeyValue);
DataMod.tranzit_acc.Open;
end;

procedure TSettingFrm.FormCreate(Sender: TObject);
begin
if not DataMod.configs.Active      then
DataMod.configs.Open   ;
end;

end.

unit ExpAccTypeUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, ExtCtrls, DB, OracleData, Mask, DBCtrlsEh,
  DBLookupEh, DBGridEh;

type
  TExpAccType = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ExpAccType: TExpAccType;

implementation

uses ExpDataModuleUnit, ExpAllParametrUnit;

{$R *.dfm}

procedure TExpAccType.Button1Click(Sender: TObject);
begin
  with ExpAllParametr do
  begin
    ExpTypeAccountsDataSet.FieldByName('branchid').AsInteger :=
      DBLookupComboBox1.KeyValue;
    ExpTypeAccountsDataSet.FieldByName('valute').AsInteger :=
      DBLookupComboBox2.KeyValue;
    ExpTypeAccountsDataSet.FieldByName('debet').AsInteger :=
      DBLookupComboboxEh1.KeyValue;
    ExpTypeAccountsDataSet.FieldByName('kredet').AsInteger :=
      DBLookupComboboxEh2.KeyValue;
    ExpTypeAccountsDataSet.FieldByName('OPTYPE').AsInteger :=
      ExpSettingsTypeDataSet.FieldByName('id').AsInteger;
    ExpTypeAccountsDataSet.Post;
  end;
  ExpAccType.Close;
end;

procedure TExpAccType.Button2Click(Sender: TObject);
begin
  with ExpAllParametr, ExpTypeAccountsDataSet do
  begin
    Cancel;

  end;
  ExpAccType.Close;

end;

procedure TExpAccType.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ExpAccType.Close;
end;

procedure TExpAccType.FormShow(Sender: TObject);
begin
  IF not(ExpAllParametr.F) THEN
  BEGIN
    DBLookupComboBox1.KeyValue := 0;
    DBLookupComboBox2.KeyValue := -1;
    DBLookupComboboxEh1.KeyValue := 0;
    DBLookupComboboxEh2.KeyValue := 0;
  END
  ELSE
  BEGIN
    DBLookupComboBox1.KeyValue := ExpAllParametr.DBGrid3.DataSource.DataSet.
      FieldByName('branchid').AsInteger;
    DBLookupComboBox2.KeyValue := ExpAllParametr.DBGrid3.DataSource.DataSet.
      FieldByName('valute').AsInteger;
    DBLookupComboboxEh1.KeyValue := ExpAllParametr.DBGrid3.DataSource.DataSet.
      FieldByName('debet').AsInteger;
    DBLookupComboboxEh2.KeyValue := ExpAllParametr.DBGrid3.DataSource.DataSet.
      FieldByName('kredet').AsInteger;
  END;
end;

end.

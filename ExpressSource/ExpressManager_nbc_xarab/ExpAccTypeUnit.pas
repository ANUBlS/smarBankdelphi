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
    Panel2: TPanel;
    Label5: TLabel;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    Label6: TLabel;
    DBLookupComboboxEh4: TDBLookupComboboxEh;
    Panel3: TPanel;
    Button2: TButton;
    Button1: TButton;
    Panel4: TPanel;
    Label3: TLabel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    Label4: TLabel;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    Panel5: TPanel;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
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
uses ExpDataModuleUnit,ExpAllParametrUnit;

{$R *.dfm}

procedure TExpAccType.Button1Click(Sender: TObject);
begin
  with ExpAllParametr do
  begin
    ExpTypeAccountsDataSet.FieldByName('branchid').AsInteger :=DBLookupComboBox1.KeyValue;
    ExpTypeAccountsDataSet.FieldByName('valute').AsInteger   :=DBLookupComboBox2.KeyValue;
    ExpTypeAccountsDataSet.FieldByName('debet').AsInteger    :=DBLookupComboboxEh1.KeyValue;
    ExpTypeAccountsDataSet.FieldByName('kredet').AsInteger   :=DBLookupComboboxEh2.KeyValue;
    IF ExpSettingsDataSetNAME.AsWideString='Möhkəmləndirmə' THEN
    begin
      ExpTypeAccountsDataSet.FieldByName('bdebet').AsInteger:=DBLookupComboboxEh3.KeyValue;
      ExpTypeAccountsDataSet.FieldByName('bkredet').AsInteger:=DBLookupComboboxEh4.KeyValue;
    end
    else
    begin
      ExpTypeAccountsDataSet.FieldByName('bdebet').AsInteger:=0;
      ExpTypeAccountsDataSet.FieldByName('bkredet').AsInteger:=0;
    end;

    ExpTypeAccountsDataSet.FieldByName('OPTYPE').AsInteger   :=ExpSettingsTypeDataSet.FieldByName('id').AsInteger;
    ExpTypeAccountsDataSet.Post;
  end;
  ExpAccType.Close;
end;

procedure TExpAccType.Button2Click(Sender: TObject);
begin
   with ExpAllParametr,ExpTypeAccountsDataSet do
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
  IF not(ExpAllParametr.F)
  THEN
    BEGIN
      DBLookupComboBox1.KeyValue:=0;
      DBLookupComboBox2.KeyValue:=-1;
      DBLookupComboboxEh1.KeyValue:=0;
      DBLookupComboboxEh2.KeyValue:=0;
      DBLookupComboboxEh3.KeyValue:=0;
      DBLookupComboboxEh4.KeyValue:=0;
    END
  ELSE
    BEGIN
      DBLookupComboBox1.KeyValue:=ExpAllParametr.DBGrid3.DataSource.DataSet.FieldByName('branchid').AsInteger;
      DBLookupComboBox2.KeyValue:=ExpAllParametr.DBGrid3.DataSource.DataSet.FieldByName('valute').AsInteger;
      DBLookupComboboxEh1.KeyValue:=ExpAllParametr.DBGrid3.DataSource.DataSet.FieldByName('debet').AsInteger;
      DBLookupComboboxEh2.KeyValue:=ExpAllParametr.DBGrid3.DataSource.DataSet.FieldByName('kredet').AsInteger;
      IF ExpAllParametr.ExpSettingsDataSetNAME.AsWideString='Möhkəmləndirmə' THEN
      begin
        DBLookupComboboxEh3.KeyValue:=ExpAllParametr.DBGrid3.DataSource.DataSet.FieldByName('bdebet').AsInteger;
        DBLookupComboboxEh4.KeyValue:=ExpAllParametr.DBGrid3.DataSource.DataSet.FieldByName('bkredet').AsInteger;
      end
      else
      begin
        DBLookupComboboxEh3.KeyValue:=0;
        DBLookupComboboxEh4.KeyValue:=0
      end;

    END;
end;

end.

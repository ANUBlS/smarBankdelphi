unit ExpComingAccUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, DBCtrls, ExtCtrls, DB, OracleData;

type
  TFormComingAcc = class(TForm)
    Panel1: TPanel;
    FlowPanel1: TFlowPanel;
    DBLFilial: TDBLookupComboBox;
    FlowPanel2: TFlowPanel;
    DBLValyuta: TDBLookupComboBox;
    FlowPanel3: TFlowPanel;
    DBLKredit: TDBLookupComboBox;
    FlowPanel4: TFlowPanel;
    DBLDebit: TDBLookupComboBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ValDataSet: TOracleDataSet;
    FilialDataSet: TOracleDataSet;
    FilialDataSource: TDataSource;
    DSVal: TDataSource;
    ODSDebit: TOracleDataSet;
    DSDebit: TDataSource;
    ODSKredit: TOracleDataSet;
    DSKredit: TDataSource;
    FlowPanel5: TFlowPanel;
    DBLType: TDBLookupComboBox;
    DSSettingsType: TDataSource;
    ODSSettingsType: TOracleDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Tip:integer;
  end;

var
  FormComingAcc: TFormComingAcc;

implementation

uses ExpComingAccountUnit;

{$R *.dfm}

procedure TFormComingAcc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FilialDataSet.Close;
  ValDataSet.Close;
  ODSDebit.Close;
  ODSKredit.Close;
  ODSSettingsType.Close;
  //Close;
end;

procedure TFormComingAcc.FormShow(Sender: TObject);
begin
  FilialDataSet.Open;
  ValDataSet.Open;
  ODSDebit.Open;
  ODSKredit.Open;
  ODSSettingsType.Open;
  IF Tip=0 THEN
  BEGIN
    DBLFilial.KeyValue := -1;
    DBLValyuta.KeyValue := -1;
    DBLDebit.KeyValue := 0;
    DBLKredit.KeyValue := 0;
    DBLType.KeyValue :=0;
  END
  ELSE
  BEGIN
    DBLFilial.KeyValue := ExpComingAccountForm.DBGrid1.DataSource.DataSet.FieldByName('branchid').AsInteger;
    DBLValyuta.KeyValue := ExpComingAccountForm.DBGrid1.DataSource.DataSet.FieldByName('valute').AsInteger;
    DBLDebit.KeyValue := ExpComingAccountForm.DBGrid1.DataSource.DataSet.FieldByName('debet').AsInteger;
    DBLKredit.KeyValue := ExpComingAccountForm.DBGrid1.DataSource.DataSet.FieldByName('kredet').AsInteger;
    DBLType.KeyValue := ExpComingAccountForm.DBGrid1.DataSource.DataSet.FieldByName('type').AsInteger;
  END;
end;

procedure TFormComingAcc.SpeedButton1Click(Sender: TObject);
begin
  with ExpComingAccountForm do
  begin
    ExpComingAccDataSet.Insert;
    ExpComingAccDataSet.FieldByName('branchid').AsInteger:=DBLFilial.KeyValue;
    ExpComingAccDataSet.FieldByName('valute').AsInteger:=DBLValyuta.KeyValue;
    ExpComingAccDataSet.FieldByName('debet').AsInteger:=DBLDebit.KeyValue;
    ExpComingAccDataSet.FieldByName('kredet').AsInteger:=DBLKredit.KeyValue;
    ExpComingAccDataSet.FieldByName('type').AsInteger:=DBLType.KeyValue;
    ExpComingAccDataSet.Post;
  end;
end;

procedure TFormComingAcc.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

end.

unit UnitReportCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, DB, OracleData;

type
  TFormReportCode = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Əməliyyatın_növü: TPanel;
    Label9: TLabel;
    DBLC_MMX_Transmode: TDBLookupComboBox;
    EditTransModeCode: TEdit;
    Panel5: TPanel;
    Label14: TLabel;
    DBLC_MMX_reportcode: TDBLookupComboBox;
    Editreportcode: TEdit;
    OracleDataSet2: TOracleDataSet;
    OracleDataSet1: TOracleDataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    OracleDataSet1ID: TIntegerField;
    OracleDataSet1NAME: TIntegerField;
    OracleDataSet1DESCRIPTION: TWideStringField;
    OracleDataSet2ID: TIntegerField;
    OracleDataSet2NAME: TWideStringField;
    OracleDataSet2DESCRIPTION: TWideStringField;
    procedure EditTransModeCodeKeyPress(Sender: TObject; var Key: Char);
    procedure DBLC_MMX_TransmodeCloseUp(Sender: TObject);
    procedure DBLC_MMX_reportcodeCloseUp(Sender: TObject);
    procedure EditreportcodeExit(Sender: TObject);
    procedure EditreportcodeKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormReportCode: TFormReportCode;

implementation

uses UnitGoaml, TransactionDataModuleUnit, TransactionPropertiesImpl;

{$R *.dfm}

procedure TFormReportCode.Button1Click(Sender: TObject);
begin
with TransactionDataModule do
begin

  OP_MMX.CallProcedure('up_mmx_transinfo',[ FormGo.OracleDataSet1ID.AsInteger
                                           ,DBLC_MMX_reportcode.KeyValue
                                           ,DBLC_MMX_Transmode.Keyvalue
                                           ]);


end;
FormGo.OracleDataSet1.Refresh;
FormReportCode.Close;
end;

procedure TFormReportCode.DBLC_MMX_reportcodeCloseUp(Sender: TObject);
begin
if DBLC_MMX_reportcode.KeyVAlue<>null then
Editreportcode.Text:=DBLC_MMX_reportcode.KeyVAlue;

end;

procedure TFormReportCode.DBLC_MMX_TransmodeCloseUp(Sender: TObject);
begin
if DBLC_MMX_Transmode.KeyVAlue<>null then
EditTransModeCode.Text:=DBLC_MMX_Transmode.KeyVAlue;

end;

procedure TFormReportCode.EditreportcodeExit(Sender: TObject);
begin
if Editreportcode.Text<>'' then

 DBLC_MMX_reportcode.KeyValue:=Editreportcode.Text;

end;

procedure TFormReportCode.EditreportcodeKeyPress(Sender: TObject;
  var Key: Char);
begin

if key=#13 then

 DBLC_MMX_reportcode.KeyValue:=Editreportcode.Text;

end;

procedure TFormReportCode.EditTransModeCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
begin
if trim(EditTransModeCode.Text)<>'' then
DBLC_MMX_Transmode.KeyValue:=EditTransModeCode.Text;

DBLC_MMX_Transmode.SetFocus;
end;
end;

procedure TFormReportCode.FormShow(Sender: TObject);
begin
    DBLC_MMX_Transmode.KeyValue:=FormGo.OracleDataSet1.fieldByName('TRANSMODE_CODE').AsInteger;
    EditTransModeCode.Text:=FormGo.OracleDataSet1.fieldByName('TRANSMODE_CODE').AsString;

    DBLC_MMX_reportcode.KeyValue:=FormGo.OracleDataSet1.FieldByName('report_code').Asstring;
    Editreportcode.Text:=FormGo.OracleDataSet1.FieldByName('report_code').AsString;
end;

end.

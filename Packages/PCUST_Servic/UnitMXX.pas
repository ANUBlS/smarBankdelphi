unit UnitMXX;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XFSCtrls, DBCtrls, ExtCtrls, DB, OracleData;

type
  TFormMMX = class(TForm)
    XFPanel1: TXFPanel;
    XFPanel2: TXFPanel;
    XFLabel1: TXFLabel;
    XFLabel2: TXFLabel;
    XFLabel3: TXFLabel;
    XFLabel4: TXFLabel;
    DBLC_MMX_Transmode: TDBLookupComboBox;
    DBLC_MMX_reportcode: TDBLookupComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    XFButton1: TXFButton;
    XFButton2: TXFButton;
    EditTransModeCode: TEdit;
    Editreportcode: TEdit;
    Edit3: TEdit;
    XFLabel5: TXFLabel;
    ods_mmx: TOracleDataSet;
    ods_mmxREPORT_CODE: TWideStringField;
    ods_mmxTRANSMODE_CODE: TIntegerField;
    ods_mmxTRANSID: TFloatField;
    ods_mmxDCUSTID: TFloatField;
    ods_mmxCCUSTID: TFloatField;
    procedure XFButton2Click(Sender: TObject);
    procedure XFButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditTransModeCodeEnter(Sender: TObject);
    procedure EditTransModeCodeKeyPress(Sender: TObject; var Key: Char);
    procedure DBLC_MMX_TransmodeCloseUp(Sender: TObject);
    procedure EditreportcodeExit(Sender: TObject);
    procedure EditreportcodeKeyPress(Sender: TObject; var Key: Char);
    procedure DBLC_MMX_reportcodeCloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMMX: TFormMMX;
  trid :integer;
implementation

uses DatUnit,sboapiDataModuleImpl;

{$R *.dfm}

procedure TFormMMX.DBLC_MMX_reportcodeCloseUp(Sender: TObject);
begin
if DBLC_MMX_reportcode.KeyVAlue<>null then
Editreportcode.Text:=DBLC_MMX_reportcode.KeyVAlue;
end;

procedure TFormMMX.DBLC_MMX_TransmodeCloseUp(Sender: TObject);
begin
if DBLC_MMX_Transmode.KeyVAlue<>null then
EditTransModeCode.Text:=DBLC_MMX_Transmode.KeyVAlue;
end;

procedure TFormMMX.EditreportcodeExit(Sender: TObject);
begin
DBLC_MMX_reportcode.KeyValue:=Editreportcode.Text;
end;

procedure TFormMMX.EditreportcodeKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
  DBLC_MMX_reportcode.KeyValue:=Editreportcode.Text;
end;

procedure TFormMMX.EditTransModeCodeEnter(Sender: TObject);
begin
DBLC_MMX_Transmode.KeyValue:=EditTransModeCode.Text;
end;

procedure TFormMMX.EditTransModeCodeKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
DBLC_MMX_Transmode.KeyValue:=EditTransModeCode.Text;
DBLC_MMX_Transmode.SetFocus;
end;
end;

procedure TFormMMX.FormCreate(Sender: TObject);
begin
with DM_goAml do
begin
ODS_MMX_TRANSMODE.open;
Ods_mmx_reportcode.Open;

end;
end;

procedure TFormMMX.FormShow(Sender: TObject);
begin
trid:=DM_goAml.ods_subtransID.AsInteger;
edit3.Text:=inttostr(trid);
ods_mmx.Close;
   ods_mmx.SetVariable('v_trid',trid);
ods_mmx.Open;

 DBLC_MMX_Transmode.KeyValue:=ods_mmx.FieldByName('TRANSMODE_CODE').AsInteger;
 EditTransModeCode.Text:=ods_mmx.FieldByName('TRANSMODE_CODE').AsString;

 DBLC_MMX_reportcode.KeyValue:=ods_mmx.FieldByName('report_code').Asstring;
 Editreportcode.Text:=ods_mmx.FieldByName('report_code').AsString;
 edit1.Text:=  ods_mmx.FieldByName('dcustid').AsString;
 edit2.Text:=  ods_mmx.FieldByName('ccustid').AsString;
end;

procedure TFormMMX.XFButton1Click(Sender: TObject);
begin
//showmessage(inttostr(trid));
DM_goAml.OP_MMX.CallProcedure('up_mmx_transinfo',[ trid
                                                 ,DBLC_MMX_reportcode.KeyValue
                                                 ,DBLC_MMX_Transmode.Keyvalue
                                                 ,Edit1.Text
                                                 ,Edit2.Text
                                                 ]);
           DM_goAml.ods_subtrans.Refresh;

           edit1.Clear;
           edit2.Clear;
           edit3.Clear;
           EditTransModeCode.Clear;
           Editreportcode.Clear;
           DBLC_MMX_Transmode.KeyValue:='';
           DBLC_MMX_reportcode.KeyValue:='';
           end;

procedure TFormMMX.XFButton2Click(Sender: TObject);
begin
FormMMX.Close
end;

end.

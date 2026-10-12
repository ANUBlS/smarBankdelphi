unit prognozImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, ComCtrls, StdCtrls, Mask, DBCtrlsEh, DBLookupEh, Buttons,
  CMExcelExport, NLSLocalizer, Gauges, ExtCtrls;

type
  TPrognoz = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    LCBFilials: TDBLookupComboboxEh;
    CBFilial: TCheckBox;
    GroupBox4: TGroupBox;
    CBAvalute: TCheckBox;
    LCBValutes: TDBLookupComboboxEh;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    valutes: TOracleDataSet;
    valutesVALUTE: TIntegerField;
    Filials: TOracleDataSet;
    FilialsID: TFloatField;
    FilialsDatSrc: TDataSource;
    valutesDatSrc: TDataSource;
    Sysdat: TOracleDataSet;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    prognoz: TOracleDataSet;
    SpeedButton2: TSpeedButton;
    ExcelExport: TCMExcelExport;
    Animate1: TAnimate;
    SpeedButton1: TSpeedButton;
    valutesVALU_NAME: TWideStringField;
    FilialsNAME: TWideStringField;
    prognozCONTRACTNO: TWideStringField;
    prognozVAL_NAME: TWideStringField;
    prognozFILNAME: TWideStringField;
    prognozOPENDATE: TDateTimeField;
    prognozCLOSEDATE: TDateTimeField;
    prognozINTRES: TWideStringField;
    prognozCUSTNAME: TWideStringField;
    prognozFACTICALDEBT: TFloatField;
    prognozINTERESTACCNO: TWideStringField;
    prognozPOK_OSTAT: TFloatField;
    prognozPROGNOZ: TFloatField;
    prognozSUMPROGNOZ: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);

  private
   function BuildFilterString : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Prognoz: TPrognoz;
 procedure exportproc(S:String);export;
implementation

uses sboapiDataModuleImpl,CommonDeclsImpl,SBTranslateProc;
{$R *.DFM}
 procedure exportproc(S:String);export;
begin
   Prognoz.ShowModal;
end;

exports
   exportproc;
procedure TPrognoz.FormCreate(Sender: TObject);
begin
valutes.Open;
Filials.open;
Sysdat.open;
DateTimePicker1.DateTime:=sysdat.fieldbyname('tek_dat').AsDateTime;
DateTimePicker2.DateTime:=sysdat.fieldbyname('tek_dat').AsDateTime;
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);

end;
function TPrognoz.BuildFilterString : String;
procedure ConcatFilter(var S: String; const Prefix : String; Checked : Boolean; KeyValue : Variant);
  const
     csFormat = '(%s=%s)';
  var
    Temp : String;
  begin

    if Checked then
    begin
      Temp := Format(csFormat,[Prefix,Keyvalue]);
      if S = '' then
        S := 'and'+Temp
      else
        S := S + 'and ' + Temp;
    end;
    
  end;

begin

  Result   := '';

  ConcatFilter(Result,'cont.CURRENCY',CBaValute.Checked,LCBValutes.KeyValue);
  ConcatFilter(Result,'cont.BRANCHID',CBFilial.Checked,LCBFilials.KeyValue);
  // ShowMessage(Result)

end;



procedure TPrognoz.FormDestroy(Sender: TObject);
begin
valutes.close;
Filials.close;
Sysdat.close;
prognoz.Closeall
end;

procedure TPrognoz.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if Ord(Key) = VK_ESCAPE then Close;
end;

procedure TPrognoz.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False
end;

procedure TPrognoz.SpeedButton1Click(Sender: TObject);
var
dat : Tdatetime;
begin
 dat:= integer(trunc(DateTimePicker2.DateTime));
  Animate1.Visible:=True;
  Animate1.Active:=True;
 with prognoz do
  begin
    if Active then CloseAll;
     SQL[14]:=BuildFilterString;
     SetVariable('dat',dat);
     open;
  end;

    with ExcelExport do
   begin
       Connect;
       ExportDataset(prognoz,'Report',true);
       Disconnect;
     end;
  // close;
   Animate1.Visible:=false;
  Animate1.Active :=false;
end;

procedure TPrognoz.SpeedButton2Click(Sender: TObject);
begin
close
end;



initialization

    Prognoz := TPrognoz.Create(CommonApplication)
end.

unit YReportsFormLmpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Mask, DBCtrlsEh, DBLookupEh, Db,
  OracleData, Oracle, CMExcelExport;

   resourcestring
  rsProgressCaption = '                 Hesabat alınır gözləyin.   .....   ';



type
    TYReportsForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    GroupBox3: TGroupBox;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    CheckBox2: TCheckBox;
    GroupBox13: TGroupBox;
    CheckBox4: TCheckBox;
    DBLookupComboboxEh9: TDBLookupComboboxEh;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    BDateP: TDateTimePicker;
    EDateP: TDateTimePicker;
    GroupBox12: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    GCredBegD: TDateTimePicker;
    GCredEndD: TDateTimePicker;
    GroupBox7: TGroupBox;
    CheckBox8: TCheckBox;
    DBLookupComboboxEh7: TDBLookupComboboxEh;
    GroupBox9: TGroupBox;
    CheckBox9: TCheckBox;
    DBLookupComboboxEh8: TDBLookupComboboxEh;
    rgKredStatus: TRadioGroup;
    Panel4: TPanel;
    GroupBox6: TGroupBox;
    CheckBox5: TCheckBox;
    DBLookupComboboxEh4: TDBLookupComboboxEh;
    GroupBox10: TGroupBox;
    CheckBox6: TCheckBox;
    DBLookupComboboxEh6: TDBLookupComboboxEh;
    GroupBox11: TGroupBox;
    CheckBox7: TCheckBox;
    cbFormsLook: TDBLookupComboboxEh;
    GroupBox16: TGroupBox;
    CheckBox3: TCheckBox;
    DBLookupComboboxEh12: TDBLookupComboboxEh;
    Panel5: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CR_AK_REPORTS: TOraclePackage;
    Kera: TCMExcelExport;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
     function BuildFilterString : String;
      procedure PrepareProgress(ProgCnt : Integer; opDesc : String);
  public
    { Public declarations }
      procedure InsertOneRow(PID : Integer; BDate : TDateTime; EDate : TDateTime; incstat : Integer);


  end;

var
  YReportsForm: TYReportsForm;

  procedure InitPlugin(s:string);export;
implementation
     uses crCommonDecls,YReportsDataModLmpl, AKProgressFormImpl ,sboapiDataModuleImpl,SBTranslateProc;
{$R *.DFM}

procedure TYReportsForm.PrepareProgress;
begin
  with AKProgressForm , ProgressBar do
  begin
    Position := 0;
    Max := ProgCnt;
    Step := 1;
    Caption := opDesc;
  end;
  AKProgressForm.Show;
end;


    procedure TYReportsForm.InsertOneRow;
resourcestring
  rsCreditNumber = '%d - № li zəmanət : ';
begin
  with CR_AK_REPORTS do
  try
    CallProcedure('insinfof1',[
    'p_ID', pID ,
    'p_bDate', bDate ,
    'p_eDate', eDate ,
    'includeold' , incstat
    ]);
  except
    on E:Exception do
    LogError(Format(rsCreditNumber,[pid]) + E.Message);
  end;
    {   if  rgKredStatus.ItemIndex = 0 then
    with Kera do begin
      Connect;
      ExportDataset(YReportsDataMod.CreditsDS , 'FBP',True);     }

end;
      

function TYReportsForm.BuildFilterString : String;

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
        S := Temp
      else
        S :=S + 'and ' + Temp;
    end;

  end;

begin

  Result := '';
//  ConcatFilter(Result,'cont.id',CheckBox1.Checked,DBLookupComboBox1.KeyValue);
 {ConcatFilter(Result,'cont.currency',CheckBox1.Checked,DBLookupComboboxEh2.KeyValue);
 ConcatFilter(Result,'cont.BRANCHID',CheckBox2.Checked,DBLookupComboboxEh1.KeyValue);
 ConcatFilter(Result,'cont.currency',CheckBox3.Checked,DBLookupComboboxEh2.KeyValue);
 ConcatFilter(Result,'cont.currency',CheckBox4.Checked,DBLookupComboboxEh2.KeyValue);
 ConcatFilter(Result,'cont.boorowerid',CheckBox5.Checked,DBLookupComboboxEh2.KeyValue);
 ConcatFilter(Result,'cont.boorowerid',CheckBox6.Checked,DBLookupComboboxEh2.KeyValue);

 ConcatFilter(Result,'cont.PERSONALTYPE',CheckBox8.Checked,DBLookupComboboxEh2.KeyValue);
 ConcatFilter(Result,'cont.CUSTOMERTYPE',CheckBox9.Checked,DBLookupComboboxEh2.KeyValue);  }
end;




procedure InitPlugin(s:string);export;
begin
   YReportsForm.ShowModal;
end;
exports
     InitPlugin;

procedure TYReportsForm.FormCreate(Sender: TObject);
var dY, dM, dD: Word;
begin

   YReportsDataMod:=TYReportsDataMod.create(self);
   AKProgressForm:=TAKProgressForm.create(self);
 {sako}
//  YReportsDataMod.sysdat.Open;
  DecodeDate(YReportsDataMod.sysdat.fieldbyname('tek_dat').AsDateTime{date}, dY, dM, dD);
  if dM-1=0 then begin
    dM := 12;
    dY := dY{-1 };
  end else begin
    dM := dM{-1 hemin ayin biri } ;
  end;
  BDateP.DateTime := EncodeDate(dY, dM, 1);
 // EDateP.DateTime := EncodeDate(dY, dM, GetMonLastDay(dM,dY));

  EDateP.DateTime:=YReportsDataMod.sysdat.fieldbyname('tek_dat').AsDateTime;
  GCredEndD.DateTime := EDateP.DateTime;

    SBTranslateProc.TranslateAllCompForms(Self, sboapiDataModule.OrPack_SL);
end;

procedure TYReportsForm.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TYReportsForm.BitBtn1Click(Sender: TObject);
var
  S          : String;
  CrdID      : Integer;
  PrintDeep  : Integer;
  Counter    : Integer;
begin
{if cbFormsLook.KeyValue=1 then begin
if EDateP.DateTime > YReportsDatamod.sysdat.fieldbyname('tek_dat').AsDateTime then
begin
end;   }
  if  BuildFilterString <>'' then
    S := 'where '+BuildFilterString;
  if rgKredStatus.ItemIndex = 0 then
    S := S + ' and partitionkey =0 ' ;
 // S := S + ' and partitionkey =0 and id in (select id from cm_history where rest+interestrest+duerest+dueinterestrest>0 and hdate='''+FormatDateTime('d-mmm-yyyy', GCredEndD.DateTime)+''''+')' ;
   if rgKredStatus.ItemIndex = 2 then
   S := S + ' and partitionkey =1';
    //ShowMessage(S);

    YReportsDataMod.CreditsDS.SQL[2] := S;

   PrepareProgress(YReportsDataMod.CreditsDS.RecordCount,rsProgressCaption);

    with YReportsDataMod.CreditsDS  do

      While not Eof do
       begin
       CrdID := YReportsDataMod.CreditsDS.FieldByName('ID').AsInteger;
       InsertOneRow(CrdID, Integer(Trunc(BDateP.DateTime)), Integer(Trunc(EDateP.DateTime)), rgKredStatus.ItemIndex);



       AKProgressForm.ProgressBar.Position := RecNo;
       AKProgressForm.Caption := rsProgressCaption + FormatFloat('<0.0%>',(100*RecNo)/RecordCount);
     next;
        CommonApplication.ProcessMessages;
      end;
     AKProgressForm.Close;

  YReportsDataMod.ResultDS.Open;
   if  rgKredStatus.ItemIndex = 0 then
    with Kera do begin
      Connect;
      ExportDataset(YReportsDataMod.ResultDS, 'F3',True);
    end

 end;


initialization
 YReportsForm := TYReportsForm.Create(CommonApplication);
end.

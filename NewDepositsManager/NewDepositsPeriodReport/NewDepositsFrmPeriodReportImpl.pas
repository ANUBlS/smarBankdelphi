unit NewDepositsFrmPeriodReportImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrlsEh, DBLookupEh, ExtCtrls,  ComCtrls,
  Buttons, CMExcelExport, DBGridEh;

type
  TNewDepositsFrmPeriodReport = class(TForm)
    BitBtnClose: TBitBtn;
    BitBtnOK: TBitBtn;
    BitBtnRetry: TBitBtn;
    ExportDeposits: TCMExcelExport;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    CBAvalute: TCheckBox;
    LCBValutes: TDBLookupComboboxEh;
    GroupBox2: TGroupBox;
    LCBDepositTypes: TDBLookupComboboxEh;
    CBDepositTypes: TCheckBox;
    GroupBox3: TGroupBox;
    LCBFilials: TDBLookupComboboxEh;
    CBFilial: TCheckBox;
    Panel2: TPanel;
    GroupBox4: TGroupBox;
    CBCustomer: TCheckBox;
    LCBCustomer: TDBLookupComboboxEh;
    GroupBox5: TGroupBox;
    LCBAccno: TDBLookupComboboxEh;
    CBAccno: TCheckBox;
    GroupBox6: TGroupBox;
    LCBCodCust: TDBLookupComboboxEh;
    CBCodCust: TCheckBox;
    Panel3: TPanel;
    GroupBox7: TGroupBox;
    CBPersons: TCheckBox;
    LCBPersons: TDBLookupComboboxEh;
    GroupBox8: TGroupBox;
    LCBCategories: TDBLookupComboboxEh;
    CBCategories: TCheckBox;
    GroupBox9: TGroupBox;
    Label1: TLabel;
    CBOpenedDep: TCheckBox;
    DTPOpenDate: TDateTimePicker;
    DTPCloseDate: TDateTimePicker;
    Panel4: TPanel;
    GroupBox10: TGroupBox;
    CBContractno: TCheckBox;
    LCBContractno: TDBLookupComboboxEh;
    GroupBox11: TGroupBox;
    Label3: TLabel;
    CBDepositAmt: TCheckBox;
    EdFamt: TEdit;
    EdSAmt: TEdit;
    GroupBox12: TGroupBox;
    Label2: TLabel;
    CBSumInterest: TCheckBox;
    EdFintAmt: TEdit;
    EdSintAmt: TEdit;
    Panel5: TPanel;
    GroupBox13: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    DTPbegin: TDateTimePicker;
    DTPend: TDateTimePicker;
    RGStatus: TRadioGroup;
    RGReport: TRadioGroup;
    RGTypes: TRadioGroup;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtnCloseClick(Sender: TObject);
    procedure BitBtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtnRetryClick(Sender: TObject);
  private
  function BuildFilterString(out outS  :String) :String;
    procedure execreport;
    procedure expexcel;
    procedure expqrp;
  public
    { Public declarations }
  end;

var
  NewDepositsFrmPeriodReport: TNewDepositsFrmPeriodReport;

  procedure exportproc(S:String);export;

implementation

{$R *.DFM}
uses NewCommonDeclsImpl,NewDepositsDmPeriodReportImpl, NewDEpositsFrmQrptReportImpl,SBTranslateProc,sboapiDataModuleimpl;


procedure exportproc(S:String);export;
begin
   NewDepositsFrmPeriodReport.ShowModal;
end;
exports
   exportproc;
 procedure TNewDepositsFrmPeriodReport.expexcel;
begin
    with ExportDeposits do
    begin
       Connect;
       ExportDataset(NewDepositsFrmPeriodReport.ResultData,'Period hesabatı',True);
       Disconnect;
    end;
end;


procedure TNewDepositsFrmPeriodReport.expqrp;
begin
   with NewDEpositsFrmQrptReport,QRepPeriod do
         Preview;
end;

procedure TNewDepositsFrmPeriodReport.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize := False
end;

procedure TNewDepositsFrmPeriodReport.FormCreate(Sender: TObject);
begin
   NewDepositsFrmPeriodReport:= TNewDepositsFrmPeriodReport.Create(Self);
   NewDEpositsFrmQrptReport := TNewDEpositsFrmQrptReport.Create(Self);
//QuicRep := TQuicRep.Create(self);
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TNewDepositsFrmPeriodReport.FormDestroy(Sender: TObject);
begin
   NewDEpositsFrmQrptReport.Free;
   NewDepositsFrmPeriodReport.Free;
end;

procedure TNewDepositsFrmPeriodReport.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Ord(Key) = VK_ESCAPE then Close
end;

procedure TNewDepositsFrmPeriodReport.FormShow(Sender: TObject);
begin
   DTPbegin.DateTime := Get_BankDate;
   DTPend.DateTime := Get_BankDate;
   DTPOpenDate.DateTime := Get_BankDate;
   DTPCloseDate.DateTime := Get_BankDate;
end;

procedure TNewDepositsFrmPeriodReport.execreport;
begin
   with RGReport do
     case ItemIndex of
     0: expexcel;
     1: expqrp;
     end;

end;

procedure TNewDepositsFrmPeriodReport.BitBtnCloseClick(Sender: TObject);
begin
   Close;
end;

procedure TNewDepositsFrmPeriodReport.BitBtnOKClick(Sender: TObject);

var BeginDat,EndDat :TDateTime;
    Ffilterstr,Sfilterstr :String;
begin
  BeginDat :=  integer(trunc(DTPbegin.DateTime));
  EndDat :=  integer(trunc(DTPend.DateTime));
  Ffilterstr := BuildFilterString(Sfilterstr);

  with NewDepositsFrmPeriodReport do
  begin
       with sbcm_period_report do
            CallProcedure('initreportdata',['bdat',BeginDat,
                                            'edat',EndDat,
                                            'Ffilterstr',Ffilterstr,
                                            'Sfilterstr',Sfilterstr]);
    with ResultData do
    begin
       CloseAll;
       SetVariable('bdat',BeginDat);
       SetVariable('edat',EndDat);
       Open;
    end;

     execreport;

  end;
end;

procedure TNewDepositsFrmPeriodReport.BitBtnRetryClick(Sender: TObject);
begin
   execreport
end;

function TNewDepositsFrmPeriodReport.BuildFilterString(out outS  :String) : String;

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

  procedure  ConcatFilter1(var S: String; var Prefix : String);
  begin
     if (S <> '') and (Prefix <> '') then S := S+' and '+Prefix;
     if (S = '') and (Prefix <> '') then S := Prefix;
  end;

var
  FOpenDates,
  FSumInterestRest,
  FDepositAmt,
  FType,
  FStatus :String;

begin

  FOpenDates := '';
  FSumInterestRest:= '';
  FDepositAmt:= '';
  FType:= '';
  FStatus := '';

  Result := '';
  ConcatFilter(Result,'cont.CURRENCY',CBAvalute.Checked,LCBValutes.KeyValue);
  ConcatFilter(Result,'cont.BRANCHID',CBFilial.Checked,LCBFilials.KeyValue);
  ConcatFilter(Result,'cont.contracttype',CBDepositTypes.Checked,LCBDepositTypes.KeyValue);
  ConcatFilter(Result,'cont.customerid',CBCustomer.Checked,LCBCustomer.KeyValue);
  ConcatFilter(Result,'cont.customerid',CBCodCust.Checked,LCBCodCust.KeyValue);
  ConcatFilter(Result,'cont.id',CBAccno.Checked,LCBAccno.KeyValue);
  ConcatFilter(Result,'cont.personaltye',CBPersons.Checked,LCBPersons.KeyValue);
  ConcatFilter(Result,'cont.clienttype',CBCategories.Checked,LCBCategories.KeyValue);
  ConcatFilter(Result,'cont.contractno',CBContractno.Checked,LCBContractno.KeyValue);

  if CBOpenedDep.Checked then

     FOpenDates := '(cont.opendate between  '''+FormatDateTime('dd-MMM-yyyy',DTPOpenDate.Date)+''' and '''+
      FormatDateTime('dd-MMM-yyyy',DTPCloseDate.Date)+''''+')'
     else FOpenDates := '';

  if CBSumInterest.Checked then
     FSumInterestRest := '( facticalinterestdebt between '+
     EdFintAmt.Text+' and ' +EdSintAmt.Text +')'

     else  FSumInterestRest := '';

  if CBDepositAmt.Checked then
     FDepositAmt := '(Cont.amount between '+EdFamt.Text+' and '+EdSAmt.Text +' ) '
     else   FDepositAmt := '';

  with RGTypes do
    case ItemIndex of
      0:FType := '(cont.type# = 3)';
      1:FType := '';
    end;

  with RGStatus do
    case ItemIndex of
      0:FStatus := '( CALCULATIONENABLED = 1)';
      1:FStatus := '';
    end;

   ConcatFilter1(Result,FOpenDates);
   ConcatFilter1(outS,FSumInterestRest);
   ConcatFilter1(Result,FDepositAmt);
   ConcatFilter1(Result,FType);
   ConcatFilter1(outS,FStatus);

end;

initialization
   NewDepositsFrmPeriodReport := TNewDepositsFrmPeriodReport.Create(CommonApplication)
end.

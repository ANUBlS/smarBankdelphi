unit ipAnnutyPaymentFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CMCurrencyEdit, ComCtrls, ExtCtrls, NLSLocalizer, ActnList;

type

  PAnnutyPaymentInfo = ^ TAnnutyPaymentInfo;

  TAnnutyPaymentInfo = record
    PaymentType : Boolean;
    FirstPayDate : TDateTime;
    Amount : Real;
    PeriodRate : Byte;
    NPeriods : integer;
  end;

  TAnnutyForm = class(TForm)
    NLSLocalizer1: TNLSLocalizer;
    GroupBox1: TGroupBox;
    RGAnnuty: TRadioGroup;
    GroupBox2: TGroupBox;
    DTPStartDate: TDateTimePicker;
    GroupBox4: TGroupBox;
    AmountEdit: TCMCurrencyEdit;
    GroupBox5: TGroupBox;
    CmbBoxPeriodRate: TComboBox;
    Panel1: TPanel;
    Button2: TButton;
    Button3: TButton;
    ActionList1: TActionList;
    GroupBox6: TGroupBox;
    NPeriodsEdit: TEdit;
    ActnApply: TAction;
    ActnCancel: TAction;
    procedure ActnApplyExecute(Sender: TObject);
    procedure ActnCancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    function AnnutyPayment_Get(var Payment : PAnnutyPaymentInfo) : Boolean;
    { Public declarations }
  end;

var
  AnnutyForm: TAnnutyForm;

implementation

uses ipScheduleDataModuleImpl;

{$R *.DFM}

function TAnnutyForm.AnnutyPayment_Get(var Payment : PAnnutyPaymentInfo) : Boolean;

  procedure InitPaymentInfo;

    function MonthsBeetwean(D1,D2 : TDateTime) : Integer;  //D1<D2
    var
      TempDate : TDateTime;
    begin
      Result := 1;
      TempDate := D1;
      
      while IncMonth(TempDate,Result) <= D2 do
        INC(Result);

      if IncMonth(TempDate,Result) > D2 then
        Result := Result - 1;
    end;
    
  var
    PeriodCnt : Word;
    D1,D2 : TDateTime;
  begin
    with ScheduleDataModule.IPInfo do
    begin
      DTPStartDate.DateTime := IncMonth(FieldByName('BANKOPENDATE').AsDateTime,1);
      AmountEdit.Value := ScheduleDataModule.CreditInfo.FieldByName('NEWFINANCEAMOUNT').AsCurrency;
      CmbBoxPeriodRate.ItemIndex := 0;
      D1 := FieldByName('BANKOPENDATE').AsDateTime;
      D2 := FieldByName('BANKCLOSEDATE').AsDateTime;
      PeriodCnt := MonthsBeetwean(D1,D2);
      NPeriodsEdit.Text := IntToStr(PeriodCnt);
    end;
  end;

var
  P : PAnnutyPaymentInfo;
  PerRate  : Integer;
begin
  //P := nil;
  InitPaymentInfo;
  Result := ShowModal = mrOK;
  if Result then
  begin
    case CmbBoxPeriodRate.ItemIndex of
      0 : PerRate := 1;
      1 : PerRate := 3;
      2 : PerRate := 6;
    else
      PerRate := 12;
    end; // Case
    New(P);
    with   P^   do
    begin
      PaymentType := RGAnnuty.ItemIndex = 0;
      FirstPayDate := Integer(Trunc(DTPStartDate.DateTime));
      Amount := AmountEdit.Value;
      PeriodRate := PerRate;
      NPeriods := StrToInt(NPeriodsEdit.Text);
    end;
    Payment := P;
  end; //if
end;

procedure TAnnutyForm.ActnApplyExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TAnnutyForm.ActnCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel
end;

procedure TAnnutyForm.FormCreate(Sender: TObject);
begin
 DTPStartDate.DateTime := IncMonth(ScheduleDataModule.IPInfo.FieldByName('BANKOPENDATE').AsDateTime,1);
end;

end.

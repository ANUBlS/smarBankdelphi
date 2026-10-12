unit NewDepositsPaymentSheduleimpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CMCurrencyEdit, ComCtrls, ExtCtrls;

type
  TNewDepositsPaymentShedule = class(TForm)
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DateTimePicker1: TDateTimePicker;
    Panel1: TPanel;
    GroupBox3: TGroupBox;
    CMCurrencyRest: TCMCurrencyEdit;
    GroupBox4: TGroupBox;
    EditPeriod: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewDepositsPaymentShedule: TNewDepositsPaymentShedule;

implementation

{$R *.dfm}
uses NewCommonDeclsImpl,NewDepositsScheduleDataModuleImpl,NewDepositsSheduleImpl,SBTranslateProc,sboapiDataModuleimpl;
procedure TNewDepositsPaymentShedule.Button1Click(Sender: TObject);
var
    period  :integer;
    FirstDate  :TDateTime;
    Amount,Percent :CURRENCY;
begin
  FirstDate:=DateTimePicker1.datetime;
  Amount:=CMCurrencyRest.Value;
  period:=StrToInt(EditPeriod.text);
  Percent:=StrToCurr(NewDepositsFrmShedule.DBEdit2.text);
  with NewDepositsScheduleDataModule,dm_payment_schedules do
  begin
    CallProcedure('DmPeriod',[
                  'Contractid' , Get_SelectedContID,
                  'PaymentDate', FirstDate,
                  'PRest'       , Amount,
                  'Period'     , Period,
                  'Percent'    , Percent
                  ]);


    OracleDataSet2.Refresh;
  end;

end;

procedure TNewDepositsPaymentShedule.Button2Click(Sender: TObject);
begin
  NewDepositsPaymentShedule.Close;
end;

procedure TNewDepositsPaymentShedule.FormCreate(Sender: TObject);
begin
  SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

end.




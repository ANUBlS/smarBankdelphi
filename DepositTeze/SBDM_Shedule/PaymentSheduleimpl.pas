unit PaymentSheduleimpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CMCurrencyEdit, ComCtrls, ExtCtrls;

type
  TPaymentShedule = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Panel1: TPanel;
    DateTimePicker1: TDateTimePicker;
    GroupBox3: TGroupBox;
    CMCurrencyEdit1: TCMCurrencyEdit;
    GroupBox4: TGroupBox;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PaymentShedule: TPaymentShedule;

implementation
uses CommonDeclsImpl,ScheduleDataModuleImpl,SheduleImpl,SBTranslateProc,sboapiDataModuleimpl;

{$R *.DFM}

procedure TPaymentShedule.Button1Click(Sender: TObject);
var depid,period  :integer;
    tarix  :TDateTime;
    amount,per :CURRENCY;
begin
  depid:=Get_SelectedContID;
  tarix:=DateTimePicker1.datetime;
  amount:=CMCurrencyEdit1.Value;
  period:=StrToInt(Edit1.text);
  per:=StrToCurr(form1.DBEdit2.text);
  with ScheduleDataModule,SBCM_PAYMENT_SCHEDULE1 do
  begin
    CallProcedure('sbcmperiod',[
                  'deposid'    , depid,
                  'PaymentDate', tarix,
                  'per_amount' , amount,
                  'period'     , period,
                  'perc'    , per
                  ]);

                  
    OracleDataSet2.Refresh;
  end;
end;

procedure TPaymentShedule.Button2Click(Sender: TObject);
begin
  PaymentShedule.Close;
end;

procedure TPaymentShedule.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

end.

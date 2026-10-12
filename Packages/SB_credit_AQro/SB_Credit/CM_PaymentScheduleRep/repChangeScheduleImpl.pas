unit repChangeScheduleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NLSLocalizer, StdCtrls, Buttons, ImgList, ComCtrls, Mask, DBCtrlsEh;

type
  TFrmChangeSchedule = class(TForm)
    NLSLocalizer1: TNLSLocalizer;
    BitBtnChenge: TBitBtn;
    BitBtnAbort: TBitBtn;
    Label1: TLabel;
    DTPChngSchedule: TDateTimePicker;
    Label2: TLabel;
    NPeriodsEdit: TEdit;
    Label3: TLabel;
    EdRest: TEdit;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormShow(Sender: TObject);
    procedure BitBtnAbortClick(Sender: TObject);
    procedure BitBtnChengeClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DTPChngScheduleChange(Sender: TObject);
  private
  function MonthsBeetwean(D1,D2 : TDateTime) : Integer;
  public
    PayAmt : Real;
  end;

var
  FrmChangeSchedule: TFrmChangeSchedule;

implementation

{$R *.DFM}

uses repScheduleDataModuleImpl,systemstate,CommonDecls,
  repScheduleMainFormImpl;

procedure TFrmChangeSchedule.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False
end;

    function TFrmChangeSchedule.MonthsBeetwean(D1,D2 : TDateTime) : Integer;  //D1<D2
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

procedure TFrmChangeSchedule.FormShow(Sender: TObject);
var D2:TDateTime;
    Periods :integer;
    FactRest : Real;

begin
   DTPChngSchedule.DateTime := Get_CurrentDate ;

   with ScheduleDataModule,CreditInfo do begin
        D2 := FieldByName('DUEDATEFIRSTCONTRACT').AsDateTime;
        FactRest :=  CreditInfo.FieldByName('Rest').AsFloat - PayAmt;
        EdRest.Text := FloatToStr(FactRest);
   end;
   Periods := MonthsBeetwean(Get_CurrentDate,D2);
   NPeriodsEdit.Text := IntToStr(Periods);

end;

procedure TFrmChangeSchedule.BitBtnAbortClick(Sender: TObject);
begin
  Close 
end;

procedure TFrmChangeSchedule.BitBtnChengeClick(Sender: TObject);
var
  BeginDate :TDateTime;
  CreditID ,period: Integer;
  CrdRest :Real;
begin
    BeginDate := DTPChngSchedule.DateTime;
    CreditID := Get_SelectedCrdID;
    period := StrToInt(NPeriodsEdit.Text);
    CrdRest := StrToFloat(EdRest.Text);
    with ScheduleDataModule,CM_SCHEDULE do
    begin
         CallProcedure('ChangeSchedule',[
                        'p_CreditID',CreditID,
                        'P_Date',BeginDate,
                        'p_period',period,
                        'p_rest',CrdRest,
                        'p_optype',true]);
         ScheduleData.Refresh;
    end ;
    Close;
end;

procedure TFrmChangeSchedule.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key) = VK_ESCAPE then close;
  if ord(Key) = VK_RETURN then  BitBtnChengeClick(Self);
end;

procedure TFrmChangeSchedule.DTPChngScheduleChange(Sender: TObject);
var D1,D2 :TDateTime;
    Periods :integer;
begin
   D1 := DTPChngSchedule.DateTime;
   with ScheduleDataModule,CreditInfo do
        D2 := FieldByName('DUEDATEFIRSTCONTRACT').AsDateTime;
   Periods := MonthsBeetwean(D1,D2);
   NPeriodsEdit.Text := IntToStr(Periods);
end;

end.

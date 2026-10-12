unit UntCloseYear;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Buttons;

type
  TFrmSetCloseYear = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    StaticText2: TStaticText;
    ECurrentDate: TEdit;
    Panel2: TPanel;
    StaticText1: TStaticText;
    ENewDate: TEdit;
    DTPNewDate: TDateTimePicker;
    SpeedButton1: TSpeedButton;
    procedure DTPNewDateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSetCloseYear: TFrmSetCloseYear;

implementation

uses MFDataModule, UntMainFacilitiesImpl;

{$R *.DFM}

procedure TFrmSetCloseYear.DTPNewDateChange(Sender: TObject);
begin
 ENewDate.Text :=FormatDateTime('dd-mmm-yyyy',(Sender as TDateTimePicker).Date);
end;

procedure TFrmSetCloseYear.FormCreate(Sender: TObject);
begin
 with MainFacilities,MainFDataModule.OPViewWares do
  begin
   DTPNewDate.DateTime :=GetPresentdate;//CallDateFunction('GetPresentDate',[]);
   ENewDate.Text :=FormatDateTime('dd-mmm-yyyy',GetPresentdate);
   ECurrentDate.Text :=FormatDateTime('dd-mmm-yyyy',CallDateFunction('GetCurrentYear',[]));
  end;
end;
procedure TFrmSetCloseYear.Button1Click(Sender: TObject);
resourcestring
 Message_CloseDayWarning =
   'Are you sure to close current operation day '+
    '(current operation date is: "%s"), and open with date: "%s"';
var
   NewDate :TDateTime;
begin
  NewDate :=trunc(DTPNewDate.DateTime);
  if
    MessageDlg(
      Format(
        Message_CloseDayWarning,
        [ECurrentDate.Text, ENewDate.Text]),
      mtConfirmation,
      [mbYes, mbCancel],
      0)
     = mrYes
  then
 with MainFDataModule do
  begin
   //Cursor :=crHourGlass;
   OPViewWares.CallProcedure('SetNewSettings',[NewDate]);
   ViewWares.Refresh;
   //Cursor :=crDefault;
  end;
end;

procedure TFrmSetCloseYear.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key = VK_ESCAPE) then  Close;
end;

procedure TFrmSetCloseYear.SpeedButton1Click(Sender: TObject);
resourcestring
 Message_CloseDayWarning =
   'Are you sure to close current operation day '+
    '(current operation date is: "%s"), and open with date: "%s"';
var
   NewDate :TDateTime;
begin
  NewDate :=trunc(DTPNewDate.DateTime);
  if
    MessageDlg(
      Format(
        Message_CloseDayWarning,
        [ECurrentDate.Text, ENewDate.Text]),
      mtConfirmation,
      [mbYes, mbCancel],
      0)
     = mrYes
  then
 with MainFDataModule do
  begin
   //Cursor :=crHourGlass;
   OPViewWares.CallProcedure('SetNewSettings',[NewDate]);
   ViewWares.Refresh;
   //Cursor :=crDefault;
  end;
end;

end.

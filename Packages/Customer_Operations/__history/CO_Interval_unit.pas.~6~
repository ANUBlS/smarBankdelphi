unit CO_Interval_unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  TFormInterval = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EndDateEdit: TDateTimePicker;
    OkButton: TButton;
    CancelButton: TButton;
    StartDateEdit: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure WMNCACTIVATE(var message: TWMNCActivate); message WM_NCACTIVATE;
    procedure WMNCPaint(var message: TWMNCPaint); message WM_NCPAINT;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OkButtonKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OkButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormInterval: TFormInterval;

implementation

uses CO_Datamod_impl, SBTranslateProc, sboapiDataModuleImpl;
{$R *.DFM}

procedure TFormInterval.WMNCACTIVATE(var message: TWMNCActivate);
var
  S: TWMNCPaint;
begin
  inherited;
  WMNCPaint(S);
end;

procedure TFormInterval.WMNCPaint(var message: TWMNCPaint);
const
  Capt = 'İnterval';
var
  dc: hDc;
begin
  inherited;
  Caption := '';
  dc := GetWindowDC(Handle);
  SetBkMode(dc, Transparent);
  SetTextColor(dc, clWhite);
  SelectObject(dc, Font.Handle);
  TextOut(dc, 23, 6, Capt, Length(Capt));
end;

procedure TFormInterval.FormShow(Sender: TObject);
begin
  ActiveControl := StartDateEdit;
end;

procedure TFormInterval.FormCreate(Sender: TObject);
begin
  SBTranslateProc.TranslateAllCompForms(Self, sboapiDataModule.OrPack_SL);
end;

procedure TFormInterval.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then
    close;
end;

procedure TFormInterval.OkButtonKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then
    close;
end;

procedure TFormInterval.OkButtonClick(Sender: TObject);
var
  S_date: Tdatetime;
  E_date: Tdatetime;
begin
  S_date := Trunc(StartDateEdit.datetime);
  E_date := Trunc(EndDateEdit.datetime);
  CO_DataMod.OPackage.CallProcedure('ins_date', [S_date, E_date]);
  CO_DataMod.memorial_date.refresh;

end;

procedure TFormInterval.FormActivate(Sender: TObject);
begin
  StartDateEdit.datetime := CO_DataMod.Sysdat.fieldbyname('tek_dat').asdatetime;
  EndDateEdit.datetime := CO_DataMod.Sysdat.fieldbyname('tek_dat').asdatetime;

end;

end.

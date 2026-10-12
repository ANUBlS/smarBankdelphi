unit CO_Choose_unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TCO_Choose = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    ch_1: TCheckBox;
    ch_2: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure WMNCACTIVATE(var message: TWMNCActivate); message WM_NCACTIVATE;
    procedure WMNCPaint(var message: TWMNCPaint); message WM_NCPAINT;
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CO_Choose: TCO_Choose;

implementation

uses MemorialRep, CO_MemorialRep1_unit, CO_datamod_impl, co_memorial,
  SBTranslateProc, sboapiDataModuleImpl;

{$R *.DFM}

procedure TCO_Choose.WMNCACTIVATE(var message: TWMNCActivate);
var
  S: TWMNCPaint;
begin
  inherited;
  WMNCPaint(S);
end;

procedure TCO_Choose.WMNCPaint(var message: TWMNCPaint);
const
  Capt = 'Seçim';
var
  dc: hDc;
begin
  inherited;
  Caption := '';
  dc := GetWindowDC(Handle);
  SetBkMode(dc, Transparent);
  SetTextColor(dc, clWhite);
  SelectObject(dc, Font.Handle);
  TextOut(dc, 23, 6, Capt, Length(Capt)); //
end;

procedure TCO_Choose.Button1Click(Sender: TObject);
begin
  if ch_1.checked then
    if not CO_DataMod.DebetTransactionsData.IsEmpty then
    begin
      CO_MemorialRep.preview;
    end
    else
    begin
      ShowMessage('Heç bir əməliyyat qeydə alınmayıb');
    END;
  if ch_2.checked then
    if not CO_DataMod.CreditTransactionsdata.IsEmpty then
    begin
      CO_MemorialRep1.preview;
    end
    else
    begin
      ShowMessage('Heç bir əməliyyat qeydə alınmayıb');
    end;
end;

procedure TCO_Choose.FormActivate(Sender: TObject);
begin
  CO_DataMod.bankinfo.open;
end;

procedure TCO_Choose.FormCreate(Sender: TObject);
begin
  SBTranslateProc.TranslateAllCompForms(Self, sboapiDataModule.OrPack_SL);
end;

procedure TCO_Choose.Label1Click(Sender: TObject);
begin
  ch_1.checked := true;
end;

procedure TCO_Choose.Label2Click(Sender: TObject);
begin
  ch_2.checked := true;
end;

end.

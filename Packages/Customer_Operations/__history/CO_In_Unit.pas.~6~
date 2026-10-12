unit CO_In_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, SearchEdit, Mask, DBCtrls, ExtCtrls;

type
  TCO_TransTypeIncOut = class(TForm)
    SettingsBrowser: TDBGrid;
    Panel4: TPanel;
    Panel5: TPanel;
    DBEditAssignment: TDBEdit;
    Panel6: TPanel;
    DBEditComissionAssignment: TDBEdit;
    Panel3: TPanel;
    ButtonRefresh: TButton;
    ButtonClose: TButton;
    BtnAdd: TButton;
    procedure BtnAddClick(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ButtonRefreshClick(Sender: TObject);
    procedure SettingsBrowserDblClick(Sender: TObject);
    procedure WMNCACTIVATE(var message: TWMNCActivate); message WM_NCACTIVATE;
    procedure WMNCPaint(var message: TWMNCPaint); message WM_NCPAINT;
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  CO_TransTypeIncOut: TCO_TransTypeIncOut;
  IncOut: integer; { 1 - incoming, 2 - outgoing }

implementation

uses CO_datamod_impl, co_commission_unit, CO_Transact_Unitp,
  SBTranslateProc, sboapiDataModuleImpl;
{$R *.DFM}

procedure TCO_TransTypeIncOut.WMNCACTIVATE(var message: TWMNCActivate);
var
  S: TWMNCPaint;
begin
  inherited;
  WMNCPaint(S);
end;

procedure TCO_TransTypeIncOut.WMNCPaint(var message: TWMNCPaint);
const
  Capt = 'Standart əməliyyatlar';
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

procedure TCO_TransTypeIncOut.BtnAddClick(Sender: TObject);
begin
  if not Assigned(CO_Transactions) then
    CO_Transactions := TCO_Transactions.Create(Self);
  with CO_Transactions do
  begin
    TransTypeIncOutDC := IncOut;
    ShowModal;
  end;
end;

procedure TCO_TransTypeIncOut.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TCO_TransTypeIncOut.FormActivate(Sender: TObject);
begin
  if IncOut = 1 then
    if CO_DataMod.Account.FieldByName('TYPEID').AsInteger = 1 then
    begin
      CO_DataMod.CO_Out.Open;
      SettingsBrowser.DataSource := CO_DataMod.CO_Out_data;
    end
    else
    begin
      CO_DataMod.CO_In.Open;
      SettingsBrowser.DataSource := CO_DataMod.CO_In_data;
    end;

  if IncOut = 2 then
    if CO_DataMod.Account.FieldByName('TYPEID').AsInteger = 1 then
    begin
      CO_DataMod.CO_In.Open;
      SettingsBrowser.DataSource := CO_DataMod.CO_In_data;
    end
    else
    begin
      CO_DataMod.CO_Out.Open;
      SettingsBrowser.DataSource := CO_DataMod.CO_Out_data;
    end;

  DBEditAssignment.DataSource := SettingsBrowser.DataSource;
  DBEditComissionAssignment.DataSource := SettingsBrowser.DataSource;
end;

procedure TCO_TransTypeIncOut.FormCreate(Sender: TObject);
begin
  SBTranslateProc.TranslateAllCompForms(Self, sboapiDataModule.OrPack_SL);
end;

procedure TCO_TransTypeIncOut.ButtonRefreshClick(Sender: TObject);
begin
  CO_DataMod.CO_In.Refresh;
  CO_DataMod.CO_Out.Refresh;
end;

procedure TCO_TransTypeIncOut.SettingsBrowserDblClick(Sender: TObject);
begin
  BtnAdd.Click;
end;

end.

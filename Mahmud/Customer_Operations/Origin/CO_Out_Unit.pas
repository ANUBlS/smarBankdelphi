unit CO_Out_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Mask, DBCtrls, ExtCtrls;
  type
  TOperationMode = (omInsert, omEdit, omCommission);

type
  TCO_Out_Form = class(TForm)
    SettingsBrowser: TDBGrid;
    Panel4: TPanel;
    Panel5: TPanel;
    DBEdit1: TDBEdit;
    Panel6: TPanel;
    DBEdit2: TDBEdit;
    Panel3: TPanel;
    ButtonRefresh: TButton;
    ButtonClose: TButton;
    Button3: TButton;
    procedure FormActivate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtonRefreshClick(Sender: TObject);
    procedure SettingsBrowserDblClick(Sender: TObject);
     procedure WMNCACTIVATE(var message: TWMNCActivate); message WM_NCACTIVATE;
  procedure WMNCPaint(var message : TWMNCPaint); message WM_NCPAINT;

  private
    { Private declarations }
  public
    { Public declarations }
     OperationMode: TOperationMode;
  end;

var
  CO_Out_Form: TCO_Out_Form;

implementation

Uses CO_datamod_impl, OutForm_Unit, CO_In_Unit;
{$R *.DFM}
 
procedure TCO_Out_Form.WMNCACTIVATE(var message:TWMNCActivate);
var
 S:TWMNCPaint;
begin
inherited;
WMNCPaint(s);
end;

procedure TCO_Out_Form.WMNCPaint(var message: TWMNCPaint);
const Capt = 'Стандарт ямялиййатлар';
var dc : hDc;
begin
inherited;
Caption:='';
dc := GetWindowDC(Handle);
        SetBkMode(dc,Transparent);
        SetTextColor(dc,clWhite);
        SelectObject(dc, Font.Handle);
        TextOut(dc, 23,6,Capt,Length(Capt));
end;

procedure TCO_Out_Form.FormActivate(Sender: TObject);
begin
CO_DataMod.CO_Out.open;
end;

procedure TCO_Out_Form.Button3Click(Sender: TObject);
begin
try
OutForm :=TOutForm.Create(self);
 OutForm.Showmodal;
  finally
  OutForm.Release;
  end;
 
end;


procedure TCO_Out_Form.ButtonCloseClick(Sender: TObject);
begin
close;
end;

procedure TCO_Out_Form.ButtonRefreshClick(Sender: TObject);
begin
CO_DataMod.CO_Out.Refresh;
end;

procedure TCO_Out_Form.SettingsBrowserDblClick(Sender: TObject);
begin
try
OutForm :=TOutForm.Create(self);
 OutForm.Showmodal;
  finally
  OutForm.Release;
 end;
 
 end;

end.

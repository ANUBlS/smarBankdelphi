unit P_CO_In_Form;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids;

type
  TP_Co_In = class(TForm)
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
    procedure Button3Click(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtonRefreshClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SettingsBrowserDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure WMNCACTIVATE(var message:TWMNCActivate);
    procedure WMNCPaint(var message: TWMNCPaint);
  end;

var
  P_Co_In: TP_Co_In;

implementation

uses P_Inform_Unit, P_Datamod_Unit;

{$R *.DFM}
 
procedure TP_Co_In.WMNCACTIVATE(var message:TWMNCActivate);
var
 S:TWMNCPaint;
begin
inherited;
WMNCPaint(s);
end;

procedure TP_Co_In.WMNCPaint(var message: TWMNCPaint);
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

procedure TP_Co_In.Button3Click(Sender: TObject);
begin
try
P_InForm :=TP_InForm.Create(self);
 P_InForm.Showmodal;
  finally
  P_InForm.Release;
  end;



end;

procedure TP_Co_In.ButtonCloseClick(Sender: TObject);
begin
close;
end;

procedure TP_Co_In.ButtonRefreshClick(Sender: TObject);
begin
P_DataModuleFS.CO_In.Refresh;
end;

procedure TP_Co_In.FormActivate(Sender: TObject);
begin
P_DataModuleFS.CO_In.Open;
end;

procedure TP_Co_In.SettingsBrowserDblClick(Sender: TObject);
begin
try
P_InForm :=TP_InForm.Create(self);
 P_InForm.Showmodal;
  finally
  P_InForm.Release;
  end;

end;

end.

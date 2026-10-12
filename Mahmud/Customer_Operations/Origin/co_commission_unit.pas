unit co_commission_unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids, SearchEdit;


type
  TCO_Commission = class(TForm)
    GridCommission: TDBGrid;
    Panel4: TPanel;
    Panel5: TPanel;
    DBEdit1: TDBEdit;
    Panel6: TPanel;
    DBEdit2: TDBEdit;
    Panel3: TPanel;
    ButtonRefresh: TButton;
    ButtonClose: TButton;
    Button3: TButton;
    acc_no: TSearchEdit;
    acc_name: TEdit;
    val_acc: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure GridCommissionDblClick(Sender: TObject);
    procedure GridCommissionTitleClick(Column: TColumn);
    procedure WMNCACTIVATE(var message: TWMNCActivate); message WM_NCACTIVATE;
    procedure WMNCPaint(var message : TWMNCPaint); message WM_NCPAINT;


    procedure ButtonRefreshClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
   
  public
    { Public declarations }
  end;

var
  CO_Commission: TCO_Commission;

implementation

uses CO_datamod_impl, CO_TransactionPropertiesImpl;
{$R *.DFM}

procedure TCO_Commission.WMNCACTIVATE(var message:TWMNCActivate);
var
 S:TWMNCPaint;
begin
inherited;
WMNCPaint(s);
end;

procedure TCO_Commission.WMNCPaint(var message: TWMNCPaint);
const Capt = 'Комиссийа Ямялиййатлары';
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
procedure TCO_Commission.FormCreate(Sender: TObject);
begin
CO_DataMod.Commission.open;


end;

procedure TCO_Commission.Button3Click(Sender: TObject);
begin
try
CO_Transaction :=TCO_Transaction.Create(self);

  CO_Transaction.Showmodal;
  finally
  CO_Transaction.Release;

end;
                       
end;


procedure TCO_Commission.ButtonCloseClick(Sender: TObject);
begin
close;
end;

procedure TCO_Commission.GridCommissionDblClick(Sender: TObject);
begin
try
CO_Transaction :=TCO_Transaction.Create(self);
    CO_Transaction.Showmodal;
       finally
        CO_Transaction.Release;
           end;
             end;


procedure TCO_Commission.GridCommissionTitleClick(Column: TColumn);

var
   TitleName :string;
begin
 TitleName :=Column.FieldName;
  with CO_DataMod.Commission do
   begin
    SetVariable('Title',TitleName);
    Refresh;
   end;  end;


procedure TCO_Commission.ButtonRefreshClick(Sender: TObject);
begin
CO_DataMod.Commission.Refresh;
end;

procedure TCO_Commission.FormActivate(Sender: TObject);
begin
CO_Commission.acc_no.Text :=CO_DataMod.Account.FieldByName('accno').AsString;
CO_Commission.acc_name.Text :=CO_DataMod.Account.FieldByName('accname').AsString;
CO_Commission.val_acc.Text :=CO_DataMod.Account.FieldByName('accvalcode').AsString;

end;

end.

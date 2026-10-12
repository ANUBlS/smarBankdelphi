unit CO_In_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, SearchEdit, Mask, DBCtrls, ExtCtrls;

  type
  TOperationMode = (omInsert, omEdit, omCommission);
type
  TCO_In_Form = class(TForm)
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
    procedure FormActivate(Sender: TObject);
    procedure ButtonRefreshClick(Sender: TObject);
    procedure SettingsBrowserDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    
  end;

var
  CO_In_Form: TCO_In_Form;

implementation
 Uses CO_datamod_impl, co_commission_unit, InFormUnit;
{$R *.DFM}

procedure TCO_In_Form.Button3Click(Sender: TObject);
begin
try
InForm :=TInForm.Create(self);
 InForm.Showmodal;
  finally
  InForm.Release;
  end;
   CO_In_Form.close;
end;

procedure TCO_In_Form.ButtonCloseClick(Sender: TObject);
begin
close;
end;

procedure TCO_In_Form.FormActivate(Sender: TObject);
begin
CO_DataMod.CO_In.Open;
end;

procedure TCO_In_Form.ButtonRefreshClick(Sender: TObject);
begin
CO_DataMod.CO_In.Refresh;
end;

procedure TCO_In_Form.SettingsBrowserDblClick(Sender: TObject);
begin
try
InForm :=TInForm.Create(self);
 InForm.Showmodal;
  finally
  InForm.Release;
  end;
   CO_In_Form.close;

end;

end.

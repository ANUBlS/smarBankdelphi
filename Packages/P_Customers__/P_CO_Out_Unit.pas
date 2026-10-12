unit P_CO_Out_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids;

type
  TP_Co_Out = class(TForm)
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
    procedure ButtonRefreshClick(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SettingsBrowserDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  P_Co_Out: TP_Co_Out;

implementation

uses P_OutForm_Unit, P_Datamod_Unit;

{$R *.DFM}

procedure TP_Co_Out.Button3Click(Sender: TObject);
begin
try
P_OutForm :=TP_OutForm.Create(self);
 P_OutForm.Showmodal;
  finally
  P_OutForm.Release;
  end;



end;

procedure TP_Co_Out.ButtonRefreshClick(Sender: TObject);
begin
P_Datamodule.CO_Out.Refresh;
end;

procedure TP_Co_Out.ButtonCloseClick(Sender: TObject);
begin
close;
end;

procedure TP_Co_Out.FormActivate(Sender: TObject);
begin
P_DataModule.CO_Out.Open;
end;

procedure TP_Co_Out.SettingsBrowserDblClick(Sender: TObject);
begin
try
P_OutForm :=TP_OutForm.Create(self);
 P_OutForm.Showmodal;
  finally
  P_OutForm.Release;
  end;

end;

end.

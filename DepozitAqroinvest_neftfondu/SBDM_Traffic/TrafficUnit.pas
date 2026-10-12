unit TrafficUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, StdCtrls;

type
  TFrmTraffic = class(TForm)
    TrafficViewer: TDBGrid;
    Panel1: TPanel;
    ButtonCancel: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    FContractID : LongInt; 
    { Public declarations }
  end;

var
  FrmTraffic: TFrmTraffic;

implementation

uses
   TrafficDataModuleUnit,DepositDataModuleUnit;

{$R *.DFM}

procedure TFrmTraffic.FormCreate(Sender: TObject);
begin
  TrafficDataModule := TTrafficDataModule.Create(Self);
  Caption := Caption + DepositDataModule.Deposits.fieldbyname('ContractNo').AsString;
end;

procedure TFrmTraffic.FormShow(Sender: TObject);
begin
  with TrafficDataModule.TrafficData  do
  begin
    SetVariable('ID#',FContractID);
    Open;
  end;
end;

procedure TFrmTraffic.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TrafficDataModule.TrafficData.CloseAll;
  Action := caFree;
end;

procedure TFrmTraffic.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    ButtonCancel.Click
end;

end.

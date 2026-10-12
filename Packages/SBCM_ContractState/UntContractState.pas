unit UntContractState;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, DBCGrids, Mask, DBCtrls, ComCtrls,Oracle
  ,OracleData, Menus;

type
  TFrmContractState = class(TForm)
    PageControl: TPageControl;
    TSheetTranches: TTabSheet;
    TSheetPayments: TTabSheet;
    TSheetProlongations: TTabSheet;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    StaticText2: TStaticText;
    DBEdit2: TDBEdit;
    Panel1: TPanel;
    StaticText1: TStaticText;
    DBEdit1: TDBEdit;
    Panel3: TPanel;
    StaticText3: TStaticText;
    DBEdit3: TDBEdit;
    Panel4: TPanel;
    StaticText4: TStaticText;
    DBEdit4: TDBEdit;
    Panel5: TPanel;
    StaticText5: TStaticText;
    DBEdit5: TDBEdit;
    Panel6: TPanel;
    StaticText6: TStaticText;
    DBEdit6: TDBEdit;
    Panel7: TPanel;
    StaticText7: TStaticText;
    DBEdit7: TDBEdit;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    PaymentPopupMenu: TPopupMenu;
    miPrintPaymentOrder: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure miPrintPaymentOrderClick(Sender: TObject);
  private
    { Private declarations }
  public
    FContractID :LongInt;
    { Public declarations }
  end;

var
  FrmContractState: TFrmContractState;

implementation

uses
   sbcmMainDataModule, UnitStateDataModule, OrderUnit;

{$R *.DFM}

procedure TFrmContractState.FormShow(Sender: TObject);
begin
  Caption := 'Traffic of Contract. ¹  ' + MainDataModule.Contracts.FieldByName('ContractNo').AsString;
  with TrafficDataModule.TranchesData do
  begin
    SetVariable('ID#',FContractID);
    Open
  end;
  with TrafficDataModule.PaymentsData do
  begin
    SetVariable('ID#',FContractID);
    Open
  end;
  with TrafficDataModule.ProlongationsData do
  begin
    SetVariable('ID#',FContractID);
    Open
  end;
  TrafficDataModule.CustomerData.Open;
end;

procedure TFrmContractState.FormCreate(Sender: TObject);
begin
  TrafficDataModule := TTrafficDataModule.Create(Self);
  PaymentOrder := TPaymentOrder.Create(Self)
end;

procedure TFrmContractState.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    Close;
end;

procedure TFrmContractState.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TrafficDataModule.TranchesData.CloseAll;
  TrafficDataModule.PaymentsData.CloseAll;
  TrafficDataModule.ProlongationsData.CloseAll;
  TrafficDataModule.Rates.CloseAll;
  TrafficDataModule.PaymentOrderData.CloseAll;
  TrafficDataModule.CustomerData.CloseAll;
end;

procedure TFrmContractState.miPrintPaymentOrderClick(Sender: TObject);
var
  CurrentID : Integer;
begin
  CurrentID := TrafficDataModule.PaymentsData.FieldByName('ID').AsInteger;
  with TrafficDataModule.PaymentsData do
  try
    Filter :='ID = '+IntToStr(CurrentID);
    Filtered := True;
    with  TrafficDataModule.PaymentOrderData do
    begin
      SetVariable('ContractID',FContractID);
      Open;
    end;
    with PaymentOrder do
    begin
      FacticalDebtChild.Enabled := FieldByName('FacticalDebt').AsFloat<>0;
      FacticalInterestDebtChild.Enabled := FieldByName('InterestDebt').AsFloat<>0;
      OverdueDebtChild.Enabled := FieldByName('OverdueDebt').AsFloat<>0;
      OverdueInterestDebtChild.Enabled := FieldByName('OverdueInterestDebt').AsFloat<>0;

      Preview
    end;
  finally
    Filter :='';
    Filtered := False;
    TrafficDataModule.PaymentOrderData.CloseAll;
    Locate('ID',CurrentID,[])
  end;
end;

end.

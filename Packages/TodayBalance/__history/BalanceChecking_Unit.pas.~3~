unit BalanceChecking_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, ComCtrls, Mask, DBCtrls;

type
  TFrmBalanceChecking = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    STTargetDate: TStaticText;
    Label2: TLabel;
    STCurrency: TStaticText;
    STBranch: TStaticText;
    Panel2: TPanel;
    Panel3: TPanel;
    BalanceViewer: TDBGrid;
    Panel4: TPanel;
    Label3: TLabel;
    STCurrFormat: TStaticText;
    Panel5: TPanel;
    AccountViewer: TDBGrid;
    Panel6: TPanel;
    EditAccountNumber: TEdit;
    EditAccNumber: TEdit;
    BtnOk: TButton;
    Panel7: TPanel;
    GroupBox1: TGroupBox;
    TransactionsViewer: TDBGrid;
    DBEdit1: TDBEdit;
    DBText1: TDBText;
    DBEdit2: TDBEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EditAccountNumberKeyPress(Sender: TObject; var Key: Char);
    procedure EditAccNumberKeyPress(Sender: TObject; var Key: Char);
    procedure EditAccountNumberExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure MouseWheelHandler(var Message: TMessage); override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBalanceChecking: TFrmBalanceChecking;

implementation

uses TB_DataModuleImpl, TodayBalanceImpl, SBTranslateProc, sboapiDataModuleImpl;

{$R *.DFM}

procedure TFrmBalanceChecking.FormCreate(Sender: TObject);
begin
  SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TFrmBalanceChecking.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    Close
end;

procedure TFrmBalanceChecking.EditAccountNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if  Key = #13  then
  begin
    with BalanceViewer.DataSource.DataSet do
    Locate('AccountNumber',EditAccountNumber.Text ,[]);
  end;
end;

procedure TFrmBalanceChecking.EditAccNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if  Key = #13  then
  begin
    with AccountViewer.DataSource.DataSet do
    Locate('AccNumber',EditAccNumber.Text ,[]);
  end;
end;

procedure TFrmBalanceChecking.EditAccountNumberExit(Sender: TObject);
begin
  (Sender as TEdit).Text := '';
end;

procedure AcceptGridScroll(Grid : TDBGrid; WhellDelta : Integer);
begin
  with Grid , DataSource.DataSet do
  if  Focused  then
  begin
    SelectedRows.Clear;
    if WhellDelta < 0 then
      Next
    else
      Prior
  end;
end;

procedure TFrmBalanceChecking.MouseWheelHandler(var Message: TMessage);
var
  Delta : Integer;
begin
  Delta :=TCMMouseWheel(Message).WheelDelta;
  AcceptGridScroll(BalanceViewer,Delta);
  AcceptGridScroll(AccountViewer,Delta);
  AcceptGridScroll(TransactionsViewer,Delta);
  inherited;
end;

end.

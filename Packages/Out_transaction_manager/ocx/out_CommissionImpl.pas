unit out_CommissionImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids;

type
  TCommissionForm = class(TForm)
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
    procedure ButtonRefreshClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridCommissionDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MouseWheelHandler(var Message: TMessage);

  end;

var
  CommissionForm: TCommissionForm;

implementation

uses TransactionManagerImpl, TransactionDataModuleUnit;

{$R *.DFM}

procedure TCommissionForm.ButtonRefreshClick(Sender: TObject);
begin
with GridCommission.DataSource.DataSet do
 begin
  Close;
  Open;
 end;
end;

procedure TCommissionForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Ord(Key) = VK_RETURN then
  GridCommission.OnDblClick(Sender)
 else
 if Key = VK_ESCAPE then
  Close;
end;

procedure TCommissionForm.GridCommissionDblClick(Sender: TObject);
begin
with TransactionManagerForm, out_transactiondatamodule do
 begin
  OperationMode :=omCommission;
  Transactions.Insert;
  InitProperties;
 end;
end;
procedure TCommissionForm.MouseWheelHandler(var Message: TMessage);
begin
 inherited;
 if GridCommission.Focused then
  begin
   with TCMMouseWheel(Message), GridCommission.DataSource.DataSet do
    if WheelDelta < 0 then
      Next
    else
      Prior;
  end;
end;

procedure TCommissionForm.FormShow(Sender: TObject);
begin
 with GridCommission.DataSource.DataSet do
  if not Active then Open;
end;

procedure TCommissionForm.Button3Click(Sender: TObject);
begin
GridCommission.OnDblClick(Sender);
end;

procedure TCommissionForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 with TransactionManagerForm do
  ActionRefreshExecute(Sender);
end;

procedure TCommissionForm.ButtonCloseClick(Sender: TObject);
begin
 Close;
end;

end.

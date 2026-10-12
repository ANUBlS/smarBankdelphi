unit CommissionImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Grids, DBGrids, Mask, DBCtrls;

type
  TCommissionForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GridCommission: TDBGrid;
    Panel3: TPanel;
    ButtonRefresh: TButton;
    ButtonClose: TButton;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Button3: TButton;
    procedure ButtonRefreshClick(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridCommissionDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private 
    { Private declarations }
  public
    { Public declarations }
    procedure MouseWheelHandler(var Message: TMessage); override;
  end;

var
  CommissionForm: TCommissionForm;

implementation

uses TransactionDataModuleUnit, TransactionManagerImpl,
  TransactionPropertiesImpl,sboapiDataModuleImpl, SBTranslateProc;

{$R *.DFM}

procedure TCommissionForm.ButtonRefreshClick(Sender: TObject);
begin
 with GridCommission.DataSource.DataSet do
 begin
  Close;
  Open;
 end;
end;

procedure TCommissionForm.ButtonCloseClick(Sender: TObject);
begin
 Close;
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
 with TransactionManagerForm, TransactionDataModule do
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

procedure TCommissionForm.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

end.

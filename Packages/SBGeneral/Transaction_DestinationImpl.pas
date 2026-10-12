unit Transaction_DestinationImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Db, OracleData, ExtCtrls, DBCtrls;

type
  TTransactionDestinationForm = class(TForm)
    GridDest: TDBGrid;
    ButtonCancel: TButton;
    ButtonOk: TButton;
    TrDest: TOracleDataSet;
    TrDestData: TDataSource;
    DBNavigator1: TDBNavigator;
    procedure ButtonCancelClick(Sender: TObject);
    procedure GridDestDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function GetValue: String;
  public
    { Public declarations }
    property Value: String read GetValue;
    procedure MouseWheelHandler(var Message: TMessage); override;
  end;

var
  TransactionDestinationForm: TTransactionDestinationForm;

implementation

uses sboapiDataModuleImpl, SBTranslateProc;

{$R *.DFM}

function TTransactionDestinationForm.GetValue: String;
begin
  Result := TrDest.FieldByName('NAME').AsString;
end;

procedure TTransactionDestinationForm.ButtonCancelClick(Sender: TObject);
begin
 Close;
end;

procedure TTransactionDestinationForm.MouseWheelHandler(var Message: TMessage);
begin
 inherited;
 if GridDest.Focused then
  begin
   GridDest.SelectedRows.Clear;
   with TCMMouseWheel(Message), GridDest.DataSource.DataSet do
    if WheelDelta < 0 then
      Next
    else
      Prior;
   GridDest.Repaint;   
  end;
end;


procedure TTransactionDestinationForm.GridDestDblClick(Sender: TObject);
begin
 if not (GridDest.DataSource.State in [dsInsert, dsEdit]) then
  ModalResult :=mrOk;
end;

procedure TTransactionDestinationForm.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TTransactionDestinationForm.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Ord(Key) = VK_RETURN then
  ModalResult :=mrOk
 else 
 if Key = VK_ESCAPE then
  Close;
end;

end.

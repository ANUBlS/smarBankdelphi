unit UnitTr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids;

type
  TFrmTransaction = class(TForm)
    GridAccount1: TDBGrid;
    Panel1: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure GridAccount1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

    { Private declarations }
  public
    v_transaction: integer;

    { Public declarations }
  end;

var
  FrmTransaction: TFrmTransaction;

implementation

uses DMBusProcSetimpl, BusinessProcessSetupImpl,SBTranslateProc,sboapidatamoduleimpl;

{$R *.dfm}

procedure TFrmTransaction.Edit1Change(Sender: TObject);
begin
  if Edit1.Text <> '' then

    DMBusProcSet.ODS_Transaction.SQL[2] := ' where id like (''%' +
      Edit1.Text + '%'')'

  else
    DMBusProcSet.ODS_Transaction.SQL[2] := '';
  DMBusProcSet.ODS_Transaction.Refresh;
end;

procedure TFrmTransaction.Edit2Change(Sender: TObject);
begin
  if Edit2.Text <> '' then
    DMBusProcSet.ODS_Transaction.SQL[3] := ' where name  like (''%' +
      Edit2.Text + '%'')'
  else
    DMBusProcSet.ODS_Transaction.SQL[3] := '';
  DMBusProcSet.ODS_Transaction.Refresh;
end;

procedure TFrmTransaction.FormCreate(Sender: TObject);
begin
  SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);

end;

procedure TFrmTransaction.GridAccount1DblClick(Sender: TObject);
begin
  v_transaction := DMBusProcSet.ODS_Transactionid.AsInteger;

  FrmTransaction.Close;

end;

end.

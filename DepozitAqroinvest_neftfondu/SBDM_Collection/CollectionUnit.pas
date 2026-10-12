unit CollectionUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids;

type
  TFrmCollection = class(TForm)
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
    DBGridCollection: TDBGrid;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
   
  public
    FContractID : LongInt;
  end;

var
  FrmCollection: TFrmCollection;

implementation

uses
    CollectionDataModUnit ,DepositDataModuleUnit ,sboapiDataModuleImpl;

{$R *.DFM}

procedure TFrmCollection.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if  Key = #27  then
    ModalResult := mrCancel;
end;

procedure TFrmCollection.FormCreate(Sender: TObject);
begin
  CollectionDataMod := TCollectionDataMod.Create(Self);
  Caption := Caption + DepositDataModule.Deposits.FieldByName('ContractNo').AsString;
end;

procedure TFrmCollection.FormShow(Sender: TObject);
begin
  with CollectionDataMod.CollectionData do
  begin
    SetVariable('ID#',FContractID);
    Open
  end;
end;

end.

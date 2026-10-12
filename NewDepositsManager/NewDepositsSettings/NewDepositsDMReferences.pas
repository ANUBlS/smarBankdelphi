unit NewDepositsDMReferences;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TNewDepositsDataModReferences = class(TDataModule)
    TVSubItems: TOracleDataSet;
    TVSubItemsID: TFloatField;
    TVSubItemsNAME: TStringField;
    TVSubItemsLNAME: TStringField;
    TVSubItemsPARENTID: TFloatField;
    TVSubItemsVALUE: TStringField;
    TVSubItemsSOURCELIST: TStringField;
    ReferLink: TOracleDataSet;
    ReferLinkID: TFloatField;
    ReferLinkNAME: TStringField;
    ReferLinkLNAME: TStringField;
    ReferLinkPARENTID: TFloatField;
    ReferLinkVALUE: TStringField;
    ReferLinkSOURCELIST: TStringField;
    ReferPackage: TOraclePackage;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure CategoriesAfterPost(DataSet: TDataSet);
    procedure AccountSettingsAfterPost(DataSet: TDataSet);
    procedure DepositTypesAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewDepositsDataModReferences: TNewDepositsDataModReferences;

implementation
       uses  sboapiDataModuleImpl;
{$R *.dfm}

procedure TNewDepositsDataModReferences.DataModuleCreate(Sender: TObject);
begin
   //Reliability.Open;
   ReferLink.Open;
end;

procedure TNewDepositsDataModReferences.DataModuleDestroy(Sender: TObject);
begin
  //Reliability.Close;
  ReferLink.Close;
end;

procedure TNewDepositsDataModReferences.CategoriesAfterPost(DataSet: TDataSet);
begin
   DataSet.Refresh;
end;
procedure TNewDepositsDataModReferences.AccountSettingsAfterPost(DataSet: TDataSet);
begin
   DataSet.Refresh;
end;

procedure TNewDepositsDataModReferences.DepositTypesAfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;
end.

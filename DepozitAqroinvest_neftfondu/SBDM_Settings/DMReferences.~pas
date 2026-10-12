unit DMReferences;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TDataModReferences = class(TDataModule)
    TVSubItems: TOracleDataSet;
    ReferLink: TOracleDataSet;
    TVSubItemsID: TFloatField;
    TVSubItemsNAME: TStringField;
    TVSubItemsLNAME: TStringField;
    TVSubItemsPARENTID: TFloatField;
    TVSubItemsVALUE: TStringField;
    TVSubItemsSOURCELIST: TStringField;
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
  DataModReferences: TDataModReferences;

implementation

uses  sboapiDataModuleImpl;
{$R *.DFM}


procedure TDataModReferences.DataModuleCreate(Sender: TObject);
begin
   //Reliability.Open;
   ReferLink.Open;
end;

procedure TDataModReferences.DataModuleDestroy(Sender: TObject);
begin
  //Reliability.Close;
  ReferLink.Close;
end;

procedure TDataModReferences.CategoriesAfterPost(DataSet: TDataSet);
begin
   DataSet.Refresh;
end;
procedure TDataModReferences.AccountSettingsAfterPost(DataSet: TDataSet);
begin
   DataSet.Refresh;
end;

procedure TDataModReferences.DepositTypesAfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

end.

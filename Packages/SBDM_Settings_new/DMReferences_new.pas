unit DMReferences_new;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TDataModReferences_new = class(TDataModule)
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
  DataModReferences_new: TDataModReferences_new;

implementation
       uses  sboapiDataModuleImpl;
{$R *.dfm}

procedure TDataModReferences_new.DataModuleCreate(Sender: TObject);
begin
   //Reliability.Open;
   ReferLink.Open;
end;

procedure TDataModReferences_new.DataModuleDestroy(Sender: TObject);
begin
  //Reliability.Close;
  ReferLink.Close;
end;

procedure TDataModReferences_new.CategoriesAfterPost(DataSet: TDataSet);
begin
   DataSet.Refresh;
end;
procedure TDataModReferences_new.AccountSettingsAfterPost(DataSet: TDataSet);
begin
   DataSet.Refresh;
end;

procedure TDataModReferences_new.DepositTypesAfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;
end.

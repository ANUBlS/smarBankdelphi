unit DatModCustmerImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TDatModCustmer = class(TDataModule)
    RelationData: TOracleDataSet;
    RelationDataID: TFloatField;
    RelationDataNAME: TStringField;
    Relation: TDataSource;
    ClientGroupData: TOracleDataSet;
    ClientGroupDataID: TFloatField;
    ClientGroupDataNAME: TStringField;
    ClientGroup: TDataSource;
    EstateTypeData: TOracleDataSet;
    EstateTypeDataID: TFloatField;
    EstateTypeDataNAME: TStringField;
    EstateType: TDataSource;
    OrganizationTypeData: TOracleDataSet;
    OrganizationTypeDataID: TFloatField;
    OrganizationTypeDataNAME: TStringField;
    OrganizationType: TDataSource;
    ActionAreaData: TOracleDataSet;
    ActionAreaDataID: TFloatField;
    ActionAreaDataNAME: TStringField;
    ActionArea: TDataSource;
    BranchData: TOracleDataSet;
    BranchDataID: TFloatField;
    BranchDataNAME: TStringField;
    Branch: TDataSource;
    TaxAreaData: TOracleDataSet;
    TaxAreaDataID: TFloatField;
    TaxAreaDataNAME: TStringField;
    TaxArea: TDataSource;
    FilialsData: TOracleDataSet;
    Filials: TDataSource;
    Customers: TDataSource;
    ActiveCustomerList: TOracleDataSet;
    ActiveCustomerListID: TIntegerField;
    ActiveCustomerListOP_ID: TFloatField;
    ActiveCustomerListOPEN_DAT: TDateTimeField;
    ActiveCustomerListCLOSE_DAT: TDateTimeField;
    ActiveCustomerListNEREZIDENT: TFloatField;
    ActiveCustomerListPRINAD_KOD: TFloatField;
    ActiveCustomerListNAME: TStringField;
    ActiveCustomerListSHORT_NAME: TStringField;
    ActiveCustomerListGROUP_KLIE: TFloatField;
    ActiveCustomerListVID_SOB: TFloatField;
    ActiveCustomerListORG_SOB: TFloatField;
    ActiveCustomerListSFERA_DEY: TFloatField;
    ActiveCustomerListOTRASL: TFloatField;
    ActiveCustomerListNALOG_KOD: TFloatField;
    ActiveCustomerListKOD_OKPRO: TFloatField;
    ActiveCustomerListDAT_NAL: TDateTimeField;
    ActiveCustomerListDAT_USTAV: TDateTimeField;
    ActiveCustomerListBIK: TFloatField;
    ActiveCustomerListRealINN: TStringField;
    ActiveCustomerListOTV_LICO: TStringField;
    ActiveCustomerListOTV_PASSPORT: TStringField;
    ActiveCustomerListOTV_ISSUED: TStringField;
    ActiveCustomerListOTV_ISDATE: TDateTimeField;
    ActiveCustomerListINN: TStringField;
    cm_credit: TOraclePackage;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DatModCustmer: TDatModCustmer;

implementation

{$R *.DFM}
uses CMOracleApiDataModuleImpl;

procedure TDatModCustmer.DataModuleCreate(Sender: TObject);
begin
//   ActiveCustomerList.Open;
   RelationData.Open;
   ClientGroupData.Open;
   EstateTypeData.Open;
   OrganizationTypeData.Open;
   ActionAreaData.Open;
   BranchData.Open;
   TaxAreaData.Open;
   FilialsData.Open;
end;

procedure TDatModCustmer.DataModuleDestroy(Sender: TObject);
begin
  // ActiveCustomerList.CloseAll;
   RelationData.CloseAll;
   ClientGroupData.CloseAll;
   EstateTypeData.CloseAll;
   OrganizationTypeData.CloseAll;
   ActionAreaData.CloseAll;
   BranchData.CloseAll;
   TaxAreaData.CloseAll;
   FilialsData.CloseAll;

end;

end.

unit UnitDataModBBPayings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TDataModBBPayings = class(TDataModule)
    ODS_ABNServices: TOracleDataSet;
    DS_ABNServices: TDataSource;
    ODS_Contracts: TOracleDataSet;
    DS_Contracts: TDataSource;
    ODS_Services: TOracleDataSet;
    DS_Services: TDataSource;
    OrPack_CableManager: TOraclePackage;
    OrPack_SBOP: TOraclePackage;
    ODS_ABNServicesID: TFloatField;
    ODS_ABNServicesABN_NAME: TStringField;
    ODS_ABNServicesCONTRACT_ID: TFloatField;
    ODS_ABNServicesCONTRACT_NUM: TStringField;
    ODS_ABNServicesREG_TIME: TDateTimeField;
    ODS_ABNServicesSRV_ID: TFloatField;
    ODS_ABNServicesSERVICE: TStringField;
    ODS_ABNServicesAMOUNT: TFloatField;
    ODS_ABNServicesAMOUNT_EQV: TFloatField;
    ODS_ABNServicesCURR_CODE: TFloatField;
    ODS_ABNServicesSTATUS: TFloatField;
    ODS_ABNServicesDONE_TIME: TDateTimeField;
    ODS_ABNServicesSYS_DATE: TDateTimeField;
    ODS_ABNServicesPAYMETHOD: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModBBPayings: TDataModBBPayings;

implementation

uses sboapidatamoduleimpl;

{$R *.DFM}

end.

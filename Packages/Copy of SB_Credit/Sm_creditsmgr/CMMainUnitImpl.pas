unit CMMainUnitImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Db, OracleData;

type
  TCreditsMgrMainDataModule = class(TDataModule)
    CR_ACTIVE: TOracleDataSet;
    DataSrcCR_ACTIVE: TDataSource;
    VisibleFieldsData: TOracleDataSet;
    CR_ADMIN: TOraclePackage;
    VisibleFieldsDataSEQNO: TFloatField;
    VisibleFieldsDataFROZEN: TFloatField;
    VisibleFieldsDataVISIBLE: TFloatField;
    CR_ACTIVEID: TFloatField;
    CR_ACTIVECURRENCY: TFloatField;
    CR_ACTIVEBOOROWERID: TFloatField;
    CR_ACTIVECREDITLINEAMOUNT: TFloatField;
    CR_ACTIVEANNUALYINTERESTRATE: TFloatField;
    CR_ACTIVEINITIALAMOUNT: TFloatField;
    CR_ACTIVEANNUALYOVERDUERATE: TFloatField;
    CR_ACTIVEANNUALYPENALTYRATE: TFloatField;
    CR_ACTIVEDATEOFCONCLUSION: TDateTimeField;
    CR_ACTIVEDUEDATEFIRSTCONTRACT: TDateTimeField;
    CR_ACTIVEDUEDATELASTCONTRACT: TDateTimeField;
    CR_ACTIVEBRANCHID: TFloatField;
    CR_ACTIVEUSID: TFloatField;
    CR_ACTIVECUSTOMERTYPE: TFloatField;
    CR_ACTIVECREDITTYPE: TFloatField;
    CR_ACTIVEPERSONALTYPE: TFloatField;
    CR_ACTIVESTATUS: TFloatField;
    CR_ACTIVESTOPCALCDATE: TDateTimeField;
    CR_ACTIVEREST: TFloatField;
    CR_ACTIVEINTERESTREST: TFloatField;
    CR_ACTIVEDUEREST: TFloatField;
    CR_ACTIVEDUEINTERESTREST: TFloatField;
    CR_ACTIVEPENALTYREST: TFloatField;
    CR_ACTIVERESERVEID: TFloatField;
    CR_ACTIVEDUERESERVEID: TFloatField;
    CR_ACTIVEOBLIGATION: TFloatField;
    CR_ACTIVEPLEDGEPRICE: TFloatField;
    CR_ACTIVEPLEDGEID: TFloatField;
    CR_ACTIVEBOOROWERREST: TFloatField;
    CR_ACTIVENUMBEROFCREDIT: TWideStringField;
    CR_ACTIVEPURPOSEOFCREDIT: TWideStringField;
    CR_ACTIVEUSRGROUP: TFloatField;
    CR_ACTIVECONTRACTACCNO: TWideStringField;
    CR_ACTIVEINTERESTACCNO: TWideStringField;
    CR_ACTIVEDUELOANACCNO: TWideStringField;
    CR_ACTIVELOANACCNO: TWideStringField;
    CR_ACTIVEVAL_NAME: TWideStringField;
    CR_ACTIVENAME: TWideStringField;
    VisibleFieldsDataFIELDNAME: TWideStringField;
    VisibleFieldsDataFIELDDESC: TWideStringField;
    SeqDataSet: TOracleDataSet;
    SeqDataSetSEQNO: TFloatField;
    SeqDataSetFIELDNAME: TWideStringField;
    SeqDataSetFROZEN: TFloatField;
    SeqDataSetVISIBLE: TFloatField;
    SeqDataSetFIELDDESC: TWideStringField;
    CR_ACTIVEINAME: TWideStringField;
    CR_ACTIVEREGISTRYNO: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CreditsMgrMainDataModule: TCreditsMgrMainDataModule;

implementation

uses sboapiDataModuleImpl;
{$R *.DFM}

procedure TCreditsMgrMainDataModule.DataModuleCreate(Sender: TObject);
begin


//CM_ACTIVE.Active;
end;

end.

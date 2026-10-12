unit InsDataMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TPayDataMod = class(TDataModule)
    ODSPayments: TOracleDataSet;
    DSPayments: TDataSource;
    ODSPaymentsID: TFloatField;
    ODSPaymentsPLANID: TFloatField;
    ODSPaymentsPAYDATE: TDateTimeField;
    ODSPaymentsAMMOUNT: TFloatField;
    ODSPaymentsTRAID: TFloatField;
    ODSPaymentsINS_ID: TFloatField;
    ODSPaymentsNAME: TWideStringField;
    ODSPlan: TOracleDataSet;
    DSPlan: TDataSource;
    OPSBOP: TOraclePackage;
    OPCOMMON: TOraclePackage;
    ODSPlanID: TFloatField;
    ODSPlanPAYDATE: TWideStringField;
    ODSPlanAMMOUNT: TFloatField;
    ODSPlanSTATUS: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PayDataMod: TPayDataMod;

implementation

uses sboapiDataModuleImpl;

{$R *.DFM}



end.

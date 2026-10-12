unit InfoOutIntImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TInfOutIntDatMod = class(TDataModule)
    IntPlaceOutBDatSet: TOracleDataSet;
    IntPlaceOutBDatSrc: TDataSource;
    CM_RETURN_INT_OB: TOraclePackage;
    IntPlaceOutBDatSetCREDITID: TFloatField;
    IntPlaceOutBDatSetHDATE: TDateTimeField;
    IntPlaceOutBDatSetSTOPCALCDATE: TDateTimeField;
    IntPlaceOutBDatSetREST: TFloatField;
    IntPlaceOutBDatSetINTERESTREST: TFloatField;
    IntPlaceOutBDatSetDUEREST: TFloatField;
    IntPlaceOutBDatSetDUEINTERESTREST: TFloatField;
    IntPlaceOutBDatSetNAME: TStringField;
    IntPlaceOutBDatSetSUMREST: TFloatField;
    IntPlaceOutBDatSetNUM: TStringField;
    out_paymentsds: TDataSource;
    out_payments: TOracleDataSet;
    out_paymentsID: TFloatField;
    out_paymentsCREDITID: TFloatField;
    out_paymentsTRDATE: TDateTimeField;
    out_paymentsTRAMOUNT: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InfOutIntDatMod: TInfOutIntDatMod;

implementation

{$R *.DFM}
uses CMOracleAPIDataModuleImpl;

end.

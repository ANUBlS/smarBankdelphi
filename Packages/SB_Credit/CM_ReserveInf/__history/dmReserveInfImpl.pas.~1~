unit dmReserveInfImpl;

interface

uses              
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TdmReserveInf = class(TDataModule)
    ReserveInf: TOracleDataSet;
    DatSetValute: TOracleDataSet;
    DatSetValuteVALUTE: TIntegerField;
    DatSetValuteVALU_NAME: TStringField;
    DatSrcValute: TDataSource;
    DatSetFilials: TOracleDataSet;
    DatSrcFilials: TDataSource;
    DatSetPersons: TOracleDataSet;
    DatSetPersonsID: TFloatField;
    DatSetPersonsDESCRIPION: TStringField;
    DatSrcPersons: TDataSource;
    DatSetCategories: TOracleDataSet;
    DatSetCategoriesID: TFloatField;
    DatSetCategoriesDESCRIPTION: TStringField;
    DatSrctCategories: TDataSource;
    DatSetCreditTypes: TOracleDataSet;
    DatSetCreditTypesID: TFloatField;
    DatSetCreditTypesDESCRIPTION: TStringField;
    DatSrcCreditTypes: TDataSource;
    DatSetReserves: TOracleDataSet;
    DatSetReservesID: TFloatField;
    DatSetReservesDESCRIPTION: TStringField;
    DatSrcReserves: TDataSource;
    ReserveInfLOANACCNO: TStringField;
    ReserveInfNAME: TStringField;
    ReserveInfDATEOFCONCLUSION: TDateTimeField;
    ReserveInfDUEDATEFIRSTCONTRACT: TDateTimeField;
    ReserveInfDUEDATELASTCONTRACT: TDateTimeField;
    ReserveInfREST: TFloatField;
    ReserveInfPLEDGEPRICE: TFloatField;
    ReserveInfPLANREST: TFloatField;
    ReserveInfRESPERCENT: TFloatField;
    ReserveInfPL: TFloatField;
    ReserveInfEXDATCOUNT: TFloatField;
    ReserveInfEKREST: TFloatField;
    ReserveInfDUEREST: TFloatField;
    ReserveInfEKDUEREST: TFloatField;
    ReserveInfDESCRIPTION: TStringField;
    ReserveInfODEMELI_FAIZ: TFloatField;
    ReserveInfEKV_INTREST: TFloatField;
    ReserveInfINTERESTREST: TFloatField;
    ReserveInfPENALTYREST: TFloatField;
    ReserveInfSTOPCALCDATE: TDateTimeField;
    ReserveInfGROVNAME: TStringField;
    ReserveInfPR_NUMBEROFCREDIT: TStringField;
    ReserveInfNUMBEROFBANKCREDIT: TStringField;
    ReserveInfRESOSTAT: TFloatField;
    ReserveInfREGISTRYNO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
   function checkzero(x:real):real;
  public
    { Public declarations }
  end;

var
  dmReserveInf: TdmReserveInf;

implementation

{$R *.DFM}

uses CMOracleApiDataModuleImpl;


function TdmReserveInf.checkzero(x:real):real;
begin
    if x = 0 then result := 1
    else result := x;
end;


procedure TdmReserveInf.DataModuleCreate(Sender: TObject);
begin
    DatSetValute.open;
    DatSetFilials.open;
    DatSetPersons.open;
    DatSetCategories.open;
    DatSetCreditTypes.open;
    DatSetReserves.open;
end;

procedure TdmReserveInf.DataModuleDestroy(Sender: TObject);
begin
    DatSetValute.Close;
    DatSetFilials.Close;
    DatSetPersons.Close;
    DatSetCategories.Close;
    DatSetCreditTypes.Close;
    DatSetReserves.Close;

end;

end.

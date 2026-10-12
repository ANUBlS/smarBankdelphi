unit dmRound_upCreditRepImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TdmRound_upCreditRep = class(TDataModule)
    sysdat: TOracleDataSet;
    filials: TOracleDataSet;
    CreditTypes: TOracleDataSet;
    valutes: TOracleDataSet;
    filialsds: TDataSource;
    CreditTypesds: TDataSource;
    valutesds: TDataSource;
    ODSmain: TOracleDataSet;
    ODSmainds: TDataSource;
    ODSmainDESCRIPTION: TWideStringField;
    ODSmainCOUNTCRD: TFloatField;
    ODSmainINITIALAMOUNT: TFloatField;
    ODSmainREST: TFloatField;
    ODSmainINTERESTREST: TFloatField;
    ODSmainPROGNOZ: TFloatField;
    ODSmainDELTA: TFloatField;
    Queries: TOracleDataSet;
    ThisMonTranched: TOracleDataSet;
    ThisMonTranchedds: TDataSource;
    ThisMonTranchedCNT: TFloatField;
    ThisMonTranchedTRAMT: TFloatField;
    ThisMonTranchedPROQNOZ: TFloatField;
    ThisMonTranchedDELTA: TFloatField;
    ODSmainsmcountcrd: TFloatField;
    ODSmainID: TFloatField;
    ODSDetailds: TDataSource;
    ODSDetail: TOracleDataSet;
    ODSDetailFILIALNAME: TWideStringField;
    ODSDetailDESCRIPTION: TWideStringField;
    ODSDetailVALU_NAME: TWideStringField;
    ODSDetailNUMBEROFCREDIT: TWideStringField;
    ODSDetailACC_NO: TWideStringField;
    ODSDetailCUSTNAME: TWideStringField;
    ODSDetailCREDITLINEAMOUNT: TFloatField;
    ODSDetailANNUALYINTERESTRATE: TFloatField;
    ODSDetailPERCENT: TFloatField;
    ODSDetailREST: TFloatField;
    ODSDetailINTERESTREST: TFloatField;
    ODSDetailDATEOFCONCLUSION: TDateTimeField;
    ODSDetailDUEDATEFIRSTCONTRACT: TDateTimeField;
    ODSmainCEOFCOUNTCRD: TFloatField;
    ODSmainCEOFINITIALAMT: TFloatField;
    ODSmainROUNDINT: TFloatField;
    ODSmainceofcntcrd: TWideStringField;
    ODSmainceofiamt: TWideStringField;
    ODSmainceofroundint: TWideStringField;
    ODSmainCEOFREST: TFloatField;
    ODSmainceofCEOFREST: TWideStringField;
    ODSDetail30ds: TDataSource;
    ODSDetail30: TOracleDataSet;
    ODSDetail30FILIALNAME: TWideStringField;
    ODSDetail30DESCRIPTION: TWideStringField;
    ODSDetail30VALU_NAME: TWideStringField;
    ODSDetail30NUMBEROFCREDIT: TWideStringField;
    ODSDetail30ACC_NO: TWideStringField;
    ODSDetail30CUSTNAME: TWideStringField;
    ODSDetail30CREDITLINEAMOUNT: TFloatField;
    ODSDetail30ANNUALYINTERESTRATE: TFloatField;
    ODSDetail30PERCENT: TFloatField;
    ODSDetail30REST: TFloatField;
    ODSDetail30INTERESTREST: TFloatField;
    ODSDetail30DATEOFCONCLUSION: TDateTimeField;
    ODSDetail30DUEDATEFIRSTCONTRACT: TDateTimeField;
    ODSDetailAllds: TDataSource;
    ODSDetailAll: TOracleDataSet;
    ODSDetailAllFILIALNAME: TWideStringField;
    ODSDetailAllDESCRIPTION: TWideStringField;
    ODSDetailAllVALU_NAME: TWideStringField;
    ODSDetailAllNUMBEROFCREDIT: TWideStringField;
    ODSDetailAllACC_NO: TWideStringField;
    ODSDetailAllCUSTNAME: TWideStringField;
    ODSDetailAllCREDITLINEAMOUNT: TFloatField;
    ODSDetailAllANNUALYINTERESTRATE: TFloatField;
    ODSDetailAllPERCENT: TFloatField;
    ODSDetailAllREST: TFloatField;
    ODSDetailAllINTERESTREST: TFloatField;
    ODSDetailAllDATEOFCONCLUSION: TDateTimeField;
    ODSDetailAllDUEDATEFIRSTCONTRACT: TDateTimeField;
    ODSmainceofdelta: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ODSmainCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRound_upCreditRep: TdmRound_upCreditRep;

implementation

{$R *.DFM}
uses sboapiDataModuleImpl;

procedure TdmRound_upCreditRep.DataModuleCreate(Sender: TObject);
begin
    sysdat.open;
    filials.open;
    CreditTypes.open;
    valutes.open;
end;

procedure TdmRound_upCreditRep.DataModuleDestroy(Sender: TObject);
begin
   sysdat.CloseAll;
    filials.CloseAll;
    CreditTypes.CloseAll;
    valutes.CloseAll;
end;

procedure TdmRound_upCreditRep.ODSmainCalcFields(DataSet: TDataSet);
begin
   with  DataSet do begin
   FieldByName('ceofCEOFCOUNTCRD').AsString := FormatFloat('#,##0.00',FieldByName('CEOFCOUNTCRD').AsFloat)+'%';
   FieldByName('ceofCEOFINITIALAMT').AsString := FormatFloat('#,##0.00',FieldByName('CEOFINITIALAMT').AsFloat)+'%';
   FieldByName('ceofROUNDINT').AsString := FormatFloat('#,##0.00',FieldByName('ROUNDINT').AsFloat)+'%';
   FieldByName('ceofCEOFREST').AsString := FormatFloat('#,##0.00',FieldByName('CEOFREST').AsFloat)+'%';
   FieldByName('ceofdelta').AsString := FormatFloat('#,##0.00',FieldByName('DELTA').AsFloat)+'%';
   end;
end;

end.

unit dmipexpImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  Tdmipexp = class(TDataModule)
    OracleDataSet1: TOracleDataSet;
    OracleDataSet1CUSTNAME: TStringField;
    OracleDataSet1CUSTINFNAME: TStringField;
    OracleDataSet1SORNAME: TStringField;
    OracleDataSet1FATHERNAME: TStringField;
    OracleDataSet1BIRTHDAY: TDateTimeField;
    OracleDataSet1ADDRESS: TStringField;
    OracleDataSet1CITY: TStringField;
    OracleDataSet1WORK: TStringField;
    OracleDataSet1WORKPLACE: TStringField;
    OracleDataSet1Telmob: TStringField;
    OracleDataSet1PHONE_H: TStringField;
    OracleDataSet1PHONE_W: TStringField;
    OracleDataSet1E_MAIL: TStringField;
    OracleDataSet1URL: TStringField;
    OracleDataSet1GARANTED: TStringField;
    OracleDataSet1PASSER: TStringField;
    OracleDataSet1PASPNUM: TStringField;
    OracleDataSet1PASPDATE: TDateTimeField;
    OracleDataSet1PASPPLACE: TStringField;
    OracleDataSet1MONTHLYPROFIT: TFloatField;
    OracleDataSet1UNIQUEINSID: TStringField;
    OracleDataSet1BB_INN: TStringField;
    OracleDataSet1DSDesigner: TStringField;
    OracleDataSet1DSDesigner2: TFloatField;
    OracleDataSet1DSDesigner3: TDateTimeField;
    OracleDataSet1DSDesigner4: TDateTimeField;
    OracleDataSet1DSDesigner5: TDateTimeField;
    DataSetKredit: TOracleDataSet;
    DataSrcKredit: TDataSource;
    DataSetKreditCREDITLINEAMOUNT: TFloatField;
    DataSetKreditANNUALYINTERESTRATE: TFloatField;
    DataSetKreditDATEOFCONCLUSION: TDateTimeField;
    DataSetKreditDUEDATEFIRSTCONTRACT: TDateTimeField;
    DataSetKreditANNUALBANKRATE: TFloatField;
    DataSetKreditNEWFINANCEAMOUNT: TFloatField;
    DataSetKreditNUMBEROFBANKCREDIT: TStringField;
    DataSetKreditID: TFloatField;
    OracleDataSet3: TOracleDataSet;
    DataSource3: TDataSource;
    DataSetKreditDD: TFloatField;
    DataSrcIP: TDataSource;
    DataSetIP: TOracleDataSet;
    DataSetKreditDESCRIPTION: TStringField;
    DataSetKreditNOW_DUEDATEFIRSTCONTRACT: TDateTimeField;
    OracleDataSet1NEW_MARRIAGE: TStringField;
    DataSetIPPREDADDRESS: TStringField;
    DataSetIPPREDPLATZ: TFloatField;
    DataSetIPOWNERNAME: TStringField;
    DataSetIPPREDCOST: TFloatField;
    DataSetIPPROPLAWNO: TStringField;
    DataSetIPPROPLAWREGNO: TStringField;
    DataSetIPCONTRACTNO: TStringField;
    DataSetIPCONTRACTDATE: TDateTimeField;
    DataSetIPCONTRACTNOT: TStringField;
    DataSetIPPAPERNO: TStringField;
    DataSetIPPAPERDATE: TDateTimeField;
    DataSetIPINSURANCEAMOUNT: TFloatField;
    DataSetIPINSURANCENO: TStringField;
    DataSetIPINSURANCEDATE: TDateTimeField;
    DataSetIPALEVPREDADDRESS: TStringField;
    DataSetIPALEVPREDCOST: TFloatField;
    DataSetIPDESCRIPTION: TStringField;
    DataSetIPIN_DESCRIPTION: TStringField;
    DataSetIPQIY_DESCRIPTION: TStringField;
    DataSetIPINTEREST: TFloatField;
    DataSetIPIPINTEREST: TFloatField;
    DataSetIPPLEDGEINSLASTDATE: TDateTimeField;
    DataSetIPSSUDA: TStringField;
    DataSetIPADIEHTIYAT: TStringField;
    DataSetIPMEQSEDLIEHTIYAT: TStringField;
    DataSetIPGECIKMISHSSDAHES: TStringField;
    DataSetIPGECIKMISHFAIZ: TStringField;
    ValuteDataSet: TOracleDataSet;
    srcValute: TDataSource;
    srcBranch: TDataSource;
    BranchDataSet: TOracleDataSet;
    srcUsrGrp: TDataSource;
    UsrGrpDataSet: TOracleDataSet;
    srcPersonelType: TDataSource;
    PersonelTypeDataSet: TOracleDataSet;
    OracleDataSet1OPEN_DAT: TDateTimeField;
    Insurances: TDataSource;
    ODSInsurance: TOracleDataSet;
    Family: TDataSource;
    ODSFamily: TOracleDataSet;
    Periods: TDataSource;
    ODSPeriods: TOracleDataSet;
    DataSetIPID: TFloatField;
    OracleDataSet1BB_FAMILYSTATUS: TFloatField;
    OracleDataSet1now_bb_familystatus: TStringField;
    OracleDataSet1INSURANCECOMP: TFloatField;
    OracleDataSet1now_INSURANCECOMP: TStringField;
    OracleDataSet1INSPERIODID: TFloatField;
    OracleDataSet1now_INSPERIODID: TStringField;
    OracleDataSet1ID: TFloatField;
    OracleDataSet1NEW_PASSTYPE: TStringField;
    DSetUustinfo1: TOracleDataSet;
    DSetCustipinfo1: TOracleDataSet;
    DSetUustinfo1ID: TFloatField;
    DSetUustinfo1CUSTNAME: TStringField;
    DSetUustinfo1OPEN_DAT: TDateTimeField;
    DSetUustinfo1CUSTINFNAME: TStringField;
    DSetUustinfo1SORNAME: TStringField;
    DSetUustinfo1FATHERNAME: TStringField;
    DSetUustinfo1BIRTHDAY: TStringField;
    DSetUustinfo1ADDRESS: TStringField;
    DSetUustinfo1CITY: TStringField;
    DSetUustinfo1WORK: TStringField;
    DSetUustinfo1WORKPLACE: TStringField;
    DSetUustinfo1Telmob: TStringField;
    DSetUustinfo1PHONE_H: TStringField;
    DSetUustinfo1PHONE_W: TStringField;
    DSetUustinfo1E_MAIL: TStringField;
    DSetUustinfo1URL: TStringField;
    DSetUustinfo1GARANTED: TStringField;
    DSetUustinfo1PASSER: TStringField;
    DSetUustinfo1PASPNUM: TStringField;
    DSetUustinfo1PASPDATE: TStringField;
    DSetUustinfo1PASPPLACE: TStringField;
    DSetCustipinfo1ID: TFloatField;
    DSetCustipinfo1CUSTNAME: TStringField;
    DSetCustipinfo1MARRIAGE: TStringField;
    DSetCustipinfo1MONTHLYPROFIT: TStringField;
    DSetCustipinfo1PASSTYPE: TStringField;
    DSetCustipinfo1UNIQUEINSID: TStringField;
    DSetCustipinfo1BB_INN: TStringField;
    DSetCustipinfo1DSDesigner: TStringField;
    DSetCustipinfo1DSDesigner2: TStringField;
    DSetCustipinfo1DSDesigner3: TStringField;
    DSetCustipinfo1DSDesigner4: TStringField;
    DSetCustipinfo1DSDesigner5: TStringField;
    OracleDataSet2: TOracleDataSet;
    DSetUustinfo: TOracleDataSet;
    DSetUustinfoID: TFloatField;
    DSetUustinfoFILTER: TFloatField;
    DSetUustinfoCUSTNAME: TStringField;
    DSetUustinfoOPEN_DAT: TDateTimeField;
    DSetUustinfoCUSTINFNAME: TStringField;
    DSetUustinfoSORNAME: TStringField;
    DSetUustinfoFATHERNAME: TStringField;
    DSetUustinfoBIRTHDAY: TDateTimeField;
    DSetUustinfoBIRTHPLACE: TStringField;
    DSetUustinfoADDRESS: TStringField;
    DSetUustinfoCITY: TStringField;
    DSetUustinfoWORK: TStringField;
    DSetUustinfoWORKPLACE: TStringField;
    DSetUustinfoTelmob: TStringField;
    DSetUustinfoPHONE_H: TStringField;
    DSetUustinfoPHONE_W: TStringField;
    DSetUustinfoE_MAIL: TStringField;
    DSetUustinfoURL: TStringField;
    DSetUustinfoGARANTED: TStringField;
    DSetUustinfoPASSER: TStringField;
    DSetUustinfoPASPNUM: TStringField;
    DSetUustinfoPASPDATE: TDateTimeField;
    DSetUustinfoPASPPLACE: TStringField;
    DSetUustinfoNOTE: TStringField;
    DataSetKreditNAME: TStringField;
    DataSetIPNAME: TStringField;
    DSetCustipinfo: TOracleDataSet;
    DSetCustipinfoID: TFloatField;
    DSetCustipinfoAA: TFloatField;
    DSetCustipinfoNEW_MARRIAGE: TStringField;
    DSetCustipinfoNEW_PASSTYPE: TStringField;
    DSetCustipinfoCUSTNAME: TStringField;
    DSetCustipinfoMONTHLYPROFIT: TFloatField;
    DSetCustipinfoUNIQUEINSID: TStringField;
    DSetCustipinfoBB_INN: TStringField;
    DSetCustipinfoDSDesigner: TStringField;
    DSetCustipinfoDSDesigner2: TFloatField;
    DSetCustipinfoDSDesigner3: TDateTimeField;
    DSetCustipinfoDSDesigner4: TDateTimeField;
    DSetCustipinfoDSDesigner5: TDateTimeField;
    DataSetIPBANKOPENDATE: TDateTimeField;
    DataSetIPBANKCLOSEDATE: TDateTimeField;
    DSetUustinfoNUMBEROFCREDIT: TStringField;
    DSetCustipinfoNUMBEROFCREDIT: TStringField;
    DataSetIPNUMBEROFCREDIT: TStringField;
    DataSetKreditNUMBEROFCREDIT: TStringField;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
  function checkzero(x:real):real;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmipexp: Tdmipexp;

implementation

uses CMOracleApiDataModuleImpl;

function Tdmipexp.checkzero(x:real):real;
begin
  //  if x = 0 then result := 1
   // else result := x;
end;

{$R *.DFM}

procedure Tdmipexp.DataModuleDestroy(Sender: TObject);
begin
OracleDataSet1.close;
DataSetKredit.close;
DataSetIP.close;
end;

procedure Tdmipexp.DataModuleCreate(Sender: TObject);
begin
//  DataSetKredit.Open;
end;

end.

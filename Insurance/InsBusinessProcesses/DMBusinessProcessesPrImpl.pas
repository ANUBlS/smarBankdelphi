unit DMBusinessProcessesPrImpl;

interface

uses
  SysUtils, Classes, DB, OracleData, Oracle;

type
  TDMBusinessProcessesPr = class(TDataModule)
    DSRsb_business_processes: TDataSource;
    DSsb_business_processes: TOracleDataSet;
    DSsb_business_processesID: TFloatField;
    DSsb_business_processesNAME: TWideStringField;
    DSsb_business_processesACCBALCN_A: TWideStringField;
    DSsb_business_processesACCSYMB_A: TWideStringField;
    DSsb_business_processesACCCURR_A: TWideStringField;
    DSsb_business_processesACCBALCN_B: TWideStringField;
    DSsb_business_processesACCSYMB_B: TWideStringField;
    DSsb_business_processesACCCURR_B: TWideStringField;
    DSsb_business_processesACCBALCN_C: TWideStringField;
    DSsb_business_processesACCSYMB_C: TWideStringField;
    DSsb_business_processesACCCURR_C: TWideStringField;
    DSsb_business_processesFORMNUM: TIntegerField;
    DSsb_business_processesCLASSID: TIntegerField;
    DSsb_business_processesCUST_TYPE: TIntegerField;
    PCp_business_proc: TOraclePackage;
    DSins_contracts: TOracleDataSet;
    DSins_contractsID: TFloatField;
    DSins_contractsTYPE_ID: TFloatField;
    DSins_contractsINS_DATE: TDateTimeField;
    DSins_contractsBEGIN_DATE: TDateTimeField;
    DSins_contractsEND_DATE: TDateTimeField;
    DSins_contractsVALUTE_ID: TFloatField;
    DSins_contractsAMMOUNT: TFloatField;
    DSins_contractsCLOSE_PREFIX: TIntegerField;
    DSins_contractsKLI_ID: TFloatField;
    DSins_contractsLOANACC_ID: TFloatField;
    DSins_contractsCURRACC_ID: TFloatField;
    DSins_contractsPOLICY_NUM: TWideStringField;
    DSins_contractsINSSUMM: TFloatField;
    DSins_contractsFRANSHIZ: TFloatField;
    DSins_contractsTARIFF: TFloatField;
    DSins_contractsSTATE: TIntegerField;
    DSins_contractsAGENT_ID: TFloatField;
    DSins_contractsPNUM: TFloatField;
    DSins_contractsBEN_ID: TFloatField;
    DSins_contractsBENEFICIARY: TWideStringField;
    DSins_contractsCONDITIONS: TWideStringField;
    DSins_contractsSUGNUM: TWideStringField;
    DSins_contractsBLANK_ID: TFloatField;
    DSins_customers: TOracleDataSet;
    DSins_customersID: TIntegerField;
    DSins_customersCUST_ID: TIntegerField;
    DSins_customersNAME: TWideStringField;
    DSins_customersSURNAME: TWideStringField;
    DSins_customersFATHERNAME: TWideStringField;
    DSins_customersHOMEPHONE: TWideStringField;
    DSins_customersWORKPHONE: TWideStringField;
    DSins_customersMOBILEPHONE: TWideStringField;
    DSins_customersFAX: TWideStringField;
    DSins_customersADDRESS: TWideStringField;
    DSins_customersDATEOFBIRTH: TDateTimeField;
    DSins_customersPLACEOFBIRTH: TWideStringField;
    DSins_customersAGE: TIntegerField;
    DSins_customersSEX: TIntegerField;
    DSins_customersPASPORTNO: TWideStringField;
    DSins_customersMS_ID: TIntegerField;
    DSins_customersCITY: TWideStringField;
    DSins_customersINDEX_: TWideStringField;
    DSins_customersMAILINGADDRESS: TWideStringField;
    DSins_customersOCC_ID: TIntegerField;
    DSins_customersED_ID: TIntegerField;
    DSins_customersSTATE: TWideStringField;
    DSins_customersACT_ID: TIntegerField;
    DSins_customersCONTACTPERSON: TWideStringField;
    DSins_customersCONTACTPERSONPHONE: TWideStringField;
    DSins_customersCLOSE_PREFIX: TIntegerField;
    DSins_customersINSURED_TYPEID: TIntegerField;
    DSins_customersPASSER: TWideStringField;
    DSins_customersDOCUMENT_TYPE: TFloatField;
    DSins_customersINN: TWideStringField;
    DSins_customersENTER_DATE: TDateTimeField;
    DSins_customersMAIL: TWideStringField;
    DSins_customersSTATE_ID: TFloatField;
    DSins_customersCITY_ID: TFloatField;
    DSloanacc_id: TOracleDataSet;
    DScurracc_id: TOracleDataSet;
    DSloanacc_idID: TFloatField;
    DSloanacc_idKLI_ID: TFloatField;
    DSloanacc_idOP_ID: TFloatField;
    DSloanacc_idACC_NO: TWideStringField;
    DSloanacc_idVAL_ACC: TIntegerField;
    DSloanacc_idNAME: TWideStringField;
    DSloanacc_idOPEN_DAT: TDateTimeField;
    DSloanacc_idCLOSE_DAT: TDateTimeField;
    DSloanacc_idBAL_CN1: TFloatField;
    DSloanacc_idBAL_CN2: TFloatField;
    DSloanacc_idBAL_CN3: TFloatField;
    DSloanacc_idBAL_CN4: TFloatField;
    DSloanacc_idFILIAL: TIntegerField;
    DSloanacc_idSIM_OTCET: TFloatField;
    DSloanacc_idTIPACC: TWideStringField;
    DSloanacc_idLIMIT: TFloatField;
    DSloanacc_idOLD_ACC_NO: TWideStringField;
    DSloanacc_idPAIR_ACC: TFloatField;
    DSloanacc_idINSIDER: TWideStringField;
    DSloanacc_idSID: TFloatField;
    DSloanacc_idTEMPID: TFloatField;
    DSloanacc_idOWNID: TFloatField;
    DSloanacc_idP_CUSTID: TFloatField;
    DSloanacc_idSYMB: TWideStringField;
    DScurracc_idID: TFloatField;
    DScurracc_idKLI_ID: TFloatField;
    DScurracc_idOP_ID: TFloatField;
    DScurracc_idACC_NO: TWideStringField;
    DScurracc_idVAL_ACC: TIntegerField;
    DScurracc_idNAME: TWideStringField;
    DScurracc_idOPEN_DAT: TDateTimeField;
    DScurracc_idCLOSE_DAT: TDateTimeField;
    DScurracc_idBAL_CN1: TFloatField;
    DScurracc_idBAL_CN2: TFloatField;
    DScurracc_idBAL_CN3: TFloatField;
    DScurracc_idBAL_CN4: TFloatField;
    DScurracc_idFILIAL: TIntegerField;
    DScurracc_idSIM_OTCET: TFloatField;
    DScurracc_idTIPACC: TWideStringField;
    DScurracc_idLIMIT: TFloatField;
    DScurracc_idOLD_ACC_NO: TWideStringField;
    DScurracc_idPAIR_ACC: TFloatField;
    DScurracc_idINSIDER: TWideStringField;
    DScurracc_idSID: TFloatField;
    DScurracc_idTEMPID: TFloatField;
    DScurracc_idOWNID: TFloatField;
    DScurracc_idP_CUSTID: TFloatField;
    DScurracc_idSYMB: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMBusinessProcessesPr: TDMBusinessProcessesPr;

implementation

{$R *.dfm}
     uses sboapiDataModuleImpl;
procedure TDMBusinessProcessesPr.DataModuleCreate(Sender: TObject);
begin
DSsb_business_processes.Open;
end;

procedure TDMBusinessProcessesPr.DataModuleDestroy(Sender: TObject);
begin
DSsb_business_processes.close;
end;

end.

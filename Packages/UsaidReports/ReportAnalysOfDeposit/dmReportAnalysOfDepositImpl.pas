unit dmReportAnalysOfDepositImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TdmReportAnalysOfDeposit = class(TDataModule)
    FilialMD: TOracleDataSet;
    SourceMD: TOracleDataSet;
    PersonMD: TOracleDataSet;
    TypeMD: TOracleDataSet;
    ValuteMD: TOracleDataSet;
    CalcStatusMD: TOracleDataSet;
    FilialMDID: TFloatField;
    FilialMDNAME: TWideStringField;
    SourceMDID: TFloatField;
    SourceMDNAME: TWideStringField;
    PersonMDID: TFloatField;
    PersonMDNAME: TWideStringField;                           
    TypeMDID: TFloatField;
    TypeMDNAME: TWideStringField;
    ValuteMDVALUTE: TIntegerField;
    CalcStatusMDID: TFloatField;
    CalcStatusMDNAME: TWideStringField;
    FilialMDds: TDataSource;
    SourceMDds: TDataSource;
    PersonMDds: TDataSource;
    TypeMDds: TDataSource;
    ValuteMDds: TDataSource;
    CalcStatusMDds: TDataSource;
    ValuteMDVAL_NAME: TWideStringField;
    FilialMDR: TOracleDataSet;
    ValuteMDR: TOracleDataSet;
    PeriodMDR: TOracleDataSet;
    AnnualIntMDR: TOracleDataSet;
    DepTypeMDR: TOracleDataSet;
    FilialMDRds: TDataSource;
    ValuteMDRds: TDataSource;
    PeriodMDRds: TDataSource;
    AnnualIntMDRds: TDataSource;
    DepTypeMDRds: TDataSource;
    FilialMDRSECTOR: TWideStringField;
    FilialMDRDPCOUNT: TFloatField;
    FilialMDRCEOFCOUNT: TFloatField;
    FilialMDRINITIALAMOUNT: TFloatField;
    FilialMDRFACTICALDEBT: TFloatField;
    FilialMDRCEOFFACTICALDEBT: TFloatField;
    FilialMDRFACTICALINTERESTDEBT: TFloatField;
    FilialMDRCEOFFACTICALINTERESTDEBT: TFloatField;
    FilialMDRROUNDINT: TFloatField;
    FilialMDRBRANCHID: TFloatField;
    ValuteMDRSECTOR: TWideStringField;
    ValuteMDRDPCOUNT: TFloatField;
    ValuteMDRCEOFCOUNT: TFloatField;
    ValuteMDRINITIALAMOUNT: TFloatField;
    ValuteMDRFACTICALDEBT: TFloatField;
    ValuteMDRCEOFFACTICALDEBT: TFloatField;
    ValuteMDRFACTICALINTERESTDEBT: TFloatField;
    ValuteMDRCEOFFACTICALINTERESTDEBT: TFloatField;
    ValuteMDRROUNDINT: TFloatField;
    ValuteMDRCURRENCY: TFloatField;
    PeriodMDRSECTOR: TWideStringField;
    PeriodMDRDPCOUNT: TFloatField;
    PeriodMDRCEOFCOUNT: TFloatField;
    PeriodMDRINITIALAMOUNT: TFloatField;
    PeriodMDRFACTICALDEBT: TFloatField;
    PeriodMDRCEOFFACTICALDEBT: TFloatField;
    PeriodMDRFACTICALINTERESTDEBT: TFloatField;
    PeriodMDRCEOFFACTICALINTERESTDEBT: TFloatField;
    PeriodMDRROUNDINT: TFloatField;
    PeriodMDRPERIOD: TFloatField;
    AnnualIntMDRSECTOR: TWideStringField;
    AnnualIntMDRDPCOUNT: TFloatField;
    AnnualIntMDRCEOFCOUNT: TFloatField;
    AnnualIntMDRINITIALAMOUNT: TFloatField;
    AnnualIntMDRFACTICALDEBT: TFloatField;
    AnnualIntMDRCEOFFACTICALDEBT: TFloatField;
    AnnualIntMDRFACTICALINTERESTDEBT: TFloatField;
    AnnualIntMDRCEOFFACTICALINTERESTDEBT: TFloatField;
    AnnualIntMDRROUNDINT: TFloatField;
    AnnualIntMDRSECTORID: TFloatField;
    Queries: TOracleDataSet;
    DepTypeMDRSECTOR: TWideStringField;
    DepTypeMDRDPCOUNT: TFloatField;
    DepTypeMDRCEOFCOUNT: TFloatField;
    DepTypeMDRINITIALAMOUNT: TFloatField;
    DepTypeMDRFACTICALDEBT: TFloatField;
    DepTypeMDRCEOFFACTICALDEBT: TFloatField;
    DepTypeMDRFACTICALINTERESTDEBT: TFloatField;
    DepTypeMDRCEOFFACTICALINTERESTDEBT: TFloatField;
    DepTypeMDRROUNDINT: TFloatField;
    DepTypeMDRCONTRACTTYPE: TFloatField;
    sysdat: TOracleDataSet;
    DetailMDR: TOracleDataSet;
    DetailMDRds: TDataSource;
    DetailMDRCONTRACTNO: TWideStringField;
    DetailMDRNAME: TWideStringField;
    DetailMDRBAL_CN: TFloatField;
    DetailMDRDEPACCNO: TWideStringField;
    DetailMDRINTACCNO: TWideStringField;
    DetailMDRVAL_NAME: TWideStringField;
    DetailMDROPENDATE: TDateTimeField;
    DetailMDRCLOSEDATE: TDateTimeField;
    DetailMDRNEWDATE: TDateTimeField;
    DetailMDRINTEREST: TFloatField;
    DetailMDRAMOUNT: TFloatField;
    DetailMDREAMOUNT: TFloatField;
    DetailMDRFACTICALDEBT: TFloatField;
    DetailMDREFACTICALDEBT: TFloatField;
    DetailMDRFACTICALINTERESTDEBT: TFloatField;
    DetailMDREFACTICALINTERESTDEBT: TFloatField;
    DetailMDRFILIAL: TWideStringField;
    DetailMDROVERDUEINTEREST: TFloatField;
    DetailMDRPERSON: TWideStringField;
    DetailMDRSOURCENAME: TWideStringField;
    DetailMDRTYPENAME: TWideStringField;
    DetailMDRDEPTYPE: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmReportAnalysOfDeposit: TdmReportAnalysOfDeposit;

implementation

{$R *.DFM}
uses sboapiDataModuleImpl;

procedure TdmReportAnalysOfDeposit.DataModuleCreate(Sender: TObject);
begin
   sysdat.Open;
   FilialMD.open;
   SourceMD.open;
   PersonMD.open;
   TypeMD.open;
   ValuteMD.open;
   CalcStatusMD.open;
end;

procedure TdmReportAnalysOfDeposit.DataModuleDestroy(Sender: TObject);
begin
   sysdat.open;
   FilialMD.CloseAll;
   SourceMD.CloseAll;
   PersonMD.CloseAll;
   TypeMD.CloseAll;
   ValuteMD.CloseAll;
   CalcStatusMD.CloseAll;
end;

end.

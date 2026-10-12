unit dmReportOfturnoverDepositImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TdmReportOfturnoverDeposit = class(TDataModule)
    FilialMDT: TOracleDataSet;
    FilialMDTID: TFloatField;
    FilialMDTNAME: TWideStringField;
    SourceMDT: TOracleDataSet;
    SourceMDTID: TFloatField;
    SourceMDTNAME: TWideStringField;
    TypeMDT: TOracleDataSet;
    TypeMDTID: TFloatField;
    TypeMDTNAME: TWideStringField;
    ValuteMDT: TOracleDataSet;
    ValuteMDTVALUTE: TIntegerField;
    ValuteMDTVAL_NAME: TWideStringField;
    CalcStatusMDT: TOracleDataSet;
    CalcStatusMDTID: TFloatField;
    CalcStatusMDTNAME: TWideStringField;
    FilialMDds: TDataSource;
    SourceMDds: TDataSource;
    TypeMDds: TDataSource;
    ValuteMDds: TDataSource;
    CalcStatusMDds: TDataSource;
    Queries: TOracleDataSet;
    sysdat: TOracleDataSet;
    MainMDT: TOracleDataSet;
    MainMDTds: TDataSource;
    MainMDTID: TFloatField;
    MainMDTNAME: TWideStringField;
    MainMDTBCOUNTDEP: TFloatField;
    MainMDTBEGINREST: TFloatField;
    MainMDTBEGININTREST: TFloatField;
    MainMDTTRCOUNTDEP: TFloatField;
    MainMDTTRAMOUNT: TFloatField;
    MainMDTCAPAMOUNT: TFloatField;
    MainMDTPAYCOUNTDEP: TFloatField;
    MainMDTMAINPAY: TFloatField;
    MainMDTINTPAY: TFloatField;
    MainMDTECOUNTDEP: TFloatField;
    MainMDTENDREST: TFloatField;
    MainMDTENDINTREST: TFloatField;
    SumMDTds: TDataSource;
    SumMDT: TOracleDataSet;
    SumMDTBCOUNTDEP: TFloatField;
    SumMDTBEGINREST: TFloatField;
    SumMDTBEGININTREST: TFloatField;
    SumMDTTRCOUNTDEP: TFloatField;
    SumMDTTRAMOUNT: TFloatField;
    SumMDTCAPAMOUNT: TFloatField;
    SumMDTPAYCOUNTDEP: TFloatField;
    SumMDTMAINPAY: TFloatField;
    SumMDTINTPAY: TFloatField;
    SumMDTECOUNTDEP: TFloatField;
    SumMDTENDREST: TFloatField;
    SumMDTENDINTREST: TFloatField;
    DetailTO: TOracleDataSet;
    DetailTOds: TDataSource;
    DetailTOACC_NO: TWideStringField;
    DetailTOCUSTNAME: TWideStringField;
    DetailTOBEGINREST: TFloatField;
    DetailTOBEGININTREST: TFloatField;
    DetailTOKREDITTO: TFloatField;
    DetailTODEBETTO: TFloatField;
    DetailTODEBETINTTO: TFloatField;
    DetailTOENDREST: TFloatField;
    DetailTOENDINTREST: TFloatField;
    DetailTOBAL_CN1: TFloatField;
    DetailTOANNUALINT: TFloatField;
    DetailTOSRCNAME: TWideStringField;
    DetailTOOPENDATE: TDateTimeField;
    DetailTOCLOSEDATE: TDateTimeField;
    DetailTOVAL_NAME: TWideStringField;
    DetailTOFILIALNAME: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmReportOfturnoverDeposit: TdmReportOfturnoverDeposit;

implementation

{$R *.DFM}
uses sboapiDataModuleImpl;

procedure TdmReportOfturnoverDeposit.DataModuleCreate(Sender: TObject);
begin
   FilialMDT.open;
   SourceMDT.open;
   TypeMDT.open;
   ValuteMDT.open;
   CalcStatusMDT.open;
   sysdat.open;
end;

end.

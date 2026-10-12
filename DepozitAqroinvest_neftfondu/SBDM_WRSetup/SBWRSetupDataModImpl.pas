unit SBWRSetupDataModImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OracleData, Oracle, Db;

type
  TSBWRSetupDataMod = class(TDataModule)
    SBWRTemplatesDSet: TOracleDataSet;
    SBWRTemplatesDSetID: TFloatField;
    SBWRTemplatesDSrc: TDataSource;
    SBCM_WR_TOOLS: TOraclePackage;
    SBWRBookmarksDSet: TOracleDataSet;
    SBWRBookmarksDSetID: TFloatField;
    SBWRBookmarksDSetTEMPLATEID: TFloatField;
    SBWRBookmarksDSetFIELDID: TFloatField;
    SBWRBookmarksDSrc: TDataSource;
    SBWRFieldsDSet: TOracleDataSet;
    SBWRFieldsDSrc: TDataSource;
    OpenDlg: TOpenDialog;
    SBOracleDSetTamplates: TOracleDataSet;
    SBOracleDSetTamplatesID: TFloatField;
    SBDSourceTamplates: TDataSource;
    SBDMInfoDataSet: TOracleDataSet;
    SBDMInfoDataSetCREDITID: TFloatField;
    SBDMInfoDataSetBOOROWERID: TFloatField;
    SBDMInfoDataSetDATEOFCONCLUSION: TDateTimeField;
    SBDMInfoDataSetCREDITLINEAMOUNT: TFloatField;
    SBDMInfoDataSetANNUALYINTERESTRATE: TFloatField;
    SBDMInfoDataSetANNUALYOVERDUERATE: TFloatField;
    SBDMInfoDataSetDUEDATEFIRSTCONTRACT: TDateTimeField;
    SBDMInfoDataSrc: TDataSource;
    SBReplaceDataSet: TOracleDataSet;
    SBWRTemplatesDSetNAME: TWideStringField;
    SBWRTemplatesDSetPATH: TWideStringField;
    SBWRBookmarksDSetBOOKMARKNAME: TWideStringField;
    SBOracleDSetTamplatesNAME: TWideStringField;
    SBOracleDSetTamplatesPATH: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SBWRSetupDataMod: TSBWRSetupDataMod;

implementation

uses sboapiDatamoduleImpl;
{$R *.DFM}

end.

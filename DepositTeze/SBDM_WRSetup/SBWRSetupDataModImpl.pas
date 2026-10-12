unit SBWRSetupDataModImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OracleData, Oracle, Db;

type
  TSBWRSetupDataMod = class(TDataModule)
    SBWRTemplatesDSet: TOracleDataSet;
    SBWRTemplatesDSetID: TFloatField;
    SBWRTemplatesDSetNAME: Twidestringfield;
    SBWRTemplatesDSetPATH: Twidestringfield;
    SBWRTemplatesDSrc: TDataSource;
    SBCM_WR_TOOLS: TOraclePackage;
    SBWRBookmarksDSet: TOracleDataSet;
    SBWRBookmarksDSetID: TFloatField;
    SBWRBookmarksDSetTEMPLATEID: TFloatField;
    SBWRBookmarksDSetFIELDID: TFloatField;
    SBWRBookmarksDSetBOOKMARKNAME: Twidestringfield;
    SBWRBookmarksDSrc: TDataSource;
    SBWRFieldsDSet: TOracleDataSet;
    SBWRFieldsDSrc: TDataSource;
    OpenDlg: TOpenDialog;
    SBOracleDSetTamplates: TOracleDataSet;
    SBOracleDSetTamplatesID: TFloatField;
    SBOracleDSetTamplatesNAME: Twidestringfield;
    SBOracleDSetTamplatesPATH: Twidestringfield;
    SBDSourceTamplates: TDataSource;
    SBDMInfoDataSet: TOracleDataSet;
    SBDMInfoDataSetCREDITID: TFloatField;
    SBDMInfoDataSetBOOROWERID: TFloatField;
    SBDMInfoDataSetBOOROWERNAME: Twidestringfield;
    SBDMInfoDataSetDATEOFCONCLUSION: TDateTimeField;
    SBDMInfoDataSetCREDITLINEAMOUNT: TFloatField;
    SBDMInfoDataSetANNUALYINTERESTRATE: TFloatField;
    SBDMInfoDataSetANNUALYOVERDUERATE: TFloatField;
    SBDMInfoDataSetDUEDATEFIRSTCONTRACT: TDateTimeField;
    SBDMInfoDataSetNUMBEROFCREDIT: Twidestringfield;
    SBDMInfoDataSetPERSONALTYPE: Twidestringfield;
    SBDMInfoDataSrc: TDataSource;
    SBReplaceDataSet: TOracleDataSet;
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

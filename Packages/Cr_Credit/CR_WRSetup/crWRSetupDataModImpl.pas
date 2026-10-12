unit crWRSetupDataModImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, 
  Db, OracleData, Oracle, Dialogs;



type
  TWRSetupDataMod = class(TDataModule)
    WRTemplatesDataSet: TOracleDataSet;
    WRTemplatesDataSrc: TDataSource;
    CR_WR_TOOLS: TOraclePackage;
    WRBookmarksDataSet: TOracleDataSet;
    WRBookmarksDataSrc: TDataSource;
    WRFieldsDataSet: TOracleDataSet;
    WRFieldsDataSrc: TDataSource;
    OpenDlg: TOpenDialog;
    WRTemplatesDataSetID: TFloatField;
    WRTemplatesDataSetNAME: TWideStringField;
    WRTemplatesDataSetPATH: TWideStringField;
    WRBookmarksDataSetID: TFloatField;
    WRBookmarksDataSetTEMPLATEID: TFloatField;
    WRBookmarksDataSetFIELDID: TFloatField;
    WRBookmarksDataSetBOOKMARKNAME: TWideStringField;
    OracleDataSetTamplates: TOracleDataSet;
    DataSourceTamplates: TDataSource;
    OracleDataSetTamplatesID: TFloatField;
    OracleDataSetTamplatesNAME: TWideStringField;
    OracleDataSetTamplatesPATH: TWideStringField;
    FilialDataSet: TOracleDataSet;
    FilialSrc: TDataSource;
    FilialDataSetNAME: TWideStringField;
    FilialDataSetC_NAME: TWideStringField;
    FilialDataSetDRNAME: TWideStringField;
    FilialDataSetDRFULLNAME: TWideStringField;
    FilialDataSetNNAME: TWideStringField;
    FilialDataSetNFULLNAME: TWideStringField;
    FilialDataSetCOUNTRY: TWideStringField;
    procedure WRBookmarksDataSetApplyRecord(Sender: TOracleDataSet;
      Action: Char; var Applied: Boolean; var NewRowId: String);
    procedure WRTemplatesDataSetApplyRecord(Sender: TOracleDataSet;
      Action: Char; var Applied: Boolean; var NewRowId: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WRSetupDataMod: TWRSetupDataMod;

implementation

{$R *.DFM}

uses
  sboapiDataModuleImpl;



procedure TWRSetupDataMod.WRBookmarksDataSetApplyRecord(
  Sender: TOracleDataSet; Action: Char; var Applied: Boolean;
  var NewRowId: String);
var  id, stemplid,sfieldid:integer; sbookmarkname:string;
begin
   with Sender do
      begin
         stemplid:=FieldByName('Templateid').Asinteger;
         sfieldid:=FieldByName('Fieldid').Asinteger;
         Sbookmarkname:=FieldByName('Bookmarkname').Asstring;
         id:=FieldByName('id').Asinteger;
      end;

   Case  Action of

   'I':  CR_WR_TOOLS.CallProcedure('AddBookmark',[
            stemplid,
            sfieldid,
            sbookmarkname]);

   'D':  CR_WR_TOOLS.CallProcedure('DeleteBookmark',[id]);

   'U':  CR_WR_TOOLS.CallProcedure('updateBookmark',[
            id,
            sbookmarkname,
            stemplid,
            sfieldid]);
        end;
        Applied:=true;
end;


procedure TWRSetupDataMod.WRTemplatesDataSetApplyRecord(
  Sender: TOracleDataSet; Action: Char; var Applied: Boolean;
  var NewRowId: String);
var
  SName , SPath : String;templid:integer;
begin

    with Sender do
        begin
          SName := FieldByName('NAME').AsString;
          SPath := FieldByName('PATH').AsString;
          templid:=FieldByName('ID').AsInteger;
        end;
  case Action of

  'I' : CR_WR_TOOLS.CallProcedure('AddTemplate',[
           SName ,
           SPath
         ]);

  'D' : CR_WR_TOOLS.CallProcedure('DeleteTemplate',[templid]);

  'U' : CR_WR_TOOLS.CallProcedure('UpdateTemplates',[
            templid,
            sname,
             spath
           ]);
   end;
 Applied:=true;

end;

end.

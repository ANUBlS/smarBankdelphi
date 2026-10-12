unit dmLoanPipeLineReportImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TdmLoanPipeLineReport = class(TDataModule)
    CrdPipeLines: TOracleDataSet;
    CrdPipeLinesds: TDataSource;
    CrdPipeLinesID: TFloatField;
    CrdPipeLinesCUSTOMERNAME: TWideStringField;
    CrdPipeLinesLOANAMOUNT: TFloatField;
    CrdPipeLinesCUSTOMERID: TWideStringField;
    CrdPipeLinesVAL_NAME: TWideStringField;
    CrdPipeLinesSTATUS: TWideStringField;
    USAID_REPORT: TOraclePackage;
    filialsclp: TOracleDataSet;
    valutesclp: TOracleDataSet;
    crdClp: TOracleDataSet;
    filialsclpds: TDataSource;
    valutesclpds: TDataSource;
    crdClpds: TDataSource;
    filialsclpID: TFloatField;
    filialsclpNAME: TWideStringField;
    valutesclpVALUTE: TIntegerField;
    valutesclpVALU_NAME: TWideStringField;
    crdClpID: TFloatField;
    crdClpDESCRIPTION: TWideStringField;
    CrdPipeLinesCURRENCY: TFloatField;
    CrdPipeLinesBRANCHID: TFloatField;
    CrdPipeLinesOPENDATE: TDateTimeField;
    cplapp: TOracleDataSet;
    cplappds: TDataSource;
    cpldocds: TDataSource;
    cplriskds: TDataSource;
    cplopds: TDataSource;
    cplpayprds: TDataSource;
    cpldoc: TOracleDataSet;
    cplrisk: TOracleDataSet;
    cplop: TOracleDataSet;
    cplpaypr: TOracleDataSet;
    continf: TOracleDataSet;
    continfds: TDataSource;
    continfCUSTOMERNAME: TWideStringField;
    continfLOANAMOUNT: TFloatField;
    continfVALU_NAME: TWideStringField;
    CurrencyOfferds: TDataSource;
    CurrencyOffer: TOracleDataSet;
    CrdCat: TOracleDataSet;
    CrdCatds: TDataSource;
    crdTypeds: TDataSource;
    crdType: TOracleDataSet;
    CrdCatID: TFloatField;
    CrdCatDESCRIPTION: TWideStringField;
    currop: TOracleDataSet;
    curropds: TDataSource;
    PayOrderds: TDataSource;
    PayOrder: TOracleDataSet;
    PayOrderID: TIntegerField;
    PayOrderNAME: TWideStringField;
    PayOrderDESCRIPTION: TWideStringField;
    cplopsmnonat: TFloatField;
    continfCURRENCY: TFloatField;
    cplappID: TFloatField;
    cplappCONTRACTID: TFloatField;
    cplappADDRESS_CUST: TWideStringField;
    cplappBIRTHDAT: TDateTimeField;
    cplappNAME_BUSINESS: TWideStringField;
    cplappADDRESS_BUSINESS: TWideStringField;
    cplappACTIVITIES_DAT_BUSINESS: TFloatField;
    cplappCREDITPERIOD: TFloatField;
    cplappOFFER_AMOUNT: TFloatField;
    cplappOFFER_CURRENCY: TFloatField;
    cplappOFFER_PERIOD: TFloatField;
    cplappPURPOSEOFCREDIT: TWideStringField;
    cplappCATEGORY_CREDITS: TFloatField;
    cplappCREDITTYPE: TFloatField;
    cpldocID: TFloatField;
    cpldocCONTRACTID: TFloatField;
    cpldocPASS_SER: TWideStringField;
    cpldocPASS_NO: TWideStringField;
    cpldocVOIN: TWideStringField;
    cpldocOPENDATOFLEASE: TDateTimeField;
    cpldocCLOSEDATOFLEASE: TDateTimeField;
    cpldocDOCOFHOME: TFloatField;
    cpldocMARRIDEVIDENCE: TFloatField;
    cpldocGUARANTEE_PASS_SER: TWideStringField;
    cpldocGUARANTEE_PASS_NO: TWideStringField;
    cpldocGUARANTEE_VOIN: TWideStringField;
    cpldocGUARANTEE_DOCOFHOME: TFloatField;
    cpldocFINANCE_REPORTS: TFloatField;
    cplriskID: TFloatField;
    cplriskOBJECTION: TIntegerField;
    cplriskABOUTOFRISK: TWideStringField;
    cplriskCONTRACTID: TFloatField;
    cplopID: TFloatField;
    cplopCONTRACTID: TFloatField;
    cplopAGAINST: TIntegerField;
    cplopCAUSE: TWideStringField;
    cplopCREDITAMOUNT_NUMBERS: TFloatField;
    cplopCREDITAMOUNT_WORDS: TWideStringField;
    cplopCREDIT_CURRENCY: TFloatField;
    cplopCREDIT_PERIOD: TFloatField;
    cplopANNUALINT: TFloatField;
    cplopPAYMENTORDER: TFloatField;
    cplopCONCESSION_PERIOD: TFloatField;
    cplopSERVICE_AMOUNT: TFloatField;
    cplopNONAT_BUSINESS_EQUIPMENT: TFloatField;
    cplopNONAT_TURNOVER_GUARANTEE: TFloatField;
    cplopNONAT_HOME_OBJECTS: TFloatField;
    cplopNONAT_DEPOSIT: TFloatField;
    cplopNONAT_OTHERS: TFloatField;
    cplopNAT_LIVEANDOTHERLIFE: TFloatField;
    cplopNAT_VEHICLE: TFloatField;
    cplopGUARANTOR: TWideStringField;
    cplopSTATUS: TWideStringField;
    cplpayprID: TFloatField;
    cplpayprCONTRACTID: TFloatField;
    cplpayprDATEOFGRANT: TDateTimeField;
    cplpayprPR_BEEN_COMPLETED: TIntegerField;
    cplpayprNUMBEROFCREDIT: TWideStringField;
    DenyNote: TOracleDataSet;
    DenyNoteID: TFloatField;
    DenyNoteCONTRACTID: TFloatField;
    DenyNoteNOTE: TWideStringField;
    DenyNoteds: TDataSource;
    curdat: TOracleDataSet;
    curdatTEK_DAT: TDateTimeField;
    users: TOracleDataSet;
    usersID: TFloatField;
    usersNAME: TWideStringField;
    usersds: TDataSource;
    fvalutesds: TDataSource;
    fvalutes: TOracleDataSet;
    ffilial: TOracleDataSet;
    fcredittype: TOracleDataSet;
    ffilialds: TDataSource;
    fcredittypeds: TDataSource;
    fcredittypeID: TFloatField;
    fcredittypeDESCRIPTION: TWideStringField;
    ffilialID: TFloatField;
    ffilialNAME: TWideStringField;
    fvalutesVALUTE: TIntegerField;
    fvalutesVALU_NAME: TWideStringField;
    CrdPipeLinesDESCRIPTION: TWideStringField;
    CrdPipeLinesCREDITTYPE: TFloatField;
    CrdPipeLinesUSID: TFloatField;
    RepApp: TOracleDataSet;
    RepAppCUSTOMERNAME: TWideStringField;
    RepAppCUSTOMERID: TWideStringField;
    RepAppVAL_NAME: TWideStringField;
    RepAppNAME: TWideStringField;
    RepAppID: TFloatField;
    RepAppCONTRACTID: TFloatField;
    RepAppADDRESS_CUST: TWideStringField;
    RepAppBIRTHDAT: TDateTimeField;
    RepAppNAME_BUSINESS: TWideStringField;
    RepAppADDRESS_BUSINESS: TWideStringField;
    RepAppACTIVITIES_DAT_BUSINESS: TFloatField;
    RepAppCREDITPERIOD: TFloatField;
    RepAppOFFER_AMOUNT: TFloatField;
    RepAppOFFER_PERIOD: TFloatField;
    RepAppPURPOSEOFCREDIT: TWideStringField;
    RepAppCATEGORY_CREDITS: TWideStringField;
    RepAppCREDITTYPE: TWideStringField;
    RepAppUSR: TWideStringField;
    RepAppTIM: TDateTimeField;
    RepAppCHANGE_USR: TWideStringField;
    RepAppCHANGE_TIM: TDateTimeField;
    RepAppOFFER_CURRENCY: TWideStringField;
    RepAppDENYNOTE: TWideStringField;
    RepDoc: TOracleDataSet;
    RepDocCUSTOMERNAME: TWideStringField;
    RepDocCUSTOMERID: TWideStringField;
    RepDocVAL_NAME: TWideStringField;
    RepDocFILIALNAME: TWideStringField;
    RepDocDENYNOTE: TWideStringField;
    RepDocID: TFloatField;
    RepDocCONTRACTID: TFloatField;
    RepDocPASS_SER: TWideStringField;
    RepDocPASS_NO: TWideStringField;
    RepDocVOIN: TWideStringField;
    RepDocOPENDATOFLEASE: TDateTimeField;
    RepDocCLOSEDATOFLEASE: TDateTimeField;
    RepDocDOCOFHOME: TWideStringField;
    RepDocMARRIDEVIDENCE: TWideStringField;
    RepDocGUARANTEE_PASS_SER: TWideStringField;
    RepDocGUARANTEE_PASS_NO: TWideStringField;
    RepDocGUARANTEE_VOIN: TWideStringField;
    RepDocGUARANTEE_DOCOFHOME: TWideStringField;
    RepDocFINANCE_REPORTS: TWideStringField;
    RepDocUSR: TWideStringField;
    RepDocTIM: TDateTimeField;
    RepDocCHANGE_USR: TWideStringField;
    RepDocCHANGE_TIM: TDateTimeField;
    RepARisk: TOracleDataSet;
    RepARiskCUSTOMERNAME: TWideStringField;
    RepARiskCUSTOMERID: TWideStringField;
    RepARiskVAL_NAME: TWideStringField;
    RepARiskFILIALNAME: TWideStringField;
    RepARiskDENYNOTE: TWideStringField;
    RepARiskID: TFloatField;
    RepARiskABOUTOFRISK: TWideStringField;
    RepARiskCONTRACTID: TFloatField;
    RepARiskUSR: TWideStringField;
    RepARiskTIM: TDateTimeField;
    RepARiskCHANGE_USR: TWideStringField;
    RepARiskCHANGE_TIM: TDateTimeField;
    RepARiskOBJECTION: TWideStringField;
    RepOp: TOracleDataSet;
    RepOpCUSTOMERNAME: TWideStringField;
    RepOpCUSTOMERID: TWideStringField;
    RepOpVAL_NAME: TWideStringField;
    RepOpFILIALNAME: TWideStringField;
    RepOpDENYNOTE: TWideStringField;
    RepOpID: TFloatField;
    RepOpCONTRACTID: TFloatField;
    RepOpAGAINST: TWideStringField;
    RepOpCAUSE: TWideStringField;
    RepOpCREDITAMOUNT_NUMBERS: TFloatField;
    RepOpCREDITAMOUNT_WORDS: TWideStringField;
    RepOpCREDIT_CURRENCY: TFloatField;
    RepOpCREDIT_PERIOD: TFloatField;
    RepOpANNUALINT: TFloatField;
    RepOpPAYMENTORDER: TFloatField;
    RepOpCONCESSION_PERIOD: TFloatField;
    RepOpSERVICE_AMOUNT: TFloatField;
    RepOpNONAT_BUSINESS_EQUIPMENT: TFloatField;
    RepOpNONAT_TURNOVER_GUARANTEE: TFloatField;
    RepOpNONAT_HOME_OBJECTS: TFloatField;
    RepOpNONAT_DEPOSIT: TFloatField;
    RepOpNONAT_OTHERS: TFloatField;
    RepOpNAT_LIVEANDOTHERLIFE: TFloatField;
    RepOpNAT_VEHICLE: TFloatField;
    RepOpGUARANTOR: TWideStringField;
    RepOpSTATUS: TWideStringField;
    RepOpUSR: TWideStringField;
    RepOpTIM: TDateTimeField;
    RepOpCHANGE_USR: TWideStringField;
    RepOpCHANGE_TIM: TDateTimeField;
    RepPayPr: TOracleDataSet;
    RepPayPrCUSTOMERNAME: TWideStringField;
    RepPayPrCUSTOMERID: TWideStringField;
    RepPayPrVAL_NAME: TWideStringField;
    RepPayPrFILIALNAME: TWideStringField;
    RepPayPrDENYNOTE: TWideStringField;
    RepPayPrID: TFloatField;
    RepPayPrCONTRACTID: TFloatField;
    RepPayPrDATEOFGRANT: TDateTimeField;
    RepPayPrPR_BEEN_COMPLETED: TWideStringField;
    RepPayPrNUMBEROFCREDIT: TWideStringField;
    RepPayPrUSR: TWideStringField;
    RepPayPrTIM: TDateTimeField;
    RepPayPrCHANGE_USR: TWideStringField;
    RepPayPrCHANGE_TIM: TDateTimeField;
    customerspl: TOracleDataSet;
    customersplds: TDataSource;
    RepAppBRANCHID: TFloatField;
    RepAppCURRENCY: TFloatField;
    RepAppCRDTYPE: TFloatField;
    RepDocBRANCHID: TFloatField;
    RepDocCURRENCY: TFloatField;
    RepDocCRDTYPE: TFloatField;
    RepDocUSID: TFloatField;
    RepAppUSID: TFloatField;
    RepARiskBRANCHID: TFloatField;
    RepARiskCURRENCY: TFloatField;
    RepARiskCRDTYPE: TFloatField;
    RepARiskUSID: TFloatField;
    RepOpBRANCHID: TFloatField;
    RepOpCURRENCY: TFloatField;
    RepOpCRDTYPE: TFloatField;
    RepOpUSID: TFloatField;
    RepPayPrBRANCHID: TFloatField;
    RepPayPrCURRENCY: TFloatField;
    RepPayPrCRDTYPE: TFloatField;
    RepPayPrUSID: TFloatField;
    CrdPipeLinesFDENY: TWideStringField;
    CrdPipeLinesFWAIT: TWideStringField;
    CrdPipeLinesPASS_SER: TWideStringField;
    CrdPipeLinesUSRNAME: TWideStringField;
    CrdPipeLinesCUSTID: TWideStringField;
    CrdPipeLinesCOMM: TWideStringField;
    qr: TOracleQuery;
    qr2: TOracleQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure suleDestroy(Sender: TObject);
    procedure cplopCalcFields(DataSet: TDataSet);
    procedure cplappBeforeEdit(DataSet: TDataSet);
    procedure cplappBeforePost(DataSet: TDataSet);
    procedure cplappPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure CrdPipeLinesApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: String);
  private
    { Private declarations }
  public
    PageIdx :Integer;
  end;

var
  dmLoanPipeLineReport: TdmLoanPipeLineReport;

implementation

{$R *.DFM}

uses  sboapiDataModuleImpl, frmInfoflevelsImpl;

procedure TdmLoanPipeLineReport.DataModuleCreate(Sender: TObject);
var S :String ;
begin
   s := 'P5';
   with  CrdPipeLines do begin
   SetVariable('orderfield','ID');
   sql[20]:=qr.SQL.Text;
   open;
   {Filtered := false;
   Filter := 'COMM <>'''+s+'''';
   Filtered := true;  }
   end;
   filialsclp.open;
   valutesclp.open;
   crdClp.open;
   PayOrder.open;
   currop.open;
   crdType.open;
   CrdCat.open;
   CurrencyOffer.open;
   curdat.open;
   users.open;
   fvalutes.open;
   ffilial.open;
   fcredittype.open;
   customerspl.open;
end;

procedure TdmLoanPipeLineReport.suleDestroy(Sender: TObject);
begin
   CrdPipeLines.close;
   filialsclp.close;
   valutesclp.close;
   crdClp.close;
   PayOrder.close;
   currop.close;
   crdType.close;
   CrdCat.close;
   continf.close;
   CurrencyOffer.close;
   curdat.close;
   users.close;
   fvalutes.close;
   ffilial.close;
   fcredittype.close;
   customerspl.close;

end;



procedure TdmLoanPipeLineReport.cplopCalcFields(DataSet: TDataSet);
begin
with dataset do
   fieldbyname('smnonat').asfloat := fieldbyname('NONAT_BUSINESS_EQUIPMENT').asfloat+
                                     fieldbyname('NONAT_TURNOVER_GUARANTEE').asfloat+
                                     fieldbyname('NONAT_HOME_OBJECTS').asfloat+
                                     fieldbyname('NONAT_DEPOSIT').asfloat+
                                     fieldbyname('NONAT_OTHERS').asfloat;
end;

procedure TdmLoanPipeLineReport.cplappBeforeEdit(DataSet: TDataSet);
var lname ,cl,wl,cml:String; c,w,commitLevel :integer;
begin
{commitLevel := 0;
//PageIdx := frmInfoflevels.CPLLevelsPageControl.ActivePageIndex;
with dmLoanPipeLineReport, USAID_REPORT do  begin
         lname:= callstringfunction('get_DenyLevels',['contid',CrdPipeLines.FieldByName('ID').AsInteger]);
         cl:= callstringfunction('get_crdlpstatus',['p_ID',CrdPipeLines.FieldByName('ID').AsInteger]);
         wl:= callstringfunction('get_waitLevels',['ContID',CrdPipeLines.FieldByName('ID').AsInteger]);
         cml := dmLoanPipeLineReport.USAID_REPORT.CallStringFunction('get_CommittedLevel',[
              'ContID',CrdPipeLines.FieldByName('ID').AsInteger]);

end;

if cl <> '' then c:=StrToInt(copy(cl,2,2)) else c:=5;
if wl <> '' then w:=StrToInt(copy(wl,2,2)) else w:=5;
if cml <> '' then commitLevel:=StrToInt(copy(cml,2,2)) ;

if w <>5 then c := w;

if ((lname = '') )  then begin
frmInfoflevels.Commit.Enabled := true;
frmInfoflevels.BitBtn3.Enabled := true;
end;

frmInfoflevels.Commit.Enabled := false;
frmInfoflevels.BitBtn3.Enabled := false;
showmessage('commitLevel = '+inttostr(commitLevel)+'PageIdx =  '+inttostr(PageIdx)+' w ='+inttostr(w));

if (commitLevel <> 0) and (PageIdx+1 > commitLevel) then begin
frmInfoflevels.Commit.Enabled := true;
frmInfoflevels.BitBtn3.Enabled := true;
end;

if (w <> 0) and (PageIdx+1 >= w) then begin
frmInfoflevels.Commit.Enabled := true;
frmInfoflevels.BitBtn3.Enabled := true;
end;


if (commitLevel = 0)  then begin
frmInfoflevels.Commit.Enabled := true;
frmInfoflevels.BitBtn3.Enabled := true;
end }
end;

procedure TdmLoanPipeLineReport.cplappBeforePost(DataSet: TDataSet);
begin
  { with DataSet do
   if FieldByName('BIRTHDAT').AsDateTime >= curdat.FieldByName('tek_DAT').AsDateTime then
   begin
      Showmessage('Äîüóì òàðèõè äöçýöí äåéèë!');
      abort;
   end; }
end;

procedure TdmLoanPipeLineReport.cplappPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
    //frmInfoflevels.hblevels.ShowMessage(E.Message)

end;

procedure TdmLoanPipeLineReport.CrdPipeLinesApplyRecord(
  Sender: TOracleDataSet; Action: Char; var Applied: Boolean;
  var NewRowId: String);
var
                v_branchid,v_currency,v_credittype,v_id : integer;
                v_customername,v_customerid ,v_pass_ser:string;
                v_loanamount :real;

begin
    with sender as TOracleDataSet do begin
         v_id := FieldByName('ID').AsInteger;
         v_branchid := FieldByName('branchid').AsInteger;
         v_credittype := FieldByName('credittype').AsInteger;
         v_currency := FieldByName('currency').AsInteger;
         v_customername := FieldByName('customername').AsString;
         v_customerid := FieldByName('customerid').AsString;
         v_loanamount := FieldByName('loanamount').AsFloat;
         v_pass_ser := FieldByName('pass_ser').AsString;
    end;

    with USAID_REPORT do
    case Action of
        'I':begin CallIntegerFunction('ins_crdpipelines',['v_customername',v_customername,
                                                    'v_credittype',v_credittype,
                                                    'v_currency',v_currency,
                                                    'v_loanamount',v_loanamount,
                                                    'v_customerid',v_customerid,
                                                    'v_branchid',v_branchid,
                                                    'v_pass_ser',v_pass_ser]); Applied := True;end;
        'U':begin CallIntegerFunction('edit_crdpipelines',['v_id',v_id,
                                                    'v_customername',v_customername,
                                                    'v_credittype',v_credittype,
                                                    'v_currency',v_currency,
                                                    'v_loanamount',v_loanamount,
                                                    'v_customerid',v_customerid,
                                                    'v_branchid',v_branchid,
                                                    'v_pass_ser',v_pass_ser]);Applied := True;end;
   else Applied := false;
   end;

end;

end.

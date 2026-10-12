unit MISImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  Db, OracleData, NLSLocalizer, CMExcelExport, StdCtrls, CheckLst,
  Evanescence, ComCtrls, ExtCtrls, Buttons, KeyListBox;

resourcestring
  rsErrorValute       = 'ян азы бир валйута сечилм€лидир!';
  rsErrorUsrGrp       = 'ян азы бир истифад€чи групу сечилм€лидир!';
  rsErrorPersonaltype = 'ян азы бир мцшт€ри типи сечилм€лидир!';
  rsErrorBranch       = 'ян азы бир филиал сечилм€лидир!';
  rsInfScriptStarted  = '»храж башлады';
  rsInfRowsExported   = '%d с€тир ихраж олунду';
  rsInfExportFinished = '»храж гуртарды';

type
  TMISForm = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    LookValute: TEvanescence;
    LookUsrGrp: TEvanescence;
    LookPersonelType: TEvanescence;
    LookBranch: TEvanescence;
    Panel2: TPanel;
    Label1: TLabel;
    Tarix: TDateTimePicker;
    challValute: TButton;
    unchallValute: TButton;
    challUsrGrp: TButton;
    unchallUsrGrp: TButton;
    challBranch: TButton;
    unchallBranch: TButton;
    challPersonalType: TButton;
    unchallPersonalType: TButton;
    MISData: TOracleDataSet;
    MISDataCONTRACTACCNO: TStringField;
    MISDataVAL_NAME: TStringField;
    MISDataNAME: TStringField;
    MISDataDATEOFCONCLUSION: TDateTimeField;
    MISDataDUEDATEFIRSTCONTRACT: TDateTimeField;
    MISDataDUEDATELASTCONTRACT: TDateTimeField;
    MISDataCREDITLINEAMOUNT: TFloatField;
    MISDataANNUALYINTERESTRATE: TFloatField;
    MISDataINTERESTREST: TFloatField;
    MISDataDUEREST: TFloatField;
    MISDataDUEINTERESTREST: TFloatField;
    MISDataREST: TFloatField;
    MISDataPERCENT: TFloatField;
    MISDataDESCRIPTION: TStringField;
    MISDataPLEDGEPRICE: TFloatField;
    MISDataRESERVESUM: TFloatField;
    MISDataPURPOSEOFCREDIT: TStringField;
    Localizer: TNLSLocalizer;
    MISExporter: TCMExcelExport;
    ValuteDataSet: TOracleDataSet;
    srcValute: TDataSource;
    srcUsrGrp: TDataSource;
    UsrGrpDataSet: TOracleDataSet;
    PersonelTypeDataSet: TOracleDataSet;
    srcPersonelType: TDataSource;
    srcBranch: TDataSource;
    BranchDataSet: TOracleDataSet;
    Panel3: TGroupBox;
    ButtonExport: TBitBtn;
    CloseBtn: TBitBtn;
    SBListBox: TKeyListBox;
    Panel4: TPanel;
    spUP: TSpeedButton;
    spDown: TSpeedButton;
    MISDataID: TFloatField;
    MISDataNUMBEROFCREDIT: TStringField;
    procedure ButtonExportClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckAllValuteClick(Sender: TObject);
    procedure UnCheckAllValuteClick(Sender: TObject);
    procedure challBranchClick(Sender: TObject);
    procedure unchallBranchClick(Sender: TObject);
    procedure challUsrGrpClick(Sender: TObject);
    procedure unchallUsrGrpClick(Sender: TObject);
    procedure challPersonalTypeClick(Sender: TObject);
    procedure unchallPersonalTypeClick(Sender: TObject);
    procedure spUPClick(Sender: TObject);
    procedure spDownClick(Sender: TObject);
  private
    { Private declarations }
  public
  
  end;

var
  MISForm: TMISForm;

implementation

{$R *.DFM}

uses
  CMOracleAPIDataModuleImpl,CommonDecls, SystemState;

function ErrorInCheck(Look: TEvanescence; ErrorMsg: String=''):Boolean;
begin
  Result := True;
  if Look.GetCheckedKeyList.Count = 0 then Result := False;
  if (ErrorMsg <> '') and (not Result)then ShowMessage(ErrorMsg);
end;

procedure TMISForm.ButtonExportClick(Sender: TObject);
var
  MISSQL: String;
  DATETABLE: String;
  ADDITIONALPARAMS: String;
  MAINSQL: String;
  SORTBY: String;
  //SortByList: TStringList;
begin
  MISSQL :=
        'SELECT'+#13#10+
        '   Rownum as ID,B.NUMBEROFCREDIT'+#13#10+
        ' , B.CREDITLINEAMOUNT -- Kreditin meblegi'+#13#10+
        ' , B.ANNUALYINTERESTRATE --'+#13#10+
        ' , B.DATEOFCONCLUSION --acilma'+#13#10+
        ' , B.DUEDATEFIRSTCONTRACT --baglanma'+#13#10+
        ' , B.DUEDATELASTCONTRACT --uzadilma'+#13#10+
        ' , B.PURPOSEOFCREDIT -- teyinat'+#13#10+
        ' , C.REST -- qaliq'+#13#10+
        ' , C.INTERESTREST --hes '+#13#10+
        ' , C.DUEREST-- gecikmish borc'+#13#10+
        ' , C.DUEINTERESTREST --gecikmish'+#13#10+
        ' , C.PLEDGEPRICE -- Girov deyeri'+#13#10+
        ' , E.PERCENT -- ehtiyat '+#13#10+
        ' , H.Description -- girovun adi'+#13#10+
        ' , Creditsmgr.CM_COMMON.AccountNumber_Get(A.CONTRACTACCID) as CONTRACTACCNO -- Hesab'+#13#10+
        ' , J.VAL_NAME -- $'+#13#10+
        ' , L.NAME --Mushteri'+#13#10+
        ' , ((C.REST+C.DUEREST)* E.PERCENT / 100) * T.OSTAT as ReserveSum'+#13#10+
        'FROM'+#13#10+
        '   CM_ACCOUNTS A'+#13#10+
        ' , %s C'+#13#10+//Table
        ' , CM_PORTFOLIO B'+#13#10+
        ' , CM_GUARANTEE G'+#13#10+
        ' , CM_PLEDGES H'+#13#10+
        ' , SB_AVALUTE J'+#13#10+
        ' , CM_RESERVE_TYPES E'+#13#10+
        ' , CM_USERGROUPS F'+#13#10+
        ' , CM_BOOROWERINFO L'+#13#10+
        ' , SB_TEMPRATE T'+#13#10+
        'WHERE'+#13#10+
        '     (B.ID = A.CREDITID)'+#13#10+
        ' AND (C.CREDITID = B.ID)'+#13#10+
        ' AND (E.ID = C.RESERVEID)'+#13#10+
        ' AND (F.ID = B.USRGROUP)'+#13#10+
        ' AND (G.CREDITID = B.ID)'+#13#10+
        ' AND (H.ID = G.PLEDGEID)'+#13#10+
        ' AND (J.VALUTE = B.CURRENCY)'+#13#10+
        ' AND (L.CREDITID = B.ID)'+#13#10+
        ' AND (T.VAL_KOD=B.CURRENCY)'+#13#10+
        '%s'+#13#10+//Additinal expressions
        'ORDER BY %s';
        //B.CURRENCY,b.PERSONALTYPE,L.NAME
  ADDITIONALPARAMS := '';
  if Trunc(Tarix.Date) = Get_CurrentDate then
    DATETABLE := 'CM_CURR_STATE'
  else
  if trunc(Tarix.Date) = Get_PrevDate then
    DATETABLE := 'CM_PREV_STATE'
  else
  begin
    DATETABLE := 'CM_HISTORY';
    ADDITIONALPARAMS := ADDITIONALPARAMS+' AND C.HDATE = '''+
          FormatDateTime('dd-MMM-yyyy',Tarix.Date)+''''+#13#10;
  end;

  {case cbSortBy.ItemIndex of
    0: SORTBY := 'L.NAME';
    1: SORTBY := 'J.VAL_NAME';
    2: SORTBY := 'L.NAME';
    3: SORTBY := 'L.NAME';
    4: SORTBY := 'L.NAME';
  end;  }
  SORTBY := SBListBox.GetCheckedKeyList.CommaText;
  {if frmSortBy.SortByList.Count>0 then
    SORTBY := frmSortBy.SortByList.CommaText;  }

  if not ErrorInCheck(LookValute,rsErrorValute) then Exit;
  if not ErrorInCheck(LookUsrGrp,rsErrorUsrGrp) then Exit;
  if not ErrorInCheck(LookPersonelType,rsErrorPersonaltype) then Exit;
  if not ErrorInCheck(LookBranch,rsErrorBranch) then Exit;

  if (LookValute.GetCheckedKeyList.Count<>LookValute.Items.Count) then
  ADDITIONALPARAMS := ADDITIONALPARAMS + ' AND B.CURRENCY in('
                   +LookValute.GetCheckedKeyList.CommaText+')'
                   +#13#10;

  if (LookUsrGrp.GetCheckedKeyList.Count<>LookUsrGrp.Items.Count) then
  ADDITIONALPARAMS := ADDITIONALPARAMS + ' AND B.USRGROUP in('
                   +LookUsrGrp.GetCheckedKeyList.CommaText+')'
                   +#13#10;

  if (LookPersonelType.GetCheckedKeyList.Count<>LookPersonelType.Items.Count) then
  ADDITIONALPARAMS := ADDITIONALPARAMS + ' AND B.CUSTOMERTYPE in('
                   +LookPersonelType.GetCheckedKeyList.CommaText+')'
                   +#13#10;

  if (LookBranch.GetCheckedKeyList.Count<>LookBranch.Items.Count) then
  ADDITIONALPARAMS := ADDITIONALPARAMS + ' AND B.BRANCHID in('
                   +LookBranch.GetCheckedKeyList.CommaText+')'
                   +#13#10;

  MAINSQL := Format(MISSQL,[DATETABLE, ADDITIONALPARAMS, SORTBY]);
  {AssignFile(F, 'C:\SQL.TXT');
  Rewrite(F);
  write(f, mainsql);
  closefile(F);
  WinExec('NOTEPAD C:\SQL.TXT',SW_SHOW);  }
//  Memo1.Text := MAINSQL;
  MISData.SQL.Text := MAINSQL;
  LogInformation(rsInfScriptStarted);
  MISData.Open;
  LogInformation(Format(rsInfRowsExported,[MISData.recordCount]));
  with MISExporter do
  begin
    Connect;
    ExportDataset(MISData,'MIS',True);
  end;
  MISData.CloseAll;
  LogInformation(rsInfExportFinished);
end;

procedure TMISForm.FormShow(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i].Tag = 3112 then begin
      (Components[i] as TEvanescence).Open;
      (Components[i] as TEvanescence).CheckAll;
    end;
  Tarix.Date := Get_CurrentDate;
  for i:=0 to 2 do
    SBListBox.Checked[i] := True
end;

procedure TMISForm.CheckAllValuteClick(Sender: TObject);
begin
  LookValute.CheckAll;
end;

procedure TMISForm.UnCheckAllValuteClick(Sender: TObject);
begin
  LookValute.UncheckAll;
end;

procedure TMISForm.challBranchClick(Sender: TObject);
begin
  LookBranch.CheckAll
end;

procedure TMISForm.unchallBranchClick(Sender: TObject);
begin
  LookBranch.UncheckAll
end;

procedure TMISForm.challUsrGrpClick(Sender: TObject);
begin
  LookUsrGrp.CheckAll
end;

procedure TMISForm.unchallUsrGrpClick(Sender: TObject);
begin
  LookUsrGrp.UncheckAll
end;

procedure TMISForm.challPersonalTypeClick(Sender: TObject);
begin
  LookPersonelType.CheckAll
end;

procedure TMISForm.unchallPersonalTypeClick(Sender: TObject);
begin
  LookPersonelType.UncheckAll
end;

procedure TMISForm.spUPClick(Sender: TObject);
var
  IDX : Integer;
begin
  IDX := SBListBox.ItemIndex;
  with SbListBox,Items do
  if  IDX > 0  then
  begin
    Move(IDX,IDX - 1);
    Keys.Move(IDX,IDX - 1);
    //FFieldList.Exchange(IDX,IDX - 1);
    if IDX >= 1 then
    ItemIndex := IDX - 1;
  end;
end;

procedure TMISForm.spDownClick(Sender: TObject);
var
  IDX : Integer;
begin
  IDX := SBListBox.ItemIndex;
  with SbListBox,Items do
  if  (IDX <> - 1) and (IDX < Items.Count - 1) then
  begin
    Move(IDX,IDX + 1);
    Keys.Move(IDX,IDX + 1);
    //FFieldList.Exchange(IDX,IDX - 1);
    if IDX <= Items.Count - 1 then
    ItemIndex := IDX + 1;
  end;
end;

end.

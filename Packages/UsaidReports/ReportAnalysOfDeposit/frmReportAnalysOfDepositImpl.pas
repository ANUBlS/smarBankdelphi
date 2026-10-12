unit frmReportAnalysOfDepositImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, ReportAnalysOfDeposit_TLB, StdVcl, StdCtrls, Buttons,
  ComCtrls, ExtCtrls, CheckLst, Evanescence, Grids, DBGridEh,oracle,db,oracledata,
  CMExcelExport, CMDBSearchEdit;

type
  TfrmReportAnalysOfDeposit = class(TActiveForm, IfrmReportAnalysOfDeposit)
    GroupBox4: TGroupBox;
    GroupBox1: TGroupBox;
    DTPRAP: TDateTimePicker;
    OK: TBitBtn;
    BitBtnexp: TBitBtn;
    Panel2: TPanel;
    RgrSum: TRadioGroup;
    GroupBox2: TGroupBox;
    ESource: TEvanescence;
    CheckBox1: TCheckBox;
    GroupBox5: TGroupBox;
    EFilial: TEvanescence;
    CheckBox2: TCheckBox;
    GroupBox11: TGroupBox;
    EValute: TEvanescence;
    CheckBox3: TCheckBox;
    GroupBox13: TGroupBox;
    EType: TEvanescence;
    CheckBox4: TCheckBox;
    GroupBox15: TGroupBox;
    ECalcMethod: TEvanescence;
    CheckBox5: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    MainGridMDR: TDBGridEh;
    BitBtn3: TBitBtn;
    expSumdsMDR: TCMExcelExport;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EdCount: TEdit;
    EdIntAmt: TEdit;
    EdRest: TEdit;
    EdIntRest: TEdit;
    EdRoundInt: TEdit;
    Label1: TLabel;
    DTPDMR: TDateTimePicker;
    Memo1: TMemo;
    procedure ActiveFormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure chfilialClick(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MainGridMDRTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure MainGridMDRDblClick(Sender: TObject);
  private
    { Private declarations }
    FEvents: IfrmReportAnalysOfDepositEvents;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure PaintEvent(Sender: TObject);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function Get_Active: WordBool; safecall;
    function Get_AutoScroll: WordBool; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    function Get_Caption: WideString; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_HelpFile: WideString; safecall;
    function Get_KeyPreview: WordBool; safecall;
    function Get_PixelsPerInch: Integer; safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    function Get_Scaled: WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(var Value: IFontDisp); safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
  public
    { Public declarations }
    procedure Initialize; override;
    procedure GetInitData( v_ds :TDataSource; v_count :real;
                                                 v_GenRest :Real; v_GenIntRest :Real; v_dat :TDateTime;
                                                 v_FStr:String; v_sqlcnt :integer;
                                                 v_FStrB:String;v_sqlcntB :integer);
  end;

implementation

uses ComObj, ComServ, frmDepSettImpl,dmReportAnalysOfDepositImpl,
  frmDetailInfAnalysOfDepImpl,SBTranslateProc,sboapiDataModuleImpl;

{$R *.DFM}

var repdat :TDateTime;
    gdepbalspr,genStrBal,FilterStr,FilterStrB :String;



{ TfrmReportAnalysOfDeposit }

procedure TfrmReportAnalysOfDeposit.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_frmReportAnalysOfDepositPage); }
end;

procedure TfrmReportAnalysOfDeposit.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IfrmReportAnalysOfDepositEvents;
end;

procedure TfrmReportAnalysOfDeposit.Initialize;
begin
  inherited Initialize;
  OnActivate := ActivateEvent;
  OnClick := ClickEvent;
  OnCreate := CreateEvent;
  OnDblClick := DblClickEvent;
  OnDeactivate := DeactivateEvent;
  OnDestroy := DestroyEvent;
  OnKeyPress := KeyPressEvent;
  OnPaint := PaintEvent;
end;

function TfrmReportAnalysOfDeposit.Get_Active: WordBool;
begin
  Result := Active;
end;

function TfrmReportAnalysOfDeposit.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TfrmReportAnalysOfDeposit.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TfrmReportAnalysOfDeposit.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TfrmReportAnalysOfDeposit.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TfrmReportAnalysOfDeposit.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TfrmReportAnalysOfDeposit.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TfrmReportAnalysOfDeposit.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TfrmReportAnalysOfDeposit.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TfrmReportAnalysOfDeposit.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TfrmReportAnalysOfDeposit.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TfrmReportAnalysOfDeposit.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TfrmReportAnalysOfDeposit.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TfrmReportAnalysOfDeposit.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TfrmReportAnalysOfDeposit.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TfrmReportAnalysOfDeposit.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TfrmReportAnalysOfDeposit.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TfrmReportAnalysOfDeposit.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TfrmReportAnalysOfDeposit._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TfrmReportAnalysOfDeposit.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TfrmReportAnalysOfDeposit.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TfrmReportAnalysOfDeposit.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TfrmReportAnalysOfDeposit.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TfrmReportAnalysOfDeposit.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TfrmReportAnalysOfDeposit.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TfrmReportAnalysOfDeposit.KeyPressEvent(Sender: TObject;
  var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TfrmReportAnalysOfDeposit.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TfrmReportAnalysOfDeposit.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TfrmReportAnalysOfDeposit.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TfrmReportAnalysOfDeposit.Set_AxBorderStyle(
  Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TfrmReportAnalysOfDeposit.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TfrmReportAnalysOfDeposit.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TfrmReportAnalysOfDeposit.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TfrmReportAnalysOfDeposit.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TfrmReportAnalysOfDeposit.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TfrmReportAnalysOfDeposit.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TfrmReportAnalysOfDeposit.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TfrmReportAnalysOfDeposit.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TfrmReportAnalysOfDeposit.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TfrmReportAnalysOfDeposit.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TfrmReportAnalysOfDeposit.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TfrmReportAnalysOfDeposit.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TfrmReportAnalysOfDeposit.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TfrmReportAnalysOfDeposit.ActiveFormCreate(Sender: TObject);
begin
   frmDepSett := TfrmDepSett.Create(self);
   dmReportAnalysOfDeposit := TdmReportAnalysOfDeposit.create(self);
   DTPDMR.DateTime := dmReportAnalysOfDeposit.sysdat.fieldByName('tek_dat').AsDateTime;
   frmDetailInfAnalysOfDep := TfrmDetailInfAnalysOfDep.Create(Self);
   EFilial.Open;
   ESource.Open;
   //Eperson.Open;
   ECalcMethod.Open;
   EType.Open;
   EValute.Open;
   SBTranslateProc.TranslateAllComponents(Self,sboapiDataModule.OrPack_SL);
end;

procedure TfrmReportAnalysOfDeposit.BitBtn3Click(Sender: TObject);
begin
   frmDepSett.ShowModal
end;

procedure TfrmReportAnalysOfDeposit.BitBtn1Click(Sender: TObject);

resourcestring rs_depgencount = 'select count(id) as cnt from sbcm_contracts p,sbcm_accounts ac,sbcm_contract_history h where p.type# in (3,4) and p.id=ac.id# and h.hdate=:dat and h.id#=p.id and h.FACTICALDEBT<>0';
resourcestring rs_Balgencount = 'select count(id) as cnt from account ac,archost ar where ac.id=ar.acc_id and ar.datdate=:dat and ar.ostat<>0';
resourcestring rs_genDeprest1 = 'select round(sum(h.FACTICALDEBT*o.ostat),2) as sm from sbcm_contracts p,sbcm_contract_history h,operkurs o,sbcm_accounts ac where p.type# in (3,4) and p.id=h.id# and p.currency=o.val_kod and o.dat=:dat and h.hdate=:dat';
resourcestring rs_genDeprest2 = ' and h.FACTICALDEBT<>0 and p.id=ac.id#';
resourcestring rs_genBalRest = 'select sum(abs(pok_ostat)) as sm from archost where datdate= :dat ';
resourcestring rs_genDepIntrest1= 'select round(sum(h.FACTICALINTERESTDEBT*o.ostat),2) as sm from sbcm_contracts p,sbcm_contract_history h,operkurs o,sbcm_accounts ac where p.type# in (3,4) and p.id=h.id# and p.currency=o.val_kod ';
resourcestring rs_genDepIntrest2 = '  and o.dat=:dat and h.hdate=:dat and h.FACTICALDEBT<>0 and p.id=ac.id#';
resourcestring rs_sourceBal = 'SELECT  bal_cn   FROM uaod_source_bal ';
resourcestring rs_typeBal = 'SELECT bal_cn   FROM uaod_type_bal  ';
resourcestring rs_roundInt1 = 'select round(sum(h.FACTICALDEBT*o.ostat*i.interest),2) as rint,round(sum(p.AMOUNT*o.ostat),2) as Intamt from sbcm_contract_history h,sbcm_contracts p,sbcm_interests i,operkurs o,sbcm_accounts ac where h.id#=p.id and h.hdate=:dat and i.id# =p.id ' ;
resourcestring rs_roundInt2=' and o.val_kod=p.currency and  o.dat=:dat and p.type# in (3,4) and h.FACTICALDEBT<>0 and p.id=ac.id#';

var
  genCount,depgencount,Balgencount :Integer;
  roundint,initialAmt,genrest,genDepIntrest,genDeprest,genBalRest :real;
  rs_genDepIntrest,rs_genDeprest,rs_roundInt, gs,sourceBal,typeBal :string;

begin
   rs_roundInt :=  rs_roundInt1+rs_roundInt2;
   rs_genDeprest := rs_genDeprest1+rs_genDeprest2;
   rs_genDepIntrest := rs_genDepIntrest1+rs_genDepIntrest2;
  if EFilial.GetCheckedKeyList.Count = 0 then begin ShowMessage('Ən azı bir filial seçilməlidir!'); Exit; end;
  if ESource.GetCheckedKeyList.Count = 0 then begin ShowMessage('Ən azı bir Mənbə seçilməlidir!'); Exit; end;
  if EValute.GetCheckedKeyList.Count = 0 then begin ShowMessage('Ən azı bir valyuta seçilməlidir!'); Exit; end;
  if ECalcMethod.GetCheckedKeyList.Count = 0 then begin ShowMessage('Ən azı bir % hesablanması tipi seçilməlidir!'); Exit; end;
  if EType.GetCheckedKeyList.Count = 0 then begin ShowMessage('Ən azı bir Tip seçilməlidir!'); Exit; end;


   FilterStr := '';
   RepDat := integer(trunc(DTPDMR.DateTime));
   sourceBal := rs_sourceBal+' where sourceid in ( '+ESource.GetCheckedKeyList.CommaText+')';
   typeBal := rs_typeBal+' where typeid in ( '+EType.GetCheckedKeyList.CommaText+')';
   genStrBal := '( ac.bal_cn1 in('+sourceBal+'))'+' and '+  '( ac.bal_cn1 in('+typeBal+'))';
   gs := '('+' ac.id not in (select contractaccid from sbcm_contract_accounts)'+')';

   genStrBal := '('+'('+genStrBal+') and '+'('+gs+')'+')';
   gdepbalspr := '( ac.bal_cn1 in('+sourceBal+'))'+' and ' +'( ac.bal_cn1 in('+typeBal+'))';

 if  FilterStr <> '' then begin
  FilterStr := FilterStr + ' and  p.branchid in ('
                              +EFilial.GetCheckedKeyList.CommaText +')' ;
  FilterStrB := FilterStrB + ' and  filial in ('
                              +EFilial.GetCheckedKeyList.CommaText +')'
  end else begin
  FilterStr :=  ' and  p.branchid in ('
                              +EFilial.GetCheckedKeyList.CommaText +')' ;
  FilterStrB :=  ' and  filial in ('
                              +EFilial.GetCheckedKeyList.CommaText +')' ;
end;

 if  FilterStr <> '' then begin
  FilterStr := FilterStr + ' and  p.currency in ('
                              +EValute.GetCheckedKeyList.CommaText +')';
  FilterStrB := FilterStrB + ' and  val_acc in ('
                              +EValute.GetCheckedKeyList.CommaText +')'
end else  begin
  FilterStr :=  ' and  p.currency in ('
                              +EValute.GetCheckedKeyList.CommaText +')' ;
  FilterStrB :=  ' and  val_acc in ('
                              +EValute.GetCheckedKeyList.CommaText +')' ;
end;



if (ECalcMethod.GetCheckedKeyList.Count<>ECalcMethod.Items.Count) then begin
    if FilterStr <> '' then FilterStr := FilterStr + ' and p.id in (select id# from sbcm_contract_state where CALCULATIONENABLED in ('+ ECalcMethod.GetCheckedKeyList.CommaText+')'+')'
    else   FilterStr := '  p.id in (select id# from sbcm_contract_state where CALCULATIONENABLED in ('+ ECalcMethod.GetCheckedKeyList.CommaText+')'+')'
end;

       with dmReportAnalysOfDeposit.Queries do begin
       DeleteVariables;
       DeclareVariable('dat',otDate);
       SetVariable('dat',repdat);
       if Active then CloseAll;
       sql.Clear;
       sql.Add(rs_depgencount+' '+FilterStr+' and '+'('+gdepbalspr+')');  //Memo1.text := sql.text;
       Open;
       depgencount := FieldByName('cnt').AsInteger;


       DeleteVariables;
       DeclareVariable('dat',otDate);
       SetVariable('dat',repdat);
       if Active then CloseAll;
       sql.Clear;
       sql.Add(rs_Balgencount+' and '+'('+genStrBal+')'+' '+FilterStrB);  //Memo1.text := sql.text;
       Open;
       Balgencount := FieldByName('cnt').AsInteger;
       //if Balgencount = 0 then Balgencount := 1;


       genCount := Balgencount + depgencount;
       if genCount = 0 then genCount := 1;


       DeleteVariables;
       DeclareVariable('dat',otDate);
       SetVariable('dat',repdat);
       if Active then CloseAll;
       sql.Clear;
       sql.Add(rs_genDeprest+' '+FilterStr+' and '+'('+gdepbalspr+')');  //Memo1.text := sql.text;
       Open;
       genDeprest := FieldByName('sm').AsInteger;
       //if genDeprest = 0 then genDeprest := 1;


       DeleteVariables;
       DeclareVariable('dat',otDate);
       SetVariable('dat',repdat);
       if Active then CloseAll;
       sql.Clear;
       sql.Add(rs_genDepIntrest+' '+FilterStr+' and '+'('+gdepbalspr+')'); //Memo1.text := sql.text;
       Open;
       genDepIntrest := FieldByName('sm').AsInteger;
       if genDepIntrest = 0 then genDepIntrest := 1;


       DeleteVariables;
       DeclareVariable('dat',otDate);
       SetVariable('dat',repdat);
       if Active then CloseAll;
       sql.Clear;
       sql.Add(rs_genBalRest+' and acc_id in (select id from account ac where '+genStrBal+FilterStrB+')'); //Memo1.text := sql.text;
       Open;
       genBalRest := FieldByName('sm').AsInteger;
       //if genBalRest = 0 then genBalRest := 1;
        //showmessage('saf');
       DeleteVariables;
       DeclareVariable('dat',otDate);
       SetVariable('dat',repdat);
       if Active then CloseAll;
       sql.Clear;
       sql.Add(rs_roundInt+' '+FilterStr+' and '+'('+gdepbalspr+')'); // Memo1.text := sql.text;
       Open;

       genrest := genBalRest + genDeprest;
       if genrest = 0 then genrest := 1;

       roundint := FieldByName('rint').AsFloat/genrest;
       roundint := trunc(roundint) + round((roundint-trunc(roundint))*100)/100;
       initialAmt := FieldbyName('Intamt').AsFloat

       end;


      with dmReportAnalysOfDeposit do begin //m
      case RgrSum.ItemIndex of
           0:GetInitData(FilialMDRds,gencount,GenRest,genDepIntrest,repdat,FilterStr+' and ('+gdepbalspr+')',35,FilterStrB+' and ('+genStrBal+')',52);
           1:GetInitData(ValuteMDRds,gencount,GenRest,genDepIntrest,repdat,FilterStr+' and ('+gdepbalspr+')',35,FilterStrB+' and ('+genStrBal+')',52);
           2:GetInitData(PeriodMDRds,gencount,GenRest,genDepIntrest,repdat,FilterStr+' and ('+gdepbalspr+')',35,FilterStrB+' and ('+genStrBal+')',52);
           3:GetInitData(AnnualIntMDRds,gencount,GenRest,genDepIntrest,repdat,FilterStr+' and ('+gdepbalspr+')',54,FilterStrB+' and ('+genStrBal+')',71);
           4:GetInitData(DepTypeMDRds,gencount,GenRest,genDepIntrest,repdat,FilterStr+' and ('+gdepbalspr+')',35,FilterStrB+' and ('+genStrBal+')',52);
      end;
      end; //m

      EdCount.Text := IntToStr(genCount);
      EdIntAmt.Text := FloatToStr(initialAmt+genBalRest);
      EdRest.Text := FloatToStr(genrest);
      EdIntRest.Text := FloatToStr(genDepIntrest);
      EdRoundInt.Text := FloatToStr(roundint);

end;

procedure TfrmReportAnalysOfDeposit.GetInitData( v_ds :TDataSource; v_count :real;
                                                 v_GenRest :Real; v_GenIntRest :Real; v_dat :TDateTime;
                                                 v_FStr:String; v_sqlcnt :integer;
                                                 v_FStrB:String;v_sqlcntB :integer);
begin

   with  v_ds.DataSet as TOracleDataSet do begin
         if Active then CloseAll;
         SetVariable('OrderField','sectorID');
         SetVariable('dat',v_dat);
         SetVariable('GenCount',v_count);
         SetVariable('GenFACTICALDEBT',v_GenRest);
         SetVariable('GenFACTICALINTDEBT',v_GenIntRest);
         sql[v_sqlcnt] := v_FStr;
         sql[v_sqlcntB] := v_FStrB;Memo1.text := sql.text;
         open;//showmessage('asfsda');
   end;
     MainGridMDR.DataSource := v_ds;
end;

procedure TfrmReportAnalysOfDeposit.CheckBox2Click(Sender: TObject);
begin
    if CheckBox2.Checked then EFilial.CheckAll else EFilial.UnCheckAll
end;

procedure TfrmReportAnalysOfDeposit.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.Checked then ESource.CheckAll else ESource.UnCheckAll
end;

procedure TfrmReportAnalysOfDeposit.chfilialClick(Sender: TObject);
begin
//if chfilial.Checked then Eperson.CheckAll else Eperson.UnCheckAll
end;

procedure TfrmReportAnalysOfDeposit.CheckBox5Click(Sender: TObject);
begin
   if CheckBox5.Checked then ECalcMethod.CheckAll else ECalcMethod.UnCheckAll
end;

procedure TfrmReportAnalysOfDeposit.CheckBox4Click(Sender: TObject);
begin
if CheckBox4.Checked then EType.CheckAll else EType.UnCheckAll
end;

procedure TfrmReportAnalysOfDeposit.CheckBox3Click(Sender: TObject);
begin
if CheckBox3.Checked then EValute.CheckAll else EValute.UnCheckAll
end;

procedure TfrmReportAnalysOfDeposit.BitBtn2Click(Sender: TObject);
begin
   with expSumdsMDR do begin
        Connect;
        ExportDataset(MainGridMDR.DataSource.DataSet,'ReportAnalysOfDeposit',true,false);
        Disconnect;
   end;
end;

procedure TfrmReportAnalysOfDeposit.MainGridMDRTitleBtnClick(
  Sender: TObject; ACol: Integer; Column: TColumnEh);
var
  SortField ,cname: String;
begin
  cname := (Sender as TDBGridEh).DataSource.DataSet.Name;
  if (Sender as TDBGridEh).DataSource.DataSet.active then   begin
  SortField := Column.FieldName;
  if SortField ='SECTOR' then SortField := 'sectorid';
  if Column.Title.SortMarker = smDownEh then
    SortField := SortField + ' DESC';
    
  with Sender as TDBGridEh , TOracleDataSet(DataSource.DataSet) do
  begin
   // ClearVariables;
    Screen.Cursor := crSQLWait;
    SetVariable('OrderField',SortField);
    RefResh;
    Screen.Cursor := crDefault;
   end;
    end;
end;

procedure TfrmReportAnalysOfDeposit.MainGridMDRDblClick(Sender: TObject);
var fstr,fstrB,SpecStr,SpecStrB{,gbstr }:String;
begin
   SpecStr := '';
   SpecStrB := '';
   //gbstr := '  ( ac.bal_cn1 in(SELECT  bal_cn   FROM uaod_source_bal union SELECT    bal_cn  FROM uaod_person_bal union SELECT bal_cn   FROM uaod_type_bal ))' ;

   fstr := FilterStr+' and '+'('+gdepbalspr+')';
   fstrB := FilterStrB;
   fstrB := fstrB +' and '+'('+genStrBal+')';//ShowMessage(fstrB);
   with dmReportAnalysOfDeposit do
   case RgrSum.ItemIndex of
        0: begin SpecStr := 'p.branchid = '+IntToStr(FilialMDR.FieldByName('BRANCHID').AsInteger);
           SpecStrB := 'ac.filial = '+IntToStr(FilialMDR.FieldByName('BRANCHID').AsInteger); end;
        1: begin SpecStr := 'p.currency = '+IntToStr(ValuteMDR.FieldByName('currency').AsInteger);
           SpecStrB := 'ac.val_acc = '+IntToStr(ValuteMDR.FieldByName('currency').AsInteger); end;
        2: begin SpecStr := 'USAID_REPORT.get_Dep_St_per(p.id) = '+IntToStr(PeriodMDR.FieldByName('period').AsInteger);
           if PeriodMDR.FieldByName('PERIOD').asInteger<>1 then
           SpecStrB := ' ac.bal_cn1= 777777777';
           end;
        3: begin SpecStr := 'USAID_REPORT.get_Dep_St_Int(p.id) = '+IntToStr(AnnualIntMDR.FieldByName('sectorID').AsInteger);
             if AnnualIntMDR.FieldByName('sectorid').asinteger<>1 then
             SpecStrB := ' ac.bal_cn1= 777777777';
           end;
        4: begin SpecStr := 'p.contracttype = '+IntToStr(DepTypeMDR.FieldByName('contracttype').AsInteger);
           if DepTypeMDR.FieldByName('contracttype').AsInteger <> 9999 then
              SpecStrB := ' ac.bal_cn1= 777777777';
        end;
   end;

  if fstr = '' then fstr := SpecStr
  else fstr := fstr + ' and ('+ SpecStr+')';


  if SpecStrB <> '' then begin
  if fstrB = '' then fstrB := SpecStrB
  else fstrB := fstrB + ' and ('+ SpecStrB+')';
  end;

   with dmReportAnalysOfDeposit,DetailMDR do begin
        if Active then CloseAll;
        SetVariable('dat',RepDat);
        SetVariable('OrderField','contractno');
        if fstr <> '' then  SQL[44] :=   fstr
        else SQL[44] := ''; //showmessage(fstrb);
        if fstrB <> '' then  SQL[83] :=   fstrB
        else SQL[83] := ''; Memo1.Text := sql.Text;
       open;
   end;

    with frmDetailInfAnalysOfDep do begin
     DBEditEh1.DataSource := dmReportAnalysOfDeposit.DetailMDRds;
     DBEditEh2.DataSource := dmReportAnalysOfDeposit.DetailMDRds;
     DBEditEh3.DataSource := dmReportAnalysOfDeposit.DetailMDRds;
     DTP.DateTime := RepDat;
     ShowModal;
    end;

end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TfrmReportAnalysOfDeposit,
    Class_frmReportAnalysOfDeposit,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

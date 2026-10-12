unit frmInfoflevelsImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DBCtrls, ComCtrls, Mask,
  DBCtrlsEh, DBLookupEh, CMHintBox,OracleData, oracle,HintBox,db;

type
  TfrmInfoflevels = class(TForm)
    Panel1: TPanel;
    Back: TBitBtn;
    Next: TBitBtn;
    BitBtn2: TBitBtn;
    Commit: TBitBtn;
    CPLLevelsPageControl: TPageControl;
    TabSheet1: TTabSheet;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Panel2: TPanel;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEditEh1: TDBEditEh;
    DBEditEh2: TDBEditEh;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    GroupBox7: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEditEh5: TDBEditEh;
    DBEditEh4: TDBEditEh;
    DBEditEh3: TDBEditEh;
    DBEditEh12: TDBEditEh;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DBEditEh6: TDBEditEh;
    DBEditEh8: TDBEditEh;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    GroupBox8: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBEditEh9: TDBEditEh;
    DBEditEh10: TDBEditEh;
    DBLookupComboboxEh4: TDBLookupComboboxEh;
    TabSheet2: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet3: TTabSheet;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label20: TLabel;
    Panel4: TPanel;
    rgrDocHome: TRadioGroup;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    DBEditEh7: TDBEditEh;
    DBEditEh11: TDBEditEh;
    DBEditEh13: TDBEditEh;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    DBDateTimeEditEh3: TDBDateTimeEditEh;
    Label21: TLabel;
    DBEditEh14: TDBEditEh;
    Label22: TLabel;
    DBEditEh15: TDBEditEh;
    Label23: TLabel;
    DBEditEh16: TDBEditEh;
    RadioGroup4: TRadioGroup;
    DBMemo1: TDBMemo;
    Label24: TLabel;
    Panel5: TPanel;
    RadioGroup5: TRadioGroup;
    Label25: TLabel;
    DBEditEh17: TDBEditEh;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    DBEditEh18: TDBEditEh;
    DBEditEh19: TDBEditEh;
    DBLookupComboboxEh5: TDBLookupComboboxEh;
    DBEditEh20: TDBEditEh;
    DBEditEh21: TDBEditEh;
    DBEditEh23: TDBEditEh;
    DBEditEh24: TDBEditEh;
    DBEditEh25: TDBEditEh;
    GroupBox9: TGroupBox;
    GroupBox10: TGroupBox;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    DBEditEh26: TDBEditEh;
    DBEditEh27: TDBEditEh;
    DBEditEh28: TDBEditEh;
    DBEditEh29: TDBEditEh;
    DBEditEh30: TDBEditEh;
    DBEditEh31: TDBEditEh;
    Label41: TLabel;
    Label42: TLabel;
    DBEditEh32: TDBEditEh;
    DBEditEh33: TDBEditEh;
    Label43: TLabel;
    Label44: TLabel;
    DBEditEh34: TDBEditEh;
    DBDateTimeEditEh4: TDBDateTimeEditEh;
    RadioGroup6: TRadioGroup;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    BitBtn1: TBitBtn;
    Label50: TLabel;
    DBEditEh35: TDBEditEh;
    DBLookupComboboxEh6: TDBLookupComboboxEh;
    RadioGroup1: TRadioGroup;
    hblevels: THintBox;
    lblDeny: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label55: TLabel;
    Label54: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    BitBtn3: TBitBtn;
    grbDeny1: TGroupBox;
    DBEditEh22: TDBEditEh;
    grbDeny2: TGroupBox;
    DBEditEh36: TDBEditEh;
    grbDeny3: TGroupBox;
    DBEditEh37: TDBEditEh;
    grbDeny4: TGroupBox;
    DBEditEh38: TDBEditEh;
    grbDeny5: TGroupBox;
    DBEditEh39: TDBEditEh;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BackClick(Sender: TObject);
    procedure CPLLevelsPageControlChange(Sender: TObject);
    procedure CommitClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure rgrDocHomeClick(Sender: TObject);
    procedure NextClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBEditEh7KeyPress(Sender: TObject; var Key: Char);
    procedure DBEditEh7Change(Sender: TObject);
    procedure DBLookupComboboxEh2Change(Sender: TObject);
  private
    procedure DoIns(ds:TOracleDataSet;contID :Integer);
    function ChackLevels:boolean;
    procedure postsData;
    procedure CancelData;
  public
    ContractID :Integer;
    CancelW :boolean;
  end;

var
  frmInfoflevels: TfrmInfoflevels;

implementation

{$R *.DFM}
uses dmLoanPipeLineReportImpl;
procedure TfrmInfoflevels.DoIns(ds:TOracleDataSet;contID :Integer);
begin
   with ds do begin
       if Active then CloseAll;
       SetVariable('contid',contID);
       Open;
       RefreshRecord;
   end;
end;

procedure TfrmInfoflevels.CancelData;
begin
   with dmLoanPipeLineReport do begin
         cplapp.Cancel;
         cpldoc.Cancel;
         cplrisk.Cancel;
         cplop.Cancel;
         cplpaypr.Cancel;
   end;
end;

procedure TfrmInfoflevels.postsData;
var b,b1 :boolean;
    D :TDateTime;
begin

   with dmLoanPipeLineReport,USAID_REPORT do
        b := CallBooleanFunction('check_CreditType',['CrdType',crdType.FieldByName('ID').AsInteger]);


  with dmLoanPipeLineReport do begin //*
   case   CPLLevelsPageControl.ActivePageIndex of  //case
      0:begin with cplapp do begin
      if UpdateStatus in [ usInserted,usModified] then begin
      d :=integer(trunc(cplapp.FieldByName('BIRTHDAT').AsDateTime));
      b1 := USAID_REPORT.CallBooleanFunction('checkDate',['dat',d]);

      if b then begin
         if FieldByName('NAME_BUSINESS').IsNull then begin ShowMessage('Ѕизнес об.ады: sah€си бошдур!');abort; end;
         if FieldByName('ADDRESS_BUSINESS').IsNull then begin ShowMessage('÷нван: sah€си бошдур!');abort; end;
         if FieldByName('ACTIVITIES_DAT_BUSINESS').IsNull then begin ShowMessage('‘€алийй€т мцдд€ти: sah€си бошдур!');abort; end;
      end;

      if b1 then
      begin
         ShowMessage('ƒоьум тарихи дцз дейил');
         abort;
      end;

         USAID_REPORT.CallProcedure('exec_ins',['tablename','CPLAPPICATIONS','ContID',ContractID]);
         fieldbyname('contractid').asinteger := ContractID;
         post;
         Session.Commit;
         RefreshRecord;
         end;
         end;
         if CancelW then begin
         USAID_REPORT.CallProcedure('cancel_wait',['ContID',ContractID]);
         lblDeny.Visible := false;    end;
          end;
      1: begin

         with cpldoc do begin
         if UpdateStatus in [ usInserted,usModified] then begin
              USAID_REPORT.CallProcedure('exec_ins',['tablename','CPLDOCUMENTS','ContID',ContractID]);
              fieldbyname('contractid').asinteger := ContractID;
              FieldByName('DOCOFHOME').asinteger := rgrDocHome.ItemIndex;
              FieldByName('MARRIDEVIDENCE').asinteger := RadioGroup2.ItemIndex;
              FieldByName('FINANCE_REPORTS').asinteger := RadioGroup3.ItemIndex;
              FieldByName('GUARANTEE_DOCOFHOME').asinteger := RadioGroup4.ItemIndex;
              post;
              Session.Commit;
              RefreshRecord;
              end;
         end;
         if CancelW then begin
         USAID_REPORT.CallProcedure('cancel_wait',['ContID',ContractID]);
         lblDeny.Visible := false;    end;
      end;

     2: begin
     if cplrisk.UpdateStatus in [ usInserted,usModified] then begin
        USAID_REPORT.CallProcedure('exec_ins',['tablename','CPLANALISEOFRISK','ContID',ContractID]);
        cplrisk.fieldbyname('contractid').asinteger := ContractID;
        cplrisk.FieldByName('OBJECTION').asinteger :=RadioGroup1.ItemIndex;
        cplrisk.post;
        cplrisk.Session.Commit;
        cplrisk.RefreshRecord ;
        end;
         if CancelW then begin
         USAID_REPORT.CallProcedure('cancel_wait',['ContID',ContractID]);
         lblDeny.Visible := false;    end;
     end;

     3:begin
     if cplop.UpdateStatus in [ usInserted,usModified] then begin
        USAID_REPORT.CallProcedure('exec_ins',['tablename','CPLOPINIONOFCOMMITTEE','ContID',ContractID]);
        cplop.fieldbyname('contractid').asinteger := ContractID;
        cplop.FieldByName('AGAINST').asinteger :=RadioGroup5.ItemIndex;
        cplop.post;
        cplop.Session.Commit;
        cplop.RefreshRecord;
        end;
         if CancelW then begin
         USAID_REPORT.CallProcedure('cancel_wait',['ContID',ContractID]);
         lblDeny.Visible := false;    end;
     end;

     4:begin
     if cplpaypr.UpdateStatus in [ usInserted,usModified] then begin
        USAID_REPORT.CallProcedure('exec_ins',['tablename','CPLPAYMENTPROCESS','ContID',ContractID]);
        cplpaypr.fieldbyname('contractid').asinteger := ContractID;
        cplpaypr.FieldByName('PR_BEEN_COMPLETED').asinteger :=RadioGroup6.ItemIndex;
        cplpaypr.post;
        cplpaypr.Session.Commit;
        cplpaypr.RefreshRecord;
        end;
         if CancelW then begin
         USAID_REPORT.CallProcedure('cancel_wait',['ContID',ContractID]);
         lblDeny.Visible := false;    end;
     end;

   end; //case
   end; //*
end;

procedure TfrmInfoflevels.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False
end;

procedure TfrmInfoflevels.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if ord(key) = VK_ESCAPE then close
end;

procedure TfrmInfoflevels.FormShow(Sender: TObject);
var lname,dln,wln,cml :string;
begin
   Back.Enabled:=false;
   Next.Enabled:=true;
   CPLLevelsPageControl.ActivePageIndex :=0;
   grbDeny1.Visible := false;
   grbDeny2.Visible := false;
   grbDeny3.Visible := false;
   grbDeny4.Visible := false;
   grbDeny5.Visible := false;
   BitBtn3.Enabled := true;
{   if dmLoanPipeLineReport.USAID_REPORT.CallBooleanFunction('CheckLevel',[
              'ContID',ContractID,'LevelName','P1']) then  CPLLevelsPageControl.ActivePageIndex :=0;
   if dmLoanPipeLineReport.USAID_REPORT.CallBooleanFunction('CheckLevel',[
              'ContID',ContractID,'LevelName','P2']) then  CPLLevelsPageControl.ActivePageIndex :=1;
   if dmLoanPipeLineReport.USAID_REPORT.CallBooleanFunction('CheckLevel',[
              'ContID',ContractID,'LevelName','P3']) then  CPLLevelsPageControl.ActivePageIndex :=2;
   if dmLoanPipeLineReport.USAID_REPORT.CallBooleanFunction('CheckLevel',[
              'ContID',ContractID,'LevelName','P4']) then  CPLLevelsPageControl.ActivePageIndex :=3;
   if dmLoanPipeLineReport.USAID_REPORT.CallBooleanFunction('CheckLevel',[
              'ContID',ContractID,'LevelName','P5']) then  CPLLevelsPageControl.ActivePageIndex :=4;  }


   dln := dmLoanPipeLineReport.USAID_REPORT.CallStringFunction('get_DenyLevels',[
              'ContID',ContractID]);

   wln := dmLoanPipeLineReport.USAID_REPORT.CallStringFunction('get_waitLevels',[
              'ContID',ContractID]);
   cml := dmLoanPipeLineReport.USAID_REPORT.CallStringFunction('get_CommittedLevel',[
              'ContID',ContractID]);


   BitBtn2.Enabled := true;
   if  dln <> '' then begin
    with dmLoanPipeLineReport,DenyNote do
    begin
       if Active then CloseAll;
       SetVariable('contid',ContractID);
       Open;
    end;

   BitBtn2.Enabled := False;
   BitBtn3.Enabled := false;
   grbDeny1.Visible := true;
   grbDeny2.Visible := true;
   grbDeny3.Visible := true;
   grbDeny4.Visible := true;
   grbDeny5.Visible := true;
   end;
   Commit.Enabled:= false;


    with dmLoanPipeLineReport,continf do begin
         if Active then close;
         SetVariable('contid',ContractID);
         open;
        DBLookupComboboxEh3.KeyValue := FieldByName('currency').AsInteger;
    end;


   DoIns(dmLoanPipeLineReport.cplapp,ContractID);
   DoIns(dmLoanPipeLineReport.cpldoc,ContractID);
   DoIns(dmLoanPipeLineReport.cplrisk,ContractID);
   DoIns(dmLoanPipeLineReport.cplop,ContractID);
   DoIns(dmLoanPipeLineReport.cplpaypr,ContractID);

   with dmLoanPipeLineReport do begin
         cpldoc.FieldByName('PASS_SER').AsString := CrdPipeLines.FieldByName('PASS_SER').AsString;
         DBEditEh7.text := CrdPipeLines.FieldByName('PASS_SER').AsString;
         cpldoc.FieldByName('PASS_NO').AsString := CrdPipeLines.FieldByName('Customerid').AsString;
         DBEditEh11.text := CrdPipeLines.FieldByName('Customerid').AsString;
   end;

   lblDeny.Visible := false;

   with dmLoanPipeLineReport do begin
        rgrDocHome.ItemIndex := cpldoc.FieldByName('DOCOFHOME').asInteger;
        RadioGroup2.ItemIndex := cpldoc.FieldByName('MARRIDEVIDENCE').asInteger;
        RadioGroup3.ItemIndex := cpldoc.FieldByName('FINANCE_REPORTS').asInteger;
        RadioGroup4.ItemIndex := cpldoc.FieldByName('GUARANTEE_DOCOFHOME').asInteger;
        RadioGroup1.ItemIndex := cplrisk.FieldByName('OBJECTION').asInteger;
        RadioGroup5.ItemIndex := cplop.FieldByName('AGAINST').asInteger;
        RadioGroup6.ItemIndex := cplpaypr.FieldByName('PR_BEEN_COMPLETED').asInteger;

        if dln <> '' then begin
            {if dln = 'P1' then  CPLLevelsPageControl.ActivePageIndex :=0;
            if dln = 'P2' then CPLLevelsPageControl.ActivePageIndex :=1;
            if dln = 'P3' then CPLLevelsPageControl.ActivePageIndex :=2;
            if dln = 'P4' then CPLLevelsPageControl.ActivePageIndex :=3;
            if dln = 'P5' then CPLLevelsPageControl.ActivePageIndex :=4;    }

        lblDeny.Visible := true;
        lblDeny.Caption := dln + '-жи м€рщ€л€д€ имтина олунуб!';
        end;


        if (wln <> '') and (dln='') then begin
            {if wln = 'P1' then  CPLLevelsPageControl.ActivePageIndex :=0;
            if wln = 'P2' then CPLLevelsPageControl.ActivePageIndex :=1;
            if wln = 'P3' then CPLLevelsPageControl.ActivePageIndex :=2;
            if wln = 'P4' then CPLLevelsPageControl.ActivePageIndex :=3;
            if wln = 'P5' then CPLLevelsPageControl.ActivePageIndex :=4;  }

        lblDeny.Visible := true;
         BitBtn3.Enabled := true;
        lblDeny.Caption := wln + '-жи м€рщ€л€д€ эюзл€дилиб!';
        end;

   end;

    if (cml <> '')   then begin
        BitBtn3.Enabled := false;
        Commit.Enabled := false;
    end else begin
        BitBtn3.Enabled := true;
        Commit.Enabled := true;

    end;

end;

function TfrmInfoflevels.ChackLevels:boolean;
begin
      case CPLLevelsPageControl.ActivePageIndex of
          0:begin
             if not dmLoanPipeLineReport.USAID_REPORT.CallBooleanFunction('CheckLevel',[
              'ContID',ContractID,'LevelName','P1']) then begin
              hblevels.ShowMessage('ћ€рщ€л€ 1 тамамланмайыб!'); result:=false ;end;
            end;
          1:begin
             if not dmLoanPipeLineReport.USAID_REPORT.CallBooleanFunction('CheckLevel',[
              'ContID',ContractID,'LevelName','P2']) then begin
              hblevels.ShowMessage('ћ€рщ€л€ 2 тамамланмайыб!'); result:=false ;end;
            end;
          2:begin
             if not dmLoanPipeLineReport.USAID_REPORT.CallBooleanFunction('CheckLevel',[
              'ContID',ContractID,'LevelName','P3']) then begin
              hblevels.ShowMessage('ћ€рщ€л€ 3 тамамланмайыб!');result:=false ;end;
            end;
          3:begin
             if not dmLoanPipeLineReport.USAID_REPORT.CallBooleanFunction('CheckLevel',[
              'ContID',ContractID,'LevelName','P4']) then begin
              hblevels.ShowMessage('ћ€рщ€л€ 4 тамамланмайыб!');result:=false ; end;
            end;
          4:begin
             if not dmLoanPipeLineReport.USAID_REPORT.CallBooleanFunction('CheckLevel',[
              'ContID',ContractID,'LevelName','P5']) then begin
              hblevels.ShowMessage('ћ€рщ€л€ 5 тамамланмайыб!');result:=false; end;
            end;

      end;

end;

procedure TfrmInfoflevels.BackClick(Sender: TObject);
var b : boolean;
begin
      with CPLLevelsPageControl do
     begin
          ActivePageIndex:=ActivePageIndex-1;
          if ActivePageIndex=0 then
          Back.Enabled:=false;
             Next.Enabled:=true;

     end;
     with dmLoanPipeLineReport,USAID_REPORT do begin
          b := CallBooleanFunction('CheckActive',['PageIDX',
               CPLLevelsPageControl.ActivePageIndex,'contid',
               CrdPipeLines.FieldByName('ID').AsInteger])
     end;
     BitBtn3.Enabled := b;
     Commit.Enabled := b;

end;

procedure TfrmInfoflevels.CPLLevelsPageControlChange(Sender: TObject);
var
     i :integer;
     c :integer;
     d,w :integer;
     ca,wa :string;
    dn,crdst,cl :string;
     b :boolean;
begin

//////////

/////////////


     with dmLoanPipeLineReport do
     crdst :=  USAID_REPORT.callstringfunction('get_crdlpstatus',['p_ID',CrdPipeLines.FieldByName('ID').AsInteger]) ;

     if crdst = '' then   begin
        CPLLevelsPageControl.ActivePageIndex := 0;
         exit;
        end;

     //ShowMessage(' CPLLevelsPageControl.ActivePageIndex = '+inttostr( CPLLevelsPageControl.ActivePageIndex)) ;
      with dmLoanPipeLineReport,USAID_REPORT do begin
             b := CallBooleanFunction('CheckActive',['PageIDX',
               CPLLevelsPageControl.ActivePageIndex,'contid',
               CrdPipeLines.FieldByName('ID').AsInteger]);
       dn := callstringfunction('get_DenyLevels',['contid',
               CrdPipeLines.FieldByName('ID').AsInteger])

     end;

     BitBtn3.Enabled := b;
     Commit.Enabled := b;



     if  dn <> '' then
     d:=strtoint(copy(dn,2,2)) else d := 0;
     dmLoanPipeLineReport.PageIdx := CPLLevelsPageControl.ActivePageIndex;

   if d<> 0 then
   if d <= CPLLevelsPageControl.ActivePageIndex then begin CPLLevelsPageControl.ActivePageIndex:=d-1; exit; end;


     cl := dmLoanPipeLineReport.USAID_REPORT.CallStringFunction('get_crdlpstatus',
     ['p_ID',ContractID]);
     if cl <> '' then
     c:=strtoint(copy(cl,2,2)) else
     c := 5;
     wa :=dmLoanPipeLineReport.USAID_REPORT.CallStringFunction('get_waitLevels',
     ['ContID',ContractID]) ;
     if  wa <> '' then
     w:=strtoint(copy(wa,2,2)) else w := 0;
     dmLoanPipeLineReport.PageIdx := CPLLevelsPageControl.ActivePageIndex;



   if w <> 0 then
   if w <= CPLLevelsPageControl.ActivePageIndex+1 then begin CPLLevelsPageControl.ActivePageIndex:=w-1; exit; end;

   if c<> 5 then
   if c <= CPLLevelsPageControl.ActivePageIndex then begin CPLLevelsPageControl.ActivePageIndex:=c; exit; end;


    for i := 0 to CPLLevelsPageControl.ActivePageIndex do begin
      case i of
          0:begin
               {if ((c>=1) and (w>1)) then  begin
               BitBtn3.Enabled := false;
               Commit.Enabled := false;  end
               else begin
               BitBtn3.Enabled := true;
               Commit.Enabled := true; end; }

             if not dmLoanPipeLineReport.USAID_REPORT.CallBooleanFunction('CheckLevel',[
              'ContID',ContractID,'LevelName','P1']) then begin
              CPLLevelsPageControl.ActivePageIndex:=0;

             // exit;
              end;


            end;
          1:begin
              { if (c>=2) and (w>2) then  begin
               BitBtn3.Enabled := false;
               Commit.Enabled := false;  end
               else begin
               BitBtn3.Enabled := true;
               Commit.Enabled := true; end;}
            
             if not dmLoanPipeLineReport.USAID_REPORT.CallBooleanFunction('CheckLevel',[
              'ContID',ContractID,'LevelName','P2']) then begin
              CPLLevelsPageControl.ActivePageIndex:=1;
             // exit;
              end;

            end;
          2:begin
                {if (c>=3) and (w>3) then  begin
               BitBtn3.Enabled := false;
               Commit.Enabled := false;  end
               else begin
               BitBtn3.Enabled := true;
               Commit.Enabled := true; end;  }
            if not dmLoanPipeLineReport.USAID_REPORT.CallBooleanFunction('CheckLevel',[
              'ContID',ContractID,'LevelName','P3']) then begin
              CPLLevelsPageControl.ActivePageIndex:=2;
              //exit;
              end;

            end;
          3:begin
               {if (c>=4) and (w>4) then  begin
               BitBtn3.Enabled := false;
               Commit.Enabled := false;  end
               else begin
               BitBtn3.Enabled := true;
               Commit.Enabled := true;
                end;      }

             if not dmLoanPipeLineReport.USAID_REPORT.CallBooleanFunction('CheckLevel',[
              'ContID',ContractID,'LevelName','P4']) then begin
              CPLLevelsPageControl.ActivePageIndex:=3;
             //exit;
              end;

            end;
          4:begin
               {if (c>=5) and (w>5) then  begin
               BitBtn3.Enabled := false;
               Commit.Enabled := false;
               end
               else begin
               BitBtn3.Enabled := true;
               Commit.Enabled := true;
              end;  }
             if not dmLoanPipeLineReport.USAID_REPORT.CallBooleanFunction('CheckLevel',[
              'ContID',ContractID,'LevelName','P5']) then begin
              CPLLevelsPageControl.ActivePageIndex:=4;
            exit;
              end;
              //if w = 5 then begin CPLLevelsPageControl.ActivePageIndex:=4; exit; end;
            end;


      end;
      end;

   
    if CPLLevelsPageControl.ActivePageIndex <> 0 then
    Back.Enabled := true;

    if CPLLevelsPageControl.ActivePageIndex <> 4 then
    next.Enabled := true;
   

     if CPLLevelsPageControl.ActivePageIndex=4 then  begin
      Next.Enabled:=false;
      Back.Enabled:=true; end;

      if CPLLevelsPageControl.ActivePageIndex=0 then  begin
          Back.Enabled:=false;
             Next.Enabled:=true;

     end;




end;

procedure TfrmInfoflevels.CommitClick(Sender: TObject);
var lname :string;
begin
CancelW := true;
        with dmLoanPipeLineReport, USAID_REPORT do
         lname:= callstringfunction('get_DenyLevels',['contid',ContractID]);
   if lname = '' then begin
   try
   postsData;
   dmLoanPipeLineReport.USAID_REPORT.CallProcedure('Committed_Level',['contid',ContractID]);
   Commit.Enabled := false;
   BitBtn3.Enabled := false;
   except
on  e: exception do
          ShowMessage(e.Message);
   end;
   end else
   CancelData;

end;

procedure TfrmInfoflevels.BitBtn2Click(Sender: TObject);
var wa,ca,lname,comml :string;
    li :integer;
    RejectReason :string;
begin


 comml :=dmLoanPipeLineReport.USAID_REPORT.CallStringFunction('get_CommittedLevel',
     ['ContID',ContractID]) ;

 if  comml = 'P5' then
 exit;
 
     wa :=dmLoanPipeLineReport.USAID_REPORT.CallStringFunction('get_waitLevels',
     ['ContID',ContractID]) ;


     ca :=dmLoanPipeLineReport.USAID_REPORT.CallStringFunction('get_crdlpstatus',
     ['p_ID',ContractID]) ;


  if (ca <> '') or   (wa<>'') then
  if InputQuery('Imtinaolunma ! ', '“€йинат:',RejectReason ) then
   try
   with dmLoanPipeLineReport,USAID_REPORT do
        lname := CallStringFunction('DenyLevels',['ContID',contractid,'LevelName',lname,'notes',RejectReason]);
   CPLLevelsPageControl.ActivePageIndex := 0;
   lblDeny.Visible := true;
   lblDeny.caption := lname + '-жи м€рщ€л€д€ имтина олунуб!';
   BitBtn2.Enabled := false;
   BitBtn3.Enabled := false;
   Back.Enabled := false;
   Next.Enabled := true;
   
    with dmLoanPipeLineReport,DenyNote do
    begin
       if Active then CloseAll;
       SetVariable('contid',ContractID);
       Open;
    end;

   grbDeny1.Visible := true;
   grbDeny2.Visible := true;
   grbDeny3.Visible := true;
   grbDeny4.Visible := true;
   grbDeny5.Visible := true;

   except
       on E: Exception do hblevels.ShowMessage(e.Message);
   end;
end;

procedure TfrmInfoflevels.rgrDocHomeClick(Sender: TObject);
var lname :string;
begin
  with dmLoanPipeLineReport do begin
  case CPLLevelsPageControl.ActivePageIndex of
       1:cpldoc.edit;
       2:cplrisk.Edit;
       3:cplop.Edit;
       4:cplpaypr.Edit;
  end;
  end;

with dmLoanPipeLineReport, USAID_REPORT do begin
         lname:= callstringfunction('get_DenyLevels',['contid',CrdPipeLines.FieldByName('ID').AsInteger]);
         end;
if lname = '' then 
    Commit.Enabled := true;
//DBEditEh1Change(sender);
end;

procedure TfrmInfoflevels.NextClick(Sender: TObject);
var
     i :integer;
     b : boolean;
     dn,ca,wa :string;
     d,c,w :integer;

begin
      with dmLoanPipeLineReport,USAID_REPORT do begin
            dn := callstringfunction('get_DenyLevels',['contid',
               CrdPipeLines.FieldByName('ID').AsInteger])
     end;

     if  dn <> '' then
     d:=strtoint(copy(dn,2,2)) else d := 0;
     dmLoanPipeLineReport.PageIdx := CPLLevelsPageControl.ActivePageIndex;

     if d<> 0 then
     if d = CPLLevelsPageControl.ActivePageIndex+1 then begin CPLLevelsPageControl.ActivePageIndex:=d-1; exit; end;

     wa :=dmLoanPipeLineReport.USAID_REPORT.CallStringFunction('get_waitLevels',
     ['ContID',ContractID]) ;
     if  wa <> '' then
     w:=strtoint(copy(wa,2,2)) else w := 6;

     ca :=dmLoanPipeLineReport.USAID_REPORT.CallStringFunction('get_crdlpstatus',
     ['p_ID',ContractID]) ;
     if  ca <> '' then
     c:=strtoint(copy(ca,2,2)) else c := 0;

    if w <> 6 then
   if w = CPLLevelsPageControl.ActivePageIndex+1 then begin CPLLevelsPageControl.ActivePageIndex:=w-1; exit; end;

   if c <> 0 then 
   if c = CPLLevelsPageControl.ActivePageIndex then begin CPLLevelsPageControl.ActivePageIndex:=c; exit; end;

   if (c = 0) and (w=6) then
   begin CPLLevelsPageControl.ActivePageIndex:=0; exit; end;

   CPLLevelsPageControlChange(sender);


    if CPLLevelsPageControl.ActivePageIndex <> 0 then
    Back.Enabled := true;

    if CPLLevelsPageControl.ActivePageIndex <> 4 then
    next.Enabled := true;


     if CPLLevelsPageControl.ActivePageIndex=4 then  begin
      Next.Enabled:=false;
      Back.Enabled:=true; end;

      if CPLLevelsPageControl.ActivePageIndex=0 then  begin
          Back.Enabled:=false;
             Next.Enabled:=true;

     end;

        with CPLLevelsPageControl do
     begin
         //if w= ActivePageIndex+1 then exit;
          ActivePageIndex:=ActivePageIndex+1;
          if ActivePageIndex= PageCount-1 then
          Next.Enabled:=false;
          Back.Enabled:=true;

     end;

    // showmessage(inttostr(CPLLevelsPageControl.ActivePageIndex));
     with dmLoanPipeLineReport,USAID_REPORT do begin
          b := CallBooleanFunction('CheckActive',['PageIDX',
               CPLLevelsPageControl.ActivePageIndex,'contid',
               CrdPipeLines.FieldByName('ID').AsInteger])
     end;
     BitBtn3.Enabled := b;
     Commit.Enabled := b;
end;

procedure TfrmInfoflevels.BitBtn3Click(Sender: TObject);
var dn,lname :String;
begin
   CancelW := false;
      with dmLoanPipeLineReport,USAID_REPORT do begin
            dn := callstringfunction('get_DenyLevels',['contid',
               CrdPipeLines.FieldByName('ID').AsInteger])
     end;

     if dn = '' then
  try
  with dmLoanPipeLineReport,USAID_REPORT do  begin
       postsData;
       lname := CallStringFunction('Wait',['contid',Contractid]);
       callprocedure('InitWait',['contid',Contractid])
       end;
     if lname <> '' then begin
     lblDeny.Visible := true;
     lblDeny.caption := lname + '-жи м€рщ€л€д€ эюзл€дилиб!';
     end ;
  except
      on  e: exception do
          ShowMessage(e.Message);
  end;


end;

procedure TfrmInfoflevels.DBEditEh7KeyPress(Sender: TObject;
  var Key: Char);
begin
key:=#0;
end;

procedure TfrmInfoflevels.DBEditEh7Change(Sender: TObject);
begin
   //DBEditEh1Change(sender)
end;

procedure TfrmInfoflevels.DBLookupComboboxEh2Change(Sender: TObject);
var b:boolean; 
begin
   with dmLoanPipeLineReport,USAID_REPORT do begin
        b := CallBooleanFunction('check_CreditType',['CrdType',crdType.FieldByName('ID').AsInteger]);
        if b then begin
           Label65.Visible := true;
           Label66.Visible := true;
           Label67.Visible := true;
        end
        else begin
           Label65.Visible := false;
           Label66.Visible := false;
           Label67.Visible := false;
        end;;
   end;
end;

end.


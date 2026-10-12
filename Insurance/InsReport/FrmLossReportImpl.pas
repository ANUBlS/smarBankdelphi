unit FrmLossReportImpl;
                      //DSPaymentReal_Reploss
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, XFSCtrls, StdCtrls, ComCtrls, DBCtrls, CMExcelExport;

type
  TFrmLossReport = class(TForm)
    XFPanel1: TXFPanel;
    XFPanel2: TXFPanel;
    XFButton1: TXFButton;
    XFButton2: TXFButton;
    XFPanel3: TXFPanel;
    XFGroupBox3: TXFGroupBox;
    XFCheckBox1: TXFCheckBox;
    DBLookupComboBox1: TDBLookupComboBox;
    XFGroupBox6: TXFGroupBox;
    XFCheckBox3: TXFCheckBox;
    ComboBox1: TComboBox;
    XFGroupBox8: TXFGroupBox;
    DBLookupComboBox2: TDBLookupComboBox;
    XFCheckBox5: TXFCheckBox;
    XFPanel4: TXFPanel;
    XFGroupBox7: TXFGroupBox;
    XFCheckBox4: TXFCheckBox;
    DBLookupComboBox3: TDBLookupComboBox;
    XFGroupBox5: TXFGroupBox;
    XFCheckBox2: TXFCheckBox;
    Edit1: TEdit;
    XFGroupBox9: TXFGroupBox;
    XFCheckBox6: TXFCheckBox;
    DateTimePicker10: TDateTimePicker;
    DateTimePicker11: TDateTimePicker;
    Memo1: TMemo;
    ExcelExport: TCMExcelExport;
    XFGroupBox1: TXFGroupBox;
    XFCheckBox7: TXFCheckBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    XFGroupBox2: TXFGroupBox;
    XFCheckBox8: TXFCheckBox;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure XFButton2Click(Sender: TObject);
    procedure XFButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
       procedure ActionFilterExecute(Sender: TObject);
       var
       FilterStr1,FilterStrimtina,FilterStrarasdirma,FilterStrodenis,Filterall,FilterOdenmeReal,groupb:string;
  end;

var
  FrmLossReport: TFrmLossReport;

implementation

{$R *.dfm}
       uses DMReportImpl;
procedure TFrmLossReport.FormCreate(Sender: TObject);
begin

//showmessage('salam1');
DMReport.DSALLins_type.open;
DMReport.DSALLCust.open;
DMReport.DSAlldict_emp_acc.open;
  //showmessage('salam2');
FilterStrimtina:=DMReport.DSALLImtinaReploss.SQL.Text;
FilterStrarasdirma:=DMReport.DSALLarasdirmaReploss.SQL.Text;
FilterStrodenis:=DMReport.DSALLtaninmaReploss.SQL.Text;
Filterall:=DMReport.DSALLReploss.SQL.Text;
FilterOdenmeReal:=DMReport.DSALLodenmisReploss.SQL.Text;
//showmessage('salam3');
end;

procedure TFrmLossReport.FormKeyPress(Sender: TObject; var Key: Char);
begin
if ord(key)=vk_escape then  close;

end;

procedure TFrmLossReport.FormShow(Sender: TObject);
begin
XFCheckBox1.Checked:=false;
XFCheckBox2.Checked:=false;
XFCheckBox3.Checked:=false;
XFCheckBox4.Checked:=false;
XFCheckBox5.Checked:=false;
XFCheckBox6.Checked:=false;
XFCheckBox7.Checked:=false;
DBLookupComboBox1.KeyValue:='';
DBLookupComboBox2.KeyValue:='';
DBLookupComboBox3.KeyValue:='';
ComboBox1.Text:='';
Edit1.Text:='';

DateTimePicker10.DateTime:=DMReport.DSsysdat.FieldByName('tek_dat').AsDateTime;
DateTimePicker11.DateTime:=DMReport.DSsysdat.FieldByName('tek_dat').AsDateTime;

DateTimePicker3.DateTime:=DMReport.DSsysdat.FieldByName('tek_dat').AsDateTime;
DateTimePicker4.DateTime:=DMReport.DSsysdat.FieldByName('tek_dat').AsDateTime;


DateTimePicker1.DateTime:=DMReport.DSsysdat.FieldByName('tek_dat').AsDateTime;
DateTimePicker2.DateTime:=DMReport.DSsysdat.FieldByName('tek_dat').AsDateTime;
end;

procedure TFrmLossReport.XFButton1Click(Sender: TObject);
begin
if (XFCheckBox3.Checked=false) or(XFCheckBox3.Checked=true) and (ComboBox1.Text='')  then
begin
  showmessage('Diqqet . status secilmeyib');
end;


ActionFilterExecute(Sender);
end;

    procedure TFrmLossReport.ActionFilterExecute(Sender: TObject);

   function  CheckFiltered(IsChecked: Boolean; const FilterStr: String; Args: array of const): String;
   begin
    Result :='';
    if  IsChecked  then
     Result :=Format(FilterStr, Args);

   end;

const
   BooleanPrefix = ' AND ';
   p_instypeFilter= '(ii.id=%d)';
   p_polisno= '(icr.policy_num=%d)';
   nameFilter = '(ic.cust_id=%d)';
   p_status='(inscs.STATUS=%d)';
   p_EMPL_ACCFilter='(ids.EMPL_ACC=%d)';


var
   p_instype: String;
   p_Polis:String;
   p_d_status:String;
   p_claim_dat:String;
   p_name:string;
   p_EMPL_ACC:string;
   FilterStr: String;
   p_claim_dat_real:string;
   p_claim_taninma_dat :string;
begin
 FilterStr :='';

p_instype:=CheckFiltered(
              XFCheckBox1.Checked
             ,p_instypeFilter
             ,[DBLookupComboBox1.ListSource.DataSet.FieldByName('id').asinteger]
              );
{if  (ComboBox1.ItemIndex<>3) then
begin
p_d_status:=CheckFiltered(
              XFCheckBox3.Checked
             ,p_status
             ,[ComboBox1.ItemIndex]
              );
              end;}

p_name:=CheckFiltered(
              XFCheckBox4.Checked
             ,nameFilter
             ,[DBLookupComboBox3.ListSource.DataSet.FieldByName('id').asinteger]
              );

 p_EMPL_ACC:=CheckFiltered(
              XFCheckBox5.Checked
             ,p_EMPL_ACCFilter
             ,[DBLookupComboBox2.ListSource.DataSet.FieldByName('id').asinteger]
              );

    if XFCheckBox2.Checked=true then
    begin
    p_Polis:=' icr.policy_num='+''''+Edit1.Text+'''';

    end
    else
    begin
     p_Polis:='';
    end;


        if XFCheckBox6.Checked=true then
    begin
    p_claim_dat:=' TO_DATE(ids.claim_date,''dd.MM.yyyy'')'+ ' between  '+''''+datetostr(DateTimePicker10.DateTime)+''''+' and '+''''+datetostr(DateTimePicker11.DateTime)+'''';
    //p_claim_dat:=' c_d.claim_date='+ ' between  ' ;
    //+''''+datetostr(DateTimePicker10.DateTime)+''''+' and '+''''+datetostr(DateTimePicker11.DateTime)+'''';
    end
    else
    begin
     p_claim_dat:='';
    end;

        if XFCheckBox7.Checked=true then
    begin
    p_claim_dat_real:='  icp.paydate in (select paydate from ins_claim_payment where TO_DATE(paydate,''dd.MM.yyyy'')'+ ' between  '+''''+datetostr(DateTimePicker1.DateTime)+''''+' and '+''''+datetostr(DateTimePicker2.DateTime)+''''+')';
    //p_claim_dat:=' c_d.claim_date='+ ' between  ' ;
    //+''''+datetostr(DateTimePicker10.DateTime)+''''+' and '+''''+datetostr(DateTimePicker11.DateTime)+'''';
    end
    else
    begin
     p_claim_dat_real:='';
    end;

      if XFCheckBox8.Checked=true then
    begin
    p_claim_taninma_dat:=' TO_DATE(inscs.stage_tesdiq_dat,''dd.MM.yyyy'')'+ ' between  '+''''+datetostr(DateTimePicker3.DateTime)+''''+' and '+''''+datetostr(DateTimePicker4.DateTime)+'''';
    //p_claim_dat:=' c_d.claim_date='+ ' between  ' ;
    //+''''+datetostr(DateTimePicker10.DateTime)+''''+' and '+''''+datetostr(DateTimePicker11.DateTime)+'''';
    end
    else
    begin
     p_claim_taninma_dat:='';
    end;


     if  XFCheckBox1.Checked
  then
  if  FilterStr=''  then
    FilterStr :=p_instype
  else
    FilterStr :=FilterStr + BooleanPrefix + p_instype;

      if  XFCheckBox2.Checked
  then
  if  FilterStr=''  then
    FilterStr :=p_Polis
  else
    FilterStr :=FilterStr + BooleanPrefix + p_Polis;


    {if  XFCheckBox3.Checked
  then
  if  FilterStr=''  then
    FilterStr :=p_d_status
  else
    FilterStr :=FilterStr + BooleanPrefix + p_d_status;
      }

    if  XFCheckBox4.Checked
  then
  if  FilterStr=''  then
    FilterStr :=p_name
  else
    FilterStr :=FilterStr + BooleanPrefix + p_name;


    if  XFCheckBox6.Checked
  then
  if  FilterStr=''  then
    FilterStr :=p_claim_dat
  else
    FilterStr :=FilterStr + BooleanPrefix + p_claim_dat;

        if  XFCheckBox7.Checked
  then
  if  FilterStr=''  then
    FilterStr :=p_claim_dat_real
  else
    FilterStr :=FilterStr + BooleanPrefix + p_claim_dat_real;

     if  XFCheckBox8.Checked
  then
  if  FilterStr=''  then
    FilterStr :=p_claim_taninma_dat
  else
    FilterStr :=FilterStr + BooleanPrefix + p_claim_taninma_dat;

      if  XFCheckBox5.Checked
  then
  if  FilterStr=''  then
    FilterStr :=p_EMPL_ACC
  else
    FilterStr :=FilterStr + BooleanPrefix + p_EMPL_ACC;



         FilterStr:=' and '+ FilterStr;

        if (XFCheckBox1.Checked=false)
        and (XFCheckBox2.Checked=false)
        and (XFCheckBox3.Checked=false)
        and (XFCheckBox4.Checked=false)
        and (XFCheckBox5.Checked=false)
        and (XFCheckBox6.Checked=false)
        and (XFCheckBox7.Checked=false)
        and (XFCheckBox8.Checked=false) then
          begin
          FilterStr:='';
          end;
          if FilterStr=' and ' then
          begin
             FilterStr:='';
          end;

groupb:=' group by ids.id, ids.region, ids.street, ids.detail, ids.person, ids.mark, ids.statenum,'
     +'  ids.avtoservis, ids.model, ids.appdate, ids.letterdate, ids.letternum, '
     +'  ids.sprnum, ids.prtnum, ids.actdate, ids.mk_id, ids.cid, ids.modelid,  '
     +'  ids.markaid, ids.claim_num, ids.claim_date, ids.subraqasiya, ids.empl_acc, '
     +'  ids.probeg, ids.uto_transportation_costs, ids.final_amount_loss, '
     +'  ids.auto_assess_costs, ids.value_new_spare_parts, ids.other_costs, '
     +'  ids.management_rights, ids.ins_against_organization, '
     +'  ids.ins_against_polisn_dat, ids.event_pub_authority_reg, '
     +'  ids.auto_real_market_value, ids.remains_value, ids.bank_accno, ids.type, '
     +'  ids.c_type, ids.claim_status, ids.driver, ids.final_payment_amount_loss,'
     +'  ids.amortizasiya_ammount, ids.ekspertiza_amount,'
     +'  ids.approximate_ammount, ids.other_driver, ids.refusal_ammount, '
     +'  ids.refusal_date, ids.refusal_description, ids.ins_against_owner, '
     +'  ids.refusal_letter_num, ids.subraqasiya1,'
     +'  ii.id, ii.name, ii.mainformname, ii.mainformguid, ii.changeguid,'
     +'  ii.suggestionguid, ii.policyguid, ii.loan_bal_cn, ii.curr_bal_cn,'
     +'  ii.prefix, ii.profit_acc_id, ii.obeykt_type, ii.comman_acc_id, '
     +'  ii.branch, ii.useid,ic.id, ic.cust_id, ic.name, ic.surname, ic.fathername, ic.homephone,'
     +'  ic.workphone, ic.mobilephone, ic.fax, ic.address, ic.dateofbirth,'
     +'  ic.placeofbirth, ic.age, ic.sex, ic.pasportno, ic.ms_id, ic.city, '
     +'  ic.index_, ic.mailingaddress, ic.occ_id, ic.ed_id, ic.state, ic.act_id, '
     +'  ic.contactperson, ic.contactpersonphone, ic.close_prefix, '
     +'  ic.insured_typeid, ic.passer, ic.document_type, ic.inn, ic.enter_date,'
     +'  ic.mail, ic.state_id, ic.city_id, ic.driver_dat, ic.user_ins_id,'
     +'  ic.sysdat,icr.id, icr.type_id, icr.ins_date, icr.begin_date, icr.end_date, '
     +'  icr.valute_id, icr.ammount, icr.close_prefix, icr.kli_id, icr.loanacc_id,'
     +'  icr.curracc_id, icr.policy_num, icr.inssumm, icr.franshiz, icr.tariff,'
     +'  icr.state, icr.agent_id, icr.pnum, icr.ben_id, icr.beneficiary, '
     +' icr.conditions, icr.sugnum, icr.blank_id, icr.op_id, icr.reins, icr.chkasko,'
     +'  icr.chm, icr.chfq, icr.commitop_id, icr.commit_date, icr.cancelopid,'
     +'  icr.canceldate, icr.filial, icr.bnf_type, icr.userinsert, icr.insured,'
     +'  icr.comission,inscs.id, inscs.dep_id, inscs.status, inscs.stage_forma4, inscs.stage_bankin_cavabi,'
     +'  inscs.stage_qarsi_teref_qiymcavab, inscs.stage_qusur_akti,'
     +'  inscs.stage_yoxlama, inscs.stage_muraciet, inscs.stage_ok_verilib,'
     +'  inscs.stage_tesdiq, inscs.stage_forma4_dat, inscs.stage_bankin_cavabi_dat,'
     +'  inscs.stage_qarsi_teref_qcavab_dat, inscs.stage_qusur_akti_dat, '
     +'  inscs.stage_yoxlama_dat, inscs.stage_muraciet_dat,'
     +'  inscs.stage_ok_verilib_dat, inscs.stage_tesdiq_dat, inscs.trid,'
     +'  icp.cid, icp.dep_id--icp.id,--, icp.paydate,icp.ammount, icp.traid   ';

        //showmessage(FilterStr);


       if (ComboBox1.ItemIndex=1)and (XFCheckBox3.Checked=true) then
begin
       FilterStr:=FilterStrimtina+FilterStr;
      with ExcelExport do
   begin
     DMReport.DSALLImtinaReploss.sql.Clear;
 DMReport.DSALLImtinaReploss.sql.Text:=FilterStr;
  memo1.Text:=DMReport.DSALLImtinaReploss.sql.Text;
  DMReport.DSALLImtinaReploss.close;
   DMReport.DSALLImtinaReploss.Open;

   if DMReport.DSALLImtinaReploss.RecordCount<>0 then
         begin
      Connect;
      ExportDataset(DMReport.DSALLImtinaReploss,'Imtina zererleri.',True,false);
      Disconnect;
      end
      else

      showmessage('Uyğun seçimlərə uyğun məlumat yoxdur!');
   end  ;

end;


       if (ComboBox1.ItemIndex=0)and (XFCheckBox3.Checked=true) then
begin

       FilterStr:=FilterStrarasdirma+FilterStr;
      with ExcelExport do
   begin
     DMReport.DSALLarasdirmaReploss.sql.Clear;
 DMReport.DSALLarasdirmaReploss.sql.Text:=FilterStr;
  memo1.Text:=DMReport.DSALLarasdirmaReploss.sql.Text;
  DMReport.DSALLarasdirmaReploss.close;
   DMReport.DSALLarasdirmaReploss.Open;
   if DMReport.DSALLarasdirmaReploss.RecordCount<>0 then
         begin
      Connect;
      ExportDataset(DMReport.DSALLarasdirmaReploss,'Arasdirilan zererleri.',True,false);
      Disconnect;
      end
      else

      showmessage('Uyğun seçimlərə uyğun məluamt yoxdur!');
   end  ;

end;


       if (ComboBox1.ItemIndex=2)and (XFCheckBox3.Checked=true) then
begin
       FilterStr:=FilterStrodenis+FilterStr;
      with ExcelExport do
   begin
     DMReport.DSALLtaninmaReploss.sql.Clear;
 DMReport.DSALLtaninmaReploss.sql.Text:=FilterStr;
  memo1.Text:=DMReport.DSALLtaninmaReploss.sql.Text;
  DMReport.DSALLtaninmaReploss.close;
   DMReport.DSALLtaninmaReploss.Open;
   if DMReport.DSALLtaninmaReploss.RecordCount<>0 then
         begin
      Connect;
      ExportDataset(DMReport.DSALLtaninmaReploss,'Ödəniş zererleri.',True,false);
      Disconnect;
      end
      else

      showmessage('Uyğun seçimlərə uyğun məluamt yoxdur!');
   end  ;

   end  ;

   if (ComboBox1.ItemIndex=3) and (XFCheckBox3.Checked=true) then
begin
       FilterStr:=FilterOdenmeReal+FilterStr+groupb;
      with ExcelExport do
   begin
     DMReport.DSALLodenmisReploss.sql.Clear;
 DMReport.DSALLodenmisReploss.sql.Text:=FilterStr;
  memo1.Text:=DMReport.DSALLodenmisReploss.sql.Text;
  DMReport.DSALLodenmisReploss.close;
   DMReport.DSALLodenmisReploss.Open;
   if DMReport.DSALLodenmisReploss.RecordCount<>0 then
         begin
      Connect;
      ExportDataset(DMReport.DSALLodenmisReploss,' zererleri.',True,false);
      Disconnect;
      end
      else

      showmessage('Uyğun seçimlərə uyğun məluamt yoxdur!');
   end  ;

end;

   if (ComboBox1.ItemIndex=4) and (XFCheckBox3.Checked=true) then
begin
       FilterStr:=Filterall+FilterStr;
      with ExcelExport do
   begin
     DMReport.DSALLReploss.sql.Clear;
 DMReport.DSALLReploss.sql.Text:=FilterStr;
  memo1.Text:=DMReport.DSALLReploss.sql.Text;
  DMReport.DSALLReploss.close;
   DMReport.DSALLReploss.Open;
   if DMReport.DSALLReploss.RecordCount<>0 then
         begin
      Connect;
      ExportDataset(DMReport.DSALLReploss,' zererleri.',True,false);
      Disconnect;
      end
      else

      showmessage('Uyğun seçimlərə uyğun məluamt yoxdur!');
   end  ;

end;



end;

procedure TFrmLossReport.XFButton2Click(Sender: TObject);
begin
close;
end;

end.

unit FrmPortfelImpl;
               //XFRadioButton5
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, XFSCtrls, StdCtrls, ComCtrls, DBCtrls, CMExcelExport;

type
  TFrmPortfel = class(TForm)
    XFPanel1: TXFPanel;
    XFPanel2: TXFPanel;
    XFButton1: TXFButton;
    XFButton2: TXFButton;
    XFPanel3: TXFPanel;
    XFGroupBox2: TXFGroupBox;
    XFRadioButton3: TXFRadioButton;
    XFRadioButton4: TXFRadioButton;
    XFRadioButton5: TXFRadioButton;
    XFGroupBox1: TXFGroupBox;
    XFRadioButton1: TXFRadioButton;
    XFRadioButton2: TXFRadioButton;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    XFGroupBox7: TXFGroupBox;
    XFRadioButton6: TXFRadioButton;
    XFRadioButton7: TXFRadioButton;
    XFRadioButton8: TXFRadioButton;
    XFRadioButton9: TXFRadioButton;
    XFPanel4: TXFPanel;
    XFGroupBox3: TXFGroupBox;
    XFCheckBox4: TXFCheckBox;
    DBLookupComboBox2: TDBLookupComboBox;
    XFGroupBox4: TXFGroupBox;
    XFCheckBox5: TXFCheckBox;
    DBLookupComboBox3: TDBLookupComboBox;
    XFGroupBox5: TXFGroupBox;
    XFCheckBox6: TXFCheckBox;
    DBLookupComboBox4: TDBLookupComboBox;
    XFPanel5: TXFPanel;
    XFGroupBox6: TXFGroupBox;
    XFCheckBox7: TXFCheckBox;
    DBLookupComboBox1: TDBLookupComboBox;
    XFGroupBox8: TXFGroupBox;
    DBLookupComboBox5: TDBLookupComboBox;
    XFCheckBox8: TXFCheckBox;
    XFCheckBox1: TXFCheckBox;
    XFRadioButton10: TXFRadioButton;
    ExcelExport: TCMExcelExport;
    Memo1: TMemo;
    XFRadioButton11: TXFRadioButton;
    XFRadioGroup1: TXFRadioGroup;
    XFCheckBox2: TXFCheckBox;
    XFRadioButton12: TXFRadioButton;
    XFRadioButton13: TXFRadioButton;
    XFRadioButton14: TXFRadioButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure XFButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure XFCheckBox4Click(Sender: TObject);
    procedure XFCheckBox5Click(Sender: TObject);
    procedure XFCheckBox6Click(Sender: TObject);
    procedure XFCheckBox7Click(Sender: TObject);
    procedure XFCheckBox8Click(Sender: TObject);
    procedure XFCheckBox1Click(Sender: TObject);
    procedure XFButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      FilterStr_kasko:String;
      FilterStr_FQ:String;
      FilterStr_M:String;
      FilterStr_Emlak:String;
      FilterStr_Seyh:String;
      FilterStr_TIBB:String;
      FilterStr_YUK:String;
      FilterStr_Hamisi:string;
      procedure ActionFilterExecute(Sender: TObject);
  end;

var
  FrmPortfel: TFrmPortfel;

implementation

{$R *.dfm}
uses DMReportImpl,CommanParametrs;

procedure TFrmPortfel.FormKeyPress(Sender: TObject; var Key: Char);
begin
if ord(key)=vk_escape then close;

end;

procedure TFrmPortfel.FormShow(Sender: TObject);
begin
//Memo1.Text:=FrmPortfel.FilterStr_kasko;
XFCheckBox1.Checked:=false;
XFCheckBox4.Checked:=false;
XFCheckBox5.Checked:=false;
XFCheckBox6.Checked:=false;
XFCheckBox7.Checked:=false;
XFCheckBox8.Checked:=false;
XFGroupBox1.Enabled:=false;
{
DBLookupComboBox1.Enabled:=false;
DBLookupComboBox2.Enabled:=false;
DBLookupComboBox3.Enabled:=false;
DBLookupComboBox4.Enabled:=false;
DBLookupComboBox5.Enabled:=false;       }

XFRadioButton1.Checked:=false;
XFRadioButton2.Checked:=false;
XFRadioButton11.Checked:=false;
XFRadioButton14.Checked:=false;
XFRadioButton5.Checked:=true;
XFRadioButton10.Checked:=true;

DateTimePicker1.DateTime:=DMReport.DSsysdat.FieldByName('tek_dat').AsDateTime;
DateTimePicker2.DateTime:=DMReport.DSsysdat.FieldByName('tek_dat').AsDateTime;

{DBLookupComboBox1.KeyValue:=Null;
DBLookupComboBox2.KeyValue:=Null;
DBLookupComboBox3.KeyValue:=Null;
DBLookupComboBox4.KeyValue:=Null;
DBLookupComboBox5.KeyValue:=Null;}

end;

procedure TFrmPortfel.ActionFilterExecute(Sender: TObject);

   function  CheckFiltered(IsChecked: Boolean; const FilterStr: String; Args: array of const): String;
   begin
    Result :='';
    if  IsChecked  then
     Result :=Format(FilterStr, Args);
     //showmessage('Result= '+Result)  ;
   end;

const
   BooleanPrefix = ' AND ';
   p_statusfilter= '(a.close_prefix=%d)';
   p_agentfilter='(a.agent_id=%d)';
   p_filialfilter='(a.filial=%d)';
   p_valutefilter='(a.valute_id=%d)';
   p_begindatfilter='(a.begin_date=%d)';
   p_enddatfilter='(a.end_date=%d)';
   p_insdatfilter='(a.commit_date=%d)';
    bankenarfilter = '(a.bnf_type=%d)';

var
   p_status:String;
   p_vesiyyet:String;
   p_agent:String;
   p_filial:String;
   p_valute:String;
   p_begindat:String;
   p_enddat:String;
   p_reins:String;
   p_insdat: string;
    bankenar: String;
   FilterStr: String;
   p_terminate_date:   String;
begin



  FilterStr :='';


 if XFCheckBox2.Checked then
 begin
  if XFRadioButton12.Checked=true then
  begin
   bankenar:='a.bnf_type=1';
  end;
  if XFRadioButton13.Checked=true then
  begin
    bankenar:='a.bnf_type in(2,3,4,5,6,7,8,9,10,11,12,13,14,15)';
  end;
 end;



     if XFRadioButton5.Checked=false then
       begin
   if XFRadioButton3.Checked then
   begin
   p_status:='a.close_prefix=0';
     end;

   if XFRadioButton4.Checked then
   begin
   p_status:='a.close_prefix=1';
     end;


     end;

   if XFRadioButton10.Checked=false then
   begin

   if XFRadioButton6.Checked=true then
   begin
      p_vesiyyet:='a.state=6'
   end;

   if XFRadioButton7.Checked=true then
   begin
      p_vesiyyet:='a.state=0'
   end;

   if XFRadioButton8.Checked=true then
   begin
      p_vesiyyet:='a.state=7'
   end;

  if XFRadioButton9.Checked=true then
   begin
      p_vesiyyet:='a.state=8'
   end;

   end;

     p_agent:=CheckFiltered(
              XFCheckBox5.Checked
             ,p_agentfilter
             ,[DBLookupComboBox3.ListSource.DataSet.FieldByName('id').asinteger]
              );

       p_filial:=CheckFiltered(
              XFCheckBox7.Checked
             ,p_filialfilter
             ,[DBLookupComboBox1.ListSource.DataSet.FieldByName('id').asinteger]
              );

       p_valute:=CheckFiltered(
              XFCheckBox8.Checked
             ,p_valutefilter
             ,[DBLookupComboBox1.ListSource.DataSet.FieldByName('id').asinteger]
              );

        if (XFCheckBox1.Checked=true)and(XFRadioButton1.Checked=true)  then
    begin
    p_begindat:=' TO_DATE(a.begin_date,''dd.MM.yyyy'')'+ ' between  '+''''+datetostr(DateTimePicker1.DateTime)+''''+' and '+''''+datetostr(DateTimePicker2.DateTime)+'''';
    end
    else
    begin
     p_begindat:='';
    end;

    if (XFCheckBox1.Checked=true)and(XFRadioButton2.Checked=true)  then
    begin
    p_enddat:=' TO_DATE(a.end_date,''dd.MM.yyyy'')'+ ' between  '+''''+datetostr(DateTimePicker1.DateTime)+''''+' and '+''''+datetostr(DateTimePicker2.DateTime)+'''';
    end
    else
    begin
     p_enddat:='';
    end;

    if (XFCheckBox1.Checked=true)and(XFRadioButton11.Checked=true)  then
    begin
    p_insdat:=' TO_DATE(a.ins_date,''dd.MM.yyyy'')'+ ' between  '+''''+datetostr(DateTimePicker1.DateTime)+''''+' and '+''''+datetostr(DateTimePicker2.DateTime)+'''';
    end
    else
    begin
     p_insdat:='';
    end;



       if (XFCheckBox1.Checked=true)and(XFRadioButton14.Checked=true) then
      begin
       p_terminate_date:='  a.id in (select cid from ins_contract_terminated where stage_ok_verilib_dat'+ ' between  '+''''+datetostr(DateTimePicker1.DateTime)+''''+' and '+''''+datetostr(DateTimePicker2.DateTime)+''''+')';
       //showmessage(p_end_date);
  if  FilterStr=''  then
    FilterStr :=p_terminate_date
  else
    FilterStr :=FilterStr + BooleanPrefix + p_terminate_date;
      end;


    if XFCheckBox6.Checked=true then
    begin
       p_reins:=' a.id in(select cid from ins_reinsurance where custid='+inttostr(DBLookupComboBox4.KeyValue)+')';
       //showmessage(p_reins);
    end;



    if  XFRadioButton5.Checked=false
  then
  if  FilterStr=''  then
    FilterStr :=p_status
  else
    FilterStr :=FilterStr + BooleanPrefix + p_status;

     if XFCheckBox2.Checked=true then
     begin
     if XFRadioButton12.Checked=true then
     begin
    if  FilterStr=''  then
    FilterStr :=bankenar
  else
    FilterStr :=FilterStr + BooleanPrefix + bankenar;
    end;

     if XFRadioButton13.Checked=true then
     begin
    if  FilterStr=''  then
    FilterStr :=bankenar
  else
    FilterStr :=FilterStr + BooleanPrefix + bankenar;
    end;
    end;




    if  XFRadioButton10.Checked=false
  then
  if  FilterStr=''  then
    FilterStr :=p_vesiyyet
  else
    FilterStr :=FilterStr + BooleanPrefix + p_vesiyyet;


        if  XFCheckBox5.Checked
  then
  if  FilterStr=''  then
    FilterStr :=p_agent
  else
    FilterStr :=FilterStr + BooleanPrefix + p_agent;

         if  XFCheckBox7.Checked
  then
  if  FilterStr=''  then
    FilterStr :=p_filial
  else
    FilterStr :=FilterStr + BooleanPrefix + p_filial;

    if  XFCheckBox8.Checked
  then
  if  FilterStr=''  then
    FilterStr :=p_valute
  else
    FilterStr :=FilterStr + BooleanPrefix + p_valute;

    if  XFCheckBox6.Checked
  then
  if  FilterStr=''  then
    FilterStr :=p_reins
  else
    FilterStr :=FilterStr + BooleanPrefix + p_reins;


    if  (XFCheckBox1.Checked )and (XFRadioButton1.Checked=true)
  then
  if  FilterStr=''  then
    FilterStr :=p_begindat
  else
    FilterStr :=FilterStr + BooleanPrefix + p_begindat;

        if  (XFCheckBox1.Checked ) and(XFRadioButton2.Checked=true)
  then
  if  FilterStr=''  then
    FilterStr :=p_enddat
  else
    FilterStr :=FilterStr + BooleanPrefix + p_enddat;

     if  (XFCheckBox1.Checked ) and(XFRadioButton11.Checked=true)
  then
  if  FilterStr=''  then
    FilterStr :=p_insdat
  else
    FilterStr :=FilterStr + BooleanPrefix + p_insdat;




        //showmessage(FilterStr);

              if FilterStr<>'' then
               begin
         FilterStr:=' and '+ FilterStr;
         end;

         if DBLookupComboBox2.KeyValue=99 then
         begin
        FilterStr:=FilterStr_Hamisi+FilterStr;
        DMReport.DsHamisi.sql.Clear;
        DMReport.DsHamisi.sql.Text:=FilterStr;
        memo1.Text:=DMReport.DsHamisi.sql.Text;
        DMReport.DsHamisi.close;
        DMReport.DsHamisi.Open;
              end;

        if DBLookupComboBox2.KeyValue=4 then
         begin
        FilterStr:=FilterStr_kasko+FilterStr;
        DMReport.DSDataKasko.sql.Clear;
        DMReport.DSDataKasko.sql.Text:=FilterStr;
        memo1.Text:=DMReport.DSDataKasko.sql.Text;
        DMReport.DSDataKasko.close;
        DMReport.DSDataKasko.Open;
              end;
               if DBLookupComboBox2.KeyValue=1 then
         begin
        FilterStr:=FilterStr_FQ+FilterStr;
        DMReport.DSDataFerdiqeza.sql.Clear;
        DMReport.DSDataFerdiqeza.sql.Text:=FilterStr;
        memo1.Text:=DMReport.DSDataFerdiqeza.sql.Text;
        DMReport.DSDataFerdiqeza.close;
        DMReport.DSDataFerdiqeza.Open;
              end;

              if DBLookupComboBox2.KeyValue=13 then
         begin
        FilterStr:=FilterStr_M+FilterStr;
        DMReport.DSDataMesuliyyet.sql.Clear;
        DMReport.DSDataMesuliyyet.sql.Text:=FilterStr;
        memo1.Text:=DMReport.DSDataMesuliyyet.sql.Text;
        DMReport.DSDataMesuliyyet.close;
        DMReport.DSDataMesuliyyet.Open;
              end;

                 if DBLookupComboBox2.KeyValue=3 then
         begin
        FilterStr:=FilterStr_Emlak+FilterStr;
        DMReport.DSDataEmalk.sql.Clear;
        DMReport.DSDataEmalk.sql.Text:=FilterStr;
        memo1.Text:=DMReport.DSDataEmalk.sql.Text;
        DMReport.DSDataEmalk.close;
        DMReport.DSDataEmalk.Open;
              end;
              if DBLookupComboBox2.KeyValue=2 then
         begin
        FilterStr:=FilterStr_TIBB+FilterStr;
        DMReport.DSDataTibb.sql.Clear;
        DMReport.DSDataTibb.sql.Text:=FilterStr;
        memo1.Text:=DMReport.DSDataTibb.sql.Text;
        DMReport.DSDataTibb.close;
        DMReport.DSDataTibb.Open;
              end;

            if DBLookupComboBox2.KeyValue=21 then
         begin
        FilterStr:=FilterStr_Seyh+FilterStr;
        DMReport.DSDataSeyahet.sql.Clear;
        DMReport.DSDataSeyahet.sql.Text:=FilterStr;
        memo1.Text:=DMReport.DSDataSeyahet.sql.Text;
        DMReport.DSDataSeyahet.close;
        DMReport.DSDataSeyahet.Open;
              end;

           if DBLookupComboBox2.KeyValue=8 then
         begin
        FilterStr:=FilterStr_YUK+FilterStr;
        DMReport.DSDataYuk.sql.Clear;
        DMReport.DSDataYuk.sql.Text:=FilterStr;
        memo1.Text:=DMReport.DSDataYuk.sql.Text;
        DMReport.DSDataYuk.close;
        DMReport.DSDataYuk.Open;
              end;

end;

procedure TFrmPortfel.XFButton1Click(Sender: TObject);
begin
 //showmessage(inttostr(DBLookupComboBox2.KeyValue));

if (XFCheckBox4.Checked=false) and (DBLookupComboBox2.KeyValue=null) then
begin
  showmessage('Sığortanın növü sahəsi boşdur!');
  exit;

end;

 //ShowMessage(IntToStr(DBLookupComboBox2.KeyValue));

if (XFCheckBox5.Checked=true)and (DBLookupComboBox3.KeyValue=null) then
begin
showmessage('Diqqət! Agent seçilməyib');
exit;
end;

if (XFCheckBox7.Checked=true)and (DBLookupComboBox1.KeyValue=null) then
begin
showmessage('Diqqət! Filial seçilməyib');
exit;
end;

if (XFCheckBox8.Checked=true)and (DBLookupComboBox5.KeyValue=null) then
begin
showmessage('Diqqət! Valyuta seçilməyib');
exit;
end;
if XFCheckBox1.Checked=true then
begin
  if (XFRadioButton1.Checked=false) and (XFRadioButton2.Checked=false) and(XFRadioButton11.Checked=false) and(XFRadioButton14.Checked=false) then
  begin
    showmessage('Tarix tipi seçimi edilməyib!');
    exit;
  end;
end;

if (XFCheckBox6.Checked=true)and (DBLookupComboBox4.KeyValue=null) then
begin
showmessage('Diqqət! Təkrarsığortaçı seçilməyib');
exit;
end;

      ActionFilterExecute(Sender);

if DBLookupComboBox2.KeyValue=4 then
begin
      with ExcelExport do
   begin
   if DMReport.DSDataKasko.RecordCount<>0 then
         begin
      Connect;
      ExportDataset(DMReport.DSDataKasko,'Kasko.',True,false);
      Disconnect;
      end
      else

      showmessage('Uyğun seçimlərə uyğun məluamt yoxdur!');
   end

end;

 if DBLookupComboBox2.KeyValue=99 then
begin
      with ExcelExport do
   begin
   if DMReport.DsHamisi.RecordCount<>0 then
         begin
      Connect;
      ExportDataset(DMReport.DsHamisi,'Kasko.',True,false);
      Disconnect;
      end
      else

      showmessage('Uyğun seçimlərə uyğun məluamt yoxdur!');
   end

end;







if DBLookupComboBox2.KeyValue=1 then
begin
      with ExcelExport do
   begin
   if DMReport.DSDataFerdiqeza.RecordCount<>0 then
         begin
      Connect;
      ExportDataset(DMReport.DSDataFerdiqeza,'Ferdi Qeza.',True,false);
      Disconnect;
      end
      else

      showmessage('Uyğun seçimlərə uyğun məluamt yoxdur!');
   end

end;

if DBLookupComboBox2.KeyValue=13 then
begin
      with ExcelExport do
   begin
   if DMReport.DSDataMesuliyyet.RecordCount<>0 then
         begin
      Connect;
      ExportDataset(DMReport.DSDataMesuliyyet,'Mesuliyyet.',True,false);
      Disconnect;
      end
      else

      showmessage('Uyğun seçimlərə uyğun məluamt yoxdur!');
   end

end;

if DBLookupComboBox2.KeyValue=3 then
begin
      with ExcelExport do
   begin
   if DMReport.DSDataEmalk.RecordCount<>0 then
         begin
      Connect;
      ExportDataset(DMReport.DSDataEmalk,'Emlak.',True,false);
      Disconnect;
      end
      else

      showmessage('Uyğun seçimlərə uyğun məluamt yoxdur!');
   end

end;

if DBLookupComboBox2.KeyValue=2 then
begin
      with ExcelExport do
   begin
   if DMReport.DSDataTibb.RecordCount<>0 then
         begin
      Connect;
      ExportDataset(DMReport.DSDataTibb,'Tibb.',True,false);
      Disconnect;
      end
      else

      showmessage('Uyğun seçimlərə uyğun məluamt yoxdur!');
   end

end;

if DBLookupComboBox2.KeyValue=21 then
begin
      with ExcelExport do
   begin
   if DMReport.DSDataSeyahet.RecordCount<>0 then
         begin
      Connect;
      ExportDataset(DMReport.DSDataSeyahet,'Seyahet.',True,false);
      Disconnect;
      end
      else

      showmessage('Uyğun seçimlərə uyğun məluamt yoxdur!');
   end

end;
if DBLookupComboBox2.KeyValue=8 then
begin
      with ExcelExport do
   begin
   if DMReport.DSDataYuk.RecordCount<>0 then
         begin
      Connect;
      ExportDataset(DMReport.DSDataYuk,'Yuk.',True,false);
      Disconnect;
      end
      else

      showmessage('Uyğun seçimlərə uyğun məluamt yoxdur!');
   end

end;
end;

procedure TFrmPortfel.XFButton2Click(Sender: TObject);
begin
FrmPortfel.Close;
end;

procedure TFrmPortfel.XFCheckBox1Click(Sender: TObject);
begin
if XFCheckBox1.Checked=false then
begin
  XFRadioButton1.Checked:=false;
    XFRadioButton2.Checked:=false;
    XFGroupBox1.Enabled:=false;
end
else
begin
     XFGroupBox1.Enabled:=true;
end;
end;

procedure TFrmPortfel.XFCheckBox4Click(Sender: TObject);
begin
if XFCheckBox4.Checked=false then
begin
DMReport.DSIns_ins.close;
 DBLookupComboBox2.KeyValue:=null;
 // DBLookupComboBox2.Enabled:=false;
 //showmessage('Salam1');
end
else

begin
DMReport.DSIns_ins.Open;
//showmessage('Salam2');
 // DBLookupComboBox2.Enabled:=true;
end;

end;

procedure TFrmPortfel.XFCheckBox5Click(Sender: TObject);
begin
if XFCheckBox5.Checked=false then
begin
  {DBLookupComboBox3.KeyValue:=null;
  DBLookupComboBox3.Enabled:=false;   }
  DMReport.DSAgent.close;
end
else

begin
 { DBLookupComboBox3.Enabled:=true;  }

 DMReport.DSAgent.Open;
end;

end;

procedure TFrmPortfel.XFCheckBox6Click(Sender: TObject);
begin
if XFCheckBox6.Checked=false then
begin
  {DBLookupComboBox4.KeyValue:=null;
  DBLookupComboBox4.Enabled:=false;  }
   DMReport.DSTekrar_cust.close;
end
else

begin
  {DBLookupComboBox4.Enabled:=true;   }
     DMReport.DSTekrar_cust.open;
end;

end;

procedure TFrmPortfel.XFCheckBox7Click(Sender: TObject);
begin
if XFCheckBox7.Checked=false then
begin
  {DBLookupComboBox1.KeyValue:=null;
  DBLookupComboBox1.Enabled:=false;}
    DMReport.DSFilial.close;

end
else

begin
 // DBLookupComboBox1.Enabled:=true;
 DMReport.DSFilial.open;
end;

end;

procedure TFrmPortfel.XFCheckBox8Click(Sender: TObject);
begin
if XFCheckBox8.Checked=false then
begin
  {DBLookupComboBox5.KeyValue:=null;
  DBLookupComboBox5.Enabled:=false;}
      DMReport.DSValyuta.close;

end
else

begin
  //DBLookupComboBox5.Enabled:=true;
     DMReport.DSValyuta.open;
end;
end;

end.

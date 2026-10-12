unit Operationtypeunit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrlsEh, DBLookupEh, Grids, DBGrids, ComCtrls, ToolWin,
  ExtCtrls, CMExcelExport, ImgList, Db, OracleData,comobj, QExport4,
  QExport4Xlsx,ShlObj, QExport4Dialog;

type
  Toperationtype = class(TForm)
    OracleDataSet2: TOracleDataSet;
    DataSource1: TDataSource;
    ImageList1: TImageList;
    CMExcelExport1: TCMExcelExport;
    Panel3: TPanel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton20: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton17: TToolButton;
    ToolButton3: TToolButton;
    ToolButton6: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton7: TToolButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    CheckBox3: TCheckBox;
    DataSource2: TDataSource;
    OracleDataSet1: TOracleDataSet;
    DBLookupComboboxEh1: TComboBox;
    OracleDataSet1EMELIYYAT: TWideStringField;
    OracleDataSet1FIL: TWideStringField;
    OracleDataSet1ID: TFloatField;
    OracleDataSet1ACCID: TFloatField;
    OracleDataSet1CARDHOLDER: TWideStringField;
    OracleDataSet1FNAME: TWideStringField;
    OracleDataSet1LNAME: TWideStringField;
    OracleDataSet1PASSPORT: TWideStringField;
    OracleDataSet1BIRTHDAY: TWideStringField;
    OracleDataSet1HOMEPHONE: TWideStringField;
    OracleDataSet1WORKPHONE: TWideStringField;
    OracleDataSet1COUNTRY: TWideStringField;
    OracleDataSet1CITY: TWideStringField;
    OracleDataSet1ADDRESS: TWideStringField;
    OracleDataSet1RESIDENT: TWideStringField;
    OracleDataSet1CARDNUMBER: TWideStringField;
    OracleDataSet1RBSNUMBER: TWideStringField;
    OracleDataSet1MAINCARD: TWideStringField;
    OracleDataSet1CURRENCY: TWideStringField;
    OracleDataSet1CARDTYPE: TWideStringField;
    OracleDataSet1CARDSTATUS: TWideStringField;
    OracleDataSet1CREDIT_LIM: TWideStringField;
    OracleDataSet1DATEOPEN: TDateTimeField;
    OracleDataSet1EXPIRY: TDateTimeField;
    OracleDataSet1REFERENCE: TWideStringField;
    OracleDataSet1EMBOSSNAME: TWideStringField;
    OracleDataSet1COMPANY: TWideStringField;
    OracleDataSet1DATECLOSE: TDateTimeField;
    OracleDataSet1SECURITY: TWideStringField;
    OracleDataSet1SEND: TIntegerField;
    OracleDataSet1CREATDATE: TIntegerField;
    OracleDataSet1FILE_NUM: TIntegerField;
    OracleDataSet1MESSTYPE: TIntegerField;
    OracleDataSet1WITHP: TWideStringField;
    OracleDataSet1URG: TWideStringField;
    OracleDataSet1OTHTYPE: TWideStringField;
    OracleDataSet1OTHMEMBER: TWideStringField;
    OracleDataSet1OTHASSCOD: TWideStringField;
    OracleDataSet1OTHIDEN: TWideStringField;
    OracleDataSet1OTHEXPRY: TWideStringField;
    OracleDataSet1FILENAME: TWideStringField;
    OracleDataSet1CON_BALAN: TWideStringField;
    OracleDataSet1BALAN_SIGN: TWideStringField;
    OracleDataSet1CARDREST: TFloatField;
    OracleDataSet1RBSNUMBER2: TWideStringField;
    OracleDataSet1ACCID2: TFloatField;
    OracleDataSet1REFINTEGER: TWideStringField;
    OracleDataSet1LANG_CODE: TWideStringField;
    OracleDataSet1FILIAL: TFloatField;
    OracleDataSet1ISSUED_BY: TWideStringField;
    OracleDataSet1DOC_SINCE: TWideStringField;
    OracleDataSet1CONTRACT_NUM: TWideStringField;
    OracleDataSet1KLI_ID: TFloatField;
    OracleDataSet1OP_ID: TFloatField;
    OracleDataSet1TYPES: TWideStringField;
    OracleDataSet1TITUL: TWideStringField;
    OracleDataSet1STATUS: TFloatField;
    OracleDataSet1DAT: TDateTimeField;
    OracleDataSet1NMOD_OPID: TFloatField;
    OracleDataSet1CRDAT: TDateTimeField;
    OracleDataSet1RBSCLOSE: TWideStringField;
    OracleDataSet1RBSCLOSEID: TFloatField;
    OracleDataSet1TRANDATE: TDateTimeField;
    OracleDataSet1KREDIT: TFloatField;
    QExport4Dialog1: TQExport4Dialog;
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  operationtype: Toperationtype;

implementation

{$R *.DFM}

procedure Toperationtype.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.Checked then
DateTimePicker1.Enabled:=true else DateTimePicker1.Enabled:=False;
end;

procedure Toperationtype.CheckBox2Click(Sender: TObject);
begin
if CheckBox2.Checked then
DateTimePicker2.Enabled:=true else DateTimePicker2.Enabled:=False;
end;

procedure Toperationtype.ToolButton1Click(Sender: TObject);
var
a:integer;

begin

     OracleDataSet1.Active:=true;
if CheckBox3.Checked then
begin
if DBLookupComboboxEh1.Text='NEW' then a:=1;
if DBLookupComboboxEh1.Text='Suppl.Card' then a:=2;
if DBLookupComboboxEh1.Text='Prolongation' then a:=3;
if DBLookupComboboxEh1.Text='Replace Card' then a:=4;
if DBLookupComboboxEh1.Text='PIN Clear' then a:=12;
if DBLookupComboboxEh1.Text='Card Status' then a:=6;
if DBLookupComboboxEh1.Text='RBS Change' then a:=11;
if DBLookupComboboxEh1.Text='Contract Close' then a:=7;
if DBLookupComboboxEh1.Text='CardName Change' then a:=35;
if DBLookupComboboxEh1.Text='Credit Limit' then a:=5;
if DBLookupComboboxEh1.Text='Security Word Change' then a:=13;
end;

if (CheckBox1.Checked) and  (CheckBox2.Checked)   then
begin
if CheckBox3.Checked then
begin
        {
oracleDataSet1.Close;

    OracleDataSet1.SetVariable('dat1',DateTimePicker1.DateTime);
     OracleDataSet1.SetVariable('dat2',DateTimePicker2.DateTime);
    OracleDataSet1.open;   }

   OracleDataSet1.close;
 OracleDataSet1.SQL[99]:=' ';
 OracleDataSet1.SQL[99]:='where ( messtype= '+inttostr(a)+') ';

//OracleDataSet1.close;
 OracleDataSet1.SQL[100]:=' ';
 OracleDataSet1.SQL[100]:='and ( TRANDATE between '+''''+Formatdatetime('dd-mmm-yyyy',datetimepicker1.datetime)+''''+' and '+''''+FormatDateTime('dd-mmm-yyyy',datetimepicker2.datetime)+''''+')';
end else
begin      {
oracleDataSet1.Close;

    OracleDataSet1.SetVariable('dat1',DateTimePicker1.DateTime);
     OracleDataSet1.SetVariable('dat2',DateTimePicker2.DateTime);
    OracleDataSet1.open;
                         }
 OracleDataSet1.close;
 OracleDataSet1.SQL[99]:=' ';
 OracleDataSet1.SQL[100]:=' ';
OracleDataSet1.SQL[100]:='where TRANDATE between '+''''+Formatdatetime('dd-mmm-yyyy',datetimepicker1.datetime)+''''+' and '+''''+FormatDateTime('dd-mmm-yyyy',datetimepicker2.datetime)+'''';
 // ShowMessage('where expiry between '+''''+datetostr(datetimepicker1.datetime)+''''+' and '+''''+datetostr(datetimepicker2.datetime)+'''');
 end;
 OracleDataSet1.open;

 end
    else

if CheckBox1.Checked then
begin
if CheckBox3.Checked then
begin
 {
oracleDataSet1.Close;

    OracleDataSet1.SetVariable('dat1',DateTimePicker1.DateTime);
     OracleDataSet1.SetVariable('dat2',DateTimePicker2.DateTime);
    OracleDataSet1.open;  }
  OracleDataSet1.close;

 OracleDataSet1.SQL[99]:=' ';
 OracleDataSet1.SQL[99]:='where ( messtype= '+inttostr(a)+') ';

 //OracleDataSet1.close;
 OracleDataSet1.SQL[100]:=' ';
 OracleDataSet1.SQL[100]:='and ( TRANDATE >= '+''''+Formatdatetime('dd-mmm-yyyy',datetimepicker1.datetime)+''''+') ';

end else
begin      {
oracleDataSet1.Close;

    OracleDataSet1.SetVariable('dat1',DateTimePicker1.DateTime);
     OracleDataSet1.SetVariable('dat2',DateTimePicker2.DateTime);
    OracleDataSet1.open;   }

 OracleDataSet1.close;
 OracleDataSet1.SQL[99]:=' ';
 OracleDataSet1.SQL[100]:=' ';
 OracleDataSet1.SQL[100]:='where TRANDATE >= '+''''+Formatdatetime('dd-mmm-yyyy',datetimepicker1.datetime)+'''';
 end;
 OracleDataSet1.open;

end
   else
if  CheckBox2.Checked  then
begin
if CheckBox3.Checked then
begin

{oracleDataSet1.Close;

    OracleDataSet1.SetVariable('dat1',DateTimePicker1.DateTime);
     OracleDataSet1.SetVariable('dat2',DateTimePicker2.DateTime);
    OracleDataSet1.open;   }

  OracleDataSet1.close;
 OracleDataSet1.SQL[99]:=' ';
 OracleDataSet1.SQL[99]:='where messtype= '+inttostr(a)+' ';
    OracleDataSet1.close;
 OracleDataSet1.SQL[100]:=' ';
 OracleDataSet1.SQL[100]:='and TRANDATE <= '+''''+Formatdatetime('dd-mmm-yyyy',datetimepicker2.datetime)+'''';

end else
begin

{oracleDataSet1.Close;

    OracleDataSet1.SetVariable('dat1',DateTimePicker1.DateTime);
     OracleDataSet1.SetVariable('dat2',DateTimePicker2.DateTime);
    OracleDataSet1.open;      }

  OracleDataSet1.close;
  OracleDataSet1.SQL[99]:=' ';
 OracleDataSet1.SQL[100]:=' ';
 OracleDataSet1.SQL[100]:='where TRANDATE <= '+''''+Formatdatetime('dd-mmm-yyyy',datetimepicker2.datetime)+'''';
 end;
 OracleDataSet1.open;
end
else

begin
 ShowMessage('Tarixlərin ən azı biri seçilməlidir!');
end;


end;

procedure Toperationtype.ToolButton14Click(Sender: TObject);
begin
OracleDataSet1.close;
end;

procedure Toperationtype.ToolButton6Click(Sender: TObject);
var i,j,index: Integer;
ExcelApp,sheet: Variant;

begin
      ExcelApp := CreateOleObject('Excel.Application');
 ExcelApp.Visible := False;
 ExcelApp.WorkBooks.Add(-4167);
 ExcelApp.WorkBooks[1].WorkSheets[1].name := 'Export';
 sheet:=ExcelApp.WorkBooks[1].WorkSheets['Export'];

  excelapp.WorkBooks[1].WorkSheets[1].Rows[1].Borders.color:=clGray;
 index:=1;
OracleDataSet1.First ;

              //excelapp.selection.Interior.color:=clgreen;

 //DBGrid1.DataSource.DataSet.First;

      for i:=1 to   OracleDataSet1.RecordCount do
      begin
          //Sheet.Cells[1,1].Value:=datamod.ODSIncome.FieldByName('Curr').AsString;
Sheet.Cells[1,1].Value:='EMELIYYAT' ;
Sheet.Cells[1,2].Value:='Fil';
//Sheet.Cells[1,3].Value:='MODIFIER';
//Sheet.Cells[1,4].Value:='CREATER';
Sheet.Cells[1,5].Value:='ID';
Sheet.Cells[1,6].Value:='ACCID';
Sheet.Cells[1,7].Value:='CARDHOLDER';
Sheet.Cells[1,8].Value:='FNAME';
Sheet.Cells[1,9].Value:='LNAME';
Sheet.Cells[1,10].Value:='PASSPORT';
Sheet.Cells[1,11].Value:='BIRTHDAY';
Sheet.Cells[1,12].Value:='HOMEPHONE';
Sheet.Cells[1,13].Value:='WORKPHONE';
Sheet.Cells[1,14].Value:='COUNTRY';
Sheet.Cells[1,15].Value:='CITY';
Sheet.Cells[1,16].Value:='ADDRESS';
Sheet.Cells[1,17].Value:='RESIDENT';
Sheet.Cells[1,18].Value:='CARDNUMBER';
Sheet.Cells[1,19].Value:='RBSNUMBER';
Sheet.Cells[1,20].Value:='MAINCARD';
Sheet.Cells[1,21].Value:='CURRENCY';
Sheet.Cells[1,22].Value:='CARDTYPE';
Sheet.Cells[1,23].Value:='CARDSTATUS';
Sheet.Cells[1,24].Value:='CREDIT_LIM';
Sheet.Cells[1,25].Value:='DATEOPEN';
Sheet.Cells[1,26].Value:='EXPIRY';
Sheet.Cells[1,27].Value:='REFERENCE';
Sheet.Cells[1,28].Value:='EMBOSSNAME';
Sheet.Cells[1,29].Value:='COMPANY';
Sheet.Cells[1,30].Value:='DATECLOSE';
Sheet.Cells[1,31].Value:='SECURITY';
Sheet.Cells[1,32].Value:='SEND';
Sheet.Cells[1,33].Value:='CREATDATE';
Sheet.Cells[1,34].Value:='FILE_NUM';
Sheet.Cells[1,35].Value:='MESSTYPE';
Sheet.Cells[1,36].Value:='WITHP';
Sheet.Cells[1,37].Value:='URG';
Sheet.Cells[1,38].Value:='OTHTYPE';
Sheet.Cells[1,39].Value:='OTHMEMBER';
Sheet.Cells[1,40].Value:='OTHASSCOD';
Sheet.Cells[1,41].Value:='OTHIDEN';
Sheet.Cells[1,42].Value:='OTHEXPRY';
Sheet.Cells[1,43].Value:='FILENAME';
Sheet.Cells[1,44].Value:='CON_BALAN';
Sheet.Cells[1,45].Value:='BALAN_SIGN';
Sheet.Cells[1,46].Value:='CARDREST';
Sheet.Cells[1,47].Value:='RBSNUMBER2';
Sheet.Cells[1,48].Value:='ACCID2';
Sheet.Cells[1,49].Value:='REFINTEGER';
Sheet.Cells[1,50].Value:='LANG_CODE';
Sheet.Cells[1,51].Value:='FILIAL';
Sheet.Cells[1,52].Value:='ISSUED_BY';
Sheet.Cells[1,53].Value:='DOC_SINCE';
Sheet.Cells[1,54].Value:='CONTRACT_NUM';
Sheet.Cells[1,55].Value:='KREDIT';
Sheet.Cells[1,56].Value:='KLI_ID';
Sheet.Cells[1,57].Value:='OP_ID';
Sheet.Cells[1,58].Value:='TYPES';
Sheet.Cells[1,59].Value:='TITUL';
Sheet.Cells[1,60].Value:='STATUS';
Sheet.Cells[1,61].Value:='DAT';
Sheet.Cells[1,62].Value:='NMOD_OPID';
Sheet.Cells[1,63].Value:='CRDAT';
Sheet.Cells[1,64].Value:='RBSCLOSE';
Sheet.Cells[1,65].Value:='RBSCLOSEID';
Sheet.Cells[1,66].Value:='TRANDATE';




        // Sheet.Cells[1,].Value:='as';

      for j:=1 to DBGrid1.FieldCount do


     sheet.cells[index+1,1]:=OracleDataSet1.FieldByName('emeliyyat').AsString;
sheet.cells[index+1,2]:=OracleDataSet1.FieldByName('FIL').AsString;;
//sheet.cells[index+1,3]:=OracleDataSet1.FieldByName('MODIFIER').AsString;;
//sheet.cells[index+1,4]:=OracleDataSet1.FieldByName('CREATER').AsString;
sheet.cells[index+1,5]:=OracleDataSet1.FieldByName('ID').AsString;
sheet.cells[index+1,6]:=OracleDataSet1.FieldByName('ACCID').AsString;
sheet.cells[index+1,7]:=OracleDataSet1.FieldByName('CARDHOLDER').AsString;
sheet.cells[index+1,8]:=OracleDataSet1.FieldByName('FNAME').AsString;
sheet.cells[index+1,9]:=OracleDataSet1.FieldByName('LNAME').AsString;
sheet.cells[index+1,10]:=OracleDataSet1.FieldByName('PASSPORT').AsString;
sheet.cells[index+1,11]:=OracleDataSet1.FieldByName('BIRTHDAY').AsString;
sheet.cells[index+1,12]:=OracleDataSet1.FieldByName('HOMEPHONE').AsString;
sheet.cells[index+1,13]:=OracleDataSet1.FieldByName('WORKPHONE').AsString;
sheet.cells[index+1,14]:=OracleDataSet1.FieldByName('COUNTRY').AsString;
sheet.cells[index+1,15]:=OracleDataSet1.FieldByName('CITY').AsString;
sheet.cells[index+1,16]:=OracleDataSet1.FieldByName('ADDRESS').AsString;
sheet.cells[index+1,17]:=OracleDataSet1.FieldByName('RESIDENT').AsString;
sheet.cells[index+1,18]:=OracleDataSet1.FieldByName('CARDNUMBER').AsString;
sheet.cells[index+1,19]:=OracleDataSet1.FieldByName('RBSNUMBER').AsString;
sheet.cells[index+1,20]:=OracleDataSet1.FieldByName('MAINCARD').AsString;
sheet.cells[index+1,21]:=OracleDataSet1.FieldByName('CURRENCY').AsString;
sheet.cells[index+1,22]:=OracleDataSet1.FieldByName('CARDTYPE').AsString;
sheet.cells[index+1,23]:=OracleDataSet1.FieldByName('CARDSTATUS').AsString;
sheet.cells[index+1,24]:=OracleDataSet1.FieldByName('CREDIT_LIM').AsString;
sheet.cells[index+1,25]:=OracleDataSet1.FieldByName('DATEOPEN').AsString;
sheet.cells[index+1,26]:=OracleDataSet1.FieldByName('EXPIRY').AsString;
sheet.cells[index+1,27]:=OracleDataSet1.FieldByName('REFERENCE').AsString;
sheet.cells[index+1,28]:=OracleDataSet1.FieldByName('EMBOSSNAME').AsString;
sheet.cells[index+1,29]:=OracleDataSet1.FieldByName('COMPANY').AsString;
sheet.cells[index+1,30]:=OracleDataSet1.FieldByName('DATECLOSE').AsString;
sheet.cells[index+1,31]:=OracleDataSet1.FieldByName('SECURITY').AsString;
sheet.cells[index+1,32]:=OracleDataSet1.FieldByName('SEND').AsString;
sheet.cells[index+1,33]:=OracleDataSet1.FieldByName('CREATDATE').AsString;
sheet.cells[index+1,34]:=OracleDataSet1.FieldByName('FILE_NUM').AsString;
sheet.cells[index+1,35]:=OracleDataSet1.FieldByName('MESSTYPE').AsString;
sheet.cells[index+1,36]:=OracleDataSet1.FieldByName('WITHP').AsString;
sheet.cells[index+1,37]:=OracleDataSet1.FieldByName('URG').AsString;
sheet.cells[index+1,38]:=OracleDataSet1.FieldByName('OTHTYPE').AsString;
sheet.cells[index+1,39]:=OracleDataSet1.FieldByName('OTHMEMBER').AsString;
sheet.cells[index+1,40]:=OracleDataSet1.FieldByName('OTHASSCOD').AsString;
sheet.cells[index+1,41]:=OracleDataSet1.FieldByName('OTHIDEN').AsString;
sheet.cells[index+1,42]:=OracleDataSet1.FieldByName('OTHEXPRY').AsString;
sheet.cells[index+1,43]:=OracleDataSet1.FieldByName('FILENAME').AsString;
sheet.cells[index+1,44]:=OracleDataSet1.FieldByName('CON_BALAN').AsString;
sheet.cells[index+1,45]:=OracleDataSet1.FieldByName('BALAN_SIGN').AsString;
sheet.cells[index+1,46]:=OracleDataSet1.FieldByName('CARDREST').AsString;
sheet.cells[index+1,47]:=OracleDataSet1.FieldByName('RBSNUMBER2').AsString;
sheet.cells[index+1,48]:=OracleDataSet1.FieldByName('ACCID2').AsString;
sheet.cells[index+1,49]:=OracleDataSet1.FieldByName('REFINTEGER').AsString;
sheet.cells[index+1,50]:=OracleDataSet1.FieldByName('LANG_CODE').AsString;
sheet.cells[index+1,51]:=OracleDataSet1.FieldByName('FILIAL').AsString;
sheet.cells[index+1,52]:=OracleDataSet1.FieldByName('ISSUED_BY').AsString;
sheet.cells[index+1,53]:=OracleDataSet1.FieldByName('DOC_SINCE').AsString;
sheet.cells[index+1,54]:=OracleDataSet1.FieldByName('CONTRACT_NUM').AsString;
sheet.cells[index+1,55]:=OracleDataSet1.FieldByName('KREDIT').AsString;
sheet.cells[index+1,56]:=OracleDataSet1.FieldByName('KLI_ID').AsString;
sheet.cells[index+1,57]:=OracleDataSet1.FieldByName('OP_ID').AsString;
sheet.cells[index+1,58]:=OracleDataSet1.FieldByName('TYPES').AsString;
sheet.cells[index+1,59]:=OracleDataSet1.FieldByName('TITUL').AsString;
sheet.cells[index+1,60]:=OracleDataSet1.FieldByName('STATUS').AsString;
sheet.cells[index+1,61]:=OracleDataSet1.FieldByName('DAT').AsString;
sheet.cells[index+1,62]:=OracleDataSet1.FieldByName('NMOD_OPID').AsString;
sheet.cells[index+1,63]:=OracleDataSet1.FieldByName('CRDAT').AsString;
sheet.cells[index+1,64]:=OracleDataSet1.FieldByName('RBSCLOSE').AsString;
sheet.cells[index+1,65]:=OracleDataSet1.FieldByName('RBSCLOSEID').AsString;
sheet.cells[index+1,66]:=OracleDataSet1.FieldByName('TRANDATE').AsString;
//sheet.cells[index+1,63]:=OracleDataSet1.FieldByName('WORKPHONE').AsString;
       inc(index);
      OracleDataSet1.Next;

      end;
       ExcelApp.Visible := true;
{if not CMExcelExport1.Connected then CMExcelExport1.Connect;
  CMExcelExport1.ExportDataset(dbgrid1.datasource.dataset,'Optype',true);
  CMExcelExport1.Disconnect;     }



end;
function DesktopPath:string;
var zpath: array [0..MAX_PATH] of char;
 begin
 SHGetFolderPath(0, CSIDL_DESKTOP, 0, SHGFP_TYPE_CURRENT, @zpath);
 result:=   (zpath);
end ;

procedure Toperationtype.ToolButton7Click(Sender: TObject);

begin


QExport4Dialog1.FileName:=DesktopPath+'\card';
  QExport4Dialog1.DataSet:= DBGrid1.DataSource.DataSet;
  //QExport4Dialog1.ShowFile:=true;
  QExport4Dialog1.Execute;
end;

procedure Toperationtype.CheckBox3Click(Sender: TObject);
begin
//OracleDataSet2.open;
if CheckBox3.Checked then
DBLookupComboboxEh1.Enabled:=true else DBLookupComboboxEh1.Enabled:=False;
end;



procedure Toperationtype.FormShow(Sender: TObject);
begin
DateTimePicker1.DateTime:=date;
DateTimePicker2.DateTime:=date;
end;

end.

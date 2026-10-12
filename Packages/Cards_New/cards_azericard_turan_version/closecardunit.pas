unit closecardunit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CMExcelExport, ImgList, StdCtrls, DBCtrls, ComCtrls, ToolWin, Grids,
  DBGrids, ExtCtrls,comobj;

type
  Tclosecards = class(TForm)
    ImageList1: TImageList;
    CMExcelExport1: TCMExcelExport;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    EditCARDNUMBER: TEdit;
    EditRBSNUMBER: TEdit;
    EditFNAME: TEdit;
    EditLNAME: TEdit;
    EditCARDHOLDER: TEdit;
    EditCREDIT_LIM: TEdit;
    Panel3: TPanel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    isertbtn: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton3: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton7: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton17: TToolButton;
    ToolButton16: TToolButton;
    ToolButton13: TToolButton;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    ToolButton21: TToolButton;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    Panel5: TPanel;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    CheckBox1: TCheckBox;
    GroupBox2: TGroupBox;
    CheckBox2: TCheckBox;
    DBLookupComboBox1: TDBLookupComboBox;
    GroupBox3: TGroupBox;
    CheckBox3: TCheckBox;
    DBLookupComboBox2: TDBLookupComboBox;
    GroupBox4: TGroupBox;
    CheckBox4: TCheckBox;
    DBLookupComboBox3: TDBLookupComboBox;
    GroupBox5: TGroupBox;
    CheckBox5: TCheckBox;
    DBLookupComboBox4: TDBLookupComboBox;
    GroupBox6: TGroupBox;
    CheckBox6: TCheckBox;
    DBLookupComboBox5: TDBLookupComboBox;
    Button1: TButton;
    DBGrid1: TDBGrid;
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  closecards: Tclosecards;

implementation

uses U9, Unit18,SBTranslateProc,sboapiDataModuleImpl;

{$R *.DFM}

procedure Tclosecards.ToolButton7Click(Sender: TObject);
begin
DataMod_CARDS.SB_ACA.CallProcedure('CheckAdvancedObjectAccess', ['card_mexcel']);
  if not CMExcelExport1.Connected then CMExcelExport1.Connect;
  CMExcelExport1.ExportDataset(DataMod_CARDS.closecard,'CARDS_CLOSE',true);
  CMExcelExport1.Disconnect;

{var


   V,Sheet,Sheets,excel  :Variant;
   cell,row,l,m    :Integer;
   i,j,ids : integer;
   formats,debet,kredit,summa,destination,vbic:string;
   output:TextFile;
   FileName,Swmessage,dir,edit_ref,BeginMessage,Endmesage,valu:String;
   Index :Integer;
   WaitNextConfirm, WillRefresh: Boolean;
   TransactionID :Integer;
begin




    Excel := CreateOleObject('Excel.Application');
    Excel.Workbooks.Add;
             excel.Cells[1,1]:=' #';
             excel.Cells[1,2]:='RBSNUMBER';
             excel.Cells[1,3]:='CARDHOLDER';
             excel.Cells[1,4]:='CARDNUMBER';
             excel.Cells[1,5]:='FIRST NAME';
             excel.Cells[1,6]:='LAST NAME';
             excel.Cells[1,7]:='CURRENCY';
             excel.Cells[1,8]:='CARDTYPE';
             excel.Cells[1,9]:='CARDSTATUS';
             excel.Cells[1,10]:='PASSPORT';
             excel.Cells[1,11]:='ISSUED_BY';
             excel.Cells[1,12]:='DOC_SINCE';
             excel.Cells[1,13]:='BIRTHDAY';
             excel.Cells[1,14]:='HOMEPHONE';
             excel.Cells[1,15]:='WORKPHONE';
             excel.Cells[1,16]:='CREDIT_LIM';
             excel.Cells[1,17]:='RESIDENT';
             excel.Cells[1,18]:='COUNTRY';
             excel.Cells[1,19]:='CITY';
             excel.Cells[1,20]:='ADDRESS';
             excel.Cells[1,21]:='DATEOPEN';
             excel.Cells[1,22]:='EXPIRY';
             excel.Cells[1,23]:='REFERENCE';
             excel.Cells[1,24]:='EMBOSSNAME';
             excel.Cells[1,25]:='COMPANY';
             excel.Cells[1,26]:='CONTRACT_NUM';
             excel.Cells[1,27]:='TYPES';
             Excel.Range[Excel.Cells[1, 1], Excel.Cells[1,27]].Select;
             Excel.Selection.Font.BOLD:=TRUE;
             Excel.Selection.Font.COLOR:=CLRED;
  //Focus;
                  DBGrid1.DataSource.DataSet.First;
      //------------------------------------------------------------------------------------create prows
             for index:=0 to DBGrid1.DataSource.DataSet.RecordCount-1 do
               begin
             excel.Cells[index+2,1]:=Index+1;
             excel.Cells[index+2,2].NUMBERFORMAT:=AnsiChar('@');
             excel.Cells[index+2,2]:=DBGrid1.DataSource.DataSet.FieldByName('rbsnumber').asstring;      //2
             excel.Cells[index+2,2].ColumnWidth:=20;
             excel.Cells[index+2,3]:=DBGrid1.DataSource.DataSet.FieldByName('CARDHOLDER').asstring;     //3
             excel.Cells[index+2,3].ColumnWidth:=20;
             excel.Cells[index+2,4].NUMBERFORMAT:=AnsiChar('@');                                                  //4
             excel.Cells[index+2,4].ColumnWidth:=20;
             excel.Cells[index+2,4]:=DBGrid1.DataSource.DataSet.FieldByName('CARDNUMBER').asstring;     //4
             excel.Cells[index+2,5].NUMBERFORMAT:=AnsiChar('@');
             excel.Cells[index+2,5]:=DBGrid1.DataSource.DataSet.FieldByName('FNAME').asstring;          //5
             excel.Cells[index+2,6]:=DBGrid1.DataSource.DataSet.FieldByName('LNAME').asstring;          //6
             excel.Cells[index+2,7]:=DBGrid1.DataSource.DataSet.FieldByName('CURRENCY').asstring;       //7
             excel.Cells[index+2,8]:=DBGrid1.DataSource.DataSet.FieldByName('CARDTYPE').asstring;       //8
             excel.Cells[index+2,8].ColumnWidth:=20;
             excel.Cells[index+2,9]:=DBGrid1.DataSource.DataSet.FieldByName('CARDSTATUS').asstring;     //9
             excel.Cells[index+2,10]:=DBGrid1.DataSource.DataSet.FieldByName('PASSPORT').asstring;      //10
             excel.Cells[index+2,11]:=DBGrid1.DataSource.DataSet.FieldByName('ISSUED_BY').asstring;     //11
             excel.Cells[index+2,12]:=DBGrid1.DataSource.DataSet.FieldByName('DOC_SINCE').asstring;     //12
             excel.Cells[index+2,13]:=DBGrid1.DataSource.DataSet.FieldByName('BIRTHDAY').asstring;      //13
             excel.Cells[index+2,14]:=DBGrid1.DataSource.DataSet.FieldByName('HOMEPHONE').asstring;     //14
             excel.Cells[index+2,15]:=DBGrid1.DataSource.DataSet.FieldByName('WORKPHONE').asstring;     //15
             excel.Cells[index+2,16]:=DBGrid1.DataSource.DataSet.FieldByName('CREDIT_LIM').asstring;    //16
             excel.Cells[index+2,17]:=DBGrid1.DataSource.DataSet.FieldByName('RESIDENT').asstring;      //17
             excel.Cells[index+2,18]:=DBGrid1.DataSource.DataSet.FieldByName('COUNTRY').asstring;       //18
             excel.Cells[index+2,19]:=DBGrid1.DataSource.DataSet.FieldByName('CITY').asstring;          //19
             excel.Cells[index+2,20]:=DBGrid1.DataSource.DataSet.FieldByName('ADDRESS').asstring;       //20
             excel.Cells[index+2,21]:=DBGrid1.DataSource.DataSet.FieldByName('DATEOPEN').asstring;      //21
             excel.Cells[index+2,22]:=DBGrid1.DataSource.DataSet.FieldByName('EXPIRY').asstring;        //22
             excel.Cells[index+2,23]:=DBGrid1.DataSource.DataSet.FieldByName('REFERENCE').asstring;     //23
             excel.Cells[index+2,24]:=DBGrid1.DataSource.DataSet.FieldByName('EMBOSSNAME').asstring;    //24
             excel.Cells[index+2,25]:=DBGrid1.DataSource.DataSet.FieldByName('COMPANY').asstring;       //25
             excel.Cells[index+2,26]:=DBGrid1.DataSource.DataSet.FieldByName('CONTRACT_NUM').asstring;  //26
             excel.Cells[index+2,27]:=DBGrid1.DataSource.DataSet.FieldByName('TYPES').asstring;         //27

                DBGrid1.DataSource.DataSet.Next;
              end;
      //--------------------------------------------end create prows

        excel.visible:=true;



               }


end;

procedure Tclosecards.ToolButton1Click(Sender: TObject);
begin
DataMod_CARDS.closecard.CLOSE;
DataMod_CARDS.closecard.SetVariable('dat1',DateTimePicker1.DateTime);
DataMod_CARDS.closecard.SetVariable('dat2',DateTimePicker2.DateTime);


DataMod_CARDS.closecard.Open;
end;

procedure Tclosecards.CheckBox1Click(Sender: TObject);
begin
IF CheckBox1.Checked then begin
DateTimePicker1.Enabled:=True;
DateTimePicker2.Enabled:=True;
end else begin
DateTimePicker1.Enabled:=False;
DateTimePicker2.Enabled:=False;
end;
end;

procedure Tclosecards.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure Tclosecards.ToolButton13Click(Sender: TObject);
begin
if   panel5.Visible=false then
begin
ToolButton13.Down:=True;
Panel5.Visible:=True;
exit;
end
else

if panel5.Visible=true then
begin
ToolButton13.Down:=false;
Panel5.Visible:=false;
end;
end;

procedure Tclosecards.ToolButton14Click(Sender: TObject);
begin
close;
end;

end.

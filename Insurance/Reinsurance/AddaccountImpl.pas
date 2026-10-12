unit AddaccountImpl;
                    //TSCustaccZ
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, XFSCtrls, StdCtrls, DBCtrls, ComCtrls;

type
  TAddaccount = class(TForm)
    XFPanel2: TXFPanel;
    XFButton1: TXFButton;
    XFButton2: TXFButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    XFPanel1: TXFPanel;
    XFLabel1: TXFLabel;
    XFLabel2: TXFLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    XFPanel3: TXFPanel;
    XFLabel3: TXFLabel;
    XFLabel4: TXFLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    XFPanel4: TXFPanel;
    XFLabel5: TXFLabel;
    XFLabel6: TXFLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    DBLookupComboBox6: TDBLookupComboBox;
    TabSheet4: TTabSheet;
    XFPanel5: TXFPanel;
    XFLabel7: TXFLabel;
    XFLabel8: TXFLabel;
    DBLookupComboBox7: TDBLookupComboBox;
    DBLookupComboBox8: TDBLookupComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure XFButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure XFButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Addaccount: TAddaccount;

implementation

{$R *.dfm}
        uses DMreinsuranceImpl, Frmreinsoperationimpl;
procedure TAddaccount.FormKeyPress(Sender: TObject; var Key: Char);
begin
if ord(key)=vk_escape then close;

end;

procedure TAddaccount.FormShow(Sender: TObject);
begin

if Frmreinsoperation.op='S' then
begin
PageControl1.ActivePageIndex:=0;
  TabSheet1.TabVisible:=true;
  TabSheet2.TabVisible:=false;
  TabSheet3.TabVisible:=false;
   TabSheet4.TabVisible:=false;
    edit1.Text:=floattostr(Frmreinsoperation.XDBGrid1.DataSource.DataSet.FieldByName('SIGORTA_HAQQI').AsFloat);
end
else
if Frmreinsoperation.op='Z' then
begin
DMreinsurance.TSCustaccZ.Close;
DMreinsurance.TSCustaccZ.SetVariable('p_bardero_no',Frmreinsoperation.XDBGrid3.DataSource.DataSet.FieldByName('BARDERO_NO').AsString);
DMreinsurance.TSCustaccZ.open;
PageControl1.ActivePageIndex:=1;
  TabSheet1.TabVisible:=false;
  TabSheet2.TabVisible:=true;
  TabSheet3.TabVisible:=false;
  TabSheet4.TabVisible:=false;
  edit2.Text:=Frmreinsoperation.XDBGrid3.DataSource.DataSet.FieldByName('SIGORTA_HAQQI').AsString;
end
else
if Frmreinsoperation.op='X' then
begin
DMreinsurance.TSCustaccX.Close;
DMreinsurance.TSCustaccX.SetVariable('p_bardero_no',Frmreinsoperation.XDBGrid5.DataSource.DataSet.FieldByName('BARDERO_NO').AsString);
DMreinsurance.TSCustaccX.open;
PageControl1.ActivePageIndex:=2;
  TabSheet1.TabVisible:=false;
  TabSheet2.TabVisible:=false;
  TabSheet3.TabVisible:=true;
  TabSheet4.TabVisible:=false;

  end
  else
  begin
  DMreinsurance.TSCustaccS.Close;
DMreinsurance.TSCustaccS.SetVariable('p_bardero_no',Frmreinsoperation.XDBGrid7.DataSource.DataSet.FieldByName('BARDERO_NO').AsString);
DMreinsurance.TSCustaccS.open;
PageControl1.ActivePageIndex:=3;
  TabSheet1.TabVisible:=false;
  TabSheet2.TabVisible:=false;
  TabSheet3.TabVisible:=false;
  TabSheet4.TabVisible:=true;
  edit3.Text:= Frmreinsoperation.XDBGrid7.DataSource.DataSet.FieldByName('SIGORTA_HAQQI').AsString;

end;

DBLookupComboBox1.KeyValue:=null;
DBLookupComboBox2.KeyValue:=null;
DBLookupComboBox3.KeyValue:=null;
DBLookupComboBox4.KeyValue:=null;
DBLookupComboBox5.KeyValue:=null;
DBLookupComboBox6.KeyValue:=null;
DMreinsurance.TSCustacc.Close;
DMreinsurance.TSCustacc.SetVariable('p_bardero_no',Frmreinsoperation.XDBGrid1.DataSource.DataSet.FieldByName('BARDERO_NO').AsString);
DMreinsurance.TSCustacc.open;


end;

procedure TAddaccount.XFButton1Click(Sender: TObject);
var
a:string;
begin
if Frmreinsoperation.op='S' then
begin
 if DBLookupComboBox1.KeyValue=null then
 begin
   showmessage('Diqqət! Müştəri Hesabı(TS) sahəsi boşdur');
   exit;
 end;

  if DBLookupComboBox2.KeyValue=null then
 begin
   showmessage('Diqqət! Kass və ya müxbir hesabı sahəsi boşdur');
   exit;
 end;
a:=Frmreinsoperation.XDBGrid1.DataSource.DataSet.FieldByName('BARDERO_NO').AsString;


  if Frmreinsoperation.XDBGrid1.DataSource.DataSet.FieldByName('status').AsInteger=2 then
    begin

DMreinsurance.P_ins_reins.CallProcedure('reins_bardero_odeme',
[Frmreinsoperation.XDBGrid1.DataSource.DataSet.FieldByName('BARDERO_NO').AsString,
DBLookupComboBox1.KeyValue,DBLookupComboBox2.KeyValue, strtofloat(edit1.Text)
//Frmreinsoperation.XDBGrid1.DataSource.DataSet.FieldByName('SIGORTA_HAQQI').AsFloat
]);

    end;


Frmreinsoperation.XDBGrid1.DataSource.DataSet.Refresh;
Frmreinsoperation.XDBGrid1.DataSource.DataSet.Locate('bardero_no',a,[]);
end;


if Frmreinsoperation.op='Z' then
begin
 if DBLookupComboBox3.KeyValue=null then
 begin
   showmessage('Diqqət! Müştəri Hesabı(TS) sahəsi boşdur');
   exit;
 end;

  if DBLookupComboBox4.KeyValue=null then
 begin
   showmessage('Diqqət! Kassa və ya müxbir hesabı sahəsi boşdur');
   exit;
 end;
a:=Frmreinsoperation.XDBGrid3.DataSource.DataSet.FieldByName('BARDERO_NO').AsString;


  if Frmreinsoperation.XDBGrid3.DataSource.DataSet.FieldByName('status').AsInteger=2 then
    begin

DMreinsurance.P_ins_reins.CallProcedure('reins_lossbardero_odeme',
[Frmreinsoperation.XDBGrid3.DataSource.DataSet.FieldByName('BARDERO_NO').AsString,
DBLookupComboBox4.KeyValue,DBLookupComboBox3.KeyValue,edit2.Text
//Frmreinsoperation.XDBGrid3.DataSource.DataSet.FieldByName('SIGORTA_HAQQI').AsString
]);

    end;


Frmreinsoperation.XDBGrid3.DataSource.DataSet.Refresh;
Frmreinsoperation.XDBGrid3.DataSource.DataSet.Locate('bardero_no',a,[]);

end;

if Frmreinsoperation.op='X' then
begin
 if DBLookupComboBox5.KeyValue=null then
 begin
   showmessage('Diqqət! Müştəri Hesabı(TS) sahəsi boşdur');
   exit;
 end;

  if DBLookupComboBox6.KeyValue=null then
 begin
   showmessage('Diqqət! Kassa və ya müxbir hesabı sahəsi boşdur');
   exit;
 end;
a:=Frmreinsoperation.XDBGrid5.DataSource.DataSet.FieldByName('BARDERO_NO').AsString;


  if Frmreinsoperation.XDBGrid5.DataSource.DataSet.FieldByName('status').AsInteger=2 then
    begin

DMreinsurance.P_ins_reins.CallProcedure('reins_terbardero_odeme',
[Frmreinsoperation.XDBGrid5.DataSource.DataSet.FieldByName('BARDERO_NO').AsString,
DBLookupComboBox6.KeyValue,DBLookupComboBox5.KeyValue
]);

    end;


Frmreinsoperation.XDBGrid5.DataSource.DataSet.Refresh;
Frmreinsoperation.XDBGrid5.DataSource.DataSet.Locate('bardero_no',a,[]);

end;

if Frmreinsoperation.op='Sub' then
begin
 if DBLookupComboBox7.KeyValue=null then
 begin
   showmessage('Diqqət! Müştəri Hesabı(TS) sahəsi boşdur');
   exit;
 end;

  if DBLookupComboBox8.KeyValue=null then
 begin
   showmessage('Diqqət! Kassa və ya müxbir hesabı sahəsi boşdur');
   exit;
 end;
a:=Frmreinsoperation.XDBGrid7.DataSource.DataSet.FieldByName('BARDERO_NO').AsString;


  if Frmreinsoperation.XDBGrid7.DataSource.DataSet.FieldByName('status').AsInteger=2 then
    begin

DMreinsurance.P_ins_reins.CallProcedure('reins_subbardero_odeme',
[Frmreinsoperation.XDBGrid7.DataSource.DataSet.FieldByName('BARDERO_NO').AsString,
DBLookupComboBox8.KeyValue,DBLookupComboBox7.KeyValue,edit3.Text
//Frmreinsoperation.XDBGrid7.DataSource.DataSet.FieldByName('SIGORTA_HAQQI').AsString
]);

    end;


Frmreinsoperation.XDBGrid7.DataSource.DataSet.Refresh;
Frmreinsoperation.XDBGrid7.DataSource.DataSet.Locate('bardero_no',a,[]);

end;

Addaccount.Close;

end;

procedure TAddaccount.XFButton2Click(Sender: TObject);
begin
close;
end;

end.

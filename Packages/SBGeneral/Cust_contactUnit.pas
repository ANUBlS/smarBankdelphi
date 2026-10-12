unit Cust_contactUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, XDBGrids, StdCtrls, Buttons, XFSCtrls, ExtCtrls, DB,
  OracleData, DBCtrls;

type
  TCust_contact = class(TForm)
    XFPanel2: TXFPanel;
    XFPanel1: TXFPanel;
    XDBGrid1: TXDBGrid;
    OracleDataSet1: TOracleDataSet;
    DataSource1: TDataSource;
    OracleDataSet2: TOracleDataSet;
    XFPanel3: TXFPanel;
    Ad: TXFLabel;
    Telfon: TXFLabel;
    Ünvan: TXFLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    XFButton1: TXFButton;
    OracleDataSet3: TOracleDataSet;
    OracleDataSet4: TOracleDataSet;
    XFButton2: TXFButton;
    XFButton3: TXFButton;
    Edit4: TEdit;
    Label1: TLabel;
    OracleDataSet1ID: TFloatField;
    OracleDataSet1CUST_ID: TFloatField;
    OracleDataSet1RELATIVE_FULLNAME: TWideStringField;
    OracleDataSet1RELATIVE_DEGREE: TWideStringField;
    OracleDataSet1RELATIVE_WORK: TWideStringField;
    OracleDataSet1RELATIVE_TASK: TWideStringField;
    OracleDataSet1RELATIVE_SALARY: TFloatField;
    Edit5: TEdit;
    XFLabel1: TXFLabel;
    procedure XFButton1Click(Sender: TObject);
    procedure XFButton2Click(Sender: TObject);
    procedure XDBGrid1DblClick(Sender: TObject);
    procedure XFButton3Click(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Cust_contact: TCust_contact;

implementation
  uses
  sboapiDataModuleImpl,OpenAccountImpl;
{$R *.dfm}

procedure TCust_contact.Edit5KeyPress(Sender: TObject; var Key: Char);
begin

if (upcase(Key)<'0')or(Upcase(Key)>'9')  then
    if  (ord(key)<>8)then
         key:=#0;
end;

procedure TCust_contact.XDBGrid1DblClick(Sender: TObject);
begin

 edit1.Text:=OracleDataSet1RELATIVE_WORK.AsString;
 edit2.Text:=OracleDataSet1RELATIVE_FULLNAME.AsString;
 edit4.Text:=OracleDataSet1RELATIVE_DEGREE.AsString;
 edit3.Text:=OracleDataSet1RELATIVE_TASK.AsString;
 edit3.Text:=inttostr(OracleDataSet1RELATIVE_SALARY.AsInteger);

end;

procedure TCust_contact.XFButton1Click(Sender: TObject);
begin

if (edit1.Text='') and (edit2.Text='') and (edit3.Text='') then
begin
  showmessage ('     Hecbir sahe doldurulmayib      !') ;
  exit;
end;

with OracleDataSet2 do
begin
 close;
SetVariable('v_custid', cust_relatives  );
SetVariable('v_RELATIVE_FULLNAME', edit2.Text  );
SetVariable('v_RELATIVE_WORK', edit1.Text  );
SetVariable('v_RELATIVE_DEGREE',edit4.Text  );
SetVariable('v_RELATIVE_TASK',edit3.Text  );
SetVariable('v_RELATIVE_SALARY',edit5.Text  );
     open;
end;
OracleDataSet2.Session.Commit;
  Cust_contact.oracledataset1.Refresh;
   edit1.Clear;
   edit2.Clear;
   edit3.Clear;
   edit4.Clear;
   edit5.Clear;
end;
procedure TCust_contact.XFButton2Click(Sender: TObject);
begin

with OracleDataSet3 do
begin
 close;
 SetVariable('v_custid', cust_relatives  );
SetVariable('v_RELATIVE_FULLNAME', edit2.Text  );
SetVariable('v_RELATIVE_WORK', edit1.Text  );
SetVariable('v_RELATIVE_DEGREE',edit4.Text  );
SetVariable('v_RELATIVE_TASK',edit3.Text  );
SetVariable('v_RELATIVE_SALARY',edit5.Text  );
  open;
end;
//showmessage(OracleDataSet1id.AsString);
OracleDataSet3.Session.Commit;
  with  oracledataset1 do
  begin
    close;
    SetVariable('v_custid',cust_relatives);
    open;
  end;
   edit1.Clear;
   edit2.Clear;
   edit3.Clear;
   edit4.Clear;
   edit5.Clear;
end;


procedure TCust_contact.XFButton3Click(Sender: TObject);
begin
with OracleDataSet4 do
begin
  close;
  SetVariable('v_id',OracleDataSet1id.asinteger);
  open;
end;
  OracleDataSet4.Session.Commit;
  oracledataset1.Refresh;

end;
end.

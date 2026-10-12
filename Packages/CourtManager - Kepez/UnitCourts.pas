unit UnitCourts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XFSCtrls, DBCtrls, Mask, ExtCtrls;

type
  TFormCourts = class(TForm)
    XFPanel1: TXFPanel;
    XFPanel2: TXFPanel;
    XFPanel3: TXFPanel;
    XFLabel2: TXFLabel;
    DBEdit1: TDBEdit;
    XFPanel4: TXFPanel;
    XFLabel1: TXFLabel;
    DBEdit2: TDBEdit;
    XFPanel5: TXFPanel;
    XFLabel3: TXFLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    XFButton1: TXFButton;
    XFButton2: TXFButton;
    DBEdit3: TDBEdit;
    XFPanel6: TXFPanel;
    XFLabel4: TXFLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit4: TDBEdit;
    procedure XFButton1Click(Sender: TObject);
    procedure XFButton2Click(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCourts: TFormCourts;

implementation
uses UnitDataModuleCourt;

{$R *.dfm}

procedure TFormCourts.DBLookupComboBox2Click(Sender: TObject);
begin
  //DBEdit3.Text:=DBLookupComboBox2.Text;
  {if DBLookupComboBox2.KeyValue=3 then
  begin
    DBLookupComboBox1.ListSource:=DataModuleCourt.DSCourtBody;
  end;
  if DBLookupComboBox2.KeyValue=4 then
  begin
    DBLookupComboBox1.ListSource:=DataModuleCourt.DSAppeal;
  end;
  if DBLookupComboBox2.KeyValue=5 then
  begin
    DBLookupComboBox1.ListSource:=DataModuleCourt.DSCassation;
  end;    }

end;

procedure TFormCourts.DBLookupComboBox1Click(Sender: TObject);
begin
  DBEdit4.Text:=DBLookupComboBox1.Text;
end;

procedure TFormCourts.FormShow(Sender: TObject);
begin
  if DBLookupComboBox2.KeyValue=3 then
  begin
    DBLookupComboBox1.ListSource:=DataModuleCourt.DSCourtBody;
  end;
  if DBLookupComboBox2.KeyValue=4 then
  begin
    DBLookupComboBox1.ListSource:=DataModuleCourt.DSAppeal;
  end;
  if DBLookupComboBox2.KeyValue=5 then
  begin
    DBLookupComboBox1.ListSource:=DataModuleCourt.DSCassation;
  end;

  //DBLookupComboBox2.KeyValue:='';
 { with DataModuleCourt do
  begin
    ODSInstan.Close;
    ODSInstan.SetVariable('pid',ODSCourt.FieldByName('courtid').AsInteger);
    ODSInstan.Open;
    DBEdit3.Text:=DBLookupComboBox2.Text;
  end;  }

  //DBLookupComboBox1.KeyValue:='';
  //DBEdit4.Text:='';
end;

procedure TFormCourts.XFButton1Click(Sender: TObject);
begin
  if DBEdit3.text='' then
  begin
    ShowMessage('Gondərəcəyiniz intansiyanı seçin!');
    exit;
  end;
  if DBEdit4.text='' then
  begin
    ShowMessage('Gondərəcəyiniz məhkəməni seçin!');
    exit;
  end;
  With DataModuleCourt.ct_control do
       begin
         CallProcedure('CourtBodyUpdate',['crnum',DBEdit1.DataSource.DataSet.FieldByName('id').AsInteger,
                                             'etype',DBLookupComboBox1.KeyValue,'inst',DBLookupComboBox2.KeyValue]);
       end;
  DataModuleCourt.ODSCourt.Refresh;
  DataModuleCourt.ODSCourt.Locate('id', DBEdit1.DataSource.DataSet.FieldByName('id').AsInteger, []);
  Close;
end;

procedure TFormCourts.XFButton2Click(Sender: TObject);
begin
  Close;
end;

end.

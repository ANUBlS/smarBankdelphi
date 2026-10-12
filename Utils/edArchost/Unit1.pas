unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Db, OracleData, Grids, DBGrids, ExtCtrls, DBCtrls, StdCtrls, Mask,
  ComCtrls;

type
  TForm1 = class(TForm)
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    OracleDataSet: TOracleDataSet;
    OracleDataSetACCOUNTS: TStringField;
    OracleDataSetID_NUMBER: TFloatField;
    OracleDataSetACC_ID: TFloatField;
    OracleDataSetOSTAT: TFloatField;
    OracleDataSetPOK_OSTAT: TFloatField;
    OracleDataSetDATDATE: TDateTimeField;
    OracleDataSetOBR_D: TFloatField;
    OracleDataSetOBR_K: TFloatField;
    OracleDataSetPOK_OBR_D: TFloatField;
    OracleDataSetPOK_OBR_K: TFloatField;
    OracleDataSetLASTOPDATE: TDateTimeField;
    OracleSession1: TOracleSession;
    OracleLogon1: TOracleLogon;
    OracleDataSetBALANCE: TFloatField;
    Panel1: TPanel;
    Button1: TButton;
    EditBalance: TEdit;
    CBFilter: TCheckBox;
    Panel2: TPanel;
    DBEdit1: TDBEdit;
    SumBalans: TOracleDataSet;
    DataSumBalans: TDataSource;
    SumBalansSUMOSTAT: TFloatField;
    EditSearch: TEdit;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    SumBalansSUMPOK_OSTAT: TFloatField;
    DTP: TDateTimePicker;
    Tekdat: TOracleDataSet;
    TekdatTEK_DAT: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure EditSearchChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MouseWheelHandler(var Message: TMessage); override;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var Logoner :Boolean;
begin
 With OracleSession1 do
 begin
  LogonUsername :='SMART';
  LogonPassword :='sm';
  LogonDatabase :='SB-Current';
 end;{with OracleSession1}
  Logoner:=OracleLogon1.Execute;
   if not Logoner then Application.Terminate;
 OracleDataSet.Open;
 Tekdat.Open;
 DTP.DateTime :=Tekdat.FieldByName('tek_dat').AsDateTime;
 
end;

procedure TForm1.MouseWheelHandler(var Message: TMessage);
begin
 Inherited;
 if DBGrid1.Focused then
  with TCMMouseWheel(Message), DBGrid1.DataSource.DataSet do
    if WheelDelta < 0 then
      Next
    else
      Prior;
  // WaresViewer.Repaint;
end;


procedure TForm1.Button1Click(Sender: TObject);
var
   tdate: Variant;
begin
 tdate :=Int(DTP.DateTime);
 if CBFilter.Checked then
  begin
   SumBalans.CloseAll;
   SumBalans.SetVariable('sik', EditBalance.Text);
   SumBalans.SetVariable('tdate', tdate);
   SumBalans.Open;
   OracleDataSet.CloseAll;
   OracleDataSet.SetVariable('DAT', tdate);
   OracleDataSet.Open;
   OracleDataSet.Filtered :=False;
   OracleDataSet.Filter :='Balance='+EditBalance.Text;
   OracleDataSet.Filtered :=True;
  end
 else
  begin
   OracleDataSet.CloseAll;
   OracleDataSet.SetVariable('DAT', tdate);
   OracleDataSet.Open;
   OracleDataSet.Filtered :=False;
  end; 
end;

procedure TForm1.EditSearchChange(Sender: TObject);
begin
 with OracleDataSet do
  Locate('accounts', EditSearch.text,[]);
end;

end.

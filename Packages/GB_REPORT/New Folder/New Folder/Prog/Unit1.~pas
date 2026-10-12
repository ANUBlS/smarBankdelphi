unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, OracleData, Oracle, ComCtrls;

type
  TForm1 = class(TForm)
    OracleSession1: TOracleSession;
    OracleDataSet1: TOracleDataSet;
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    Button3: TButton;
    Memo3: TMemo;
    Memo4: TMemo;
    ProgressBar1: TProgressBar;
    Button4: TButton;
    Memo5: TMemo;
    Button5: TButton;
    OraclePackage1: TOraclePackage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
   ProgressBar1.Position:=1;

   OracleDataSet1.Close;
   OracleDataSet1.SQL.clear;
   OracleDataSet1.SQL.Add('CREATE TABLE report_setting (language NUMBER,dirnaq VARCHAR2(1))');
   OracleDataSet1.ExecSQL;

   ProgressBar1.Position:=30;

   OracleDataSet1.Close;
   OracleDataSet1.SQL.clear;
   OracleDataSet1.SQL.Add('CREATE TABLE report_sql (name VARCHAR2(30),sql VARCHAR2(1000))');
   OracleDataSet1.ExecSQL;

   ProgressBar1.Position:=60;

   OracleDataSet1.Close;
   OracleDataSet1.SQL.clear;
   OracleDataSet1.SQL.Add('CREATE TABLE report_unicode (az VARCHAR2(500),az_font VARCHAR2(100), az_font_size NUMBER, az_charset NUMBER,q_az VARCHAR2(500), ');
   OracleDataSet1.SQL.Add(' q_az_font VARCHAR2(100), q_az_font_size NUMBER, q_az_charset NUMBER, id NUMBER,component VARCHAR2(500),component_type VARCHAR2(500),');
   OracleDataSet1.SQL.Add(' component_type_c VARCHAR2(500),comp VARCHAR2(500)) ');
   OracleDataSet1.ExecSQL;

   ProgressBar1.Position:=100;
   Button2.Visible:=true;
   Button1.Visible:=false;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   ProgressBar1.Position:=1;
   OracleDataSet1.Close;
   OracleDataSet1.SQL.clear;
   OracleDataSet1.SQL.Add(Memo1.Text);
   OracleDataSet1.ExecSQL;

   ProgressBar1.Position:=50;

   OracleDataSet1.Close;
   OracleDataSet1.SQL.clear;
   OracleDataSet1.SQL.Add(Memo2.Text);
   OracleDataSet1.ExecSQL;
   ProgressBar1.Position:=100;
   Button2.Visible:=false;
   Button4.Visible:=true;

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
   ProgressBar1.Position:=1;
   OracleDataSet1.Close;
   OracleDataSet1.SQL.clear;
   OracleDataSet1.SQL.Add(Memo3.Text);
   OracleDataSet1.ExecSQL;

   ProgressBar1.Position:=50;

   OracleDataSet1.Close;
   OracleDataSet1.SQL.clear;
   OracleDataSet1.SQL.Add(Memo4.Text);
   OracleDataSet1.ExecSQL;

   ProgressBar1.Position:=100;
   Application.Terminate;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
   ProgressBar1.Position:=1;
   OracleDataSet1.Close;
   OracleDataSet1.SQL.clear;
   OracleDataSet1.SQL.Add(Memo5.Text);
   OracleDataSet1.ExecSQL;
   Button4.Visible:=false;
   Button5.Visible:=true;
   ProgressBar1.Position:=100;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
   ProgressBar1.Position:=1;
   OraclePackage1.CallProcedure('L_chin',[]);
   ProgressBar1.Position:=100;
   Application.Terminate;
end;

end.

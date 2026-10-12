unit FreeAccUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, SearchEdit, Oracle, Db, OracleData;

type
  TForm1 = class(TForm)
    OraclePackage: TOraclePackage;
    Button1: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    SearchEdit1: TSearchEdit;
    Label2: TLabel;
    EditActivTrDesc: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    SearchEdit2: TSearchEdit;
    EditPassivTrDesc: TEdit;
    Activ: TDataSource;
    ActiveData: TOracleDataSet;
    PassivData: TOracleDataSet;
    Passiv: TDataSource;
    OracleLogon: TOracleLogon;
    OracleSession: TOracleSession;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
 With OracleSession do
 begin
   LogonUsername :='Smart';
   //LogonPassword :='sm';
   LogonDatabase :='SB-CURRENT';
 end;
 if OracleLogon.Execute then
   if not OracleSession.Connected then
    Application.Terminate;
 ActiveData.open;
 PassivData.open;   
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 with OraclePackage do
  CallProcedure('FREEACCOUNTS',
      [ActiveData.FieldByName('ID').AsVariant,
      PassivData.FieldByName('ID').AsVariant,
      EditActivTrDesc.text,
      EditPassivTrDesc.text]
       );
  OracleSession.Commit;
end;

end.

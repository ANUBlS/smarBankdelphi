unit SetLastOpdateImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Oracle, Db, OracleData, DBCtrls, ComCtrls, Grids, DBGrids,
  SearchEdit;

type
  TForm1 = class(TForm)
    Memo: TMemo;
    Label1: TLabel;
    Session: TOracleSession;
    Accounts: TOracleDataSet;
    DataSource: TDataSource;
    OracleLogon: TOracleLogon;
    Button: TButton;
    QueryAcc: TOracleQuery;
    StatusBar: TStatusBar;
    QueryTrg: TOracleQuery;
    SearchEdit1: TSearchEdit;
    CBRateDif: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ButtonClick(Sender: TObject);
    procedure SearchEdit1Change(Sender: TObject);
    procedure MemoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBRateDifClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ExecuteDDL;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
 with Session do
 begin
  LogonUsername :='Smart';
 // LogonPassword :='SM';
  LogonDatabase :='SB' ;
 end;
 if OracleLogon.Execute then
  if not Session.Connected then
   Application.Terminate;
 Accounts.Open;  

end;

procedure TForm1.ButtonClick(Sender: TObject);
const
     cs_name= 'getlastopdate';
     cs_disable = ' alter trigger UPD_SET_OF_LASTOPDAY disable ';
     cs_enable = ' alter trigger UPD_SET_OF_LASTOPDAY enable ';
begin
 Screen.Cursor :=crSQLWait;
 StatusBar.SimpleText :='Executing Repair Last Operation Date....';
 try
  with QueryAcc do
  begin
   QueryTrg.SQL.Text :=cs_disable;
   QueryTrg.Execute;
   SetVariable('AccID', Accounts.FieldByName('ID').AsInteger);
   Execute;
   Session.Commit;
  end;
 finally
  QueryTrg.SQL.Text :=cs_enable;
  QueryTrg.Execute;
  Screen.Cursor :=crDefault;
  StatusBar.SimpleText :='Account: ' + Accounts.FieldByName('acc_no').AsString + '  executed!';
 end;
end;

procedure TForm1.ExecuteDDl;
begin
  QueryTrg.SQL.Assign(Memo.Lines);
  QueryTrg.Execute;
end;

procedure TForm1.SearchEdit1Change(Sender: TObject);
begin
 Button.Enabled :=Trim((Sender as TSearchEdit).Text) <>'';
end;


procedure TForm1.MemoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_F1 then
  ExecuteDDL;
end;

procedure TForm1.CBRateDifClick(Sender: TObject);
begin
 if CBRateDif.Checked then
  Memo.Lines[10] :=''
 else
  Memo.Lines[10] :=' and (Decode(vid_op, 1, 2, 1) = 1) ';
 ExecuteDDL; 
end;

end.

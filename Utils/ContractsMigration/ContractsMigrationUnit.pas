unit ContractsMigrationUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Oracle, Db, OracleData, ExtCtrls, Grids, DBGrids;

type
  TFormMain = class(TForm)
    GroupBox1: TGroupBox;
    StaticText1: TStaticText;
    DTPMigrationDate: TDateTimePicker;
    StaticText2: TStaticText;
    CmbBoxTypes: TComboBox;
    OraclePackage: TOraclePackage;
    Contracts: TOracleDataSet;
    OracleLogon: TOracleLogon;
    OracleSession: TOracleSession;
    LogoMemo: TMemo;
    BtnMigrate: TButton;
    Panel1: TPanel;
    ProgressBar: TProgressBar;
    StatusBar1: TStatusBar;
    ContractsID: TFloatField;
    ContractsCONTRACTNO: TStringField;
    DataSource: TDataSource;
    CurrentBankDate: TOracleDataSet;
    DBGrid1: TDBGrid;
    CurrentBankDateTEK_DAT: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure BtnMigrateClick(Sender: TObject);
    procedure CmbBoxTypesChange(Sender: TObject);
    procedure ContractsAfterOpen(DataSet: TDataSet);
    procedure ContractsAfterClose(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.DFM}

procedure TFormMain.FormCreate(Sender: TObject);
begin

  CmbBoxTypes.ItemIndex := 0;
  with  OracleLogon do
  if (not Execute)or(not Session.Connected)  then
  Application.Terminate;

  Contracts.SetVariable('Type#',1);
  Contracts.Open;
  CurrentBankDate.Open;
  DTPMigrationDate.DateTime := CurrentBankDate.FieldByName('Tek_Dat').AsDateTime;
end;

procedure TFormMain.BtnMigrateClick(Sender: TObject);
var
  MigrationDate : TDateTime;
  ContractID : LongInt;
begin
  if  MessageDlg(
              Format('All Rests In %s Contracts Will be updated! Continue?',[CmbBoxTypes.Text])
              ,mtConfirmation
              ,[mbYes,mbNo]
              ,0
             ) <> mrYes  then  Exit;

  MigrationDate := Trunc(DTPMigrationDate.DateTime);
  with Contracts do
  try
    First;
    while not EOF do
    begin
      ContractID := FieldByName('ID').AsInteger;

      try
       with  OraclePackage do
         CallProcedure('MigrateContractRests',[MigrationDate,ContractID]);
       except
       on E:EOracleError do
         LogoMemo.Lines.Add('Could not migrate data! N='+FieldByName('ContractNo').AsString + '  Error :'+E.Message);
       end;

     Next;

    end;
  finally
    ShowMessage('Contracts rests has succesful migrated!')
  end;
end;

procedure TFormMain.CmbBoxTypesChange(Sender: TObject);
var
  ContType :Integer;
begin
 Screen.Cursor :=crSQLWait;
 try
  ContType :=(Sender as TComboBox).ItemIndex*2 + 1;
  with  Contracts  do
  begin
    if Active then Close;
    SetVariable('Type#',ContType);
    Open;
  end;
 finally
   Screen.Cursor :=crDefault;
 end;
end;

procedure TFormMain.ContractsAfterOpen(DataSet: TDataSet);
begin
  StatusBar1.SimpleText :='Count : '   + IntToStr(DataSet.RecordCount)
end;

procedure TFormMain.ContractsAfterClose(DataSet: TDataSet);
begin
  StatusBar1.SimpleText :='Count :   ' + '0'
end;

end.


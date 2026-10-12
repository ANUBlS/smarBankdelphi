unit UntQuery;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ComCtrls, Spin;
type
  EInvalidDate=Class(Exception);
type
  TFrmQuery = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StaticText1: TStaticText;
    ELastClosedMonth: TEdit;
    Panel3: TPanel;
    StaticText2: TStaticText;
    DTPNewCloseDate: TDateTimePicker;
    ENewCloseDate: TEdit;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    NotesMemo: TMemo;
    TranzProgressBar: TProgressBar;
    SpeedButton1: TSpeedButton;
    SpinEditDays: TSpinEdit;
    StaticText3: TStaticText;
    Panel4: TPanel;
    StaticText4: TStaticText;
    EOperationDate: TEdit;
    DTPOperationDate: TDateTimePicker;
    Panel5: TPanel;
    Panel6: TPanel;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DTPNewCloseDateChange(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    function GetLastCalculateDate :TDateTime;
    procedure GetErroneousWares;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DTPOperationDateChange(Sender: TObject);
    procedure SpinEditDaysKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshContacts;
    function GenerateTransAssignment(GroupName :string) :string;
  end;

var
  FrmQuery: TFrmQuery;

implementation

uses MFDataModule, UntMainFacilitiesImpl, SBTransaction;

{$R *.DFM}

procedure TFrmQuery.SpeedButton2Click(Sender: TObject);
begin
 Close;
end;

function TFrmQuery.GenerateTransAssignment(GroupName :string) :string;
 resourcestring
   Assignment = '%s групу цзря амортизасийа';
begin
 Result :=Format(Assignment,[GroupName]);
end;

procedure TFrmQuery.RefreshContacts;
begin
 with MainFDataModule do
  begin
   ODSSumWares.Refresh;
   ODSSumModWares.Refresh;
   ODSSumRepair.Refresh;
  end
end;

function TFrmQuery.GetLastCalculateDate :TDateTime;
begin
 with MainFDataModule.OPViewWares do
  Result :=CallDateFunction('GetLastCalculateDate',[]);
end;

procedure TFrmQuery.FormActivate(Sender: TObject);
begin
 ELastClosedMonth.Text :=FormatDateTime('dd-mmm-yyyy',GetLastCalculateDate);
 ENewCloseDate.Text :=FormatDateTime('dd-mmm-yyyy',MainFDataModule.OPViewWares.CallDateFunction('GetPresentDate',[]));
 DTPNewCloseDate.DateTime:=MainFDataModule.OPViewWares.CallDateFunction('GetPresentDate',[]);
 DTPOperationDate.DateTime:=MainFDataModule.OPViewWares.CallDateFunction('GetPresentDate',[]);
 EOperationDate.Text :=FormatDateTime('dd-mmm-yyyy',MainFDataModule.OPViewWares.CallDateFunction('GetPresentDate',[]));
 SpinEditDays.Text :=(FloatToStr(Int(DTPNewCloseDate.DateTime)-GetLastCalculateDate));
 TranzProgressBar.Hide;
end;

procedure TFrmQuery.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key = VK_ESCAPE) then Close;
end;

procedure TFrmQuery.DTPNewCloseDateChange(Sender: TObject);
begin
 ENewCloseDate.Text :=FormatDateTime('dd-mmm-yyyy',(Sender as TDateTimePicker).Date);
 SpinEditDays.Text :=(FloatToStr(Int(DTPNewCloseDate.DateTime)-GetLastCalculateDate));
end;

procedure TFrmQuery.SpeedButton3Click(Sender: TObject);
begin
 Close;
end;

procedure TFrmQuery.SpeedButton4Click(Sender: TObject);
var
   CloseD      :TDateTime;
   OperationDate  :TDateTime;
   TempID      :integer;
   Transaction : TTransaction;
begin
 CloseD:=Int(DTPNewCloseDate.DateTime);
 if CloseD <= GetLastCalculateDate then
   Raise
     EInvalidDate.Create('You can not calculate for past day!'+#13+'You can not calculate twice in 1 day!');

 OperationDate :=Int(DTPOperationDate.DateTime);
 TranzProgressBar.Show;
 TranzProgressBar.Position :=0;
 TranzProgressBar.StepBy(15);
 with MainFDataModule do
  begin
   TranzProgressBar.Stepby(10);
   OPViewWares.CallProcedure('CalculateOldWares',[CloseD,SpinEditDays.Value]);
   TranzProgressBar.Stepby(20);
   OPViewWares.CallProcedure('add_close_month',[CloseD]);
   OPViewWares.CallProcedure('CalculateNewWares',[CloseD]);
   TranzProgressBar.StepBy(35);
   ViewWares.Refresh;
   TranzProgressBar.StepBy(20);
  //Beginning transaction
  with MainFDataModule.ODSTransaction do
   begin
    Open;
    First;
     while Not(Eof) do
      begin
        with Transaction do
         begin
          Size := 0;
          TransactionDate := OperationDate;
          hDebit := ODSTransaction.FieldByName('Exp_account').Value;
          hCredit := ODSTransaction.FieldByName('Amort_account').Value;
          DebitAmount := ODSTransaction.FieldByName('Rest').Value;
          CreditAmount := ODSTransaction.FieldByName('Rest').Value;
          LAmount := ODSTransaction.FieldByName('Rest').Value;
          DebitRate := 1;
          CreditRate := 1;
          ParentID := 0;
          DebitBankID := 0;
          CreditBankID := 0;
          FilialID := 0;
          PackageNumber := 0;
          InbalanceChar := 0;
          OutBalanceChar := 0;
          CypherCode := 0;
          OperationCode := 0;
          TransactionID := -1;
          TrName := GenerateTransAssignment(FieldByName('Name').AsString);
          IsRoot :=true;
          ArchiveID := 0;
         end;
        TempID :=SB_AddTransaction(Transaction, []);
        OPViewWares.CallProcedure('SetTransactions',[TempID,ODSTransaction.FieldByName('ID').value]);
        Next;
      end;
    Close;
   end;
   TranzProgressBar.Hide;
   ELastClosedMonth.Text :=FormatDateTime('dd-mmm-yyyy',GetLastCalculateDate);
   GetErroneousWares;
   RefreshContacts;
   MainFacilities.StopCalculate(-1);
 end;
end;

procedure TFrmQuery.GetErroneousWares;
begin
 NotesMemo.Clear;
 with MainFDataModule.ODSGetErroneousWares do
  begin
   if Active =False then Open;
   while not(eof) do
    begin
      NotesMemo.Lines.Add(FieldByName('Name').AsString);
      Next;
    end;
   CloseAll; 
  end;
end;

procedure TFrmQuery.SpeedButton1Click(Sender: TObject);
begin
 NotesMemo.Visible :=not(NotesMemo.Visible);
end;

procedure TFrmQuery.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 NotesMemo.Visible :=False;
end;

procedure TFrmQuery.DTPOperationDateChange(Sender: TObject);
begin
 EOperationDate.Text :=FormatDateTime('dd-mmm-yyyy',(Sender as TDateTimePicker).Date);
end;

procedure TFrmQuery.SpinEditDaysKeyPress(Sender: TObject; var Key: Char);
begin
 if Key='-' then Key :=#0;
end;

end.

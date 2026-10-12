unit NewDepositUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, DBViewComboBox, SearchEdit, ComCtrls,DB;

type
  ELoadContractError=class(Exception);

type
  TOperationMode = (omInsert,omEdit);

type
  TFrmNewDeposit = class(TForm)
    LeftPanel: TPanel;
    GBAcounts: TGroupBox;
    GBCurrency: TGroupBox;
    CmbBoxCurrencys: TDBViewComboBox;
    Panel2: TPanel;
    DepositAccs: TSearchEdit;
    DepositAccNames: TDBViewComboBox;
    StaticText1: TStaticText;
    Panel3: TPanel;
    ClientAccs: TSearchEdit;
    ClientAccNames: TDBViewComboBox;
    StaticText2: TStaticText;
    Panel4: TPanel;
    InterestAccs: TSearchEdit;
    InterestAccNames: TDBViewComboBox;
    StaticText3: TStaticText;
    Panel1: TPanel;
    StaticText4: TStaticText;
    DTPOpenDate: TDateTimePicker;
    DTPCloseDate: TDateTimePicker;
    Panel5: TPanel;
    Panel8: TPanel;
    GroupBox1: TGroupBox;
    Panel6: TPanel;
    StaticText5: TStaticText;
    OverduePercentEdit: TEdit;
    Panel7: TPanel;
    StaticText6: TStaticText;
    PercentEdit: TEdit;
    GroupBox2: TGroupBox;
    Panel10: TPanel;
    StaticText8: TStaticText;
    Panel11: TPanel;
    StaticText9: TStaticText;
    ClientTypes: TDBViewComboBox;
    ContractTypes: TDBViewComboBox;
    ApplyButton: TButton;
    CancelButton: TButton;
    Panel9: TPanel;
    StaticText7: TStaticText;
    AmountEdit: TEdit;
    Panel12: TPanel;
    StaticText10: TStaticText;
    ContractNoEdit: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure DepositAccNamesChange(Sender: TObject);
    procedure ClientAccNamesChange(Sender: TObject);
    procedure InterestAccNamesChange(Sender: TObject);
    procedure ApplyButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmbBoxCurrencysChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure NewDeposit(OpMode :TOperationMode);
    procedure ResetData;
    procedure LoadContractProperties;
  public
    FOperationMode :TOperationMode;
    FContractType  :Integer;
    FContractID    :Integer;
    { Public declarations }
  end;

var
  FrmNewDeposit: TFrmNewDeposit;

implementation

uses
    DataModNewDepositUnit,StoredProgramsUnit,DepositDataModuleUnit;

{$R *.DFM}

procedure TFrmNewDeposit.FormCreate(Sender: TObject);
begin
   DataModuleNewDeposit  :=TDataModuleNewDeposit.Create(Self);
   DTPOpenDate.DateTime  :=GetBankDate;
   DTPCloseDate.DateTime :=GetBankDate;
   ResetData;
end;

procedure TFrmNewDeposit.DepositAccNamesChange(Sender: TObject);
begin
    DepositAccs.Text :=(Sender as TDBViewComboBox).ListSource.DataSet.FieldByName('AccNo').AsString;
end;

procedure TFrmNewDeposit.ClientAccNamesChange(Sender: TObject);
begin
  ClientAccs.Text :=(Sender as TDBViewComboBox).ListSource.DataSet.FieldByName('AccNo').AsString;
end;

procedure TFrmNewDeposit.InterestAccNamesChange(Sender: TObject);
begin
   InterestAccs.Text :=(Sender as TDBViewComboBox).ListSource.DataSet.FieldByName('AccNo').AsString;
end;

procedure TFrmNewDeposit.ResetData;
begin

end;

procedure TFrmNewDeposit.LoadContractProperties;

   procedure LocateToAccount(SEdit :TSearchEdit;AccID :LongInt);
    begin
      with  SEdit,DataSource.DataSet   do
      if Locate('ID',AccID,[]) then
      begin
        Text :=FieldByName(SearchField).AsString;
        if Assigned(Partnership) and (Partnership.ItemIndex=-1)then
         Partnership.ItemIndex :=0;
      end else  ELoadContractError.Create('Can not Load Contract Properties due Errors');
    end;

begin

  with  DepositDataModule,Deposits do
  begin

    DataModuleNewDeposit.Currencys.Locate('Valute',FieldByName('ContractCurrencyID').AsInteger,[]);
    DepositAccNames.RefreshList;
    ClientAccNames.RefreshList;
    InterestAccNames.RefreshList;

    LocateToAccount(DepositAccs,FieldByName('ContractAccID').AsInteger);
    LocateToAccount(ClientAccs,FieldByName('ClientAccID').AsInteger);
    LocateToAccount(InterestAccs,FieldByName('InterestAccID').AsInteger);

    ContractNoEdit.Text :=FieldByName('ContractNo').AsString;
    AmountEdit.Text :=FieldByName('Amount').AsString;
    PercentEdit.Text :=Percents.FieldbyName('Interest').AsString;
    OverduePercentEdit.Text:=OverduePercents.FieldbyName('OverdueInterest').AsString;

    if not ClientTypes.ListSource.DataSet.Locate('ID',FieldByName('ClientType').AsInteger,[]) then
      ELoadContractError.Create('Can not Load Contract Properties due Errors');
    if not ContractTypes.ListSource.DataSet.Locate('ID',FieldByName('ContractType').AsInteger,[]) then
      ELoadContractError.Create('Can not Load Contract Properties due Errors');

    DTPOpenDate.DateTime :=FieldByName('OpenDate').AsDateTime;
    DTPCloseDate.DateTime :=FieldByName('CloseDate').AsDateTime;

  end;
end;

procedure TFrmNewDeposit.NewDeposit(OpMode :TOperationMode);
var
   Amount  :Real;
   Percent :Real;
   OverduePercent :Real;
   OpenDate,CloseDate :TDateTime;
   DepositAccID  :Variant;
   ClientAccID   :Variant;
   InterestAccID :Variant;
   ClientTypeID  :Integer;
   ContractTypeID :Integer;
   ContractNo    :String;
function    GetAccID(SEdit :TSearchEdit):Variant;
begin
  Result :=null;
  with  SEdit,DataSource.DataSet  do
  begin
    if  Locate(SearchField,Text,[loCaseInsensitive]) then
      Result :=FieldByName('ID').AsVariant;
  end;
end;
begin
  try
    Amount :=StrToFloat(AmountEdit.Text);
    Percent :=StrToFloat(PercentEdit.Text);
    OverduePercent :=StrToFloat(OverduePercentEdit.Text);
    OpenDate :=Trunc(DTPOpenDate.DateTime);
    CloseDate :=Trunc(DTPCloseDate.DateTime);
    ClientTypeID :=ClientTypes.ListSource.DataSet.FieldByName('ID').AsInteger;
    ContractTypeID:=ContractTypes.ListSource.DataSet.FieldByName('ID').AsInteger;
    DepositAccID :=GetAccID(DepositAccs);
    ClientAccID  :=GetAccID(ClientAccs);
    InterestAccID :=GetAccID(InterestAccs);
    ContractNo :=ContractNoEdit.Text;

    with DataModuleNewDeposit.DepositProperties  do
    if   OpMode = omInsert   then
      CallProcedure('NewDeposit',[
                   FContractType
                  ,OpenDate
                  ,CloseDate
                  ,Amount
                  ,ContractNo
                  ,ContractTypeID
                  ,ClientTypeID
                  ,DepositAccID
                  ,ClientAccID
                  ,InterestAccID
                  ,Percent
                  ,OverduePercent
                  ])
    else
      CallProcedure('UpdateDeposit',[
                   FContractID
                  ,FContractType
                  ,OpenDate
                  ,CloseDate
                  ,Amount
                  ,ContractNo
                  ,ContractTypeID
                  ,ClientTypeID
                  ,DepositAccID
                  ,ClientAccID
                  ,InterestAccID
                  ,Percent
                  ,OverduePercent
                  ]);

  except
    ShowMessage('Invalid Input Data.')
  end;
end;

procedure TFrmNewDeposit.ApplyButtonClick(Sender: TObject);
begin
   NewDeposit(FOperationMode);
   ModalResult :=mrOk;
end;

procedure TFrmNewDeposit.FormShow(Sender: TObject);
begin
  if  FOperationMode = omEdit  then
  begin
    Caption := 'Editing Contract ';
    LoadContractProperties
  end;  
end;

procedure TFrmNewDeposit.CmbBoxCurrencysChange(Sender: TObject);
begin
  DepositAccs.Text :='';
  DepositAccs.Partnership.RefreshList;
  ClientAccs.Text :='';
  ClientAccs.Partnership.RefreshList;
  InterestAccs.Text :='';
  InterestAccs.Partnership.RefreshList;
end;

procedure TFrmNewDeposit.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27  then
    CancelButton.Click;
end;

end.

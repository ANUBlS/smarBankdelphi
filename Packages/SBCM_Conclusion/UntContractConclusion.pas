unit UntContractConclusion;

interface

uses
  Windows, Buttons, StdCtrls, ComCtrls, Mask, DBCtrls,
  Controls, ExtCtrls, Classes, Forms,SysUtils,Db,Messages,Dialogs,Graphics,
  Grids, DBGrids, SearchEdit, DBViewComboBox, CurrencyEdit;
type
   EInvalidPercents = class(Exception);
type
  TPercentMode = (pmNormal,pmOverdue);

type
  TFloatableDatePtr = array of Int64;
type
  TFloatablePercentPtr = array of Real;
type
  TFloatableDate = array[TPercentMode] of  TFloatableDatePtr;
type
  TFloatablePercent = array[TPercentMode] of TFloatablePercentPtr;
type
  TOperationMode = (omInsert,omEdit);
type
  TAccountsID = array[0..6] of  LongInt;

type
  TFrmContract = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    GBGrandAccs: TGroupBox;
    GroupBox3: TGroupBox;
    GBReserveAccs: TGroupBox;
    GroupBox5: TGroupBox;
    GBOverdueAccs: TGroupBox;
    GBOverdueInterestAccs: TGroupBox;
    Panel5: TPanel;
    Label2: TLabel;
    GroupBox8: TGroupBox;
    DTPOpenDate: TDateTimePicker;
    GroupBox9: TGroupBox;
    DTPCloseDate: TDateTimePicker;
    GBStopCalcDate: TGroupBox;
    DTPStopCalcDate: TDateTimePicker;
    Panel6: TPanel;
    Label3: TLabel;
    ContractNumEdit: TEdit;
    GBReliability: TGroupBox;
    Panel7: TPanel;
    Label4: TLabel;
    GroupBox12: TGroupBox;
    GBMountlyPayment: TGroupBox;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    CBMountlyRent: TCheckBox;
    Panel8: TPanel;
    Label5: TLabel;
    GroupBox14: TGroupBox;
    PercentEdit: TEdit;
    CBConstant: TCheckBox;
    SBBrowse: TSpeedButton;
    Panel9: TPanel;
    GBOverduePercent: TGroupBox;
    SBOverdueBrowse: TSpeedButton;
    OverduePercentEdit: TEdit;
    CBOverdueConstant: TCheckBox;
    Panel10: TPanel;
    Label6: TLabel;
    MounthlyAmount: TEdit;
    MounthlyPercent: TEdit;
    GroupBox16: TGroupBox;
    GBPledge: TGroupBox;
    GroupBox18: TGroupBox;
    Panel11: TPanel;
    GrandAccs: TSearchEdit;
    ClientAccs: TSearchEdit;
    ReserveAccs: TSearchEdit;
    InterestAccs: TSearchEdit;
    OverdueAccs: TSearchEdit;
    OverdueInterestAccs: TSearchEdit;
    ReliabilityPercentEdit: TEdit;
    GrandNames: TDBViewComboBox;
    ClientNames: TDBViewComboBox;
    ReliabilityNames: TDBViewComboBox;
    InterestNames: TDBViewComboBox;
    OverdueNames: TDBViewComboBox;
    OverdueInterestNames: TDBViewComboBox;
    ReliabilityViewer: TDBViewComboBox;
    CBClientType: TDBViewComboBox;
    CBPledgeType: TDBViewComboBox;
    CBContractType: TDBViewComboBox;
    CurrencyGroupBox: TGroupBox;
    CurrencyViewer: TDBViewComboBox;
    Bevel1: TBevel;
    CurrencyEdit: TEdit;
    DBTextCurrency: TDBText;
    PledgePriceEdit: TEdit;
    Panel12: TPanel;
    BtnApply: TButton;
    BtnClose: TButton;
    AmountEdit: TCurrencyEdit;
    GroupBox1: TGroupBox;
    OverdueReserveAccs: TSearchEdit;
    OverdueReserveNames: TDBViewComboBox;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
    OverdueReliabilityViewer: TDBViewComboBox;
    procedure CBMountlyRentClick(Sender: TObject);
    procedure CBConstantClick(Sender: TObject);
    procedure SBBrowseClick(Sender: TObject);
    procedure CBOverdueConstantClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnApplyClick(Sender: TObject);
    procedure AmountEditKeyPress(Sender: TObject; var Key: Char);
    procedure GrandNamesChange(Sender: TObject);
    procedure ClientNamesChange(Sender: TObject);
    procedure ReliabilityNamesChange(Sender: TObject);
    procedure InterestNamesChange(Sender: TObject);
    procedure OverdueNamesChange(Sender: TObject);
    procedure OverdueInterestNamesChange(Sender: TObject);
    procedure ReliabilityViewerChange(Sender: TObject);
    procedure CurrencyEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyViewerChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure AmountEditExit(Sender: TObject);
    procedure GrandAccsChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure OverdueReliabilityViewerChange(Sender: TObject);
    procedure OverdueReserveNamesChange(Sender: TObject);
  private
     function   CheckingAccounts(SEdit :TSearchEdit) :LongInt;
     procedure  LoadAccount(SEdit :TSearchEdit;AccountID :LongInt = -1);
     procedure  LoadingAccounts(Params :TAccountsID);
     procedure  InitPercents;
     procedure  FreePercents;
     procedure  IncludePercents;
     function   CheckDateSequnce(FloatDate :TFloatableDate;Mode :TPercentMode):Boolean;
    { Private declarations }
  public
      FAccountsID :TAccountsID;
      FOpMode  :TOperationMode;
      FContractType :Integer;
      FloatableDate :TFloatableDate;
      FloatablePercent :TFloatablePercent;
      IsControlReseting : Boolean;
      procedure   ContractConclusion(opMode :TOperationMode;ContractType :Integer);
      procedure   Push(var FloatDate :TFloatableDate;Value :Int64;Mode :TPercentMode);overload;
      procedure   Push(var FloatPercent :TFloatablePercent;Value :Real;Mode :TPercentMode);overload;
      procedure   Pop(var FloatDate :TFloatableDate;Index :Integer;Mode :TPercentMode);overload;
      procedure   Pop(var FloatPercent :TFloatablePercent;Index :Integer;Mode :TPercentMode);overload;
      procedure   Reset;
      procedure   LoadContractProperties;
      function    SBCMPercentAssigned(PercentMode :TPercentMode) :Boolean;
      procedure   ResetContrls;
      procedure   ResetControl(Control :TSearchEdit);
      procedure   FindOtherAccounts(Sender : TObject);
    { Public declarations }
  end;

var
  FrmContract: TFrmContract;

implementation

{$R *.DFM}

uses
   StoredProgramsUnit,UntConclusionDataModule,sbcmMainDataModule;

const
     _SEARCHED = 33;

procedure   TFrmContract.FindOtherAccounts(Sender : TObject);
var
  i : integer;
  CustID : LongInt;
begin
  Screen.Cursor := crHourGlass;
  try
   CustID := TSearchEdit(Sender).DataSource.DataSet.FieldByName('CustID').AsInteger;
   for i := 0 to ComponentCount - 1 do
   if    (Components[i] is TSearchEdit)
     and (Components[i].Tag = _SEARCHED) then
   begin
     with  TSearchEdit(Components[i]) do
     begin
       if DataSource.DataSet.Locate('CustID',CustID,[]) then
       begin
         if (Partnership.Items.Count > 0) and (Partnership.ItemIndex < 0) then
           Partnership.ItemIndex := 0;
         Partnership.OnChange(Partnership);
       end;
     end;
   end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

function  TFrmContract.CheckingAccounts(SEdit :TSearchEdit):LongInt;
begin
   Result :=-1;
   with  SEdit do
   if   Text <>''  then
   if   DataSource.DataSet.Active and (DataSource.DataSet.RecordCount>0) then
     Result :=DataSource.DataSet.FieldByName('ID').AsInteger
end;
procedure TFrmContract.ContractConclusion;
var
   OpenDate,CloseDate,StopCalcDate :TDateTime;
   Amount,MAmount,MPercent:Real;
   PledgePrice :Real;
begin
  {Initializing  Params}
 try
   OpenDate :=Trunc(DTPOpenDate.DateTime);
   CloseDate:=Trunc(DTPCloseDate.DateTime);
   StopCalcDate :=Trunc(DTPStopCalcDate.DateTime);
   Amount :=AmountEdit.Value;
   PledgePrice :=StrToFloat(PledgePriceEdit.Text);
   if  CBMountlyRent.Checked  then
   begin
     MAmount :=StrToFloat(MounthlyAmount.Text);
     MPercent :=StrToFloat(MounthlyPercent.Text);
   end else
   begin
     MAmount :=0;
     MPercent :=0;
   end;
   {Initializing Percents}

   InitPercents;

   {Calling  Stored program}

   with  DataModContract do
   with  ContractPack  do
   if   FOpMode = omInsert  then
   CallProcedure('NewContract',[
                 ContractType      //Type of Contract 1<=>Credit
                ,OpenDate
                ,CloseDate
                ,Amount
                ,ContractNumEdit.Text
                ,CBContractType.ListSource.DataSet.FieldByName('ID').Value
                ,CBPledgeType.ListSource.DataSet.FieldByName('ID').Value
                ,ReliabilityViewer.ListSource.DataSet.FieldByName('ID').Value
                ,CBClientType.ListSource.DataSet.FieldByName('ID').Value       //AddContract Params
                ,PledgePrice
                ,CheckingAccounts(GrandAccs)
                ,CheckingAccounts(ClientAccs)
                ,CheckingAccounts(ReserveAccs)
                ,CheckingAccounts(InterestAccs)
                ,CheckingAccounts(OverdueAccs)
                ,CheckingAccounts(OverdueInterestAccs)   //add contract accounts
                ,CheckingAccounts(OverdueReserveAccs)
                ,StopCalcDate
                ,MAmount
                ,MPercent
                ,OverdueReliabilityViewer.ListSource.DataSet.FieldByName('ID').Value
                ])

                else

    CallProcedure('UpdateingContract',[
                 MainDataModule.Contracts.FieldByName('ID').Value
                ,ContractType      //Type of Contract 1<=>Credit
                ,OpenDate
                ,CloseDate
                ,Amount
                ,ContractNumEdit.Text
                ,CBContractType.ListSource.DataSet.FieldByName('ID').Value
                ,CBPledgeType.ListSource.DataSet.FieldByName('ID').Value
                ,ReliabilityViewer.ListSource.DataSet.FieldByName('ID').Value
                ,CBClientType.ListSource.DataSet.FieldByName('ID').Value       //AddContract Params
                ,PledgePrice
                ,CheckingAccounts(GrandAccs)
                ,CheckingAccounts(ClientAccs)
                ,CheckingAccounts(ReserveAccs)
                ,CheckingAccounts(InterestAccs)
                ,CheckingAccounts(OverdueAccs)
                ,CheckingAccounts(OverdueInterestAccs)   //add contract accounts
                ,CheckingAccounts(OverdueReserveAccs)
                ,StopCalcDate           // other 7  params inserting auto
                ,MAmount
                ,MPercent
                ,OverdueReliabilityViewer.ListSource.DataSet.FieldByName('ID').Value
                ])

  finally
   if SBCMPercentAssigned(pmNormal) and SBCMPercentAssigned(pmOverdue) then
     FreePercents;
  end;
end;
function  TFrmContract.CheckDateSequnce;
var
   Succesfuly :Boolean;
   Index  :Integer;
begin
   Succesfuly :=True;
   Index :=0;
   while Succesfuly and (Index<=High(FloatableDate[Mode])-1) do
   begin
     Succesfuly := FloatDate[Mode][Index]<FloatDate[Mode][Index+1];
     Index :=Index + 1;
   end;
   Result :=Succesfuly;
end;
procedure  TFrmContract.IncludePercents;
var
  Index :Integer;
  PercentCount :Integer;
  PercentMode :TPercentMode;
begin
      {initializing  Percents}
   PercentMode :=pmNormal;
   PercentCount :=MainDataModule.Interests.RecordCount;
   if  PercentCount>1  then
   with  MainDataModule.Interests do
   begin
     SetLength(FloatableDate[PercentMode],PercentCount);
     SetLength(FloatablePercent[PercentMode],PercentCount);
     CBConstant.Checked :=False;
     First;
     Index :=0;
     while not EOF do
     begin
       FloatableDate[PercentMode][Index] :=Trunc(FieldByName('HDate').AsDateTime);
       FloatablePercent[PercentMode][Index] :=FieldByName('Interest').AsFloat;
       Inc(Index);
       Next;
     end;
   end  else
   begin
     CBConstant.Checked :=True;
     PercentEdit.Text :=MainDataModule.Interests.FieldByName('Interest').AsString
   end;

      {initializing  Overdue Percents}
   PercentMode :=pmOverdue;
   PercentCount :=MainDataModule.OverdueInterests.RecordCount;
   if  PercentCount>1  then
   with  MainDataModule.OverdueInterests do
   begin
     SetLength(FloatableDate[PercentMode],PercentCount);
     SetLength(FloatablePercent[PercentMode],PercentCount);
     CBOverdueConstant.Checked :=False;
     First;
     Index :=0;
     while not EOF do
     begin
       FloatableDate[PercentMode][Index] :=Trunc(FieldByName('HDate').AsDateTime);
       FloatablePercent[PercentMode][Index] :=FieldByName('OverdueInterest').AsFloat;
       Inc(Index);
       Next;
     end;
   end  else
   begin
     CBOverdueConstant.Checked :=True;
     OverduePercentEdit.Text :=MainDataModule.OverdueInterests.FieldByName('OverdueInterest').AsString
   end;
end;
procedure  TFrmContract.FreePercents;
begin
  with DataModContract.ContractPack do
    CallProcedure('Free',[])
end;
procedure  TFrmContract.InitPercents;
var
   CurrentDate :TDateTime;
   I :Integer;
begin
  if  CheckDateSequnce(FloatableDate,pmNormal) and CheckDateSequnce(FloatableDate,pmOverdue) then
  with DataModContract.ContractPack do
  begin  //1
   if  CBConstant.Checked then
   begin  //2
     CallProcedure('Init',[0,1]);
     CurrentDate :=Trunc(DTPOpenDate.DateTime);
     CallProcedure('AddValue',[0,CurrentDate,StrToFloat(PercentEdit.Text)])
   end //2
   else
   if  Assigned(FloatableDate[pmNormal]) then
   begin  //3
     CallProcedure('Init',[0,High(FloatablePercent[pmNormal])+1]);
     for  I :=0  to  High(FloatablePercent[pmNormal])  do
     begin //4
       CurrentDate :=FloatableDate[pmNormal][I];
       CallProcedure('AddValue',[0,CurrentDate,FloatablePercent[pmNormal][I]])
     end;//4
   end //3
   else
     EInvalidPercents.Create('Invalid Percents!');

     {Initalizing Overdue Percents}

   if  CBOverdueConstant.Checked then
   begin
     CallProcedure('Init',[1,1]);
     CurrentDate :=Trunc(DTPOpenDate.DateTime);
     CallProcedure('AddValue',[1,CurrentDate,StrToFloat(OverduePercentEdit.Text)])
   end
   else
   if  Assigned(FloatableDate[pmOverdue]) then
   begin
     CallProcedure('Init',[1,High(FloatablePercent[pmOverdue])+1]);
     for  I :=0  to  High(FloatablePercent[pmOverdue])  do
     begin
       CurrentDate :=FloatableDate[pmOverdue][I];
       CallProcedure('AddValue',[1,CurrentDate,FloatablePercent[pmOverdue][I]])
     end;
   end
   else
   raise  EInvalidPercents.Create('Invalid Percents!!');

  end
  else
   raise EInvalidPercents.Create('Invalid Percents!!!');
end;
procedure  TFrmContract.LoadingAccounts;
var
  CurrentCurrency :LongInt;
begin
  with  DataModContract  do
  begin
    CurrentCurrency :=MainDataModule.Contracts.FieldByName('ContractCurrencyID').AsInteger;
    CurrencyDataSet.Locate('CurrencyID',CurrentCurrency,[]);
    CurrencyEdit.Text :=CurrencyDataSet.FieldByName('CurrencyID').AsString;
    ResetContrls;
    LoadAccount(GrandAccs,Params[0]);
    LoadAccount(ClientAccs,Params[1]);
    LoadAccount(ReserveAccs,Params[2]);
    LoadAccount(InterestAccs,Params[3]);
    LoadAccount(OverdueAccs,Params[4]);
    LoadAccount(OverdueInterestAccs,Params[5]);
    LoadAccount(OverdueReserveAccs,Params[6]);

  end;
end;
procedure  TFrmContract.LoadAccount;
begin
   if     SEdit.DataSource.DataSet.Active
          and (SEdit.DataSource.DataSet.RecordCount>0)
          and SEdit.DataSource.DataSet.Locate('ID',AccountID,[]) then
     begin
         //SEdit.Color :=clWhite;
         SEdit.Text :=SEdit.DataSource.DataSet.FieldByName('AccNo').AsString;
         if  Assigned(SEdit.PartnerShip) and (SEdit.PartnerShip.ItemIndex =-1) then
          SEdit.PartnerShip.ItemIndex :=0;
       end
     else
       begin
         SEdit.Text :='';
         SEdit.Partnership.ItemIndex :=-1;
       end;
end;
procedure  TFrmContract.Push(var FloatDate :TFloatableDate;Value :Int64;Mode :TPercentMode);
var
  DataCount :Integer;
begin
   DataCount :=High(FloatDate[Mode]) + 2;
   SetLength(FloatDate[Mode],DataCount);
   FloatDate[Mode][DataCount-1] :=Value;

end;

procedure   TFrmContract.LoadContractProperties;
begin
 with  MainDataModule.Contracts do
 begin
  FAccountsID[0] :=FieldByName('ContractAccID').AsInteger;
  FAccountsID[1] :=FieldByName('ClientAccID').AsInteger;
  FAccountsID[2] :=FieldByName('ReserveAccID').AsInteger;
  FAccountsID[3] :=FieldByName('InterestAccID').AsInteger;
  FAccountsID[4] :=FieldByName('OverdueAccID').AsInteger;
  FAccountsID[5] :=FieldByName('OverdueInterestAccID').AsInteger;
  FAccountsID[6] :=FieldByName('OverdueReserveAccID').AsInteger;
 end;
  LoadingAccounts(FAccountsID);
  IncludePercents;
  with  MainDataModule  do
  begin
    with  Contracts  do
    begin
      ContractNumEdit.Text :=FieldByName('ContractNo').AsString;
      AmountEdit.Text :=FieldByName('Amount').AsString;
      PledgePriceEdit.Text :=FieldByName('PledgePrice').AsString;
      DTPOpenDate.DateTime :=FieldByName('OpenDate').AsDateTime;
      DTPCloseDate.DateTime :=FieldByName('CloseDate').AsDateTime;
      DTPStopCalcDate.DateTime :=FieldByName('StopCalculationDate').AsDateTime;
    end;
      {Loading Reliability}

   if DataModContract.ReliabilityDataSet.Locate('ID',Reliability.FieldByName('ID').Value,[]) then
   begin
     ReliabilityViewer.ItemIndex :=ReliabilityViewer.Items.IndexOf(Reliability.FieldByName('Reliability').AsString);
     ReliabilityPercentEdit.Text :=Reliability.FieldByName('Percent').AsString+'%';
   end;

   if DataModContract.OverdueReliabilityData.Locate('ID',OverdueReliability.FieldByName('ID').Value,[]) then
   begin
     OverdueReliabilityViewer.ItemIndex :=OverdueReliabilityViewer.Items.IndexOf(OverdueReliability.FieldByName('Reliability').AsString);
     Edit1.Text :=OverdueReliability.FieldByName('Percent').AsString+'%';
   end;

   with CBPledgeType  do
   if  DataModContract.PledgeTypesDataSet.Locate('ID',Pledges.FieldByName('ID').Value,[])  then
     ItemIndex :=Items.IndexOf(Pledges.FieldByName('Type').AsString);

   with CBClientType  do
   if  DataModContract.ClientCategoriesDataSet.Locate('ID',Categories.FieldByName('ID').Value,[]) then
     ItemIndex :=Items.IndexOf(Categories.FieldByName('Category').AsString);

   with CBContractType  do
   if  DataModContract.CreditTypeDataSet.Locate('ID',ContractType.FieldByName('ID').Value,[])  then
     ItemIndex :=Items.IndexOf(ContractType.FieldByName('Type').AsString);

   with Contracts do
   if (FieldByName('ReguiredAmountDEC').AsFloat>0)
      or (FieldByName('ReguiredPercentDEC').AsFloat>0)  then
    begin
      CBMountlyRent.Checked :=True;
      MounthlyAmount.Text :=FieldByName('ReguiredAmountDEC').AsString;
      MounthlyPercent.Text :=FieldByName('ReguiredPercentDEC').AsString;
    end;
  end;
end;

function    TFrmContract.SBCMPercentAssigned(PercentMode :TPercentMode) :Boolean;
function    ModeToInt(pMode :TPercentMode):Integer;
begin
  if  pMode = pmNormal  then
   Result :=0
  else
   Result :=1; 
end;

begin
  with DataModContract.ContractPack do
    Result :=CallBooleanFunction('CheckAssigned',[ModeToInt(PercentMode)]);
end;
procedure   TFrmContract.ResetControl(Control :TSearchEdit);
begin
  Control.Text :='';
  Control.Partnership.RefreshList;
  Control.Partnership.ItemIndex :=-1;
end;
procedure   TFrmContract.ResetContrls;
begin
   IsControlReseting := True;
   ResetControl(GrandAccs);
   ResetControl(ClientAccs);
   ResetControl(ReserveAccs);
   ResetControl(InterestAccs);
   ResetControl(OverdueAccs);
   ResetControl(OverdueInterestAccs);
   ResetControl(OverdueReserveAccs);
   IsControlReseting := False;
end;
procedure   TFrmContract.Reset;
var
  IDX :Integer;
begin
  ResetContrls;
  CurrencyEdit.Text :=DataModContract.CurrencyDataSet.FieldByName('CurrencyID').AsString;

  for  IDX :=0 to  5  do
   FAccountsID[IDX] :=-1;

 DTPOpenDate.DateTime :=GetBankDate;
 DTPCloseDate.DateTime :=GetBankDate;
 DTPStopCalcDate.DateTime :=GetBankDate;
end;
procedure   TFrmContract.Pop(var FloatPercent :TFloatablePercent;Index :Integer;Mode :TPercentMode);
var
   Idx :Integer;
   Count :Integer;
begin
   Count :=High(FloatPercent[Mode]);
   for   Idx :=Index  to  Count - 1  do
    FloatPercent[Mode][Idx] :=FloatPercent[Mode][Idx+1];
   SetLength(FloatPercent[Mode],Count);
end;
procedure   TFrmContract.Pop(var FloatDate :TFloatableDate;Index :Integer;Mode :TPercentMode);
var
   Idx :Integer;
   Count :Integer;
begin
   Count :=High(FloatDate[Mode]);
   for   Idx :=Index  to  Count - 1 do
    FloatDate[Mode][Idx] :=FloatDate[Mode][Idx+1];
    SetLength(FloatDate[Mode],Count);
end;
procedure TFrmContract.Push(var FloatPercent :TFloatablePercent;Value :Real;Mode :TPercentMode);
var
  DataCount :Integer;
begin
   DataCount :=High(FloatPercent[Mode]) + 2;
   SetLength(FloatPercent[Mode],DataCount);
   FloatPercent[Mode][DataCount-1] :=Value;
end;
procedure TFrmContract.CBMountlyRentClick(Sender: TObject);
begin
   MounthlyAmount.Enabled  :=CBMountlyRent.Checked;
   MounthlyPercent.Enabled :=CBMountlyRent.Checked;
end;

procedure TFrmContract.CBConstantClick(Sender: TObject);
begin
  SBBrowse.Enabled :=not CBConstant.Checked;
  PercentEdit.Enabled :=CBConstant.Checked;
  if PercentEdit.Enabled then
    PercentEdit.Color :=clWhite
  else
   PercentEdit.Color :=clInactiveCaption;
end;

procedure TFrmContract.SBBrowseClick(Sender: TObject);
begin
{   with FrmPercents do
   begin
     FParentButtonTag :=(Sender as TSpeedButton).Tag;
     ShowModal;
   end;}
  // if  raised  ESubMarineError(U704) then comment this and delete UntPercents from USES list!
end;

procedure TFrmContract.CBOverdueConstantClick(Sender: TObject);
begin
    SBOverdueBrowse.Enabled :=not CBOverdueConstant.Checked;
    OverduePercentEdit.Enabled :=CBOverdueConstant.Checked;
    if OverduePercentEdit.Enabled then
      OverduePercentEdit.Color :=clWhite
    else
     OverduePercentEdit.Color :=clInactiveCaption;
end;

procedure TFrmContract.FormDestroy(Sender: TObject);
begin
    if  Assigned(FloatableDate[pmNormal])  then
      Finalize(FloatableDate[pmNormal]);
    if  Assigned(FloatableDate[pmOverdue])  then
      Finalize(FloatableDate[pmOverdue]);
    if  Assigned(FloatablePercent[pmNormal])  then
      Finalize(FloatablePercent[pmNormal]);
    if  Assigned(FloatablePercent[pmOverdue])  then
      Finalize(FloatablePercent[pmOverdue]);
end;
procedure TFrmContract.FormShow(Sender: TObject);
begin
 with DataModContract  do
 begin
   CurrencyDataSet.Open;
   GrandAcc.Open;

   if   SBCMGetOption('cmrCurrencyFilter') = 'OFF'  then
   with ClientAcc do
   begin
      SQL[9] :='';
      DeleteVariables;
      Master :=nil;
      MasterFields :='';
      DetailFields :='';
   end;

   IsControlReseting := False;
   ClientAcc.Open;
   ReserveAcc.Open;
   InterestAcc.Open;
   OverdueAcc.Open;
   OverdueInterestAcc.Open;
   ReliabilityDataSet.Open;
   ClientCategoriesDataSet.Open;
   PledgeTypesDataSet.Open;
   CreditTypeDataSet.Open;
   OverdueReserveAcc.Open;
   OverdueReliabilityData.Open;
 end;
  Reset;
  
  if  FOpMode=omEdit then
    LoadContractProperties
end;

procedure TFrmContract.BtnApplyClick(Sender: TObject);
begin
  Screen.Cursor :=crSQLWait;
 try
  ContractConclusion(FOpMode,FContractType);
  ModalResult :=mrOk;
 finally
   Screen.Cursor :=crDefault;
 end;
end;

procedure TFrmContract.AmountEditKeyPress(Sender: TObject; var Key: Char);
begin
   if  not (Key in  ['0'..'9',#8,Chr(VK_DELETE),'.']) then
      Key :=#0
end;

procedure TFrmContract.GrandNamesChange(Sender: TObject);
begin
 GrandAccs.Text :=(Sender as  TDBViewComboBox).ListSource.DataSet.FieldByName('AccNo').AsString;
end;

procedure TFrmContract.ClientNamesChange(Sender: TObject);
begin
  ClientAccs.Text :=(Sender as  TDBViewComboBox).ListSource.DataSet.FieldByName('AccNo').AsString;
end;

procedure TFrmContract.ReliabilityNamesChange(Sender: TObject);
begin
  ReserveAccs.Text :=(Sender as  TDBViewComboBox).ListSource.DataSet.FieldByName('AccNo').AsString;
end;

procedure TFrmContract.InterestNamesChange(Sender: TObject);
begin
  InterestAccs.Text :=(Sender as  TDBViewComboBox).ListSource.DataSet.FieldByName('AccNo').AsString;
end;

procedure TFrmContract.OverdueNamesChange(Sender: TObject);
begin
  OverdueAccs.Text :=(Sender as  TDBViewComboBox).ListSource.DataSet.FieldByName('AccNo').AsString;
end;

procedure TFrmContract.OverdueInterestNamesChange(Sender: TObject);
begin
   OverdueInterestAccs.Text :=(Sender as  TDBViewComboBox).ListSource.DataSet.FieldByName('AccNo').AsString;
end;

procedure TFrmContract.ReliabilityViewerChange(Sender: TObject);
begin
  ReliabilityPercentEdit.Text :=ReliabilityViewer.ListSource.DataSet.FieldByName('Percent').AsString + '%';
end;

procedure TFrmContract.CurrencyEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if  Key = VK_RETURN  then
  with DataModContract.CurrencyDataSet do
  begin
   if not Locate('CurrencyID',(Sender as TEdit).Text,[])  then
     (Sender as TEdit).Text :=FieldByName('CurrencyID').AsString;
  end;
end;

procedure TFrmContract.CurrencyViewerChange(Sender: TObject);
begin
  with  DataModContract.CurrencyDataSet  do
  begin
   CurrencyEdit.Text :=FieldByName('CurrencyID').AsString;
   ResetContrls;
  end;
end;

{procedure  Init;
 begin
   FrmContract :=TFrmContract.Create(nil);
 end;
procedure  CleanUp;
 begin
   FrmContract.Free;
 end;}

procedure TFrmContract.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with  DataModContract  do
  begin
    CurrencyDataSet.CloseAll;
    GrandAcc.CloseAll;
    ClientAcc.CloseAll;
    ReserveAcc.CloseAll;
    InterestAcc.CloseAll;
    OverdueAcc.CloseAll;
    OverdueInterestAcc.CloseAll;
    PledgeTypesDataSet.CloseAll;
    OverdueReserveAcc.CloseAll;
    ReliabilityDataSet.CloseAll;
    ClientCategoriesDataSet.CloseAll;
    CreditTypeDataSet.CloseAll;
    CurrencyDataSet.CloseAll;
    OverdueReliabilityData.CloseAll;
  end;
end;

{initialization
  Init;
finalization
  CleanUp;}
procedure TFrmContract.FormCreate(Sender: TObject);
begin
  DataModContract :=TDataModContract.Create(Self);
//!!  FrmPercents :=TFrmPercents.Create(Self);
end;

procedure TFrmContract.AmountEditExit(Sender: TObject);
begin
//  (Sender as TEdit).Text :=FormatFloat('#,##.00',StrToFloat((Sender as TEdit).Text));
end;

procedure TFrmContract.GrandAccsChange(Sender: TObject);
begin
  if not IsControlReseting then
  if SBCMGetOption('cmrAutoSearchAccount') =  'ON' then
  if FOpMode = omInsert then
   FindOtherAccounts(Sender);
end;

procedure TFrmContract.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27  then
   BtnClose.Click
end;

procedure TFrmContract.OverdueReliabilityViewerChange(Sender: TObject);
begin
  Edit1.Text := (Sender as TDBViewComboBox).ListSource.DataSet.FieldByName('Percent').AsString + '%';
end;

procedure TFrmContract.OverdueReserveNamesChange(Sender: TObject);
begin
   OverdueReserveAccs.Text := (Sender as  TDBViewComboBox).ListSource.DataSet.FieldByName('AccNo').AsString;
end;

end.


unit OBSMainUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NLSLocalizer, ExtCtrls, StdCtrls, Mask, DBCtrls, DBCtrlsEh, DBLookupEh,
  Buttons, ComCtrls;

type
  TOBSMainForm = class(TForm)
    NLSLocalizer: TNLSLocalizer;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    DBEditEh1: TDBEditEh;
    GroupBox5: TGroupBox;
    DBEditEh3: TDBEditEh;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    AccountListIncomeIntInout: TDBLookupComboboxEh;
    Panel4: TPanel;
    IntInfLbl: TLabel;
    Panel5: TPanel;
    GroupBox4: TGroupBox;
    GroupBox6: TGroupBox;
    CusiIntacc: TDBLookupComboboxEh;
    IntincomeAcc: TDBLookupComboboxEh;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    AccountListCB: TDBLookupComboboxEh;
    ValLabel: TLabel;
    TrDateTime: TDateTimePicker;
    Label1: TLabel;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OBSMainForm: TOBSMainForm;

implementation

  Uses CommonDecls,OBSDatModImpl,SystemState;

{$R *.DFM}

procedure InitPlugin(S:string);Export;

resourcestring rsMainCaption = '%s № ли кредитин инфармасийасы';

var Crd_id ,
    Cust_id ,
    Curr_id ,
    Br_id ,
    Cat_id : Integer;
    Crd_num ,
    Val_name : string;
    IntStopDate :TDateTime;
begin

   Crd_id := Get_SelectedCrdID;
   Crd_num := Get_SelectedCrdNo;

   with OBSDatMod do
   begin
      with  OutInterestsAccounts do
      begin
        Open;
        OBSMainForm.AccountListCB.KeyValue := FieldByName('ID').AsInteger;
      end;

      with OutIntIncomeAccounts do
      begin
        Open;
        OBSMainForm.AccountListIncomeIntInout.KeyValue := FieldByName('ID').AsInteger;
      end;

      with OutInterestsAccounts do
      begin
         if Active then Close;
         SetVariable('CrdID',Crd_id);
         Open;
         OBSMainForm.AccountListCB.KeyValue := FieldByName('ID').AsInteger;
         
      end;
      with InterestInfo do
      begin
         if Active then Close;
         SetVariable('Crdid',Crd_id);;
         Open;
         IntStopDate := FieldByName('StopCalcDate').AsDateTime;
      end;

      with CreditInfo do         
      begin
         if Active then Close;
         SetVariable('B_ID',Crd_id);
         Open;
         Cust_id := FieldByName('Boorowerid').AsInteger;
         Curr_id := FieldByName('currency').AsInteger;
         Br_id := FieldByName('branchid').AsInteger;
         Cat_id := FieldByName('customertype').AsInteger;
      end;

      with Customers do
      begin
         if Active then Close;
         SetVariable('CliID',Cust_id);
         Open;
      end;

      with Avalute do
      begin
        if Active then Close;
        SetVariable('val_id',Curr_id);
        Open;
        Val_name := FieldByName('val_name').AsString;
      end;

      with Interestrests do
      begin
         if Active then Close;
         SetVariable('Ac_ID',Crd_id);
         Open;
      end;

      with InterestsAccounts do
      begin
         if Active then Close;
         SetVariable('CurrID',Curr_id);
         SetVariable('BrID',br_id);
         SetVariable('CatID',Cat_id);
         Open;
         OBSMainForm.IntincomeAcc.KeyValue := FieldByName('ID').AsInteger;
      end;

      with CustIntAccounts do
      begin
         if Active then Close;
         SetVariable('CrdID',Crd_id);
         Open;
         OBSMainForm.CusiIntacc.KeyValue :=  FieldByName('ID').AsInteger;
      end;
   end;

   with OBSMainForm do
   begin
     if (integer(trunc(IntStopDate)) <> 0) then
     begin
       ValLabel.Caption := Val_name;
       NLSLocalizer.Caption := Crd_num+' -нюмряли кредит цчцн фаизлярин Б.К-да отуздурмаг ';
       IntInfLbl.Caption := 'Фаизлярин щесабланмасы  '+
       DateToStr(IntStopDate)+
       ' -Тарихиндян дайандырылыб';
       ShowModal;
     end
   end;
end;

 exports
  InitPlugin;

procedure TOBSMainForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False;
end;

procedure TOBSMainForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if ord(Key) = VK_ESCAPE then Close;
end;

procedure TOBSMainForm.FormDestroy(Sender: TObject);
begin
   with OBSDatMod do
   begin
      OutInterestsAccounts.CloseAll;
      OutIntIncomeAccounts.CloseAll;
      CreditInfo.CloseAll;
      Customers.CloseAll;
      Interestrests.CloseAll;
   end;
   OBSDatMod.Free;
end;

procedure TOBSMainForm.FormCreate(Sender: TObject);
begin
  OBSDatMod :=TOBSDatMod.Create(Self);
  TrDateTime.DateTime := Get_CurrentDate;
  {with OBSDatMod do
  begin
    AccountListCB.KeyValue := OutInterestsAccounts.FieldByName('ACC_NO').AsString;
  end;}
end;

procedure TOBSMainForm.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TOBSMainForm.BitBtn2Click(Sender: TObject);
resourcestring
  rsTransactionsWillProcessed = 'Фаизлярин Б.К-да отуздурмаг ...';
var
  CrdID : Integer;
  TDate : TDateTime;
  CustAccID : Integer;
  CommitTr : Boolean;
begin
  CrdID := Get_SelectedCrdID;
  TDate := Integer(Trunc(TrDateTime.DateTime));
  CustAccID := AccountListCB.ListSource.DataSet.FieldByName('ID').AsInteger;

  with OBSDatMod do
  CM_INT_PLACEOUTBALANCE.CallProcedure('Int_PlaceOutBalance',[
     'p_CreditID' ,CrdID ,
     'P_Cust_IntOutAccID' ,CustAccID,
     'p_Date' ,TDate ]);

  try

    CommitTr := TrDelayed_Show(Self,rsTransactionsWillProcessed);

    Update;

    with OBSDatMod do
    CM_INT_PLACEOUTBALANCE.CallProcedure('CommitTr',[
       'DefCommit' , CommitTr
    ]);

  except

    with OBSDatMod do
    CM_INT_PLACEOUTBALANCE.CallProcedure('CommitTr',[
       'DefCommit' , False
    ]);

    raise;

  end;

end;

Initialization

    OBSMainForm := TOBSMainForm.Create(CommonApplication);

end.

 unit UntDelWares;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ExtCtrls,DB;

type
  TFrmDelWares = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StaticText1: TStaticText;
    Panel3: TPanel;
    Panel4: TPanel;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    EOut_num: TEdit;
    DTPOUT: TDateTimePicker;
    ECause_out: TEdit;
    StaticText4: TStaticText;
    EOffDate: TEdit;
    CheckBox1: TCheckBox;
    Button3: TButton;
    Button4: TButton;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DTPOUTChange(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDelWares: TFrmDelWares;

implementation

uses MFDataModule,SBTransaction, UntMainFacilitiesImpl;

{$R *.DFM}


procedure TFrmDelWares.FormActivate(Sender: TObject);
begin
 with MainFacilities do
  begin
    DTPOUT.DateTime:=GetPresentDate;
    EOffDate.Text :=FormatDateTime('dd-mmm-yyyy',GetPresentDate);
  end;
end;

procedure TFrmDelWares.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key = VK_ESCAPE) then Close; 
end;

procedure TFrmDelWares.DTPOUTChange(Sender: TObject);
begin
 EOffDate.Text :=FormatDateTime('dd-mmm-yyyy',(Sender as TDateTimePicker).Date);
end;

procedure TFrmDelWares.Button3Click(Sender: TObject);
begin
 Close;
end;

procedure TFrmDelWares.Button4Click(Sender: TObject);
var
 TempID               :integer;
// ReturnID             :integer;
 OUTDate              :TDateTime;
 Transaction          :TTransaction;
begin
if MessageDlg('Are you sure to delete this wares?',mtConfirmation,mbYesNoCancel,0)=mrYes then
 begin//Main
  OUTDate:=Trunc(DTPOUT.DateTime);
    with MainFDataModule do
     begin
      // Поиск ТОВАРА
     // ODSMODERN.Close;
     // ODSMODERN.SetVariable('WID',ViewWares.FieldByName('ID').AsInteger);
    //  ODSMODERN.Open;
    //  ODSREPAIR.Close;
    //  ODSREPAIR.SetVariable('WID',ViewWares.FieldByName('ID').AsInteger);
    //  ODSREPAIR.Open;
     // ReturnID:=ViewWares.FieldByName('ID').AsInteger;
    //  ViewWares.Refresh;
     // ViewWares.Locate('ID',ReturnID,[loPartialKey]); //Na x.. ya eto pisal ne pomnyu
      //Конец
      OPViewWares.CallProcedure('add_archive_wares1',[
      ViewWares.FieldByName('ID').AsInteger,
      ViewWares.FieldByName('GROUPSID').AsInteger,
      ViewWares.FieldByName('Name').AsString,
      ViewWares.FieldByName('Inventar').Asstring,
      ViewWares.FieldByName('Inventar_date').AsDateTime,
      ViewWares.FieldByName('First_price').AsInteger,
      ViewWares.FieldByName('Balance_price').AsInteger,
      ViewWares.FieldByName('In_date').AsDateTime,
      OUTDate,
      ViewWares.FieldByName('In_num').AsInteger,
      StrToInt(EOut_num.text),
      ViewWares.FieldByName('Amort').AsInteger,
      ViewWares.FieldByName('AllAmort').AsInteger,
      ViewWares.FieldByName('Producer_plane').AsString,
      ViewWares.FieldByName('FXM').AsInteger,
      ViewWares.FieldByName('Sector_cod').AsInteger,
      ECause_out.text,
      ViewWares.FieldByName('Modern_date').AsDateTime,
      ViewWares.FieldByName('Modern_summa').AsInteger,
      ViewWares.FieldByName('Modern_num').AsInteger,
      ViewWares.FieldByName('Repair_date').AsDateTime,
      ViewWares.FieldByName('Repair_summa').AsInteger,
      ViewWares.FieldByName('Repair_num').AsInteger,
      ViewWares.FieldByName('Amort_date').AsDateTime]
      );
    //Приступаем к проводкам
      if OPViewWares.CallBooleanFunction('CheckForTakeOff',[ViewWares.FieldByName('ID').AsInteger]) then
      //Проверка на наличие полной амортизации
       begin
        //TempID:=OPTranzaction.CallIntegerFunction('gen_temp_ID',[]);
         With Transaction do
          begin
            Size := 0;
            TransactionDate := OUTDate;
            hDebit := ViewGroup.FieldByName('amort_account').value;
            hCredit := ViewGroup.FieldByName('main_account').value;
            DebitAmount := ViewWares.FieldByName('first_price').value;
            CreditAmount := ViewWares.FieldByName('first_price').value;
            LAmount := ViewWares.FieldByName('first_price').value;
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
            TrName := 'Ясас вясаитин щесабдан силинмяси';
            IsRoot :=true;
            ArchiveID := 0;
          end;
        TempID:= SB_AddTransaction(Transaction, []);
        OPViewWares.CallProcedure('SetTransactions',[TempID,ViewGroup.FieldByName('ID').value]);
       end
      else
       begin
        //TempID:=OPTranzaction.CallIntegerFunction('gen_temp_ID',[]);
         With Transaction do
          begin
            Size := 0;
            TransactionDate := OUTDate;
            hDebit := ViewGroup.FieldByName('amort_account').value;
            hCredit := ViewGroup.FieldByName('main_account').value;
            DebitAmount := ViewWares.FieldByName('first_price').value;
            CreditAmount := ViewWares.FieldByName('first_price').value;
            LAmount:= ViewWares.FieldByName('first_price').value;
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
            TrName := 'Там амортизасийа олунмамыш ясас вясаитин щесабдан силинмяси';
            IsRoot :=true;
            ArchiveID := 0;
          end;
        TempID:= SB_AddTransaction(Transaction, []);
        OPViewWares.CallProcedure('SetTransactions',[TempID,ViewGroup.FieldByName('ID').value]);

        //TempID:=OPTranzaction.CallIntegerFunction('gen_temp_ID',[]);
        With Transaction do
          begin
            Size := 0;
            TransactionDate := OUTDate;
            hDebit := ViewGroup.FieldByName('sale_account').value;
            hCredit := ViewGroup.FieldByName('amort_account').value;
            DebitAmount := ViewWares.FieldByName('balance_price').value;
            CreditAmount := ViewWares.FieldByName('balance_price').value;
            LAmount := ViewWares.FieldByName('balance_price').value;
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
            TrName:= 'Ясас вясаитин щесабдан силинмясиндян йаранан зяряр';
            IsRoot :=true;
            ArchiveID := 0;
          end;
        TempID:= SB_AddTransaction(Transaction, []);
        OPViewWares.CallProcedure('SetTransactions',[TempID,ViewGroup.FieldByName('ID').value]);
       end;
       //Отступаем от проводок
       OPViewWares.CallProcedure('delete_wares',[ViewWares.FieldByName('ID').AsInteger]);
       ViewWares.Refresh;
     end;
 end;//Main
 Close;
end;

end.

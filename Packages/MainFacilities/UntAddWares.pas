unit UntAddWares;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ComCtrls,Db, ActnList, CurrencyEdit;

type

  EInvalidDepartment = Class(Exception);
type
  TFrmAddWares = class(TForm)
    Panel1: TPanel;
    Label12: TLabel;
    TitlePanel: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    ENAME: TEdit;
    Panel5: TPanel;
    CBDepartments: TComboBox;
    Panel6: TPanel;
    EFXM: TEdit;
    Panel7: TPanel;
    EInventar: TEdit;
    Panel8: TPanel;
    DTPINVENTAR_DATE: TDateTimePicker;
    Panel9: TPanel;
    EFIRST_PRICE: TEdit;
    Panel10: TPanel;
    EBALANCE_PRICE: TEdit;
    Panel11: TPanel;
    EAccrualAmort: TEdit;
    Panel12: TPanel;
    Panel13: TPanel;
    EAMORTNB: TEdit;
    EPRODUCER_PLANE: TEdit;
    Panel14: TPanel;
    EAMORTTAX: TEdit;
    Panel15: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    DTPIN_DATE: TDateTimePicker;
    EIN_NUM: TEdit;
    GroupBox3: TGroupBox;
    GroupBox2: TGroupBox;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    DTPREPAIR: TDateTimePicker;
    EREPAIR_SUMMA: TEdit;
    EREPAIR_NUM: TEdit;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    DTPMODERN: TDateTimePicker;
    EMODERN_SUMMA: TEdit;
    EMODERN_NUM: TEdit;
    SpeedButton2: TSpeedButton;
    EMODER5N_NUM: TEdit;
    Panel22: TPanel;
    EDepartment: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton5: TSpeedButton;
    ButtonCommit: TButton;
    ButtonCancel: TButton;
    MainActionList: TActionList;
    ActionCommit: TAction;
    ActionCancel: TAction;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    SpeedButton3: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure CBDepartmentsClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton3Click(Sender: TObject);
    procedure CBDepartmentsChange(Sender: TObject);
    procedure EFXMKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ActionCommitExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionCommitUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  INV_D,IN_D,MOD_D,REP_D   :TDateTime;
  DSector_cod              :Integer;
  OUT_D,OUT_NUM,M,R        :Variant;
  function GetDepartmentName(DepartmentID :integer) :string;
  procedure CleanUp(Sender: TObject);
  end;
var
  FrmAddWares: TFrmAddWares;
implementation

uses MFDataModule, UntMainFacilitiesImpl,SBTransaction;

{$R *.DFM}


function TFrmAddWares.GetDepartmentName(DepartmentID :integer) :string;
begin
 with MainFDataModule.OPViewWares do
  result :=CallStringFunction('GetDepartmentName',[DepartmentID]);
end;

procedure TFrmAddWares.CleanUp;
var
  CompCount :word;
begin
 with (Sender as TForm) do
 for CompCount :=0 to ComponentCount-1 do
  if(Components[CompCount] is TEdit) then
     (Components[CompCount] as TEdit).Text :=''
  else
   if(Components[CompCount] is TComboBox) then
     begin
      (Components[CompCount] as TComboBox).Text :='';
      (Components[CompCount] as TComboBox).Tag :=0;
     end;
end;

procedure TFrmAddWares.BitBtn1Click(Sender: TObject);
var
   GroupID,SearchID:Integer;
Begin
 TRY
 if MainFacilities.OpeartionMode = omAdd then
  begin
   INV_D:=Trunc(DTPINVENTAR_DATE.DateTime);
   IN_D:=Trunc(DTPIN_DATE.DateTime);
   GroupID:=MainFDataModule.ViewGroup.FieldByName('ID').AsInteger;
   with MainFDataModule do
    begin
          OPViewWares.CallProcedure('add_wares',[
             GroupID,
             ENAME.Text,
             EInventar.Text,
             INV_D,
             StrToFloat(EFirst_price.Text),
             StrToFloat(EBalance_price.Text),
             IN_D,
             StrToInt(EIn_num.Text),
             StrToInt(EAMORTNB.Text),
             EPRODUCER_PLANE.Text,
             StrToInt(EFXM.Text),
             ODSTakeDepartmentID.FieldByName('ID').AsInteger,
             0,0,
             StrToFloat(EAccrualAmort.Text),
             0,0,
             StrToInt(EAMORTTAX.Text)]);
            ODSWClose.Refresh;
       //*********
     ODSMODERN.Close;
     ODSMODERN.SetVariable('WID',ViewWares.FieldByName('ID').AsInteger);
     ODSMODERN.Open;

     ODSREPAIR.Close;
     ODSREPAIR.SetVariable('WID',ViewWares.FieldByName('ID').AsInteger);
     ODSREPAIR.Open;
       //*********
       ViewWares.Refresh;
    Close;
   end;
 end
else
 if MainFacilities.OpeartionMode =omEdit then
 Begin
   with MainFDataModule do
    Begin
     SearchID:=ViewWares.FieldByName('ID').AsInteger;
     OPViewWares.CallProcedure('upd_wares',[
             ViewWares.FieldByName('ID').AsInteger,
             EName.Text,
             EInventar.Text,
             DTPInventar_date.DateTime,
             StrToFloat(EFirst_price.Text),
             StrToFloat(EBalance_price.Text),
             DTPIn_date.DateTime,
             StrToInt(EIn_num.Text),
             StrToFloat(EAMORTNB.Text),
             EPRODUCER_PLANE.Text,
             StrToInt(EFXM.Text),
             MainFDataModule.ODSTakeDepartmentID.FieldByName('ID').AsInteger,
             StrToFloat(EAccrualAmort.Text),
             StrToFloat(EAMORTTAX.Text)]);
     ViewWares.Refresh;
     ViewWares.Locate('ID',SearchID,[loPartialKey]);
     ODSWClose.Refresh;
     Close;
    End;
 End;
 EXCEPT
 // ShowMessage('Не все поля заполнены!');
 // Abort;
 Raise;
 end;
 EMODERN_NUM.Text:='';
 EMODERN_SUMMA.Text:='';
 EREPAIR_NUM.TEXT:='';
 EREPAIR_SUMMA.tEXT:='';
End;

procedure TFrmAddWares.FormActivate(Sender: TObject);
BEGIN
 if MainFacilities.OpeartionMode = omAdd then
  begin
   CleanUp(self);
   EAMORTNB.Text:=MainFDataModule.ViewGroup.FieldByName('AMORT').AsString;
   EAMORTTAX.Text:=MainFDataModule.ViewGroup.FieldByName('TAXAMORT').AsString;
   DTPINVENTAR_DATE.DateTime:=MainFacilities.GetPresentDate;
   DTPMODERN.DateTime:=MainFacilities.GetPresentDate;
   DTPREPAIR.DateTime:=MainFacilities.GetPresentDate;
   DTPIN_DATE.DateTime:=MainFacilities.GetPresentDate;
   CurrencyEdit1.Text :='0';
   CurrencyEdit2.Text :='0';
  end
else
 if MainFacilities.OpeartionMode = omEdit then
 Begin
   INV_D:=Trunc(DTPInventar_date.DateTime);
   IN_D:=Trunc(DTPIn_date.DateTime);
  with MainFDataModule do
    begin //1
     //****MOdern
     ODSMODERN.Close;
     ODSMODERN.SetVariable('WID',ViewWares.FieldByName('ID').AsInteger);
     ODSMODERN.Open;
     if  not ODSMODERN.FieldByName('Modern_date').IsNull then
      begin
       DTPMODERN.DateTime:=ODSMODERN.FieldByName('Modern_date').AsDateTime;
       M:=ODSMODERN.FieldByName('Modern_date').AsDateTime;
       EMODERN_SUMMA.Text:=ODSMODERN.FieldByName('Modern_summa').AsString;
       EMODERN_NUM.text:=ODSMODERN.FieldByName('Modern_num').AsString;
      end
     else
       M:=Null;
     //****Repair
     ODSREPAIR.Close;
     ODSREPAIR.SetVariable('WID',ViewWares.FieldByName('ID').AsInteger);
     ODSREPAIR.Open;
     if  not ODSREPAIR.FieldByName('Repair_date').IsNull then
      begin
       DTPREPAIR.DateTime:=ODSREPAIR.FieldByName('Repair_date').AsDateTime;
       R:=ODSREPAIR.FieldByName('Repair_date').AsDateTime;
       EREPAIR_SUMMA.Text:=ODSRepair.FieldByName('Repair_summa').AsString;
       EREPAIR_NUM.text:=ODSRepair.FieldByName('Repair_num').AsString;
      end
     else
      R:=Null;
    end;//1
  with MainFDataModule.ODSTakeDepartmentID do
  begin
   Close;
   SetVariable('Dname',CBDepartments.text);
   Open;
  end;
  with MainFDataModule.ViewWares do
   begin
     CBDepartments.text :=GetDepartmentName(FieldByName('Sector_cod').AsInteger);
     ENAME.Text :=FieldByName('Name').AsString;
     EFXM.Text :=FieldByName('FXM').AsString;
     EINVENTAR.Text :=FieldByName('Inventar').AsString;
     DTPINVENTAR_DATE.DateTime :=StrToDate(FieldByName('Inventar_date').AsString);
     EAMORTNB.Text :=FieldByName('Amort').AsString;
     EAMORTTAX.Text :=FieldByName('Tax').AsString;
     EFIRST_PRICE.Text :=FieldByName('First_price').AsString;
     EBALANCE_PRICE.Text :=FieldByName('Balance_price').AsString;
     EIN_NUM.Text :=FieldByName('In_num').AsString;
     DTPIN_DATE.DateTime :=StrToDate(FieldByName('In_date').AsString);
     EPRODUCER_PLANE.Text :=FieldByName('Producer_plane').AsString;
     EAccrualAmort.Text :=FieldByName('AllAmort').AsString;
     CurrencyEdit1.Text :=FieldByName('TaxPercentPrice').AsString;
     CurrencyEdit2.Text :=FieldByName('AllTaxAmort').AsString;
   end;
 End;
END;

procedure TFrmAddWares.BitBtn2Click(Sender: TObject);
begin
 EMODERN_NUM.Text:='';
 EMODERN_SUMMA.Text:='';
 EREPAIR_NUM.TEXT:='';
 EREPAIR_SUMMA.tEXT:='';
 Close;
end;

procedure TFrmAddWares.CBDepartmentsClick(Sender: TObject);
begin
 with MainFDataModule.ODSTakeDepartmentID do
  begin
   Close;
    SetVariable('Dname',CBDepartments.text);
   Open;
  end;
end;

procedure TFrmAddWares.SpeedButton2Click(Sender: TObject);
var
   Transaction :    TTransaction;
   ReturnID            :integer;
begin
 MOD_D:=Trunc(DTPMODERN.DateTime);
 if MOD_D<=M then
 begin
  ShowMessage('В один день нельзя 2 модернизации!');
  Abort;
 end;
 OUT_D:=Null;
 OUT_NUM:=Null;
try
 With MainFDataModule do
 if (EMODERN_NUM.Text<>'')and(EMODERN_SUMMA.Text<>'') then
   begin
    OPViewWares.CallProcedure('delete_moderned_wares',[ViewWares.FieldByName('ID').AsInteger]);
    OPViewWares.CallProcedure('add_moderned_wares',[ViewWares.FieldByName('ID').AsInteger,ViewWares.FieldByName('GroupsID').AsInteger,StrToInt(EMODERN_NUM.Text),StrToInt(EMODERN_SUMMA.text),MOD_D]);
    ODSMODERN.Refresh;
    ReturnID:=ViewWares.FieldByName('ID').AsInteger;
    ViewWares.Refresh;
    ViewWares.Locate('ID',ReturnID,[loPartialKey]);
    //Приступаем к проводкам
     with  MainFDataModule do
      begin
       with Transaction do
       begin
        Size:= 0;
        TransactionDate:= Mod_D;
        hDebit:= ViewGroup.FieldByName('Main_account').Value;
        hCredit:= ViewGroup.FieldByName('Sale_account').Value;
        DebitAmount:=StrToInt(EMODERN_SUMMA.text);
        CreditAmount:= StrToInt(EMODERN_SUMMA.text);
        LAmount:= StrToInt(EMODERN_SUMMA.text);
        DebitRate:= 1;
        CreditRate:= 1;
        ParentID:= 0;
        DebitBankID:= 0;
        CreditBankID:= 0;
        FilialID:= 0;
        PackageNumber:= 0;
        InbalanceChar:= 0;
        OutBalanceChar:= 0;
        CypherCode:= 0;
        OperationCode:= 0;
        TransactionID:= -1;
        TrName:= 'Модернляшмя';
        IsRoot:=true;
        ArchiveID:= 0;
       end;
       SB_AddTransaction(Transaction, []);

      end;
    //Отступаем от проводок
    //АРХИВИЗАЦИЯ
   with MainFDataModule.OPViewWares,MainFDataModule.ViewWares do
    begin
     CallProcedure('add_archive_wares1',[
                        FieldByName('ID').AsInteger,
                        FieldByName('GROUPSID').AsInteger,
                        FieldByName('Name').AsString,
                        FieldByName('Inventar').AsString,
                        FieldByName('Inventar_date').AsDateTime,
                        FieldByName('First_price').AsInteger,
                        FieldByName('Balance_price').Value,
                        FieldByName('In_date').AsDateTime,
                        OUT_D,
                        FieldByName('In_num').AsInteger,
                        OUT_NUM,
                        FieldByName('Amort').AsInteger,
                        FieldByName('AllAmort').Value,
                        FieldByName('Producer_plane').AsString,
                        FieldByName('FXM').AsInteger,
                        FieldByName('Sector_cod').AsInteger,
                        '',
                        FieldByName('Modern_date').AsDateTime,
                        FieldByName('Modern_summa').AsInteger,
                        FieldByName('Modern_num').AsInteger,
                        FieldByName('Repair_date').AsDateTime,
                        FieldByName('Repair_summa').AsInteger,
                        FieldByName('Repair_num').AsInteger,
                        FieldByName('Amort_date').AsDateTime
                                        ]);
    //КОНЕЦ АРХИВИЗАЦИИ
    end;
   M:=Mod_D;
  end;
 except
   raise;
 end;
end;

procedure TFrmAddWares.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 EMODERN_NUM.Text:='';
 EMODERN_SUMMA.Text:='';
 EREPAIR_NUM.TEXT:='';
 EREPAIR_SUMMA.tEXT:='';
end;

procedure TFrmAddWares.SpeedButton3Click(Sender: TObject);
var
   SearchID:Integer;
Begin
 with MainFDataModule, OPViewWares do
  begin
     SearchID :=ViewWares.FieldByName('ID').AsInteger;
     CallProcedure('TempTaxUpdate',[searchid,CurrencyEdit1.value,CurrencyEdit2.value]);
     ViewWares.Refresh;
     ViewWares.Locate('ID',SearchID,[loPartialKey]);
  End;
End;

procedure TFrmAddWares.CBDepartmentsChange(Sender: TObject);
begin
 with MainFDataModule.ODSTakeDepartmentID do
 begin
  Close;
   SetVariable('Dname',CBDepartments.text);
  Open;
 end;
end;

procedure TFrmAddWares.EFXMKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',',','.',#8]) then
   Key :=#0
end;

procedure TFrmAddWares.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key =VK_ESCAPE) then Close;
end;

procedure TFrmAddWares.BitBtn3Click(Sender: TObject);
begin
 if EDepartment.text='' then
  begin
   ShowMessage('There is no department!');
   Abort;
  end;
 MainFDataModule.OPViewWares.CallProcedure('add_departments',[EDepartment.text]);
 MainFDataModule.ODSDepartments.Refresh;
 With MainFDataModule.ODSDepartments do
 begin
  Open;
  First;
  While not EOF do
   begin
    FrmAddWares.CBDepartments.Items.Add(FieldByName('Department').AsString);
    Next;
   end;
 end;
 EDepartment.Text:='';
end;

procedure TFrmAddWares.SpeedButton4Click(Sender: TObject);
begin
 EMODERN_NUM.Text:='';
 EMODERN_SUMMA.Text:='';
 EREPAIR_NUM.TEXT:='';
 EREPAIR_SUMMA.tEXT:='';
 Close;
end;

procedure TFrmAddWares.SpeedButton5Click(Sender: TObject);
begin
 if EDepartment.text='' then
   Raise
    EInvalidDepartment.Create('Invalid department!');

 MainFDataModule.OPViewWares.CallProcedure('add_departments',[EDepartment.text]);
 MainFDataModule.ODSDepartments.Refresh;
 CBDepartments.Items.Clear;
 With MainFDataModule.ODSDepartments do
 begin
  Open;
  First;
  While not EOF do
   begin
    CBDepartments.Items.Add(FieldByName('Department').AsString);
    Next;
   end;
 end;
 EDepartment.Text:='';
end;

procedure TFrmAddWares.SpeedButton1Click(Sender: TObject);
var
   Transaction        :TTransaction;
   ReturnID           :integer;
   //TempID             :integer;
begin
REP_D:=Trunc(DTPREPAIR.DateTime);
if REP_D<=R then
 begin
  ShowMessage('В один день нельзя 2 ремонта!');
  Abort;
 end;
 OUT_D:=Null;
 OUT_NUM:=Null;
 With MainFDataModule do
try
if (EREPAIR_NUM.Text<>'')and(EREPAIR_SUMMA.Text<>'') then
  begin
   OPViewWares.CallProcedure('delete_repaired_wares',[ViewWares.FieldByName('ID').AsInteger]);
   OPViewWares.CallProcedure('add_repaired_wares',[ViewWares.FieldByName('ID').AsInteger,ViewWares.FieldByName('GroupsID').AsInteger,StrToInt(EREPAIR_NUM.Text),StrToInt(EREPAIR_SUMMA.text),REP_D]);
   ODSREPAIR.Refresh;
   ReturnID:=ViewWares.FieldByName('ID').AsInteger;
   ViewWares.Refresh;
   ViewWares.Locate('ID',ReturnID,[loPartialKey]);
   //Приступаем к проводкам
     with  MainFDataModule do
      begin
        //TempID:=OPTranzaction.CallIntegerFunction('Gen_Temp_ID',[]);
      with Transaction do
       begin
        Size:= 0;
        TransactionDate:= Mod_D;
        hDebit:= ViewGroup.FieldByName('Main_account').Value;
        hCredit:= ViewGroup.FieldByName('Sale_account').Value;
        DebitAmount:=StrToInt(ERepair_SUMMA.text);
        CreditAmount:= StrToInt(ERepair_SUMMA.text);
        LAmount:= StrToInt(ERepair_SUMMA.text);
        DebitRate:= 1;
        CreditRate:= 1;
        ParentID:= 0;
        DebitBankID:= 0;
        CreditBankID:= 0;
        FilialID:= 0;
        PackageNumber:= 0;
        InbalanceChar:= 0;
        OutBalanceChar:= 0;
        CypherCode:= 0;
        OperationCode:= 0;
        TransactionID:= -1;
        TrName:= 'Ясаслы тямир';
        IsRoot:=true;
        ArchiveID:= 0;
       end;
       SB_AddTransaction(Transaction, []);
      end;
    //Отступаем от проводок
   //АЗХИВИЗАЦИЯ
   with MainFDataModule.OPViewWares,MainFDataModule.ViewWares do
    begin
     CallProcedure('add_archive_wares1',[
                       FieldByName('ID').AsInteger,
                       FieldByName('GROUPSID').AsInteger,
                       FieldByName('Name').AsString,
                       FieldByName('Inventar').AsString,
                       FieldByName('Inventar_date').AsDateTime,
                       FieldByName('First_price').AsInteger,
                       FieldByName('Balance_price').Value,
                       FieldByName('In_date').AsDateTime,
                       OUT_D,
                       FieldByName('In_num').AsInteger,
                       OUT_NUM,
                       FieldByName('Amort').AsInteger,
                       FieldByName('AllAmort').Value,
                       FieldByName('Producer_plane').AsString,
                       FieldByName('FXM').AsInteger,
                       FieldByName('Sector_cod').AsInteger,
                       '',
                       FieldByName('Modern_date').AsDateTime,
                       FieldByName('Modern_summa').AsInteger,
                       FieldByName('Modern_num').AsInteger,
                       FieldByName('Repair_date').AsDateTime,
                       FieldByName('Repair_summa').AsInteger,
                       FieldByName('Repair_num').AsInteger,
                       FieldByName('Amort_date').AsDateTime
                                         ]);
    end;
   //КОНЕЦ АЗХИВИЗАЦИИ
    R:=REP_D;
  end;
  except
   raise;
  end;
end;

procedure TFrmAddWares.ActionCommitExecute(Sender: TObject);
var
   GroupID,SearchID:Integer;
Begin
 TRY
 if MainFacilities.OpeartionMode = omAdd then
  begin
   INV_D:=Trunc(DTPINVENTAR_DATE.DateTime);
   IN_D:=Trunc(DTPIN_DATE.DateTime);
   GroupID:=MainFDataModule.ViewGroup.FieldByName('ID').AsInteger;
   with MainFDataModule do
    begin
          OPViewWares.CallProcedure('add_wares',[
             GroupID,
             ENAME.Text,
             EInventar.Text,
             INV_D,
             StrToFloat(EFirst_price.Text),
             StrToFloat(EBalance_price.Text),
             IN_D,
             StrToInt(EIn_num.Text),
             StrToInt(EAMORTNB.Text),
             EPRODUCER_PLANE.Text,
             StrToInt(EFXM.Text),
             ODSTakeDepartmentID.FieldByName('ID').AsInteger,
             0,
             StrToFloat(EAccrualAmort.Text),
             0,0,
             StrToInt(EAMORTTAX.Text)]);
            ODSWClose.Refresh;
       //*********
     ODSMODERN.Close;
     ODSMODERN.SetVariable('WID',ViewWares.FieldByName('ID').AsInteger);
     ODSMODERN.Open;

     ODSREPAIR.Close;
     ODSREPAIR.SetVariable('WID',ViewWares.FieldByName('ID').AsInteger);
     ODSREPAIR.Open;
       //*********
       ViewWares.Refresh;
    Close;
   end;
 end
else
 if MainFacilities.OpeartionMode = omEdit then
 Begin
   with MainFDataModule do
    Begin
     SearchID:=ViewWares.FieldByName('ID').AsInteger;
     OPViewWares.CallProcedure('upd_wares',[
             ViewWares.FieldByName('ID').AsInteger,
             EName.Text,
             EInventar.Text,
             DTPInventar_date.DateTime,
             StrToFloat(EFirst_price.Text),
             StrToFloat(EBalance_price.Text),
             DTPIn_date.DateTime,
             StrToInt(EIn_num.Text),
             StrToFloat(EAMORTNB.Text),
             EPRODUCER_PLANE.Text,
             StrToInt(EFXM.Text),
             MainFDataModule.ODSTakeDepartmentID.FieldByName('ID').AsInteger,
             StrToFloat(EAccrualAmort.Text),
             StrToFloat(EAMORTTAX.Text),
             ViewWares.FieldByName('GroupsID').AsInteger]
             );
     ViewWares.Refresh;
     ViewWares.Locate('ID',SearchID,[loPartialKey]);
     ODSWClose.Refresh;
     Close;
    End;
 End;
 EXCEPT
 // ShowMessage('Не все поля заполнены!');
 // Abort;
 Raise;
 end;
 EMODERN_NUM.Text:='';
 EMODERN_SUMMA.Text:='';
 EREPAIR_NUM.TEXT:='';
 EREPAIR_SUMMA.tEXT:='';
end;
procedure TFrmAddWares.ActionCancelExecute(Sender: TObject);
begin
 EMODERN_NUM.Text:='';
 EMODERN_SUMMA.Text:='';
 EREPAIR_NUM.TEXT:='';
 EREPAIR_SUMMA.tEXT:='';
 Close;
end;

procedure TFrmAddWares.ActionCommitUpdate(Sender: TObject);
begin
 with (Sender as TAction) do
  Enabled :=
          (trim(ENAME.Text)<>'')
          and (EFXM.Text<>'')
          and (EFIRST_PRICE.Text<>'')
          and (EBALANCE_PRICE.Text<>'')
          and (EAccrualAmort.Text<>'')
          and (EAMORTNB.Text<>'')
          and (EAMORTTAX.Text<>'')
          and (EIN_NUM.Text<>'')
end;

end.

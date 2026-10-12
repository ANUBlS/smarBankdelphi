unit NewDepositsFrmAddMoneyImpl;
           //PercentEdit
           //DBEditEh1
           //ButtonCommit
           //MoneySumEdit
           //fkCalculated


interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrlsEh, DBLookupEh, CMCurrencyEdit, ComCtrls,
   ActnList, DBGridEh, XFSCtrls, DBCtrls, Grids, DBGrids, CurrencyEdit;

type
  TNewDepositsFrmAddMoney = class(TForm)
    XFPanel1: TXFPanel;
    XFPanel2: TXFPanel;
    XFPanel3: TXFPanel;
    XFPanel4: TXFPanel;
    XFPanel5: TXFPanel;
    XFPanel6: TXFPanel;
    XFPanel7: TXFPanel;
    XFPanel8: TXFPanel;
    ButtonCommit: TXFButton;
    ButtonCancel: TXFButton;
    XFPanel9: TXFPanel;
    XFPanel10: TXFPanel;
    XFStaticText1: TXFStaticText;
    XFPanel11: TXFPanel;
    XFStaticText2: TXFStaticText;
    XFPanel12: TXFPanel;
    XFStaticText3: TXFStaticText;
    XFPanel13: TXFPanel;
    XFStaticText5: TXFStaticText;
    XFPanel14: TXFPanel;
    XFStaticText4: TXFStaticText;
    XFPanel15: TXFPanel;
    XFStaticText6: TXFStaticText;
    XFPanel16: TXFPanel;
    XFStaticText7: TXFStaticText;
    XFPanel17: TXFPanel;
    DBEditNo: TDBEdit;
    XFPanel18: TXFPanel;
    DBEditCustName: TDBEdit;
    XFPanel19: TXFPanel;
    DBEditAccNo: TDBEdit;
    XFPanel20: TXFPanel;
    DBEditAmount: TDBEdit;
    XFPanel21: TXFPanel;
    DBEditPercent: TDBEdit;
    XFPanel22: TXFPanel;
    DBEditDate: TDBEdit;
    XFPanel23: TXFPanel;
    CMCurrencyEditMoneySum: TCMCurrencyEdit;
    XFPanel24: TXFPanel;
    XFStaticText8: TXFStaticText;
    XFPanel25: TXFPanel;
    CBoxDescript: TComboBox;
    ActionList1: TActionList;
    ActnTransaction: TAction;
    XFPanel26: TXFPanel;
    XFPanel27: TXFPanel;
    XFStaticText9: TXFStaticText;
    XFPanel28: TXFPanel;
    XFPanel29: TXFPanel;
    XFPanel30: TXFPanel;
    XFStaticText10: TXFStaticText;
    XFPanel31: TXFPanel;
    CMCurrencyEditOstat: TCMCurrencyEdit;
    DBLookupClientAccNo: TDBLookupComboboxEh;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ActnTransactionExecute(Sender: TObject);
    procedure ActnTransactionUpdate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AccnameListCBChange(Sender: TObject);
    procedure AccountListCBChange(Sender: TObject);
    procedure DBLookupClientAccNoChange(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewDepositsFrmAddMoney: TNewDepositsFrmAddMoney;
  counttransh:integer;

implementation

{$R *.dfm}
uses NewCommonDeclsImpl,NewDepositsDMApplyMoneyImpl,NewTemporaryTransactionsFormImpl,SBTranslateProc,sboapiDataModuleimpl;
procedure TNewDepositsFrmAddMoney.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False
end;

procedure TNewDepositsFrmAddMoney.FormCreate(Sender: TObject);
begin
//  SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TNewDepositsFrmAddMoney.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if ord(key) = VK_ESCAPE then close
end;

procedure TNewDepositsFrmAddMoney.FormShow(Sender: TObject);

begin
//
   with NewDepositsDMApplyMoney,DepositInfo,dm_tranches do
   begin
     IF Active THEN  Refresh;

 //  PercentEdit.Text := FloatToStr(FieldByName('interest').AsFloat);
  // PercentEdit.Text := FloatToStr(CallFloatFunction('getpersentTransh',['ContractID',Get_SelectedContID]));
 //   counttransh:=CallIntegerFunction('counttranch',['p_contractid',Get_SelectedContID]);

   end;


 //  OperationDatePckr.DateTime := Get_BankDate;
   CMCurrencyEditMoneySum.Text :='0.00';
   CBoxDescript.ItemIndex:=0;
   DBLookupClientAccNo.KeyValue:=-1;
end;

procedure TNewDepositsFrmAddMoney.AccnameListCBChange(Sender: TObject);
begin
  //AccountListCB.KeyValue :=AccnameListCB.KeyValue;
end;

procedure TNewDepositsFrmAddMoney.AccountListCBChange(Sender: TObject);
begin
  //AccnameListCB.KeyValue := AccountListCB.KeyValue;
end;

procedure TNewDepositsFrmAddMoney.ActnTransactionExecute(Sender: TObject);
resourcestring
  rsTransactionsWillProcessed = 'Depozit yatrımı ...';

var PClientAccID :Integer;
    PTotal : Real;
    PPercent :Real;
    PCAccID:integer;
    CommitDepositMoney : Boolean;
    p_check1 :integer;
    p_check2 :integer;
    p_check3 :integer;
    PDescript :string;
begin
   With NewDepositsDMApplyMoney do
   begin
     PClientAccID := DebitAccsID.AsInteger;
   end;
     PTotal := CMCurrencyEditMoneySum.Value;
     PPercent := StrToFloat(DBEditPercent.Text);
     PDescript:=CBoxDescript.Text;
     PCAccID:=DBLookupClientAccNo.Value;

     if PPercent=0 then
     begin
       showmessage('Yatrımın % dərəcəsi 0 ola bilməz.');
       exit;
     end;



     {with NewDepositsDMApplyMoney,dm_tranches do
     begin
        p_check1:=CallIntegerFunction('checkedtranch',[
                                            'p_contractid',Get_SelectedContID,
                                            'p_amuont',Total]);

        p_check2:=CallIntegerFunction('checkedaddtranch',[
                                            'p_contractid',Get_SelectedContID,
                                            'p_amuont',Total]);


        p_check3:=CallIntegerFunction('checkedtranch_max_limit',[
                                            'p_contractid',Get_SelectedContID,
                                            'p_amuont',Total]);


        if counttransh=0 then
        begin
       if p_check1=0 then
       begin
       showmessage('Bu depozit tipi üçün ilk yatrım üçün daxil edilən yatrım məbləğinə uyğun sazlama aralığı mövcud deyil.');
       exit;
       end;

       if p_check1=2 then
       begin
       showmessage('Bu depozit tipi üçün ilk yatrım üçün daxil edilən yatrım məbləğinə uyğun cox sayda sazlama aralığı mövcuddur.');
       exit;
       end;
        end ;

       if counttransh>0 then
        begin
       if p_check2=0 then
       begin
       showmessage('Bu depozit tipi üçün növbəti yatrımlar üçün sazlama  mövcuddur deyil.');
       exit;
       end;


       if p_check2=1 then
       begin
       showmessage('Bu depozitdə seçilmiş depozit tipinə və digər sazlamalara,bu tarixe ve daxil olunan yeni yatrim məbəlğinə uygun sazlama movcud deyil.');
       exit;
       end;


       if p_check2=2 then
       begin
       showmessage('Bu müqavilə üçün seçilmiş depozit tipinə və digər sazlamalara bu məbləğ yatrım məbləği aralığına uyğun olmadığından bu məbləğdğ Yatrım edə bilmərsiz.');
       exit;
       end;

       if p_check2=4 then
       begin
       showmessage('Seçilmiş depozit tipinə və digər sazlamalara ,bu tarixə və bu məbləğə uyğun yatrım edə bilmərsiz. Daxil olunan məbləğ sazamada göstərilən ilkin məbləğin % hissələri aralığında deyildir');
       exit;
       end;

       if p_check2=6 then
       begin
       showmessage('Bu müqavilə üçün seçilmiş depozit tipinə və digər parametrlərə görə bu tarixə uyğun sazlamda məbəğ(min),məbəğ(max),məbəğ%(min),məbəğ%(max)=0 olduğundan yatrım etmək olmaz!');
       exit;
       end;

       if p_check2=7 then
       begin
       showmessage('Bu müqavilə üçün seçilmiş depozit tipinə və digər parametrlərə görə bu tarixə uyğun cox sayda sazlama olduğundan yatrım etmək olmaz!');
       exit;
       end;

    if p_check3=0 then
    begin
     showmessage('Bu tip depozit üçün meblegin sazlanmasi movcud deyil!');
     exit;
    end;

    if p_check3=1 then
    begin
     showmessage('Bu tip depozit üçün meblegin çox sayda sazlanma movcuddur!');
     exit;
    end;

   if p_check3=2 then
    begin
     showmessage('Faizlərin sazlanmasında meblegler bölümündə Meb.artımı(max)və Meb.artımı(max)% bölümlərindən yalnız biri daxil edilməlidir!');
     exit;
    end;


   if p_check3=3 then
    begin
     showmessage('Yeni daxil edilən yatrım və əvvəlki yatrımların cəmi sazlamdakı Meb.artımı(max)-dən böyükdür!');
     exit;
    end;

    if p_check3=4 then
    begin
     showmessage('Yeni daxil edilən yatrım və əvvəlki yatrımların cəmi sazlamdakı Meb.artımı(max)%-dən böyükdür!');
     exit;
    end;
        end;
   end;     }


   with NewDepositsDMApplyMoney,dm_tranches do
        CallProcedure('depositmoney',[
                      'ClientAccID',PClientAccID,
                      'PAccID', PCAccID,
                      'Contractid',Get_SelectedContID,
                      'Hdate',Get_BankDate,
                      'Total',PTotal,
                      'Percent',PPercent,
                      'Descript',PDescript,
                      'Usetransaction',true]);

  try
    CommitDepositMoney := TrDelayed_Show(Self,rsTransactionsWillProcessed);

    Update;

    NewDepositsDMApplyMoney.dm_tranches.CallProcedure('CommitDepositMoney',['DoCommit',
       CommitDepositMoney
    ]);

    if CommitDepositMoney then
    Self.ModalResult := mrOk;
    Self.Update;
  except

    NewDepositsDMApplyMoney.dm_tranches.CallProcedure('CommitDepositMoney',['DoCommit',
        False
    ]);

    raise;
  end;

  end;

    procedure TNewDepositsFrmAddMoney.ActnTransactionUpdate(Sender: TObject);
begin
  with (Sender as TAction) do
         Enabled := CMCurrencyEditMoneySum.Value > 0
end;



procedure TNewDepositsFrmAddMoney.DBLookupClientAccNoChange(Sender: TObject);
begin
  if DBLookupClientAccNo.KeyValue=-1 then CMCurrencyEditOstat.Text:='0.00'
                                     else begin
                                            with NewDepositsDMApplyMoney,AccNoOstat do
                                            begin
                                              close;
                                             if not Active then
                                             SetVariable('accid',DBLookupClientAccNo.KeyValue);
                                             Open;
                                             CMCurrencyEditOstat.Text:=FieldByName('ostat').AsString;
                                            end;
                                          end;

end;

end.

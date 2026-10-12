unit UnitPaymentsCredit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CMCurrencyEdit, SearchEdit, ExtCtrls, DBCtrls,
  FieldSearchEdit, Buttons, DB, OracleData, Designer, Mask;

type
  TFormPaymentsCredit = class(TForm)
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Account: TOracleDataSet;
    AccountDS: TDataSource;
    Label3: TLabel;
    Panel1: TPanel;
    Label22: TLabel;
    Searchpasspin: TEdit;
    Panel3: TPanel;
    Label76: TLabel;
    Searchpaspnum: TEdit;
    P4: TPanel;
    Label102: TLabel;
    Searchid: TEdit;
    P5: TPanel;
    Label103: TLabel;
    Searchinn: TEdit;
    Panel4: TPanel;
    Label2: TLabel;
    Panel5: TPanel;
    Label1: TLabel;
    FilialName: TEdit;
    Panel6: TPanel;
    Label4: TLabel;
    EditName: TEdit;
    Panel7: TPanel;
    Label5: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Panel8: TPanel;
    Label8: TLabel;
    CMCurrencyEdit2: TCMCurrencyEdit;
    Panel9: TPanel;
    CMCurrencyEdit3: TCMCurrencyEdit;
    Label9: TLabel;
    Panel10: TPanel;
    CMCurrencyEdit1: TEdit;
    Label6: TLabel;
    Panel11: TPanel;
    ComboBox1: TComboBox;
    Label7: TLabel;
    EditDescription: TEdit;
    Panel12: TPanel;
    SpeedButton1: TSpeedButton;
    Searchname: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FieldSearchEditNameExit(Sender: TObject);
    procedure SearchpasspinKeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure SearchEditNameChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SearchEditName1KeyPress(Sender: TObject; var Key: Char);
    procedure SearchpaspnumExit(Sender: TObject);
    procedure SearchpasspinExit(Sender: TObject);
    procedure SearchidExit(Sender: TObject);
    procedure SearchinnExit(Sender: TObject);
    procedure SearchEditName1Exit(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure CMCurrencyEdit1MouseActivate(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
    procedure CMCurrencyEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure CMCurrencyEdit1Exit(Sender: TObject);
    procedure EditDescriptionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);


  private
    { Private declarations }
  public
    procedure LoadComboData(Sender: TComboBox);
     var  FForm               :integer;
          FiledBatchs         :boolean;
          FiledIncoming       :boolean;
          FieldBatchsArchive  :boolean;
          FiledIncomingArchive:Boolean;
          Sum                 :real;
  end;

var
  FormPaymentsCredit: TFormPaymentsCredit;
  KeyD:integer;
  Hcusttype:integer;

implementation
uses ExpDataModuleUnit, ExpCustomersTypeUnit, ExpressDecls,UnitNominalCustomers,
  ExpUnitImpl;

{$R *.dfm}

procedure TFormPaymentsCredit.Button1Click(Sender: TObject);
var
    val_cod    :Integer;
    accid      :Variant;
    amount     :real;
    paymentname:string;
    filname    :integer;
    v_id       :Integer;
    optype     :integer;
begin

    if EditName.Text='' then begin
                               ShowMessage('Adı sahəsi boşdur!');
                               exit;
                             end;

    if DBLookupComboBox1.Text='' then begin
                                            ShowMessage('Hesab sahəsi seçilməyib!');
                                            exit;
                                          end;

    if CMCurrencyEdit1.text='0.00' then begin
                                       ShowMessage('Məbləğ sahəsi doldurulmayıb!');
                                       exit;
                                     end;

    if EditDescription.Text='' then begin
                                      ShowMessage('Təyinat  sahəsi doldurulmayıb!');
                                      exit;
                                     end;

   IF not(FormNominalCustomers.RH) then
   if  Hcusttype=0 then   begin
                            ShowMessage('III-cü şəxs doldurulmayıb!');
                            exit;
                          end;


  v_id     :=0;
  optype   :=4;
  val_cod  :=ExpDataModule.KredetDataSet.FieldByName('val_acc').AsInteger;
  amount   :=StrToFloat( CMCurrencyEdit1.Text);
  filname  :=ExpDataModule.KredetDataSet.FieldByName('filial').AsInteger;
  accid    :=ExpDataModule.KredetDataSet.FieldByName('id').AsInteger;
  ExpressVariables.remit_inf:=EditDescription.Text;


   with   ExpressVariables do
   begin

  IF FForm=0 THEN
  BEGIN
    ExpDataModule.EXPESSPAC.CallProcedure('exp_payments_insert',
                                        [ 'batchid'          ,v_id
                                         ,'v_exid'           ,exid
                                         ,'v_optype'         ,optype
                                         ,'v_accid'          ,accid
                                         ,'v_val_cod'        ,val_cod
                                         ,'v_amount'         ,amount
                                         ,'v_filname'        ,filname
                                         ,'v_remit_inf'      ,remit_inf
                                         ,'v_doc_type'       ,doc_type
                                         ,'v_passpin'        ,passpin
                                         ,'v_passer'         ,passer
                                         ,'v_paspnum'        ,paspnum
                                         ,'v_doc_country'    ,doc_country
                                         ,'v_paspplace'      ,paspplace
                                         ,'v_paspdate'       ,paspdate
                                         ,'v_passexpire'     ,passexpire
                                         ,'v_citizenship'    ,citizenship
                                         ,'v_lastname'       ,lastname
                                         ,'v_soname'         ,soname
                                         ,'v_name'           ,name
                                         ,'v_sex'            ,sex
                                         ,'v_fam_status'     ,fam_status
                                         ,'v_bbirthplace'    ,bbirthplace
                                         ,'v_birth_state'    ,birth_state
                                         ,'v_birthday'       ,birthday
                                         ,'v_aadrs_state'    ,aadrs_state
                                         ,'v_city'           ,city
                                         ,'v_reg_zip'        ,reg_zip
                                         ,'v_address'        ,address
                                         ,'v_phone_m'        ,phone_m
                                         ,'v_phone_h'        ,phone_h
                                         ,'v_e_mail'         ,e_mail
                                         ,'v_nerezident'     ,v_nerezident
                                         ,'v_work_place'     ,work_place
                                         ,'v_work_adrs_spec' ,work_adrs_spec
                                         ,'v_work_cntr'      ,work_cntr
                                         ,'v_work_city'      ,work_city
                                         ,'v_work_state'     ,work_state
                                         ,'v_work_zip'       ,work_zip
                                         ,'v_work_adress'    ,work_adress
                                         ,'v_work_phone_spec',work_phone_spec
                                         ,'v_work_phconttype',work_phconttype
                                         ,'v_work_phoppref'  ,work_phoppref
                                         ,'v_work_phone'     ,work_phone
                                         ,'v_work_phext'     ,work_phext
                                         ,'v_work_phcode'    ,work_phcode
                                        ]);
    v_id:=ExpDataModule.EXPESSPAC.GetParameter(0);
    FormPaymentsCredit.Close;
    ExpCustomersType.Close;
    ExpDataModule.Expdescription.Refresh;
    ExpDataModule.ExpBatchsDataSet.Refresh;
    ExpDataModule.ExpBatchsDataSet.Locate('ID',v_id,[]);
  END
  ELSE
    begin
      if EditName.Text='' then begin
                               ShowMessage('Adı sahəsi boşdur!');
                               exit;
                             end;

     if DBLookupComboBox1.Text='' then begin
                                            ShowMessage('Hesab sahəsi seçilməyib!');
                                            exit;
                                          end;

      if CMCurrencyEdit1.Text='' then begin
                                       ShowMessage('Məbləğ sahəsi doldurulmayıb!');
                                       exit;
                                     end;

      FormNominalCustomers.Parametr;
      v_id:=ExpDataModule.ExpBatchsDataSet.FieldByName('id').AsInteger;
      ExpDataModule.EXPESSPAC.CallProcedure('exp_payments_update',
                                           ['batchid'          ,v_id
                                           ,'nominalid'        ,custid
                                           ,'v_exid'           ,exid
                                           ,'v_optype'         ,optype
                                           ,'v_accid'          ,accid
                                           ,'v_val_cod'        ,val_cod
                                           ,'v_amount'         ,amount
                                           ,'v_filname'        ,filname
                                           ,'v_remit_inf'      ,remit_inf
                                           ,'v_doc_type'       ,doc_type
                                           ,'v_passpin'        ,passpin
                                           ,'v_passer'         ,passer
                                           ,'v_paspnum'        ,paspnum
                                           ,'v_doc_country'    ,doc_country
                                           ,'v_paspplace'      ,paspplace
                                           ,'v_paspdate'       ,paspdate
                                           ,'v_passexpire'     ,passexpire
                                           ,'v_citizenship'    ,citizenship
                                           ,'v_lastname'       ,lastname
                                           ,'v_soname'         ,soname
                                           ,'v_name'           ,name
                                           ,'v_sex'            ,sex
                                           ,'v_fam_status'     ,fam_status
                                           ,'v_bbirthplace'    ,bbirthplace
                                           ,'v_birth_state'    ,birth_state
                                           ,'v_birthday'       ,birthday
                                           ,'v_aadrs_state'    ,aadrs_state
                                           ,'v_city'           ,city
                                           ,'v_reg_zip'        ,reg_zip
                                           ,'v_address'        ,address
                                           ,'v_phone_m'        ,phone_m
                                           ,'v_phone_h'        ,phone_h
                                           ,'v_e_mail'         ,e_mail
                                           ,'v_nerezident'     ,v_nerezident
                                           ,'v_work_place'     ,work_place
                                           ,'v_work_adrs_spec' ,work_adrs_spec
                                           ,'v_work_cntr'      ,work_cntr
                                           ,'v_work_city'      ,work_city
                                           ,'v_work_state'     ,work_state
                                           ,'v_work_zip'       ,work_zip
                                           ,'v_work_adress'    ,work_adress
                                           ,'v_work_phone_spec',work_phone_spec
                                           ,'v_work_phconttype',work_phconttype
                                           ,'v_work_phoppref'  ,work_phoppref
                                           ,'v_work_phone'     ,work_phone
                                           ,'v_work_phext'     ,work_phext
                                           ,'v_work_phcode'    ,work_phcode] ) ;

    FormPaymentsCredit.Close;
    ExpCustomersType.Close;
    ExpDataModule.Expdescription.Refresh;
    ExpDataModule.ExpBatchsDataSet.Refresh;
    ExpDataModule.ExpBatchsDataSet.Locate('ID',v_id,[]);
    end;
   end;
end;

procedure TFormPaymentsCredit.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormPaymentsCredit.LoadComboData(Sender: TComboBox);
begin
 with ExpDataModule.Expdescription, Sender do
  begin
    if not(Active) then Open
    else
      begin
       Refresh;
      end;
   if Items.Count<>RecordCount then
     begin
       Items.Clear;
       First;
     while not(EOF) do
        begin
         Items.Add(FieldByName('description').AsString);
         Next;
        end;
     end;
  end;
end;



procedure TFormPaymentsCredit.CMCurrencyEdit1Exit(Sender: TObject);
var s:integer;
begin

  s:=  pos('.',CMCurrencyEdit1.Text);
  IF s=0 THEN CMCurrencyEdit1.Text:=CMCurrencyEdit1.Text+'.00' ;
end;


procedure TFormPaymentsCredit.CMCurrencyEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (key in [#8,'0'..'9',DecimalSeparator]) then key:=#0;
end;

procedure TFormPaymentsCredit.CMCurrencyEdit1MouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
  IF CMCurrencyEdit1.Text='0.00' then CMCurrencyEdit1.Clear;
end;

procedure TFormPaymentsCredit.ComboBox1Click(Sender: TObject);
begin
 EditDescription.Text:=(Sender as TComboBox).Text;
end;

procedure TFormPaymentsCredit.ComboBox1DropDown(Sender: TObject);
begin
  LoadComboData(TComboBox(Sender));
end;

procedure TFormPaymentsCredit.DBLookupComboBox1Click(Sender: TObject);
begin
  KeyD:=1;
  with ExpDataModule do
  begin

    FilialDataSet.Filtered:=False;
    FilialDataSet.Filter:='';
    FilialDataSet.Filter:='id='+KredetDataSet.FieldByName('filial').AsString;
    FilialDataSet.Filtered:=true;
    FilialName.Text:=ExpDataModule.FilialDataSet.FieldByName('name').AsString;

    KreditRestDataSet.Close;
    KreditRestDataSet.SetVariable('acc_id',KredetDataSet.FieldByName('id').AsInteger);
    KreditRestDataSet.Open;

    SearchName.Text:=DBLookupComboBox1.Text;

    IF VarIsNull(KreditRestDataSet.FieldByName('rest').AsVariant)
    THEN CMCurrencyEdit2.Value:=0
    ELSE CMCurrencyEdit2.Value:=KreditRestDataSet.FieldByName('rest').AsVariant;

   IF VarIsNull(KreditRestDataSet.FieldByName('interestrest').AsVariant)
   THEN CMCurrencyEdit3.Value:=0
   ELSE CMCurrencyEdit3.Value:=KreditRestDataSet.FieldByName('interestrest').AsVariant;


  end;
end;

procedure TFormPaymentsCredit.EditDescriptionKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key=VK_F3 then
 with ExpFormDestination, ExpDataModule do
 begin
  ShowModal;
  if ModalResult = mrOk then
  EditDescription.Text :=Value;
 end
 else
  if Key = VK_ESCAPE then
   Close;
end;


procedure TFormPaymentsCredit.FieldSearchEditNameExit(Sender: TObject);
begin
   //SearchEditName.Clear;
end;

procedure TFormPaymentsCredit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Account.Close;
  FormPaymentsCredit.Button1.Visible:=True;
  FormNominalCustomers.Button1.Visible:=True;
  FiledBatchs:=false;
  FiledIncoming:=false;
end;

procedure TFormPaymentsCredit.FormShow(Sender: TObject);
var
    FieldKLIID:string;
    FieldBKLIID:string;
    FieldBFILIALNAME:string;
    FieldKREDITACCID:Variant;
    FieldAMOUNT:real;
    FieldREMIT_INF:string;

begin
       with ExpressVariables do
       begin
         custid       :=null;
         remit_inf    :='';
         doc_type     :=null;
         passpin      :='';
         passer       :='';
         paspnum      :='';
         doc_country  :=null;
         paspplace    :='';
         paspdate     :=null;
         passexpire   :=null;
         citizenship  :=-1;
         lastname     :='';
         soname       :='';
         name         :='';
         sex          :=null;
         fam_status   :=null;
         bbirthplace  :='';
         birth_state  :='';
         birthday     :=null;
         aadrs_state  :='';
         city         :='';
         reg_zip      :='';
         address      :='';
         phone_m      :='';
         phone_h      :='';
         e_mail       :='';
         filial       :=-1;
         v_nerezident :=-1;
         v_cust_type  :=-1;
         v_inn        :='';
         debetid      :=null;
         work_place   :='';
         work_adrs_spec:=-1;
         work_cntr     :=-1;
         work_city     :=-1;
         work_state    :='';
         work_zip      :='';
         work_adress   :='';
         work_phone_spec:=-1;
         work_phconttype:=-1;
         work_phoppref  :=-1;
         work_phone     :='';
         work_phext     :='';
         work_phcode    :='';
       end;
         KeyD:=0;
         FormNominalCustomers.RH:=false;

         FormPaymentsCredit.Account.Close;
         FormPaymentsCredit.Account.Open;


  IF FForm=0 then
  BEGIN
    Sum:=0;
    Searchpaspnum.Clear;
    Searchinn.Clear;
    Searchid.Clear;
    Searchpasspin.Clear;
    EditName.Clear;
    SearchName.Clear;
    FilialName.Clear;
    ExpDataModule.KredetDataSet.Close;
    ExpDataModule.KredetDataSet.SetVariable('kli_id',-1);
    ExpDataModule.KredetDataSet.Open;
    CMCurrencyEdit1.Text:='0.00';
    EditDescription.Clear;
    Hcusttype:=-1;
  END
  ELSE
    BEGIN
      KeyD:=1;
      with ExpDataModule do
      begin

        IF FiledIncoming THEN begin
                              FieldKLIID:=ExpIncomingDataSetKLIID.AsString;
                              FieldBKLIID:=ExpIncomingDataSetBKLIID.AsString;
                              FieldBFILIALNAME:=ExpIncomingDataSetBFILIALNAME.AsString;
                              FieldKREDITACCID:=ExpIncomingDataSetKREDITACCID.AsString;
                              FieldAMOUNT:=ExpIncomingDataSetAMOUNT.AsFloat;
                              FieldREMIT_INF:=ExpIncomingDataSetREMIT_INF.AsString;
                            end;


        IF FiledBatchs THEN begin
                                FieldKLIID:=ExpBatchsDataSetKLIID.AsString;
                                FieldBKLIID:=ExpBatchsDataSetBKLIID.AsString;
                                FieldBFILIALNAME:=ExpBatchsDataSetBFILIALNAME.AsString;
                                FieldKREDITACCID:=ExpBatchsDataSetKREDITACCID.AsString;
                                FieldAMOUNT:=ExpBatchsDataSetAMOUNT.AsFloat;
                                FieldREMIT_INF:=ExpBatchsDataSetREMIT_INF.AsString;
                              end;

      end;
      with ExpDataModule,SendToDataSet do
      BEGIN
        Close;
        SQl[1]:='';
        SQl[1]:='where id='+ FieldBKLIID;
        Open;

        Searchpasspin.Text :=SendToDataSet.FieldByName('passpin').AsString;
        Searchpaspnum.Text :=SendToDataSet.FieldByName('paspnum').AsString;
        Searchid.Text      :=SendToDataSet.FieldByName('id').AsString;
        Searchinn.Text     :=SendToDataSet.FieldByName('inn').AsString;
        Hcusttype          :=SendToDataSet.FieldByName('cust_type').AsInteger;


        FilialName.Text:=FieldBFILIALNAME;
        EditName.Text:=SendToDataSet.FieldByName('custname').AsString;

        KredetDataSet.Close;
        KredetDataSet.SetVariable('kli_id',FieldBKLIID);
        KredetDataSet.Open;

        DBLookupComboBox1.KeyValue:=FieldKREDITACCID;
        SearchName.Text:=DBLookupComboBox1.Text;

        KreditRestDataSet.Close;
        KreditRestDataSet.SetVariable('acc_id',FieldKREDITACCID);
        KreditRestDataSet.Open;

        CMCurrencyEdit2.Value:=KreditRestDataSetREST.AsFloat;
        CMCurrencyEdit3.Value:=KreditRestDataSetINTERESTREST.AsFloat;
        CMCurrencyEdit1.Text:=FloatToStr(FieldAMOUNT);
        CMCurrencyEdit1Exit(sender);
        EditDescription.Text:=FieldREMIT_INF;

      END;

      IF  FieldBKLIID<>FieldKLIID Then
      begin
      with ExpDataModule,SendDataSet do
      BEGIN
        Close;
        SQl[1]:='';
        SQl[1]:='where id='+ FieldKLIID;
        Open;
        with FormNominalCustomers,ExpressVariables do
        begin
          custid           :=FieldKLIID;
          Editpasspin.Text :=FieldByName('passpin').AsString;
          if Editpasspin.Text<>'' then  FormNominalCustomers.RH:=true;

          EditLastName.Text:=FieldByName('lastname').AsString;
          EditName1.Text   :=FieldByName('name').AsString;
          EditSoname.Text  :=FieldByName('soname').AsString;

          CBoxPassPlace.KeyValue      :=FieldByName('doc_type').AsInteger;
          EditSerial.Text             :=FieldByName('passer').AsString;
          EditPassport.Text           :=FieldByName('paspnum').AsString;
          Issue_country.KeyValue      :=FieldByName('doc_country').AsVariant;



          DBCBox_DocTYPE.KeyValue     :=FieldByName('paspplace').AsString;
          DateEdit.Value              :=FieldByName('paspdate').AsVariant;
          DateEdit1.Value             :=FieldByName('passexpire').AsVariant;


          DBCBox_Citizenship.KeyValue  :=FieldByName('citizenship').AsInteger;

          CBoxSex.KeyValue             :=FieldByName('sex').AsString;
          CBoxFamStatus.KeyValue       :=FieldByName('fam_status').AsString;
          BirthPlace.KeyValue          :=FieldByName('birthplace').AsString;
          EditBirthCity.KeyValue       :=FieldByName('birth_state').AsString;
          DateEdit2.Value              :=FieldByName('birthday').AsVariant;

          Adrs_State.KeyValue          :=FieldByName('adrs_state').AsString;
          Adrs_City.KeyValue           :=FieldByName('city').AsString;
          ZipQ.Text                    :=FieldByName('reg_zip').AsString;
          EditMobil.Text               :=FieldByName('phone_m').AsString;
          EditPhone.Text               :=FieldByName('phone_h').AsString;
          EditEmail.Text               :=FieldByName('e_mail').AsString;
          AdressEdit.Text              :=FieldByName('address').AsString;


          FormNominalCustomers.Work_Place.Text:=FieldByName('work_place').AsString;
          FormNominalCustomers.Address_type.KeyValue:=FieldByName('work_adrs_spec').AsVariant;
          FormNominalCustomers.CountryByConctType.KeyValue:=FieldByName('work_cntr').AsVariant;

          FormNominalCustomers.CityByConctType.KeyValue:=FieldByName('work_city').AsVariant;
          FormNominalCustomers.db_tph_state.Text:=FieldByName('work_state').AsString;
          FormNominalCustomers.DB_tph_zip.Text:=FieldByName('work_zip').AsString;

          FormNominalCustomers.db_tph_adress.Text:=FieldByName('work_adress').AsString;
          FormNominalCustomers.tph_contact_type.KeyValue:=FieldByName('work_phone_spec').AsVariant;
          FormNominalCustomers.tph_communication_type.KeyValue:=FieldByName('work_phconttype').AsVariant;

          FormNominalCustomers.tph_country_prefix.KeyValue:=FieldByName('work_phoppref').AsVariant;
          FormNominalCustomers.Db_tph_number.Text:=FieldByName('work_phone').AsString;
          FormNominalCustomers.Db_tph_extension.Text:=FieldByName('work_phext').AsString;
          FormNominalCustomers.Db_tph_cod.Text:=FieldByName('work_phcode').AsString;

      END;
        end
      end
        else
          begin
          with FormNominalCustomers do
          begin
            RadioButton1.Checked :=true;
            Editpasspin.Clear;
            EditLastName.Clear;
            EditName1.Clear;
            EditSoname.Clear;
            CBoxPassPlace.KeyValue:=-1;
            EditSerial.Clear;
            EditPassport.Clear;
            Issue_country.KeyValue:=-1;
            DBCBox_DocTYPE.KeyValue:=-1;
            DateEdit.Clear;
            DateEdit1.Clear;
            DBCBox_Citizenship.KeyValue:=-1;
            CBoxSex.KeyValue:=-1;
            CBoxFamStatus.KeyValue:=-1;
            BirthPlace.KeyValue:=-1;
            EditBirthCity.KeyValue:=-1;
            DateEdit2.Clear;
            Adrs_State.KeyValue:=-1;
            Adrs_City.KeyValue:=-1;
            ZipQ.Clear;
            EditMobil.Clear;
            EditPhone.Clear;
            EditEmail.Clear;
            AdressEdit.Clear;

            FormNominalCustomers.Work_Place.Clear;
            FormNominalCustomers.Address_type.KeyValue:=-1;
            FormNominalCustomers.CountryByConctType.KeyValue:=-1;

            FormNominalCustomers.CityByConctType.KeyValue:=-1;
            FormNominalCustomers.db_tph_state.Clear;
            FormNominalCustomers.DB_tph_zip.Clear;

            FormNominalCustomers.db_tph_adress.Clear;
            FormNominalCustomers.tph_contact_type.KeyValue:=-1;
            FormNominalCustomers.tph_communication_type.KeyValue:=-1;

            FormNominalCustomers.tph_country_prefix.KeyValue:=-1;
            FormNominalCustomers.Db_tph_number.Clear;
            FormNominalCustomers.Db_tph_extension.Clear;
            FormNominalCustomers.Db_tph_cod.Clear;



          end;
          end;

    Sum:=ExpDataModule.Repair.CallFloatFunction('SumNominalid',[ExpDataModule.ExpBatchsDataSetKLIID.AsInteger]);
    //ShowMessage(FloatToStr(Sum));

    IF Sum>=20000 then  begin
                                FormNominalCustomers.GroupBox6.Visible:=True;
                                FormNominalCustomers.GroupBox5.Visible:=True;
                                FormNominalCustomers.GroupBox4.Visible:=True;
                                FormNominalCustomers.GroupBox3.Visible:=True;
                                FormNominalCustomers.Panel2.Visible   :=True;
                                FormNominalCustomers.Top:=140
                              end
                        else  begin
                                FormNominalCustomers.Panel2.Visible:=false;
                                FormNominalCustomers.GroupBox3.Visible:=false;
                                FormNominalCustomers.GroupBox4.Visible:=false;
                                FormNominalCustomers.GroupBox5.Visible:=false;
                                FormNominalCustomers.GroupBox6.Visible:=false;
                                FormNominalCustomers.Top:=350;
                              end;
    FormPaymentsCredit.FForm:=1;
    END;



end;

procedure TFormPaymentsCredit.SearchEditNameChange(Sender: TObject);
begin
//ShowMessage(FormPaymentsCredit.Account.FieldByName('kli_id').AsString);
// IF KeyD=0 THEN
 // begin
  {if (SearchEditName.Color <>clred) and(length(SearchEditName.Text)<>0) then
   begin
     with ExpDataModule do
     begin

       SearchCustDataSet.Filter:='';
       SearchCustDataSet.Filter:='id='+FormPaymentsCredit.Account.FieldByName('kli_id').AsString;
       SearchCustDataSet.Filtered:=true;


       Searchpasspin.Text:=SearchCustDataSetPASSPIN.AsString;
       Searchpaspnum.Text:=SearchCustDataSetPASPNUM.AsString;
       Searchid.Text:=SearchCustDataSetID.AsString;
       Searchinn.Text:=SearchCustDataSetINN.AsString;
       Hcusttype:=SearchCustDataSetCUST_TYPE.AsInteger;
       EditName.Text:=Account.FieldByName('name').AsString;

       KredetDataSet.Close;
       KredetDataSet.SetVariable('kli_id',FormPaymentsCredit.Account.FieldByName('kli_id').AsInteger);
       KredetDataSet.Open;
       KredetDataSet.Filtered:=False;
       KredetDataSet.Filter:='';
       KredetDataSet.Filter:='acc_no='+QUOTEDSTR(SearchEditName.Text);
       KredetDataSet.Filtered:=true;
       DBLookupComboBox1.KeyValue:=KredetDataSet.FieldByName('id').AsString;

       KreditRestDataSet.Close;
       KreditRestDataSet.SetVariable('acc_id',FormPaymentsCredit.Account.FieldByName('id').AsInteger);
       KreditRestDataSet.Open;
       IF VarIsNull(KreditRestDataSet.FieldByName('rest').AsVariant)
       THEN CMCurrencyEdit2.Value:=0
       ELSE CMCurrencyEdit2.Value:=KreditRestDataSet.FieldByName('rest').AsVariant;

       IF VarIsNull(KreditRestDataSet.FieldByName('interestrest').AsVariant)
       THEN CMCurrencyEdit3.Value:=0
       ELSE CMCurrencyEdit3.Value:=KreditRestDataSet.FieldByName('interestrest').AsVariant;

       FilialDataSet.Filtered:=False;
       FilialDataSet.Filter:='';
       FilialDataSet.Filter:='id='+FormPaymentsCredit.Account.FieldByName('filial').AsString;
       FilialDataSet.Filtered:=true;
       FilialName.Text:=ExpDataModule.FilialDataSet.FieldByName('name').AsString;
     end;
   end
   ELSE begin
          Searchpasspin.Clear;
          Searchpaspnum.Clear;
          Searchid.Clear;
          Searchinn.Clear;
          Hcusttype:=-1;
          EditName.Clear;
        end;
  //END;               }

end;

procedure TFormPaymentsCredit.SearchEditName1Exit(Sender: TObject);
begin
// searcheditname.Clear;
end;

procedure TFormPaymentsCredit.SearchEditName1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if (not (key in ['0'..'9','a'..'z','A'..'Z','-',':','(',')','.',',','''','+','{','}',' ',#8]))
   then
   Begin
     key:=#0;
   end;
  { if key=#8  then
   begin
     FilialName.Clear;
     EditName.Clear;
     DBLookupComboBox1.KeyValue:=-1;
     CMCurrencyEdit2.Value:=0.00;
     CMCurrencyEdit3.Value:=0.00;
   end; }

end;

procedure TFormPaymentsCredit.SearchidExit(Sender: TObject);
begin
  //Searchid.Clear;
end;

procedure TFormPaymentsCredit.SearchinnExit(Sender: TObject);
begin
  //Searchinn.Clear;
end;

procedure TFormPaymentsCredit.SearchpaspnumExit(Sender: TObject);
begin
//  Searchpaspnum.Clear;
end;





procedure TFormPaymentsCredit.SearchpasspinExit(Sender: TObject);
begin
//  Searchpasspin.Clear;
end;

procedure TFormPaymentsCredit.SearchpasspinKeyPress(Sender: TObject;
  var Key: Char);
VAR S:string;
    Accno:string;
BEGIN
  S:='';
  IF Key=#13 THEN
  begin
  KeyD:=1;
  IF (Sender as TEdit).Text<>'' THEN
  BEGIN
    if (Sender as TEdit).Name='Searchname' then
    begin
      Accno:=(Sender as TEdit).Text;
      FormPaymentsCredit.Account.close;
      FormPaymentsCredit.Account.SetVariable('accno',Accno);
      FormPaymentsCredit.Account.Open;
     { FormPaymentsCredit.Account.Filtered:=False;
      FormPaymentsCredit.Account.Filter:='';
      FormPaymentsCredit.Account.Filter:='acc_no='''+Accno+'''';
      FormPaymentsCredit.Account.Open;
      FormPaymentsCredit.Account.Filtered:=true; }

      IF FormPaymentsCredit.Account.RecordCount=0 THEN
      BEGIN
        ShowMessage('Müştəri tapılmadı');
        IF (Sender as TEdit).Name<>'Searchpaspnum' THEN   Searchpaspnum.Clear;
        IF (Sender as TEdit).Name<>'Searchinn'     THEN   Searchinn.Clear;
        IF (Sender as TEdit).Name<>'Searchid'      THEN   Searchid.Clear;
        IF (Sender as TEdit).Name<>'Searchpasspin' THEN   Searchpasspin.Clear;
        IF (Sender as TEdit).Name<>'SearchName'    THEN   SearchName.Clear;
        EditName.Clear;
        FilialName.Clear;
        ExpDataModule.KredetDataSet.Close;
        ExpDataModule.KredetDataSet.SetVariable('kli_id',-1);
        ExpDataModule.KredetDataSet.Open;
        CMCurrencyEdit1.Text:='0.00';
        EditDescription.Clear;
        exit;
      END;



      with ExpDataModule do
      begin
         FilialDataSet.Close;
         FilialDataSet.SQL[1]:='';
         FilialDataSet.Open;
         FilialDataSet.Filtered:=False;
         FilialDataSet.Filter:='';
         FilialDataSet.Filter:='id='+FormPaymentsCredit.Account.FieldByName('filial').AsString;
         FilialDataSet.Filtered:=true;
         FilialName.Text:=FilialDataSet.FieldByName('name').AsString;
      end;
      S:='c.id='+ FormPaymentsCredit.Account.FieldByName('kli_id').AsString;
    end
    else
    begin
      S:=copy((Sender as TEdit).name,7,length((Sender as TEdit).name));
      if s='id' then s:='c.'+s;
      S:='('+S+'='+''''+(Sender as TEdit).text+''''+')';
    end;
  END;
  WITH ExpDataModule DO
    BEGIN
      KredetDataSet.Filtered:=False;
      KredetDataSet.Filter:='';

      SearchCustDataSet.Close;
      SearchCustDataSet.SQL[47]:=S;
      SearchCustDataSet.Open;

      {SearchCustDataSet.Filtered:=false;
      SearchCustDataSet.Filter:='';
      SearchCustDataSet.Filter:=S;
      SearchCustDataSet.Filtered:=true; }

      IF SearchCustDataSet.RecordCount=0 THEN
      BEGIN
        ShowMessage('Müştəri tapılmadı');
        IF (Sender as TEdit).Name<>'Searchpaspnum' THEN   Searchpaspnum.Clear;
        IF (Sender as TEdit).Name<>'Searchinn'     THEN   Searchinn.Clear;
        IF (Sender as TEdit).Name<>'Searchid'      THEN   Searchid.Clear;
        IF (Sender as TEdit).Name<>'Searchpasspin' THEN   Searchpasspin.Clear;
        IF (Sender as TEdit).Name<>'SearchName'    THEN   SearchName.Clear;
        EditName.Clear;
        FilialName.Clear;
        ExpDataModule.KredetDataSet.Close;
        ExpDataModule.KredetDataSet.SetVariable('kli_id',-1);
        ExpDataModule.KredetDataSet.Open;
        CMCurrencyEdit1.Text:='0.00';
        EditDescription.Clear;
        exit;
      END;



     Searchpasspin.Text:=SearchCustDataSetPASSPIN.AsString;
     Searchpaspnum.Text:=SearchCustDataSetPASPNUM.AsString;
     Searchid.Text:=SearchCustDataSetID.AsString;
     Searchinn.Text:=SearchCustDataSetINN.AsString;
     Hcusttype:=SearchCustDataSetCUST_TYPE.AsInteger;
     DBLookupComboBox1.KeyValue:=FormPaymentsCredit.Account.FieldByName('id').AsInteger;


     EditName.Text:=SearchCustDataSetNAME.AsString;
     //SearchName.Text:='';

     KredetDataSet.Close;
     KredetDataSet.SetVariable('kli_id',SearchCustDataSetID.AsInteger);
     KredetDataSet.Open;


    IF KredetDataSet.RecordCount=1 then begin
                                          FilialDataSet.Close;
                                          FilialDataSet.SQL[1]:='';
                                          FilialDataSet.Open;
                                          FilialDataSet.Filtered:=False;
                                          FilialDataSet.Filter:='';
                                          FilialDataSet.Filter:='id='+KredetDataSet.FieldByName('filial').AsString;
                                          FilialDataSet.Filtered:=true;
                                          FilialName.Text:=ExpDataModule.FilialDataSet.FieldByName('name').AsString;
                                          DBLookupComboBox1.KeyValue:=KredetDataSet.FieldByName('id').AsInteger;
                                          KreditRestDataSet.Close;
                                          KreditRestDataSet.SetVariable('acc_id',KredetDataSet.FieldByName('id').AsInteger);
                                          KreditRestDataSet.Open;

                                          IF VarIsNull(KreditRestDataSet.FieldByName('rest').AsVariant)
                                          THEN CMCurrencyEdit2.Value:=0
                                          ELSE CMCurrencyEdit2.Value:=KreditRestDataSet.FieldByName('rest').AsVariant;

                                          IF VarIsNull(KreditRestDataSet.FieldByName('interestrest').AsVariant)
                                          THEN CMCurrencyEdit3.Value:=0
                                          ELSE CMCurrencyEdit3.Value:=KreditRestDataSet.FieldByName('interestrest').AsVariant;

                                          SearchName.Text:=KredetDataSet.FieldByName('acc_no').AsString;

                                        end;




    END;
  end;
  KeyD:=0;
END;

procedure TFormPaymentsCredit.SpeedButton1Click(Sender: TObject);
begin
  if (StrToFloat(CMCurrencyEdit1.Text)>0)then
  begin
  if StrToFloat(CMCurrencyEdit1.Text)<20000 then
    with FormNominalCustomers do
    begin
      Label53.Visible:=false;
      Label54.Visible:=false;
      Label55.Visible:=false;
      Label56.Visible:=false;
      Label57.Visible:=false;
      Label61.Visible:=false;
      Label62.Visible:=false;
      Label63.Visible:=false;
      Label64.Visible:=false;
      Label65.Visible:=false;
      Label66.Visible:=false;
      Label67.Visible:=false;
      Label68.Visible:=false;
      Label69.Visible:=false;
      Label70.Visible:=false;
      Label71.Visible:=false;
      Label72.Visible:=false;
      Label73.Visible:=false;
      Label74.Visible:=false;
      Label75.Visible:=false;
      Label76.Visible:=false;
      Label77.Visible:=false;
      Label78.Visible:=false;
      Label79.Visible:=false;



    end;
  if StrToFloat(CMCurrencyEdit1.Text)>=20000 then
    with FormNominalCustomers do
    begin
      GroupBox6.Visible:=True;
      GroupBox5.Visible:=True;
      GroupBox4.Visible:=True;
      GroupBox3.Visible:=True;
      Panel2.Visible   :=True;
      FormNominalCustomers.Top:=140;

      Label53.Visible:=true;
      Label54.Visible:=true;
      Label55.Visible:=true;
      Label56.Visible:=true;
      Label57.Visible:=true;
      Label61.Visible:=true;
      Label62.Visible:=true;
      Label63.Visible:=true;
      Label64.Visible:=true;
      Label65.Visible:=true;
      Label66.Visible:=true;
      Label67.Visible:=true;
      Label68.Visible:=true;
      Label69.Visible:=true;
      Label70.Visible:=true;
      Label71.Visible:=true;
      Label72.Visible:=true;
      Label73.Visible:=true;
      Label74.Visible:=true;
      Label75.Visible:=true;
      Label76.Visible:=true;
      Label77.Visible:=true;
      Label78.Visible:=true;
      Label79.Visible:=true;
    end;
    FormNominalCustomers.ShowModal;
   end
   else ShowMessage('Məbləği daxil edin!...');
end;

END.

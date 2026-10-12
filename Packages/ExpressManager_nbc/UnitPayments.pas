unit UnitPayments;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, CMCurrencyEdit, DBCtrls, CMDBSearchEdit,DB,
  SearchEdit, DBGridEh, Mask, DBCtrlsEh, DBLookupEh;

type
  TFormPayments = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    Label6: TLabel;
    FilialName: TEdit;
    Panel3: TPanel;
    Label1: TLabel;
    EditPayments: TEdit;
    Panel4: TPanel;
    Label3: TLabel;
    Panel5: TPanel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label5: TLabel;
    Panel6: TPanel;
    CMCurrencyEdit1: TCMCurrencyEdit;
    Label4: TLabel;
    Panel7: TPanel;
    Label2: TLabel;
    Label7: TLabel;
    ComboBox1: TComboBox;
    EditDescription: TEdit;
    AllFilialName: TDBLookupComboBox;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    RFilialPanel: TPanel;
    Label8: TLabel;
    RFilialname: TDBLookupComboBox;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditDescriptionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Click(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure DBLookupComboboxEh1Change(Sender: TObject);
  private
    { Private declarations }
  public
     var exid:integer;
         optype:integer;
         FForm:integer;
         FiledBatchs         :boolean;
         FiledIncoming       :boolean;
         FieldBatchsArchive  :boolean;
         FiledIncomingArchive:Boolean;

  end;

var
  FormPayments: TFormPayments;

implementation
uses ExpDataModuleUnit,ExpCustomersTypeUnit,ExpUnitImpl, UnitPaymentsCredit;

{$R *.dfm}

procedure TFormPayments.Button1Click(Sender: TObject);
var
    val_cod    :Integer;
    accid      :Variant;
    amount     :real;
    paymentname:string;
    fillialid  :Integer;
    v_id       :Integer;
    remit_inf  :string;
    stid       :integer;
    Fnumber    :integer;
    rfilialid  :integer;

begin
   if DBLookupComboboxEh1.Text='' then  Begin
                                       ShowMessage('Köçürmənin növünü seçin!');
                                       exit;
                                     End;

  if ExpCustomersType.typetext='Möhkəmləndirmə' then
  begin
    if DBLookupComboBox2.Text='' then  Begin
                                         ShowMessage('Köçürmənin valyutasını seçin!');
                                         exit;
                                       End;

    if DBLookupComboboxEh1.KeyValue=69 then  Begin
                                               ShowMessage('Göndərən Filialı  seçin!');
                                               exit;
                                             End;

  end;

  IF CMCurrencyEdit1.Value=0 THEN  Begin
                                    ShowMessage('Məbləği daxil edin!');
                                    exit;
                                   End;


 // EditDescription.Text:='';

  if ExpCustomersType.typetext<>'Möhkəmləndirmə' then
  begin
    if EditDescription.Text='' then  Begin
                                       ShowMessage('Ödənişin təyinatını daxil edin!');
                                       exit;
                                     End;
  end
  else
    EditDescription.Text:='';

   fillialid  :=ExpDataModule.FilialDataSet.FieldByName('id').AsInteger;
  if ExpCustomersType.typetext='Möhkəmləndirmə' then
  begin
   // ShowMessage(IntToStr(fillialid));
    if (DBLookupComboboxEh1.Text='AvtoKredit') and (fillialid=0) then
    begin
      ShowMessage('Bu əməliyyatı siz verə bilməsiniz!... Köçürmənin növünü düzgün seçin!');
      exit;
    end;
    //ShowMessage(DBLookupComboBox2.Text);
    if (DBLookupComboboxEh1.Text<>'AvtoKredit') and (fillialid<>0) then
    begin
      ShowMessage('Bu əməliyyatı siz verə bilməsiniz!... Köçürmənin növünü düzgün seçin!');
      exit;
    end;
  end;



  if DBLookupComboboxEh1.KeyValue=69 then rfilialid:= ExpDataModule.RFilialDataSet.FieldByName('id').AsInteger
                                     else rfilialid:=0;
  v_id       :=0;
  stid       :=DBLookupComboboxEh1.KeyValue;
  val_cod    :=DBLookupComboBox2.KeyValue;
  amount     :=CMCurrencyEdit1.Value;
  paymentname:=EditPayments.Text;
  remit_inf  :=EditDescription.Text;


  IF FForm=0 THEN
  BEGIN
    ExpDataModule.EXPESSPAC.CallProcedure('Exp_GoldenPayKomiks_insert',
                                        [ 'batchid'      ,v_id
                                         ,'v_exid'       ,exid
                                         ,'v_optype'     ,optype
                                         ,'v_setid'      ,stid
                                         ,'v_paymentname',paymentname
                                         ,'v_val_cod'    ,val_cod
                                         ,'v_amount'     ,amount
                                         ,'fillialid'    ,fillialid
                                         ,'Rfillialid'    ,rfilialid
                                         ,'v_remit_inf'  ,remit_inf]);

   v_id:=ExpDataModule.EXPESSPAC.GetParameter(0);
  END

  ELSE
    BEGIN
      v_id:=ExpDataModule.ExpBatchsDataSet.FieldByName('id').AsInteger;
      fillialid  :=ExpDataModule.FilialDataSet.FieldByName('id').AsInteger;
      ExpDataModule.EXPESSPAC.CallProcedure('Exp_GoldenPayKomiks_update',
                                           ['batchid'      ,v_id
                                           ,'v_setid'      ,stid
                                           ,'v_amount'     ,amount
                                           ,'v_remit_inf'  ,remit_inf
                                           ,'v_branchid'   ,fillialid
                                           ,'Rfilialid'    ,rfilialid ]) ;

    END;

  FormPayments.Close;
  ExpCustomersType.Close;

  ExpDataModule.ExpBatchsDataSet.Refresh;
  ExpDataModule.ExpBatchsDataSet.Locate('ID',V_ID,[]);
end;



procedure TFormPayments.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormPayments.ComboBox1Click(Sender: TObject);
begin
  EditDescription.Text:=(Sender as TComboBox).Text;
end;

procedure TFormPayments.ComboBox1DropDown(Sender: TObject);
begin
 FormPaymentsCredit.LoadComboData(TComboBox(Sender));
end;

procedure TFormPayments.DBLookupComboBox1Click(Sender: TObject);
begin
  EditDescription.Text:=ExpDataModule.Exp_settingstype.FieldByName('description').AsString;
end;

procedure TFormPayments.DBLookupComboboxEh1Change(Sender: TObject);
begin
  with ExpDataModule  do begin
                           EditDescription.Text := Exp_settingstype.FieldByName('description').AsString;
                           if DBLookupComboboxEh1.KeyValue=69 then  begin
                                                                      RFilialPanel.Visible:=True;
                                                                      RFilialDataSet.Open;
                                                                    end
                                                              else begin
                                                                      RFilialPanel.Visible:=False;
                                                                      RFilialDataSet.Close;
                                                                   end;
                           end;
  end;

procedure TFormPayments.EditDescriptionKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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

procedure TFormPayments.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ExpDataModule.ExpSetDataSet.Filter:='';
  ExpDataModule.ExpSetDataSet.Filtered:=False;
  ExpDataModule.FilialDataSet.Close;
  ExpDataModule.FilialDataSet.SQL[1]:='';
  ExpDataModule.FilialDataSet.Open;
  IF ExpDataModule.FilialDataSet.Filtered then ExpDataModule.FilialDataSet.Filtered:=False;
  if not (Button1.Visible) then Button1.Visible:=True;

end;

procedure TFormPayments.FormShow(Sender: TObject);
var
    FieldKLIID:string;
    FieldBKLIID:string;
    FieldBFILIALNAME:string;
    FieldKREDITACCID:Variant;
    FieldAMOUNT:real;
    FieldREMIT_INF:string;
    FNumber:integer;
    v_optype:integer;
begin
//  if FilialName.CanFocus then FilialName.SetFocus;
  case FForm of
  0:begin
      with  ExpDataModule do
      begin

         CMCurrencyEdit1.Value:=0.00;
         FNumber:=Repair.CallIntegerFunction('Filid',[]);
         FilialDataSet.Close;
         FilialDataSet.SQL[1]:='';
         if (ExpCustomersType.typetext<>'Möhkəmləndirmə' )
         then
          begin
            AllFilialName.Visible:=False;
            FilialName.Visible:=True;
            FilialDataSet.SQL[1]:='where id=(select filialid from sba_objinf where sysuserid=uid)';
            FilialDataSet.Open;
            FilialName.Text:=FilialDataSet.FieldByName('name').AsString;
          end
          else
            begin
              if (FNumber=0) and (ExpCustomersType.typetext='Möhkəmləndirmə') then
              begin
                //if ExpCustomersType.typecode=69 then  RFilialPanel.Visible:=True
                  //                              else  RFilialPanel.Visible:=False;

                AllFilialName.Visible:=False;
                FilialName.Visible:=True;
                FilialDataSet.SQL[1]:='where id=0';
                FilialDataSet.Open;
            //    ShowMessage(FilialDataSet.SQL.Text);
                FilialName.Text:=FilialDataSet.FieldByName('name').AsString;
              end
              else
              begin
                if (FNumber=1) and (ExpCustomersType.typetext='Möhkəmləndirmə' ) then
                begin
                //  if ExpCustomersType.typecode=69 then  RFilialPanel.Visible:=True
                //                                  else  RFilialPanel.Visible:=False;

                  AllFilialName.Visible:=False;
                  AllFilialName.Visible:=true;
                  FilialDataSet.SQL[1]:='where id<>0';
                  FilialDataSet.Open;
                  AllFilialName.KeyValue:=FilialDataSet.FieldByName('id').AsInteger;
                end;
              end;
            end;

         EditPayments.Text:=ExpCustomersType.typetext;
         Exp_settingstype.Close;
         Exp_settingstype.SetVariable('stypeid',optype);
         Exp_settingstype.Open;
         IF Exp_settingstype.RecordCount=1 THEN  begin
                                                   DBLookupComboboxEh1.KeyValue:=Exp_settingstype.FieldByName('id').AsInteger;
                                                   EditDescription.Text:=Exp_settingstype.FieldByName('description').AsString;
                                                 end
         ELSE begin
                DBLookupComboboxEh1.KeyValue:=-1;
                EditDescription.Text:='';
              end;

      end;
    end;
  1:begin
      with ExpDataModule do
      begin
        IF FiledIncoming THEN begin
                                ExpSetDataSet.Filter      :='id='+ExpIncomingDataSet.FieldByName('optype').AsString;
                                ExpSetDataSet.Filtered    :=true;
                                v_optype :=ExpIncomingDataSet.FieldByName('optype').AsInteger;
                                Exp_settingstype.Close;
                                Exp_settingstype.SetVariable('stypeid',ExpIncomingDataSet.FieldByName('optype').AsInteger);
                                Exp_settingstype.Open;
                                EditPayments.Text         :=ExpSetDataSet.FieldByName('name').AsString;
                                ExpCustomersType.typetext :=EditPayments.Text;
                                IF v_optype=7 THEN
                                 begin
                                   FNumber:=Repair.CallIntegerFunction('Filid',[]);
                                   IF FNumber=1 THEN
                                    begin
                                      FilialDataSet.Close;
                                      FilialDataSet.Filtered:=false;
                                      FilialDataSet.Filter      :='';
                                      FilialDataSet.Open;
                                      FilialDataSet.Locate('id',ExpIncomingDataSet.FieldByName('bfilial').AsVariant,[loCaseInsensitive]);
                                      FilialName.Visible:=False;
                                      AllFilialName.Visible:=True;
                                      DBLookupComboBox2.Enabled:=True;
                                      Panel7.Visible:=False;
                                      Label7.Visible:=False;
                                      AllFilialName.KeyValue:=ExpIncomingDataSet.FieldByName('bfilial').AsInteger;
                                      DBLookupComboBox2.KeyValue:=ExpIncomingDataSet.FieldByName('val_cod').AsInteger;
                                    end
                                   ELSE
                                    begin
                                      FilialDataSet.Close;
                                      FilialDataSet.Filtered:=false;
                                      FilialDataSet.Filter      :='';
                                      FilialDataSet.Filter      :='id='+ExpIncomingDataSet.FieldByName('bfilial').AsString;
                                      FilialDataSet.Open;
                                      FilialDataSet.Filtered    :=True;
                                      FilialName.Visible:=True;
                                      AllFilialName.Visible:=False;
                                      DBLookupComboBox2.Enabled:=True;
                                      Panel7.Visible:=False;
                                      Label7.Visible:=False;
                                      FilialName.Text:=FilialDataSet.FieldByName('name').AsString;
                                      DBLookupComboBox2.KeyValue:=ExpIncomingDataSet.FieldByName('val_cod').AsInteger;
                                    end;
                                 end
                                ELSE
                                 begin
                                   FilialDataSet.Close;
                                   FilialDataSet.Filtered:=false;
                                   FilialDataSet.Filter      :='';
                                   FilialDataSet.Filter      :='id='+ExpIncomingDataSet.FieldByName('filial').AsString;
                                   FilialDataSet.Open;
                                   FilialDataSet.Filtered    :=True;
                                   FilialName.Visible:=True;
                                   AllFilialName.Visible:=False;
                                   DBLookupComboBox2.Enabled:=False;
                                   Panel7.Visible:=True;
                                   Label7.Visible:=True;
                                   FilialName.Text:=FilialDataSet.FieldByName('name').AsString;
                                   DBLookupComboBox2.KeyValue:=ExpIncomingDataSet.FieldByName('val_cod').AsInteger;
                                   EditDescription.Text:=ExpIncomingDataSet.FieldByName('remit_inf').AsString;
                                 end;
                                DBLookupComboboxEh1.KeyValue:=ExpIncomingDataSet.FieldByName('setid').AsInteger;
                                CMCurrencyEdit1.Value     :=ExpIncomingDataSet.FieldByName('amount').AsFloat;

                              end;


        IF FiledBatchs THEN begin
                              ExpSetDataSet.Filter      :='id='+ExpBatchsDataSet.FieldByName('optype').AsString;
                              ExpSetDataSet.Filtered    :=true;
                              v_optype :=ExpBatchsDataSet.FieldByName('optype').AsInteger;
                              Exp_settingstype.Close;
                              Exp_settingstype.SetVariable('stypeid',ExpBatchsDataSet.FieldByName('optype').AsInteger);
                              Exp_settingstype.Open;
                              EditPayments.Text         :=ExpSetDataSet.FieldByName('name').AsString;
                              ExpCustomersType.typetext :=EditPayments.Text;
                              IF v_optype=7 THEN
                                 begin
                                   FNumber:=Repair.CallIntegerFunction('Filid',[]);
                                   IF FNumber=1 THEN
                                    begin
                                      FilialDataSet.Close;
                                      FilialDataSet.Filtered:=false;
                                      FilialDataSet.Filter      :='';
                                      FilialDataSet.Open;
                                      FilialDataSet.Locate('id',ExpBatchsDataSet.FieldByName('bfilial').AsVariant,[loCaseInsensitive]);
                                      FilialName.Visible:=False;
                                      AllFilialName.Visible:=True;
                                      DBLookupComboBox2.Enabled:=True;
                                      Panel7.Visible:=False;
                                      Label7.Visible:=False;
                                      AllFilialName.KeyValue:=ExpBatchsDataSet.FieldByName('bfilial').AsInteger;
                                      DBLookupComboBox2.KeyValue:=ExpBatchsDataSet.FieldByName('val_cod').AsInteger;
                                    end
                                   ELSE
                                    begin
                                      FilialDataSet.Close;
                                      FilialDataSet.Filtered:=false;
                                      FilialDataSet.Filter      :='';
                                      FilialDataSet.Filter      :='id='+ExpBatchsDataSet.FieldByName('bfilial').AsString;
                                      FilialDataSet.Open;
                                      FilialDataSet.Filtered    :=True;
                                      FilialName.Visible:=True;
                                      AllFilialName.Visible:=False;
                                      DBLookupComboBox2.Enabled:=True;
                                      Panel7.Visible:=False;
                                      Label7.Visible:=False;
                                      FilialName.Text:=FilialDataSet.FieldByName('name').AsString;
                                      DBLookupComboBox2.KeyValue:=ExpBatchsDataSet.FieldByName('val_cod').AsInteger;
                                    end;
                                 end
                                ELSE
                                 begin
                                   FilialDataSet.Close;
                                   FilialDataSet.Filtered:=false;
                                   FilialDataSet.Filter      :='';
                                   FilialDataSet.Filter      :='id='+ExpBatchsDataSet.FieldByName('filial').AsString;
                                   FilialDataSet.Open;
                                   FilialDataSet.Filtered    :=True;
                                   FilialName.Visible:=True;
                                   AllFilialName.Visible:=False;
                                   DBLookupComboBox2.Enabled:=False;
                                   Panel7.Visible:=True;
                                   Label7.Visible:=True;
                                   FilialName.Text:=FilialDataSet.FieldByName('name').AsString;
                                   DBLookupComboBox2.KeyValue:=ExpBatchsDataSet.FieldByName('val_cod').AsInteger;
                                   EditDescription.Text:=ExpBatchsDataSet.FieldByName('remit_inf').AsString;
                                 end;
                               DBLookupComboboxEh1.KeyValue:=ExpBatchsDataSet.FieldByName('setid').AsInteger;
                               CMCurrencyEdit1.Value     :=ExpBatchsDataSet.FieldByName('amount').AsFloat;
                            end;






       IF FiledIncomingArchive  THEN begin
                                       ExpSetDataSet.Filter      :='id='+ExpIncomingarchiveDataSet.FieldByName('optype').AsString;
                                       ExpSetDataSet.Filtered    :=true;
                                       v_optype :=ExpIncomingarchiveDataSet.FieldByName('optype').AsInteger;
                                       Exp_settingstype.Close;
                                       Exp_settingstype.SetVariable('stypeid',ExpIncomingarchiveDataSet.FieldByName('optype').AsInteger);
                                       Exp_settingstype.Open;
                                       EditPayments.Text         :=ExpSetDataSet.FieldByName('name').AsString;
                                       ExpCustomersType.typetext :=EditPayments.Text;
                                       IF v_optype=7 THEN
                                        begin
                                          FNumber:=Repair.CallIntegerFunction('Filid',[]);
                                          IF FNumber=1 THEN
                                           begin
                                             FilialDataSet.Close;
                                             FilialDataSet.Filtered:=false;
                                             FilialDataSet.Filter      :='';
                                             FilialDataSet.Open;
                                             FilialDataSet.Locate('id',ExpIncomingarchiveDataSet.FieldByName('bfilial').AsVariant,[loCaseInsensitive]);
                                             FilialName.Visible:=False;
                                             AllFilialName.Visible:=True;
                                             DBLookupComboBox2.Enabled:=True;
                                             Panel7.Visible:=False;
                                             Label7.Visible:=False;
                                             AllFilialName.KeyValue:=ExpIncomingarchiveDataSet.FieldByName('bfilial').AsInteger;
                                             DBLookupComboBox2.KeyValue:=ExpIncomingarchiveDataSet.FieldByName('val_cod').AsInteger;
                                           end
                                          ELSE
                                           begin
                                             FilialDataSet.Close;
                                             FilialDataSet.Filtered:=false;
                                             FilialDataSet.Filter      :='';
                                             FilialDataSet.Filter      :='id='+ExpIncomingarchiveDataSet.FieldByName('bfilial').AsString;
                                             FilialDataSet.Open;
                                             FilialDataSet.Filtered    :=True;
                                             FilialName.Visible:=True;
                                             AllFilialName.Visible:=False;
                                             DBLookupComboBox2.Enabled:=True;
                                             Panel7.Visible:=False;
                                             Label7.Visible:=False;
                                             FilialName.Text:=FilialDataSet.FieldByName('name').AsString;
                                             DBLookupComboBox2.KeyValue:=ExpIncomingarchiveDataSet.FieldByName('val_cod').AsInteger;
                                           end;
                                        end
                                       ELSE
                                        begin
                                          FilialDataSet.Close;
                                          FilialDataSet.Filtered:=false;
                                          FilialDataSet.Filter      :='';
                                          FilialDataSet.Filter      :='id='+ExpIncomingarchiveDataSet.FieldByName('filial').AsString;
                                          FilialDataSet.Open;
                                          FilialDataSet.Filtered    :=True;
                                          FilialName.Visible:=True;
                                          FilialName.Visible:=True;
                                          AllFilialName.Visible:=False;
                                          DBLookupComboBox2.Enabled:=False;
                                          Panel7.Visible:=True;
                                          Label7.Visible:=True;
                                          FilialName.Text:=FilialDataSet.FieldByName('name').AsString;
                                          DBLookupComboBox2.KeyValue:=ExpIncomingarchiveDataSet.FieldByName('val_cod').AsInteger;
                                          EditDescription.Text:=ExpIncomingarchiveDataSet.FieldByName('remit_inf').AsString;
                                        end;
                                       DBLookupComboboxEh1.KeyValue:=ExpIncomingarchiveDataSet.FieldByName('setid').AsInteger;
                                       CMCurrencyEdit1.Value     :=ExpIncomingarchiveDataSet.FieldByName('amount').AsFloat;
                                   end;


        IF FieldBatchsArchive THEN begin
                                     ExpSetDataSet.Filter      :='id='+ExpBatchsArchiveDataSet.FieldByName('optype').AsString;
                                     ExpSetDataSet.Filtered    :=true;
                                     v_optype :=ExpBatchsArchiveDataSet.FieldByName('optype').AsInteger;
                                     Exp_settingstype.Close;
                                     Exp_settingstype.SetVariable('stypeid',ExpBatchsArchiveDataSet.FieldByName('optype').AsInteger);
                                     Exp_settingstype.Open;
                                     EditPayments.Text         :=ExpSetDataSet.FieldByName('name').AsString;
                                     ExpCustomersType.typetext :=EditPayments.Text;
                                     IF v_optype=7 THEN
                                      begin
                                        FNumber:=Repair.CallIntegerFunction('Filid',[]);
                                        IF FNumber=1 THEN
                                         begin
                                           FilialDataSet.Close;
                                           FilialDataSet.Filtered:=false;
                                           FilialDataSet.Filter      :='';
                                           FilialDataSet.Open;
                                           FilialDataSet.Locate('id',ExpBatchsArchiveDataSet.FieldByName('bfilial').AsVariant,[loCaseInsensitive]);
                                           FilialName.Visible:=False;
                                           AllFilialName.Visible:=True;
                                           DBLookupComboBox2.Enabled:=True;
                                           Panel7.Visible:=False;
                                           Label7.Visible:=False;
                                           AllFilialName.KeyValue:=ExpBatchsArchiveDataSet.FieldByName('bfilial').AsInteger;
                                           DBLookupComboBox2.KeyValue:=ExpBatchsArchiveDataSet.FieldByName('val_cod').AsInteger;
                                         end
                                        ELSE
                                         begin
                                           FilialDataSet.Close;
                                           FilialDataSet.Filtered:=false;
                                           FilialDataSet.Filter      :='';
                                           FilialDataSet.Filter      :='id='+ExpBatchsArchiveDataSet.FieldByName('bfilial').AsString;
                                           FilialDataSet.Open;
                                           FilialDataSet.Filtered    :=True;
                                           FilialName.Visible:=True;
                                           AllFilialName.Visible:=False;
                                           DBLookupComboBox2.Enabled:=True;
                                           Panel7.Visible:=False;
                                           Label7.Visible:=False;
                                           FilialName.Text:=FilialDataSet.FieldByName('name').AsString;
                                           DBLookupComboBox2.KeyValue:=ExpBatchsArchiveDataSet.FieldByName('val_cod').AsInteger;
                                         end;
                                        end
                                       ELSE
                                        begin
                                          FilialDataSet.Close;
                                          FilialDataSet.Filtered:=false;
                                          FilialDataSet.Filter      :='';
                                          FilialDataSet.Filter      :='id='+ExpBatchsArchiveDataSet.FieldByName('filial').AsString;
                                          FilialDataSet.Open;
                                          FilialDataSet.Filtered    :=True;
                                          FilialName.Visible:=True;
                                          FilialName.Visible:=True;
                                          AllFilialName.Visible:=False;
                                          DBLookupComboBox2.Enabled:=False;
                                          Panel7.Visible:=True;
                                          Label7.Visible:=True;
                                          FilialName.Text:=FilialDataSet.FieldByName('name').AsString;
                                          DBLookupComboBox2.KeyValue:=ExpBatchsArchiveDataSet.FieldByName('val_cod').AsInteger;
                                          EditDescription.Text:=ExpBatchsArchiveDataSet.FieldByName('remit_inf').AsString;
                                        end;
                                       DBLookupComboboxEh1.KeyValue:=ExpBatchsArchiveDataSet.FieldByName('setid').AsInteger;
                                       CMCurrencyEdit1.Value     :=ExpBatchsArchiveDataSet.FieldByName('amount').AsFloat;
                                   end;

      end;



      end;
    end;

  end;


end.

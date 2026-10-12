unit UnitCustProps;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, DBCtrls, ExtCtrls, StdCtrls, Mask, ComCtrls, SBCustomer, Db,
  Variants,
  DBCtrlsEh, Buttons, ToolWin, Grids, DBGrids, CustomersImpl, CO_CustRelations,
  DBGridEh, XFSCtrls, DBLookupEh;

type
  TFrmCustProps = class(TForm)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label1: TLabel;
    OpenDateEdit: TDateTimePicker;
    NameEdit: TDBEdit;
    RelationCB: TDBLookupComboBox;
    GroupCB: TDBLookupComboBox;
    EstateTypeCB: TDBLookupComboBox;
    OrganizationTypeCB: TDBLookupComboBox;
    ActionAreaCB: TDBLookupComboBox;
    BranchCB: TDBLookupComboBox;
    ClientClosedCB: TCheckBox;
    ClientClosedPanel: TPanel;
    CloseDateEdit: TDateTimePicker;
    IsNotResidentCB: TDBCheckBox;
    OKPOCodeEdit: TDBEdit;
    TazAreaCB: TDBLookupComboBox;
    TaxIDEdit: TDBEdit;
    BankIDEdit: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit2: TDBEdit;
    ActionList1: TActionList;
    InfoView: TAction;
    IpInfoView: TAction;
    GroupBox2: TGroupBox;
    GroupBox9: TGroupBox;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label51: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label61: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Address_type: TDBLookupComboBox;
    CountryByConctType: TDBLookupComboBox;
    CityByConctType: TDBLookupComboBox;
    tph_contact_type: TDBLookupComboBox;
    tph_communication_type: TDBLookupComboBox;
    tph_country_prefix: TDBLookupComboBox;
    DBEdit_CountryCode: TDBEdit;
    Label2: TLabel;
    Label4: TLabel;
    DBEdit6: TDBEdit;
    Db_tph_number: TDBEdit;
    Db_tph_extension: TDBEdit;
    Label14: TLabel;
    Label20: TLabel;
    db_tph_state: TDBEdit;
    DB_tph_zip: TDBEdit;
    db_tph_adress: TDBEdit;
    DBEdit5: TDBEdit;
    DBLC_INCORP_CNTR: TDBLookupComboBox;
    DB_INCORP_STATE: TDBEdit;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    DBLC_RiskCateg: TDBLookupComboBox;
    Dpt_Nal: TDBDateTimeEditEh;
    Dtp_Ustav: TDBDateTimeEditEh;
    Label29: TLabel;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton1: TToolButton;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    ToolButton5: TToolButton;
    DBLC_cust_risk_desc: TDBLookupComboBox;
    Label30: TLabel;
    Label31: TLabel;
    DBDateTimeSamelyDate: TDBDateTimeEditEh;
    XFGroupBox6: TXFGroupBox;
    id_quality_DBLookupComboboxEh: TDBLookupComboboxEh;
    ButtonMeyar: TXFButton;
    Label32: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ClientClosedCBClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Dpt_Nal1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ButtonMeyarClick(Sender: TObject);
  private
    { Private declarations }
    FCustomerParams: TCustomer;
    FClientClosed: Boolean;
    FChanged: Boolean;
    procedure SetCustomerParams(Customer: TCustomer);
    property CustomerParams: TCustomer read FCustomerParams
      write SetCustomerParams;
    procedure SetClientClosed(Value: Boolean);
  public
    { Public declarations }
    procedure Reset;
    function New: Boolean;
    procedure Edit(ID: Integer);
    property ClientClosed: Boolean read FClientClosed write SetClientClosed;
  end;

var
  FrmCustProps: TFrmCustProps;

implementation

{$R *.DFM}

uses CO_datamod_impl, OracleData, SBCore, CustInfoFormImpl, SBTranslateProc,
  sboapiDataModuleImpl, CO_PhotoLogo, Unit_id_quality, Pep_changeUnit,customers_operation_impl;

function TFrmCustProps.New: Boolean;
begin
  Reset;
  CO_DataMod.Customers.Insert;
  InfoView.Visible := False;
  ToolButton2.Visible := False;
  Dtp_Ustav.Value := null;
  Dpt_Nal.Value := null;
  DBDateTimeSamelyDate.Value := null;
  id_quality_DBLookupComboboxEh.Enabled:=true;
  FrmCustProps.id_quality_DBLookupComboboxEh.KeyValue:=CO_DataMod.Ods_cust_quality.Lookup('name','Yüksək','id');
  ButtonMeyar.Visible:=false;
  ShowModal;
  Result := FChanged;
end;

procedure TFrmCustProps.Edit(ID: Integer);
var
  Customer: TCustomer;
begin
  //Reset;
  CO_DataMod.OracleDataSet1.Edit;
   // showmessage('1') ;
  CO_DataMod.Customers.Edit;
  //showmessage('2') ;
  Sb_GetCustomer(ID, Customer);
  CustomerParams := Customer;
  InfoView.Visible := True;
  if not CO_DataMod.Customers.FieldByName('dat_ustav').IsNull then
    Dtp_Ustav.Value := CO_DataMod.Customers.FieldByName('dat_ustav').AsVariant
  else
    Dtp_Ustav.Value := null;

  if not CO_DataMod.Customers.FieldByName('dat_nal').IsNull then
    Dpt_Nal.Value := CO_DataMod.Customers.FieldByName('dat_nal').AsVariant
  else
    Dpt_Nal.Value := null;

 if not CO_DataMod.Customers.FieldByName('samelydate').IsNull then
    DBDateTimeSamelyDate.Value := CO_DataMod.Customers.FieldByName('samelydate').AsVariant
  else
    DBDateTimeSamelyDate.Value := null;

   if CO_DataMod.Customers.RecordCount>0 then
   begin
   ButtonMeyar.Visible:=true
   end ;

   if id_quality_DBLookupComboboxEh.Text<>'' then
    id_quality_DBLookupComboboxEh.Enabled:=false;
{ if not CO_DataMod.Customers.FieldByName('quality_id').IsNull then
    id_quality_DBLookupComboboxEh.Value := CO_DataMod.Customers.FieldByName('quality_id').AsVariant
  else
    id_quality_DBLookupComboboxEh.Value := 0;
    }


  ToolButton2.Visible := True;
  ToolButton2.Enabled := True;
  ShowModal;
end;

procedure TFrmCustProps.Reset;
var
  CurrentDay: TDateTime;
begin
  FChanged := False;
  CurrentDay := Sb_GetSystemDate();
  OpenDateEdit.DateTime := CurrentDay;
  CloseDateEdit.DateTime := CurrentDay;
  ClientClosed := False;
end;

procedure TFrmCustProps.SetCustomerParams(Customer: TCustomer);
begin
  FCustomerParams := Customer;

  with CustomerParams do
  begin
    OpenDateEdit.DateTime := OpenDate;
    CloseDateEdit.DateTime := CloseDate;
    ClientClosed := CloseDate <> NullDate;

    CO_DataMod.Relation.DataSet.Locate('ID', RelationID, []);
  end;
end;

procedure TFrmCustProps.ToolButton1Click(Sender: TObject);
begin
  if not Assigned(FrmLoqo) then
    FrmLoqo := TFrmLoqo.Create(Self);

  if ToolButton1.Down = True then
  begin
    FrmLoqo.Show;
  end
  else
  begin
    FrmLoqo.Close;
  end;

end;

procedure TFrmCustProps.ToolButton2Click(Sender: TObject);
var
  CustIDs: String;
  i, index: Integer;
begin
  if not Assigned(FormCustRelations) then
    FormCustRelations := TFormCustRelations.Create(Self);

    CO_DataMod.Customers_relations.Close;
    CO_DataMod.Customers_relations.SetVariable('v_custid',
      CO_DataMod.Customers.FieldByName('ID').AsInteger);
    CO_DataMod.Customers_relations.Open;
    CO_DataMod.Customers_relations.First;
    CustIDs := CO_DataMod.Customers_relations.FieldByName('CUSTID2').AsString;

      for i := 1 to CO_DataMod.Customers_relations.RecordCount - 1 do
      begin
        CO_DataMod.Customers_relations.Next;
        CustIDs := CustIDs + ',' + CO_DataMod.Customers_relations.FieldByName
          ('CUSTID2').AsString;
      end;
      FormCustRelations.ShowModal;
     { with CustomerInfoForm, CustInfoData do
      begin
        ClearVariables;
        Close;
        SetVariable('customerid', CustIDs);
        // CO_DataMod.Customers.fields[0].AsVariant);
        Open;
        ShowModal;
      end; }

end;
   {
      if not Assigned(FormCustomers) then
        FormCustomers := TFormCustomers.Create(Self);
      FormCustomers.ShowModal;

      if FormCustomers.vCustId <> -1 then
      begin
        sb_CustInfo.CallProcedure('add_cust_relations',
          ['v_custid', CO_DataMod.Customers.FieldByName('ID').AsInteger,
          'v_custid2', FormCustomers.vCustId]);
        Customers_relations.Refresh;

        with Customers_relations, TabControl do
        begin
          Tabs.Clear;
          First;
          for Index := 0 to RecordCount - 1 do
          begin
            Tabs.Add(Customers_relationsWORKPOST_NAME.AsString + ' (ID ' +
              Customers_relations.FieldByName('custid2').AsString + ')');
            // Format('Kart N-%d', [Index]));
            Next;
          end;
          First;
        end;

        with CustomerInfoForm do
        begin
          Customers_relations.Close;
          Customers_relations.SetVariable('v_custid',
            CO_DataMod.Customers.FieldByName('ID').AsInteger);
          Customers_relations.Open;
          Customers_relations.First;
          CustIDs := Customers_relations.FieldByName('CUSTID2').AsString;

          if Customers_relations.RecordCount <> 0 then
          begin

            for i := 1 to Customers_relations.RecordCount - 1 do
            begin
              Customers_relations.Next;
              CustIDs := CustIDs + ',' + Customers_relations.FieldByName
                ('CUSTID2').AsString;
            end;

            with CustomerInfoForm, CustInfoData do
            begin
              ClearVariables;
              Close;
              SetVariable('customerid', CustIDs);
              // CO_DataMod.Customers.fields[0].AsVariant);
              Open;
              ShowModal;
            end;
            // fill_edit.click;
          end;
        end;
      end;  }



function ShowRedMessage(const AText: string): Boolean;
var
  F: TForm;
  L: TLabel;
  BtnYes, BtnNo: TButton;
begin
  F := TForm.Create(nil);
  try
    F.Caption := 'Diqqət!';
    F.Width := 600;
    F.Height := 120;
    F.Position := poScreenCenter;
    F.BorderStyle := bsDialog;

    // --- Qırmızı xəbərdarlıq mətni ---
    L := TLabel.Create(F);
    L.Parent := F;
    L.Caption := AText;
    L.Font.Size := 12;
    L.Font.Color := clRed;
    L.Font.Style := [fsBold];
    L.AutoSize := True;
    L.Left := 30;
    L.Top := 30;

    // --- Bəli düyməsi ---
    BtnYes := TButton.Create(F);
    BtnYes.Parent := F;
    BtnYes.Caption := 'Bəli';
    BtnYes.ModalResult := mrYes;
    BtnYes.Left := 200;
    BtnYes.Top := 70;
    BtnYes.Width := 80;
    BtnYes.Height := 22;

    // --- Xeyr düyməsi ---
    BtnNo := TButton.Create(F);
    BtnNo.Parent := F;
    BtnNo.Caption := 'Xeyr';
    BtnNo.ModalResult := mrNo;
    BtnNo.Left := 300;
    BtnNo.Top := 70;
    BtnNo.Width := 80;
    BtnNo.Height := 22;

    Result := (F.ShowModal = mrYes);
  finally
    F.Free;
  end;
end;




procedure TFrmCustProps.ToolButton4Click(Sender: TObject);
var
black:string;
ins,ins1:integer;
begin

  if label27.Visible=true then
                         begin
  if NameEdit.Text = '' then
  begin
    ShowMessage('Müştərinin adını daxil edin!');
    Exit;
  end;
  end;

   if DBEdit1.Text = '' then
  begin
    ShowMessage('Müştərinin qısa adını daxil edin!');
    Exit;
  end;


 {zaur if EstateTypeCB.Text = '' then
  begin
    ShowMessage('Mülkiyyət növünü daxil edin!');
    Exit;
  end; }
         if label21.Visible=true then
                                begin
  if DBEdit2.Text = '' then
  begin
    ShowMessage('Müştərinin dövlət qeydiyyat nömrəsini daxil edin!');
    Exit;
  end;
                                end;
    if label29.Visible=true then
                           begin
  if DBLC_RiskCateg.KeyValue = null then
  begin
    ShowMessage('Müştərinin risk kateqoriyasını daxil edin!');
    Exit;
  end;
                           end;
         if label26.Visible=true then
                                begin
  if TaxIDEdit.Text = '' then
  begin
    ShowMessage('Müştərinin vöen-nin daxil edin!');
    Exit;
  end;
                                     end;
                                     if label23.Visible=true then
                                                            begin
  if Dpt_Nal.Value = null then
  begin
    ShowMessage('Müştərinin DVM-də qeydə alındığı tarixi daxil edin!');
    Exit;
  end;
                                                            end;
      if label22.Visible=true then
                             begin
  if Dtp_Ustav.Value = null then
  begin
    ShowMessage('Müştərinin Nizamnaməsi qeydə alındığı tarixi daxil edin!');
    Exit;
  end;
                             end;
      if label31.Visible=true then
                             begin
   if DBDateTimeSamelyDate.Value = null then
  begin
    ShowMessage('Müştərinin Eyniləşdirmə tarixini daxil edin!');
    Exit;
  end;

                             end;
            if label24.Visible=true then
                                   begin
  if DBLC_INCORP_CNTR.KeyValue = null then
  begin
    ShowMessage('Hüquqi şəxsin mənsub olduğu ölkəni daxil edin!');
    Exit;
  end;
                                   end;
    if label61.Visible=true then
                           begin
  if Address_type.KeyValue = '' then
  begin
    ShowMessage('Müştərinin əlaqə növün daxil edin!');
    Exit;
  end;
                           end;
          if label65.Visible=true then
                                 begin
  if CountryByConctType.KeyValue = null then
  begin
    ShowMessage('Müştərinin əlaqə növünə görə ölkəni daxil edin!');
    Exit;
  end;
                                 end;
            if label66.Visible=true then
                                   begin
  if CityByConctType.KeyValue = null then
  begin
    ShowMessage('Müştərinin əlaqə növünə görə şəhəri daxil edin!');
    Exit;
  end;
      end;
                 if label25.Visible=true then
                                        begin
  if db_tph_adress.Text = '' then
  begin
    ShowMessage('Müştərinin əlaqə növünə görə adresin daxil edin!');
    Exit;
  end;
                                        end;
    if label67.Visible=true then
                           begin
  if tph_contact_type.KeyValue = '' then
  begin
    ShowMessage
      ('Müştərinin Əlaqə növünə görə telefon nömrəsinin tipin daxil edin!');
    Exit;
  end;

        end;
        if label68.Visible=true then
                               begin
  if tph_communication_type.KeyValue = '' then
  begin
    ShowMessage
      ('Müştərinin Rabitə növünə görə telefon nömrəsinin tipin daxil edin!');
    Exit;
  end;

                               end;
                               if label69.Visible=true then
                                                      begin
  if Db_tph_number.Text = '' then
  begin
    ShowMessage('Müştərinin əlaqə növünə görə telefon nömrəsini daxil edin!');
    Exit;
  end;
                                                      end;

  with CO_DataMod.Customers do
  begin
    FChanged := True;
    FieldByName('ID').Required := False;
    FieldByName('OPEN_DAT').AsDateTime := OpenDateEdit.DateTime;
    FieldByName('Dat_Nal').AsVariant := Dpt_Nal.Value;
    FieldByName('Dat_Ustav').AsVariant := Dtp_Ustav.Value;
    FieldByName('SamelyDate').AsVariant := DBDateTimeSamelyDate.Value;


          if (NameEdit.Text<>'') and(pep_chek<>-1)then
               begin
               Pep_change := TPep_change.Create(nil);
               Pep_change.Position := poMainFormCenter;
               //Pep_change.Edit1.Text:= p_Lastname;
               //Pep_change.Edit2.Text:= p_FirstName;
               Pep_change.ShowModal;
               exit;
         end;


     black:= CO_DataMod.PG_PCustService.CallStringFunction('GET_WORLD_YOXLAMA',[trim(NameEdit.Text),null]);
    if (black <>'') then
    begin
     if ShowRedMessage('DIQQƏT! Bu müştəri qara siyahıdadır! Risk şöbəsinə müraciət edin!') then

     begin
      ShowMessage('Davam edilir...');
       ins1 := 1
     end
      else
      begin
      ShowMessage('Əməliyyat dayandırıldı.');
       ins1:=-1;
       exit;
      end;

    end;


    if  (Pep_change.Memo1.Lines.Count>2)  then
     begin
     if ShowRedMessage('DIQQƏT! Bu müştəri siyasi nufuzlu şəxslər siyahısındadı! Risk şöbəsinə müraciət edin!') then
     begin
      ShowMessage('Davam edilir...');
       ins := 1
     end
      else
      begin
      ShowMessage('Əməliyyat dayandırıldı.');
       ins:=-1;
       exit;
      end;
     end;




    Post;
    ApplyUpdates([aaInsert, aaUpdate]);
    CommitUpdates;
  end;
  Close;

end;

procedure TFrmCustProps.ToolButton5Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCustProps.FormCanResize(Sender: TObject;
  var NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;
end;

procedure TFrmCustProps.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with CO_DataMod.Customers do
    if State = dsInsert then
    begin
      Cancel;
      CancelUpdates;
    end;
   // ButtonMeyar.Visible:=false;
end;

procedure TFrmCustProps.FormCreate(Sender: TObject);
var j:integer;
 aa : string;

begin
  with CO_DataMod do
  begin
    Customers.Open;
    RelationData.Open;
    ClientGroupData.Open;
    EstateTypeData.Open;
    OrganizationTypeData.Open;
    ActionAreaData.Open;
    BranchData.Open;
    TaxAreaData.Open;
  end;

    j:=CO_DataMod.OPackage.CallIntegerFunction('get_Messaj',['customers','open_dat']);
      if j=0 then Label28.Visible:=false
           else
                 Label28.Visible:=true;


       j:=CO_DataMod.OPackage.CallIntegerFunction('get_Messaj',['customers','name']);
   if j=0 then Label27.Visible:=false
          else
                Label27.Visible:=true;



       j:=CO_DataMod.OPackage.CallIntegerFunction('get_Messaj',['customers','risk_categ']);
   if j=0 then Label29.Visible:=false
          else
                Label29.Visible:=true;



       j:=CO_DataMod.OPackage.CallIntegerFunction('get_Messaj',['customers','samelydate']);
   if j=0 then Label31.Visible:=false
          else
                Label31.Visible:=true;


     j:=CO_DataMod.OPackage.CallIntegerFunction('get_Messaj',['customers','inn']);
   if j=0 then Label26.Visible:=false
          else
                Label26.Visible:=true;


                j:=CO_DataMod.OPackage.CallIntegerFunction('get_Messaj',['customers','dat_ustav']);
   if j=0 then Label22.Visible:=false
          else
                Label22.Visible:=true;




                j:=CO_DataMod.OPackage.CallIntegerFunction('get_Messaj',['customers','incorporation_cntr']);
   if j=0 then Label24.Visible:=false
          else
                Label24.Visible:=true;



        j:=CO_DataMod.OPackage.CallIntegerFunction('get_Messaj',['customers','address_type']);
   if j=0 then Label61.Visible:=false
          else
               Label61.Visible:=true;


        j:=CO_DataMod.OPackage.CallIntegerFunction('get_Messaj',['customers','city']);
   if j=0 then Label66.Visible:=false
          else
               Label66.Visible:=true;


        j:=CO_DataMod.OPackage.CallIntegerFunction('get_Messaj',['customers','address']);
   if j=0 then Label25.Visible:=false
          else
               Label25.Visible:=true;


        j:=CO_DataMod.OPackage.CallIntegerFunction('get_Messaj',['customers','tph_contact_type']);
   if j=0 then Label67.Visible:=false
          else
               Label67.Visible:=true;


        j:=CO_DataMod.OPackage.CallIntegerFunction('get_Messaj',['customers','tph_communication_type']);
   if j=0 then Label68.Visible:=false
          else
               Label68.Visible:=true;



        j:=CO_DataMod.OPackage.CallIntegerFunction('get_Messaj',['customers','tph_number']);
   if j=0 then Label69.Visible:=false
          else
               Label69.Visible:=true;


                j:=CO_DataMod.OPackage.CallIntegerFunction('get_Messaj',['customers','incorporation_number']);
   if j=0 then Label21.Visible:=false
          else
               Label21.Visible:=true;



                j:=CO_DataMod.OPackage.CallIntegerFunction('get_Messaj',['customers','dat_nal']);
   if j=0 then Label23.Visible:=false
          else
               Label23.Visible:=true;



                j:=CO_DataMod.OPackage.CallIntegerFunction('get_Messaj',['customers','country_code']);
   if j=0 then Label65.Visible:=false
          else
               Label65.Visible:=true;





 SBTranslateProc.TranslateAllCompForms(Self, sboapiDataModule.OrPack_SL);



end;
procedure TFrmCustProps.SetClientClosed(Value: Boolean);
begin
  FClientClosed := Value;
  // ClientClosedPanel.Visible := Value;
  CloseDateEdit.Enabled := Value;
  ClientClosedCB.Checked := Value;
end;

procedure TFrmCustProps.ButtonMeyarClick(Sender: TObject);
var

cust_quality:Integer;
begin
Formid_quality:=TFormid_quality.create(self);

with CO_DataMod   do
begin
//showmessage(inttostr(Customers.FieldByName('id').AsInteger));
///Ods_cust_id_quality.ClearVariables;
Ods_cust_id_quality1.close;
Ods_custid_quality.close;
Ods_custid_quality.SetVariable('custid',Customers.FieldByName('id').AsInteger);

Ods_cust_id_quality1.SetVariable('custid',Customers.FieldByName('id').AsInteger);
Ods_custid_quality.open;
Ods_cust_id_quality1.open;

 end;

Formid_quality.ShowModal ;



end;

procedure TFrmCustProps.ClientClosedCBClick(Sender: TObject);
begin
  ClientClosed := (Sender as TCheckBox).Checked;
end;

procedure TFrmCustProps.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_RETURN then
    SelectNext(ActiveControl, True, True);
end;

procedure TFrmCustProps.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TFrmCustProps.Dpt_Nal1Change(Sender: TObject);
begin
  with CO_DataMod, Customers do
    FieldByName('dat' + (copy((Sender as tcomponent).name, 4, 10))).Value :=
      (Sender as TDateTimePicker).DateTime;
end;

end.

unit Properties_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, Buttons, StdCtrls, SearchEdit, CurrencyEdit,
  Db, OracleData, Oracle, Spin, DBCtrls,FileCtrl, DBCGrids, DBViewComboBox;

type
  TPropertiesForm = class(TForm)
    But_cancel: TBitBtn;
    DataXSAccount: TOracleDataSet;
    DS_XSAccount: TDataSource;
    DataTemp: TOracleDataSet;
    PackConfig: TOraclePackage;
    Panel1: TPanel;
    Panel4: TPanel;
    GroupBox4: TGroupBox;
    DBGrid2: TDBGrid;
    Panel7: TPanel;
    Combo_valute: TComboBox;
    Valute_ID: TListBox;
    Panel8: TPanel;
    SpeedButton3: TSpeedButton;
    SearchXsAccount: TSearchEdit;
    Panel3: TPanel;
    GroupBox3: TGroupBox;
    SpeedButton5: TSpeedButton;
    Edit_limit: TCurrencyEdit;
    GroupBox1: TGroupBox;
    Panel5: TPanel;
    GroupBox5: TGroupBox;
    Panel10: TPanel;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Panel11: TPanel;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    GroupBox2: TGroupBox;
    Panel6: TPanel;
    But_in: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Edit_IN_Dir: TEdit;
    Panel12: TPanel;
    But_out: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Edit_out_dir: TEdit;
    GroupBox6: TGroupBox;
    DBGrid3: TDBGrid;
    Panel13: TPanel;
    Edit_transcode_name: TEdit;
    Edit_transCode_value: TSpinEdit;
    SpeedButton13: TSpeedButton;
    Commision: TOracleDataSet;
    DS_Commision: TDataSource;
    Panel15: TPanel;
    but_archive: TSpeedButton;
    SpeedButton16: TSpeedButton;
    Edit_archiv_dir: TEdit;
    SpeedButton12: TSpeedButton;
    Label1: TLabel;
    Edit_Account: TEdit;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox7: TGroupBox;
    Panel14: TPanel;
    SpeedButton14: TSpeedButton;
    DBText1: TDBText;
    DBLookupComboBox1: TDBLookupComboBox;
    Panel2: TPanel;
    Panel16: TPanel;
    Edit_TransType_name: TEdit;
    SpeedButton17: TSpeedButton;
    DBCtrlGrid1: TDBCtrlGrid;
    DBText2: TDBText;
    SpeedButton15: TSpeedButton;
    Panel9: TPanel;
    ComFilial: TDBViewComboBox;
    DataFilial: TOracleDataSet;
    DSFilial: TDataSource;
    DBGrid1: TDBGrid;
    DS_XSBranchAccount: TDataSource;
    OrDSXS_BranchAccount: TOracleDataSet;
    SearchEditXS_BranchAccount: TSearchEdit;
    BtnXS_BranchAccountOK: TSpeedButton;
    Label4: TLabel;
    SpeedButton2: TSpeedButton;
    Admin_: TSpeedButton;
    Button1: TButton;
    SpeedButton4: TSpeedButton;
    procedure Edit_AccountKeyPress(Sender: TObject; var Key: Char);
    procedure But_outClick(Sender: TObject);
    procedure But_inClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure But_cancelClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure but_archiveClick(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure BtnXS_BranchAccountOKClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Admin_Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    Dir : String;

    { Public declarations }
  end;

var
  PropertiesForm: TPropertiesForm;

implementation

uses data_unit, LVPCSSImpl, Unit_setting, Admin_Setting, account_admin,Vergi_Unit;

{$R *.DFM}

procedure TPropertiesForm.Edit_AccountKeyPress(Sender: TObject; var Key: Char);
begin
   IF NOT(KEY IN ['0'..'9',#8])  THEN KEY :=  #0;
end;

procedure TPropertiesForm.But_outClick(Sender: TObject);
begin
   selectdirectory('Select Out directory','',dir);
   if dir <>'' then
   Edit_out_dir.Text:=Dir;
end;

procedure TPropertiesForm.But_inClick(Sender: TObject);
begin
   selectdirectory('Select In directory','',dir);
   if dir <>'' then
   Edit_IN_Dir.Text:=dir;
end;

procedure TPropertiesForm.SpeedButton1Click(Sender: TObject);
begin
   if trim(Edit_Account.text)='' then exit;
   PackConfig.CallProcedure('xs_config_change',[1,Edit_Account.Text]);
   MessageDlg('Qebul Olundu!',mtInformation,[mbok],0); 
end;

procedure TPropertiesForm.But_cancelClick(Sender: TObject);
begin
    close;
end;

procedure TPropertiesForm.SpeedButton5Click(Sender: TObject);
begin
   if trim(Edit_limit.text)='' then exit;
   PackConfig.CallProcedure('xs_config_change',[2,Edit_limit.Value]);
   MessageDlg('Qebul Olundu!',mtInformation,[mbok],0);
end;

procedure TPropertiesForm.SpeedButton6Click(Sender: TObject);
begin
   if trim(Edit_IN_Dir.text)='' then exit;
   PackConfig.CallProcedure('xs_config_change',[3,Edit_in_dir.Text]);
   MessageDlg('Qebul Olundu!',mtInformation,[mbok],0);
   {}
   LVPCSSForm.UpdateFileInList;
end;

procedure TPropertiesForm.SpeedButton7Click(Sender: TObject);
begin
   if trim(Edit_out_Dir.text)='' then exit;
   PackConfig.CallProcedure('xs_config_change',[4,Edit_out_dir.Text]);
   MessageDlg('Qebul Olundu!',mtInformation,[mbok],0);
end;

procedure TPropertiesForm.SpeedButton3Click(Sender: TObject);
begin
   if SearchXsAccount.Text = '' then exit;
   begin
   PackConfig.CallProcedure('xs_accounts_add',[strtoint(valute_id.items[combo_valute.itemindex]),
                                               DataMod.DataAccount.fieldbyname('id').asinteger,
                                               DataFilial.fieldbyname('id').asinteger]);
   SearchXsAccount.clear;
   DataXSAccount.Refresh;
   end;
end;

procedure TPropertiesForm.SpeedButton12Click(Sender: TObject);
begin
  if (trim(Edit_transcode_name.Text)='')or
     (DBCtrlGrid1.DataSource.DataSet.RecordCount = 0)
   then exit;
  begin
    PackConfig.CallProcedure('xs_transtype_code_change',[DataMod.TransTypeName.FieldByName('id').AsInteger,
                                                         Edit_transcode_name.text,
                                                         Edit_transcode_value.value]);
    Edit_transcode_name.Clear;
    Edit_transCode_value.Value:=0;
    DataMod.TransTypeCode.Refresh;
  end;
end;

procedure TPropertiesForm.SpeedButton13Click(Sender: TObject);
begin
   if (DataMod.TransTypeCode.RecordCount >0) then
   begin
       PackConfig.CallProcedure('xs_transtype_code_delete',[DataMod.TransTypeCode.fieldbyname('code').asinteger]);
       DataMod.TransTypeCode.Refresh;
   end;

end;

procedure TPropertiesForm.SpeedButton14Click(Sender: TObject);
begin
   if Commision.RecordCount =0  then exit;
   PackConfig.CallProcedure('xs_Config_Commision_Change',[Commision.fieldbyname('id').asinteger]);

end;

procedure TPropertiesForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = Vk_escape then close;
end;

procedure TPropertiesForm.but_archiveClick(Sender: TObject);
begin
   selectdirectory('Select Archive directory','',dir);
   if dir <>'' then
   Edit_archiv_dir.Text:=Dir;
end;

procedure TPropertiesForm.SpeedButton16Click(Sender: TObject);
begin
   if trim(Edit_archiv_dir.text)='' then exit;
   PackConfig.CallProcedure('xs_config_change',[5,Edit_archiv_dir.Text]);
   MessageDlg('Qebul Olundu!',mtInformation,[mbok],0);
end;

procedure TPropertiesForm.SpeedButton15Click(Sender: TObject);
begin
   if Trim(Edit_transtype_name.Text)='' then exit;
   if DataMod.TransTypeName.Locate('NAME',Edit_transtype_name.text,[]) then
      MessageDlg('Bu ad movcuddur!',mtWarning,[mbok],0);
      PackConfig.CallProcedure('xs_transtype_name_change',[0,
                                                           Edit_transtype_name.text,
                                                           1]);
   Edit_transtype_name.Clear;
   DataMod.TransTypeName.Refresh;
end;

procedure TPropertiesForm.SpeedButton17Click(Sender: TObject);
begin
      if DataMod.TransTypeName.RecordCount = 0 then exit;
      if MessageDlg('Bu ad movcuddur!',mtWarning,[mbyes,mbno],0)=mryes
      then
      PackConfig.CallProcedure('xs_transtype_name_change',[DataMod.TransTypeName.FieldByName('id').AsInteger,
                                                           '',0]);
      DataMod.TransTypeName.Refresh;

end;

procedure TPropertiesForm.BtnXS_BranchAccountOKClick(Sender: TObject);
begin
  if SearchEditXs_BranchAccount.Text = '' then exit;
  begin
   PackConfig.CallProcedure('XS_BranchAccount_Add',[StrToInt(Valute_ID.Items[Combo_Valute.ItemIndex]),
                             DataMod.DataAccount.FieldByName('ID').AsInteger,
                             DataFilial.FieldByName('ID').AsInteger]);
   SearchXsAccount.clear;
   OrDSXS_BranchAccount.Refresh;
  end;
end;

procedure TPropertiesForm.SpeedButton2Click(Sender: TObject);
begin
   Form_Setting.ShowModal;
end;

procedure TPropertiesForm.Admin_Click(Sender: TObject);
begin
   DataMod.ODS_Ad_Sett_Fili.Active:=True;
   DataMod.ODS_Admin_in.Active:=True;
   with DataMod.ODS_Admin_Setting do
   begin
      Open;
      if UpperCase(Session.LogonUsername) = 'SMART' then
      begin
         Form_Admin_Setting.ShowModal;
      end else
      begin
         Application.MessageBox('ACCESS DENIED!','Admin Setting',0);
      end;
   end;
end;

procedure TPropertiesForm.Button1Click(Sender: TObject);
begin
  VergiForm.ShowModal;
end;

procedure TPropertiesForm.SpeedButton4Click(Sender: TObject);
begin
  if Acccount.OracleDataSet1.Active=false then Acccount.OracleDataSet1.Open;
  Acccount.ShowModal;

end;

end.

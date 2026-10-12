unit Properties_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, Buttons, StdCtrls, SearchEdit, CurrencyEdit,
  Db, OracleData, Oracle, Spin, DBCtrls;

type
  TPropertiesForm = class(TForm)
    But_cancel: TBitBtn;
    HOXAccount: TOracleDataSet;
    HoxDataSource: TDataSource;
    ForAll: TOracleDataSet;
    Proper_pack: TOraclePackage;
    SWAccount: TOracleDataSet;
    SWDataSource: TDataSource;
    Panel1: TPanel;
    Panel4: TPanel;
    GroupBox4: TGroupBox;
    DBGrid2: TDBGrid;
    Panel7: TPanel;
    Combo_valute: TComboBox;
    Valute_ID: TListBox;
    Panel8: TPanel;
    SpeedButton3: TSpeedButton;
    search_hox: TSearchEdit;
    Panel9: TPanel;
    SpeedButton4: TSpeedButton;
    search_swift: TSearchEdit;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    GroupBox3: TGroupBox;
    SpeedButton5: TSpeedButton;
    Edit_limit: TCurrencyEdit;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    Edit_hox: TEdit;
    Panel5: TPanel;
    SpeedButton2: TSpeedButton;
    Edit_swift: TEdit;
    GroupBox5: TGroupBox;
    Panel10: TPanel;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Edit_swIN: TEdit;
    Panel11: TPanel;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    Edit_swOUT: TEdit;
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
    SpeedButton12: TSpeedButton;
    Edit_transcode_name: TEdit;
    Edit_transCode_value: TSpinEdit;
    SpeedButton13: TSpeedButton;
    Panel14: TPanel;
    DBLookupComboBox1: TDBLookupComboBox;
    SpeedButton14: TSpeedButton;
    Commision: TOracleDataSet;
    commision_DataSource: TDataSource;
    DBText1: TDBText;
    procedure Edit_hoxKeyPress(Sender: TObject; var Key: Char);
    procedure But_outClick(Sender: TObject);
    procedure But_inClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure But_cancelClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
  private
    { Private declarations }
  public
    GetIndir,GetOutdir,SW_GetIndir,SW_GetOutdir: boolean;
    { Public declarations }
  end;

var
  PropertiesForm: TPropertiesForm;

implementation

uses SelDialog,data_unit,sboapiDataModuleImpl;

{$R *.DFM}

procedure TPropertiesForm.Edit_hoxKeyPress(Sender: TObject; var Key: Char);
begin
   IF NOT(KEY IN ['0'..'9',#8])  THEN KEY :=  #0;
end;

procedure TPropertiesForm.But_outClick(Sender: TObject);
begin
   GetOUTdir:=true;
   SelDirFrm.ShowModal;
end;

procedure TPropertiesForm.But_inClick(Sender: TObject);
begin
   GetINdir:=true;
   SelDirFrm.ShowModal;
end;

procedure TPropertiesForm.SpeedButton1Click(Sender: TObject);
begin
   if trim(edit_hox.text)='' then exit;
   Proper_pack.CallProcedure('UPD_proper',[2,Edit_Hox.Text]);
end;

procedure TPropertiesForm.SpeedButton2Click(Sender: TObject);
begin
   if trim(Edit_swift.text)='' then exit;
   Proper_pack.CallProcedure('UPD_proper',[1,Edit_swift.Text]);
end;

procedure TPropertiesForm.But_cancelClick(Sender: TObject);
begin
    close;
end;

procedure TPropertiesForm.SpeedButton5Click(Sender: TObject);
begin
   if trim(edit_hox.text)='' then exit;
   Proper_pack.CallProcedure('UPD_proper',[3,Edit_limit.Value]);
end;

procedure TPropertiesForm.SpeedButton6Click(Sender: TObject);
begin
   if trim(Edit_IN_Dir.text)='' then exit;
   Proper_pack.CallProcedure('UPD_proper_dir',[2,1,Edit_in_dir.Text]);
end;

procedure TPropertiesForm.SpeedButton7Click(Sender: TObject);
begin
   if trim(Edit_out_Dir.text)='' then exit;
   Proper_pack.CallProcedure('UPD_proper_dir',[2,2,Edit_out_dir.Text]);
end;

procedure TPropertiesForm.SpeedButton4Click(Sender: TObject);
begin
   if search_swift.Text = '' then exit;
   Proper_pack.CallProcedure('addto_hoxswaccount',[1,valute_id.items[combo_valute.itemindex],DataMod.Account_data.fieldbyname('id').asinteger]);
   search_swift.Clear;
   SWAccount.Refresh;
end;

procedure TPropertiesForm.SpeedButton3Click(Sender: TObject);
begin
   if search_hox.Text = '' then exit;
   begin
//   ShowMessage(valute_id.items[combo_valute.itemindex]);
   Proper_pack.CallProcedure('addto_hoxswaccount',[2,strtoint(valute_id.items[combo_valute.itemindex]),DataMod.Account_data.fieldbyname('id').asinteger]);
   search_hox.clear;

   HOXAccount.Refresh;
   end;
end;

procedure TPropertiesForm.SpeedButton8Click(Sender: TObject);
begin
   sw_GetINdir:=true;
   SelDirFrm.ShowModal;
end;

procedure TPropertiesForm.SpeedButton10Click(Sender: TObject);
begin
   sw_GetOUTdir:=true;
   SelDirFrm.ShowModal;
end;

procedure TPropertiesForm.SpeedButton9Click(Sender: TObject);
begin
   if trim(Edit_swIN.text)='' then exit;
   Proper_pack.CallProcedure('UPD_proper_dir',[1,1,Edit_swIN.Text]);
end;

procedure TPropertiesForm.SpeedButton11Click(Sender: TObject);
begin
   if trim(Edit_swout.text)='' then exit;
   Proper_pack.CallProcedure('UPD_proper_dir',[1,2,Edit_swout.Text]);
end;

procedure TPropertiesForm.SpeedButton12Click(Sender: TObject);
begin
  if trim(Edit_transcode_name.Text)='' then exit;
  begin
    Proper_pack.CallProcedure('INS_UPD_TRANSCODE',[edit_transcode_name.text,edit_transcode_value.value]);
    Edit_transcode_name.Clear;
    Edit_transCode_value.Value:=0;
    DataMod.TransTypeCode.Refresh;
  end;
end;

procedure TPropertiesForm.SpeedButton13Click(Sender: TObject);
begin
   if (DataMod.TransTypeCode.RecordCount >0) then
   begin
       Proper_pack.CallProcedure('DEL_TRANSTYPE_CODE',[DataMod.TransTypeCode.fieldbyname('code').asinteger]);
       DataMod.TransTypeCode.Refresh;
   end;

end;

procedure TPropertiesForm.SpeedButton14Click(Sender: TObject);
begin
   if Commision.RecordCount =0  then exit;
   Proper_pack.CallProcedure('UPD_TransType',[Commision.fieldbyname('id').asinteger]);

end;

end.

unit propertyUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, DB, OracleData, GridsEh, DBGridEh, StdCtrls,
  ExtCtrls, Oracle,CommonDecls, Menus;

type
  TFormProperty = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    EditFin: TEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    OracleDataSet1: TOracleDataSet;
    OracleDataSet2: TOracleDataSet;
    GroupBox1: TGroupBox;
    DBGridEh1: TDBGridEh;
    GroupBox2: TGroupBox;
    DBGridEh2: TDBGridEh;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    OracleDataSet1ID: TFloatField;
    OracleDataSet1PIN: TWideStringField;
    OracleDataSet1OLD_ADDRESS: TWideStringField;
    OracleDataSet1REGISTRATION_NUMBER: TWideStringField;
    OracleDataSet1REYESTR_NUMBER: TWideStringField;
    OracleDataSet1TYPE_ID: TWideStringField;
    OracleDataSet1TYPE_NAME: TWideStringField;
    OracleDataSet2GUARID: TFloatField;
    OracleDataSet2ASAN_ID: TFloatField;
    OracleDataSet2FIN: TWideStringField;
    OracleDataSet2OLD_ADDRESS: TWideStringField;
    OracleDataSet2REGISTRATION_NUMBER: TWideStringField;
    OracleDataSet2REYESTR_NUMBER: TWideStringField;
    OracleDataSet2TYPE_ID: TWideStringField;
    OracleDataSet2TYPE_NAME: TWideStringField;
    OracleQuery1: TOracleQuery;
    PopupMenu1: TPopupMenu;
    SeilmiiSil1: TMenuItem;
    OracleQuery2: TOracleQuery;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SeilmiiSil1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormProperty: TFormProperty;

implementation
 uses sboapiDataModuleImpl,GuaranteImpl  ;
{$R *.dfm}

procedure TFormProperty.Button1Click(Sender: TObject);
begin
if EditFin.text='' then
begin
   showmessage('FIN daxil edilmeyib  !');
   exit;
end
   else
   begin
with OracleDataSet1 do
begin
  close;
    SetVariable('v_pin',EditFin.text);
  open;
  Refresh;
end;
   end;
end;

procedure TFormProperty.Button2Click(Sender: TObject);

 var
  v_asan_id: Integer;
begin

  v_asan_id := OracleDataSet1.FieldByName('id').AsInteger;


  if OracleDataSet2.Locate('asan_id', v_asan_id, []) then
  begin
    ShowMessage('Bu məlumat  artıq sistemdə mövcuddur!');
    Exit;
  end;

  if v_asan_id>0 then
    begin
  with OracleQuery1 do
  begin
    ClearVariables;
    SQL.Clear;
    SQL.Add('INSERT INTO cm_guar_property (guarid, asan_id, fin, old_address, registration_number, reyestr_number, type_id, type_name)');
    SQL.Add('VALUES (:p_guarid, :p_asan_id, :p_pin, :p_old_address, :p_reg_num, :p_reyestr_num, :p_type_id, :p_type_name)');

    DeclareVariable('p_guarid',      otInteger);
    DeclareVariable('p_asan_id',     otInteger);
    DeclareVariable('p_pin',         otString);
    DeclareVariable('p_old_address', otString);
    DeclareVariable('p_reg_num',     otString);
    DeclareVariable('p_reyestr_num', otString);
    DeclareVariable('p_type_id',     otString);
    DeclareVariable('p_type_name',   otString);

    SetVariable('p_guarid',      Get_SelectedCrdID);
    SetVariable('p_asan_id',     v_asan_id);
    SetVariable('p_pin',         OracleDataSet1.FieldByName('pin').AsString);
    SetVariable('p_old_address', OracleDataSet1.FieldByName('old_address').AsString);
    SetVariable('p_reg_num',     OracleDataSet1.FieldByName('registration_number').AsString);
    SetVariable('p_reyestr_num', OracleDataSet1.FieldByName('reyestr_number').AsString);
    SetVariable('p_type_id',     OracleDataSet1.FieldByName('type_id').AsString);
    SetVariable('p_type_name',   OracleDataSet1.FieldByName('type_name').AsString);

    Execute;
    Session.Commit;
  end;

    end;

  OracleDataSet2.Close;
  OracleDataSet2.Open;


end;

procedure TFormProperty.Button3Click(Sender: TObject);
begin
FormProperty.Close;
end;

procedure TFormProperty.FormClose(Sender: TObject; var Action: TCloseAction);
begin
EditFin.Clear;
with OracleDataSet1 do
begin
  close;
    SetVariable('v_pin','');
  open;
  Refresh;
end;
end;

procedure TFormProperty.FormShow(Sender: TObject);
begin
with OracleDataSet2 do
begin
  close;
  SetVariable('v_id',Get_SelectedCrdID);
  open;
end;
end;

procedure TFormProperty.SeilmiiSil1Click(Sender: TObject);
begin
    with OracleQuery2 do
begin

  SQL.Clear;

  SQL.Add('DELETE FROM cm_guar_property');
  SQL.Add('WHERE asan_id = :p_asan_id');

  DeclareVariable('p_asan_id', otInteger);

  SetVariable('p_asan_id', OracleDataSet2.FieldByName('asan_id').AsInteger);

  Execute;
  Session.Commit;
 OracleDataSet2.close;
 OracleDataSet2.open;
end;
end;

end.

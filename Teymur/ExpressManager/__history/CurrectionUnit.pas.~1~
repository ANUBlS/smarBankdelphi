unit CurrectionUnit;

interface

uses
  Windows, Messages, SysUtils, Variants,Classes, Graphics, Controls, Forms, Dialogs,ExpDataModuleUnit,
  DBCtrls, StdCtrls, ExtCtrls, NLSLocalizer, Mask, DBCtrlsEh, sboapiDataModuleImpl,SearchEdit;

type
  TFormCurrection = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    DBLookupComboBox1: TDBLookupComboBox;
    Edit3: TEdit;
    Edit2: TEdit;
    Edit1: TEdit;
    GroupBox3: TGroupBox;
    ComboBox1: TComboBox;
    Edit4: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label9: TLabel;
    DBDateEdit: TDBDateTimeEditEh;
    Edit8: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    SearchPincode: TSearchEdit;
    Button1: TButton;
    procedure ComboBox1Change(Sender: TObject);
    procedure SearchPincodeKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private
    { Private declarations }
  public
     procedure clear;
    { Public declarations }
  end;

var
  FormCurrection: TFormCurrection;

implementation

uses ExpUnitImpl;

{$R *.DFM}

procedure TFormCurrection.ComboBox1Change(Sender: TObject);
begin
  Case ComboBox1.Itemindex of
    0:begin
        Edit6.Text:='AZE';
        edit6.ReadOnly:=true;
        Edit7.MaxLength:=8;
        Edit7.Clear;
      end;
    1:begin
        Edit6.Text:='AZE';
        edit6.ReadOnly:=true;
        Edit7.MaxLength:=8;
        Edit7.Clear;
      end;
    2:begin
        edit6.ReadOnly:=false;
        Edit6.Text:='';
        Edit7.MaxLength:=0;
        Edit7.Clear;
      end;
  end;
end;

procedure TFormCurrection.SearchPincodeKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (SearchPincode.Color <>clred) and(SearchPincode.Text<>'') then
   begin
     Edit4.Text                :=SearchPincode.Text;
     ComboBox1.ItemIndex       :=ExpDataModule.ExpBatchsDataSet.fieldbyname('bkindpassport').AsInteger;
     Edit6.Text                :=ExpDataModule.ExpBatchsDataSet.fieldbyname('bpassper').asstring;
     Edit7.Text                :=ExpDataModule.ExpBatchsDataSet.fieldbyname('bpaspnum').asstring;
     DBLookupComboBox2.KeyValue:=ExpDataModule.ExpBatchsDataSet.fieldbyname('bpaspplace').AsString;
     DBDateEdit.Value          :=ExpDataModule.ExpBatchsDataSet.fieldbyname('bpaspdate').AsVariant;
     Edit8.Text                :=ExpDataModule.ExpBatchsDataSet.fieldbyname('badress').AsString;
     Edit1.Text                :=ExpDataModule.ExpBatchsDataSet.fieldbyname('blastname').AsString;
     Edit2.Text                :=ExpDataModule.ExpBatchsDataSet.fieldbyname('bfirstname').AsString;
     Edit3.Text                :=ExpDataModule.ExpBatchsDataSet.fieldbyname('bmidname').AsString;
   end
  else SearchPincode.Clear;
end;

procedure TFormCurrection.Button1Click(Sender: TObject);
var  v_bpincod      :string;
     v_bkindpassport:integer;
     v_bpassper     :string;
     v_bpaspnum     :string;
     v_bpaspplace   :string;
     v_bpaspdate    :variant;
     v_badress      :string;
     v_blastname    :string;
     v_bfirstname   :string;
     v_bmidname     :string;
     v_bfilial      :variant;
     v_senddatetime :TDateTime;
     s              :string;
     v_password     :string;
     id             :integer;

begin
  with ExpDataModule do
  begin
    id             :=ExpBatchsDataSet.fieldbyname('id').asinteger;
    v_bpincod      :=SearchPincode.Text;
    v_bkindpassport:=ComboBox1.ItemIndex;
    v_bpassper     :=Edit6.Text;
    v_bpaspnum     :=Edit7.Text;
    if DBLookupComboBox2.KeyValue =null then v_bpaspplace:=''
    else  v_bpaspplace   :=DBLookupComboBox2.KeyValue;
    v_bpaspdate    :=DBDateEdit.Value;
    v_badress      :=Edit8.Text;
    v_blastname    :=Edit1.Text;
    v_bfirstname   :=Edit2.Text;
    v_bmidname     :=Edit3.Text;
    if DBLookupComboBox1.KeyValue =null then v_bfilial:=null
    else v_bfilial  :=DBLookupComboBox1.KeyValue;
    v_senddatetime:=SysdateDataSet.fieldbyname('dat').AsDateTime;
    //ICECrypt1.CryptType:=cHASH_CRC32;
    //ICECrypt1.Text:=DateTimeToStr(v_senddatetime);
    s:=DateTimeToStr(v_senddatetime);//ICECrypt1.GetCrypted;
    //ICECrypt1.CryptType:=cHASH_GOST;
    //ICECrypt1.Text:=s;
    v_password:=s;//ICECrypt1.GetCrypted;

    Repair.CallProcedure('Exp_CorectionBatchs_update',
                                     [id,
                                      v_bpincod,
                                      v_bkindpassport,
                                      v_bpassper,
                                      v_bpaspnum,
                                      v_bpaspplace,
                                      v_bpaspdate,
                                      v_badress,
                                      v_blastname,
                                      v_bfirstname,
                                      v_bmidname,
                                      v_bfilial,
                                      v_senddatetime,
                                      v_password]);
   close;
   ExpBatchsDataSet.Refresh;
   ExpBatchsDataSet.Locate('ID',ID,[]);
 end;   
end;

procedure TFormCurrection.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormCurrection.clear;
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit6.Clear;
  Edit7.Clear;
  Edit8.Clear;
  DBDateEdit.Value:=null;
  DBLookupComboBox1.KeyValue:=null;
  DBLookupComboBox2.KeyValue:=null;
  ComboBox1.ItemIndex:=-1;
end;

end.

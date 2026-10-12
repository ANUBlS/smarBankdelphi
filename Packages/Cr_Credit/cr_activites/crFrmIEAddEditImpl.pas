unit crFrmIEAddEditImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, StdCtrls, Mask, DBCtrlsEh, DBLookupEh, DBCtrls, DBGridEh
  ;

type                          
  TFrmIEAddEdit = class(TForm)
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CBBranch: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    IEAccountList: TOracleDataSet;
    BranchList: TOracleDataSet;
    BranchListNAME: TWideStringField;
    DataSrcIEAccountList: TDataSource;
    DataSrcBranchList: TDataSource;
    CurrencyList: TOracleDataSet;
    CurrencyListVALUTE: TIntegerField;
    CurrencyListVAL_NAME: TWideStringField;
    DataSrcCurrencyList: TDataSource;
    BranchListID: TFloatField;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    IEAccountListID: TFloatField;
    IEAccountListACC_NO: TWideStringField;
    IEAccountListVAL_ACC: TIntegerField;
    IEAccountListNAME: TWideStringField;
    IEAccountListFILIAL: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmIEAddEdit: TFrmIEAddEdit;

implementation
uses cractImpl,sboapiDataModuleImpl;
{$R *.DFM}

procedure TFrmIEAddEdit.FormCreate(Sender: TObject);
begin
 IEAccountList.open;//conin elavesi
CurrencyList.open;
BranchList.open 
end;

procedure TFrmIEAddEdit.FormDestroy(Sender: TObject);
begin
IEAccountList.closeall;
CurrencyList.closeall;
BranchList.closeall      
end;

procedure TFrmIEAddEdit.Button1Click(Sender: TObject);
begin
  with ActFrom.LinkValuesData do
  Post;
  ModalResult := mrOK;
end;

procedure TFrmIEAddEdit.Button2Click(Sender: TObject);
begin
  with ActFrom.LinkValuesData do
  Cancel;
  ModalResult := mrOK;
end;

end.

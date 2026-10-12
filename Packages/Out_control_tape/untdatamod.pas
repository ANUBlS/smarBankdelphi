unit untdatamod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Oracle, OracleData;

type
  Tcontrol_tape_mod = class(TDataModule)
    ForMoney: TOracleDataSet;
    ForTable: TOracleDataSet;
    ForTableBAL_CN1: TFloatField;
    ForTableAMMOUNTS: TFloatField;
    ForTableLAMMOUNTS: TFloatField;
    DataSource1: TDataSource;
    BanksName: TOracleDataSet;
    Group: TOracleDataSet;
    GroupBAL_CN1: TFloatField;
    GroupAMMOUNT: TFloatField;
    GroupLAMMOUNT: TFloatField;
    GroupVAL_ACC: TFloatField;
    GroupCURRENCYNAME: TWideStringField;
    GroupOperationDate: TWideStringField;
    OraclePackage1: TOraclePackage;
    ODSTransactionView: TOracleDataSet;
    ODSTransactionViewBALANCEACCOUNT: TFloatField;
    ODSTransactionViewDEBIT: TWideStringField;
    ODSTransactionViewDEBITCURRENCY: TIntegerField;
    ODSTransactionViewDVALNAME: TWideStringField;
    ODSTransactionViewCREDIT: TWideStringField;
    ODSTransactionViewCREDITCURRENCY: TIntegerField;
    ODSTransactionViewCVALNAME: TWideStringField;
    ODSTransactionViewDEBITAMMOUNT: TFloatField;
    ODSTransactionViewCREDITAMMOUNT: TFloatField;
    ODSTransactionViewCOMMONAMMOUNT: TFloatField;
    ODSTransactionViewNAME: TWideStringField;
    Branch: TOracleDataSet;
    BranchData: TDataSource;
    procedure GroupCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  control_tape_mod: Tcontrol_tape_mod;

implementation

uses sboapiDataModuleImpl, ControlTapeImpl;
{$R *.DFM}

procedure Tcontrol_tape_mod.GroupCalcFields(DataSet: TDataSet);
begin
 with DataSet, FrmControlTape do
  FieldByName('OperationDate').AsString :=FormatDateTime('dd/mm/yyyy',DoDate.DateTime)

end;

end.

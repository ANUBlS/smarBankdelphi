unit TransactionsDocDataModUnit;

interface            //   TransactionsDocDataMod.ProvarchData

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Db, OracleData;

type
  TTransactionsDocDataMod = class(TDataModule)
    ProvarchData: TOracleDataSet;
    ProvarchSource: TDataSource;
    TransDocPackage: TOraclePackage;
    ProvarchDataID: TFloatField;
    ProvarchDataOP_ID: TFloatField;
    ProvarchDataNO_PROV: TStringField;
    ProvarchDataDAT: TDateTimeField;
    ProvarchDataDEBT: TFloatField;
    ProvarchDataKREDIT: TFloatField;
    ProvarchDataVAL_ACC: TFloatField;
    ProvarchDataVID_OP: TIntegerField;
    ProvarchDataAMMOUNT: TFloatField;
    ProvarchDataLAMMOUNT: TFloatField;
    ProvarchDataTIM: TDateTimeField;
    ProvarchDataSHIFR: TIntegerField;
    ProvarchDataNO_PACK: TIntegerField;
    ProvarchDataKASSA_B: TIntegerField;
    ProvarchDataKASSA_Z: TIntegerField;
    ProvarchDataNO_FILIAL: TIntegerField;
    ProvarchDataSLOJ_PROV: TIntegerField;
    ProvarchDataBANK_D: TFloatField;
    ProvarchDataBANK_K: TFloatField;
    ProvarchDataNO_DOC: TIntegerField;
    ProvarchDataNO_MEM: TIntegerField;
    ProvarchDataD1: TStringField;
    ProvarchDataK1: TStringField;
    ProvarchDataRATE_D: TFloatField;
    ProvarchDataRATE_C: TFloatField;
    ProvarchDataPARENTID: TIntegerField;
    ProvarchDataCURRENCYID_C: TIntegerField;
    ProvarchDataAMMOUNT_C: TFloatField;
    ProvarchDataNAME: TStringField;
    ProvarchDataDEBIT: TStringField;
    ProvarchDataCREDIT: TStringField;
    ProvarchDataCURRENCYDEB: TStringField;
    ProvarchDataCURRENCYCRED: TStringField;
    SysdatData: TOracleDataSet;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TransactionsDocDataMod: TTransactionsDocDataMod;

implementation

uses sboapiDataModuleImpl;
{$R *.DFM}

procedure TTransactionsDocDataMod.DataModuleDestroy(Sender: TObject);
begin
  TransactionsDocDataMod:= nil;
end;

end.

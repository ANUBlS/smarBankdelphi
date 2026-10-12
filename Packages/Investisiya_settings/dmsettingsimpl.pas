unit dmsettingsimpl;

interface

uses
  SysUtils, Classes, DB, OracleData;

type
  Tdmsettings = class(TDataModule)
    DsInvestType: TOracleDataSet;
    Ds_İnvest_time: TOracleDataSet;
    DsrInvestType: TDataSource;
    Dsr_İnvest_time: TDataSource;
    DsInvestTypeID: TFloatField;
    DsInvestTypeNAME: TWideStringField;
    Ds_İnvest_timeID: TFloatField;
    Ds_İnvest_timeNAME: TWideStringField;
    DSins_acc_typesB: TOracleDataSet;
    DSins_acc_typesBID: TFloatField;
    DSins_acc_typesBNAME: TWideStringField;
    DSins_acc_bal_cn: TOracleDataSet;
    DSins_acc_bal_cnDICT_ID: TFloatField;
    DSins_acc_bal_cnBAL_CN: TFloatField;
    DSRins_acc_bal_cn: TDataSource;
    DSRins_acc_typesB: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmsettings: Tdmsettings;

implementation

{$R *.dfm}
uses  CommanParametrs,sboapiDataModuleImpl;

procedure Tdmsettings.DataModuleCreate(Sender: TObject);
begin
DsInvestType.Open;
Ds_İnvest_time.Open;
end;

procedure Tdmsettings.DataModuleDestroy(Sender: TObject);
begin
DsInvestType.Close;
Ds_İnvest_time.Close;
end;

end.

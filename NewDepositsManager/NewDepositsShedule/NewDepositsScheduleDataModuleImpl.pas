unit NewDepositsScheduleDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TNewDepositsScheduleDataModule = class(TDataModule)
    CustName: TOracleDataSet;
    DSName: TDataSource;
    OracleDataSet1: TOracleDataSet;
    DataSource1: TDataSource;
    OracleDataSet2: TOracleDataSet;
    OracleDataSet2SeqNo: TIntegerField;
    OracleDataSet2ID: TFloatField;
    OracleDataSet2ID2: TFloatField;
    OracleDataSet2HDATE: TDateTimeField;
    OracleDataSet2INTEREST: TFloatField;
    OracleDataSet2IPINTEREST: TFloatField;
    DataSource2: TDataSource;
    dm_date: TOraclePackage;
    dm_calculator: TOraclePackage;
    dm_payment_schedules: TOraclePackage;
    Dm_contracts: TOracleDataSet;
    Dm_contractsID: TFloatField;
    Dm_contractsTYPE: TFloatField;
    Dm_contractsCONTRACTNO: TWideStringField;
    Dm_contractsOPENDATE: TDateTimeField;
    Dm_contractsCLOSEDATE: TDateTimeField;
    Dm_contractsFIRSTINTERESTPAYDAT: TDateTimeField;
    Dm_contractsCONTRACTDATE: TDateTimeField;
    Dm_contractsAMOUNT: TFloatField;
    Dm_contractsCURRENCY: TFloatField;
    Dm_contractsINTEREST: TFloatField;
    Dm_contractsOVERDUEINTEREST: TFloatField;
    Dm_contractsDUEINTEREST: TFloatField;
    Dm_contractsCONTRACTTYPE: TIntegerField;
    Dm_contractsCLIENTTYPE: TFloatField;
    Dm_contractsPERSONALTYPE: TFloatField;
    Dm_contractsSID: TFloatField;
    Dm_contractsBRANCHID: TFloatField;
    Dm_contractsCUSTOMERID: TFloatField;
    Dm_contractsPERIODID: TFloatField;
    Dm_contractsCREDITSTATUS: TFloatField;
    Dm_contractsCAPITALPERID: TFloatField;
    Dm_contractsPROLANID: TFloatField;
    Dm_contractsTOCARD: TIntegerField;
    Dm_contractsAGENTID: TFloatField;
    Dm_contractsPROLONGATIONDATE: TDateTimeField;
    Dm_contractsSTOPCALCDATE: TDateTimeField;
    OdsDmContracts: TDataSource;
    dm_stored_programs: TOraclePackage;
    OracleDataSet2DAYCOUNT: TIntegerField;
    OracleDataSet2REST: TFloatField;
    procedure OracleDataSet2SeqNoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewDepositsScheduleDataModule: TNewDepositsScheduleDataModule;

implementation

{$R *.dfm}
  uses sboapiDataModuleImpl;
procedure TNewDepositsScheduleDataModule.OracleDataSet2SeqNoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
 Text := IntToStr(Sender.DataSet.RecNo);
end;

end.

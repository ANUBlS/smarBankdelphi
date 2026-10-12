unit DataModuleUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, sboapiDataModuleImpl,
  Db, OracleData, Oracle;

type
  TDataModWU = class(TDataModule)
    DataWUIncoming: TOracleDataSet;
    DSWesternUnion: TDataSource;
    TempPack: TOraclePackage;
    DataTempFile: TOracleDataSet;
    DataAccount: TOracleDataSet;
    DSAccount: TDataSource;
    DataValute: TOracleDataSet;
    DSValute: TDataSource;
    DataConfig: TOracleDataSet;
    DSConfig: TDataSource;
    DataBranch: TOracleDataSet;
    DSBranch: TDataSource;
    DataReport: TOracleDataSet;
    DSReport: TDataSource;
    DataReportDSDesigner: TDateTimeField;
    DataReportDSDesigner2: TStringField;
    DataReportDSDesigner3: TFloatField;
    DataReportDSDesigner4: TFloatField;
    DataReportDSDesigner5: TStringField;
    DataReportDSDesigner6: TStringField;
    DataReportBRANCHID: TFloatField;
    DataReportDSDesigner7: TStringField;
    DataReportComplex: TOracleDataSet;
    DSReportComplex: TDataSource;
    procedure DataReportEditError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModWU: TDataModWU;

implementation

uses WesternUnionImpl;
{$R *.DFM}
procedure TDataModWU.DataReportEditError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  with WesternUnionForm do
  begin
  ListBoxErrors.Items.Text := '[Warning] '+TimeToStr(Time)+'  ' + E.Message +
                               ListBoxErrors.Items.Text ;
  ListBoxErrors.ItemIndex :=0;
  end;
end;

end.

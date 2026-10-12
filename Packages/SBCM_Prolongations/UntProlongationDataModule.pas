unit UntProlongationDataModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TDataModuleProlongation = class(TDataModule)
    ProlongationPackage: TOraclePackage;
    DataSrcProlongations: TDataSource;
    Prolongations: TOracleDataSet;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleProlongation: TDataModuleProlongation;

implementation

uses sboapiDataModuleImpl;

{$R *.DFM}

procedure TDataModuleProlongation.DataModuleDestroy(Sender: TObject);
begin
  Prolongations.Close;
end;
  
end.

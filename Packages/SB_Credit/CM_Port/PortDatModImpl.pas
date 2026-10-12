unit PortDatModImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TPortDatMod = class(TDataModule)
    RestDatSet: TOracleDataSet;
    CrdDatSet: TOracleDataSet;
    RestDatSrc: TDataSource;
    CrdDatSrc: TDataSource;
    AvaluteDatSet: TOracleDataSet;
    UsGrDatSet: TOracleDataSet;
    PersonsDatSet: TOracleDataSet;
    CategoryDatSet: TOracleDataSet;
    CrdTypeDatSet: TOracleDataSet;
    FilialDatSet: TOracleDataSet;
    AvaluteDatSrc: TDataSource;
    FilialDatSrc: TDataSource;
    UsGrDatSrc: TDataSource;
    CrdTypeDatSrc: TDataSource;
    PersonsDatSrc: TDataSource;
    CategoryDatSrc: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PortDatMod: TPortDatMod;

implementation

{$R *.DFM}
uses CMOracleAPIDataModuleImpl;

end.

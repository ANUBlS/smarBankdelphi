unit CollectionDataModUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TCollectionDataMod = class(TDataModule)
    CollectionData: TOracleDataSet;
    DataSrcCollection: TDataSource;
    CollectionDataID: TFloatField;
    CollectionDataID2: TFloatField;
    CollectionDataHDATE: TDateTimeField;
    CollectionDataAMOUNT: TFloatField;
    CollectionDataPERCENT: TFloatField;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CollectionDataMod: TCollectionDataMod;

implementation

{$R *.DFM}

uses
   sboapiDataModuleImpl;
   
procedure TCollectionDataMod.DataModuleDestroy(Sender: TObject);
begin
  CollectionData.CloseAll;
end;

end.

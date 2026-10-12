unit DMImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TDataModuleLogs = class(TDataModule)
    odsTables: TOracleDataSet;
    Tables: TDataSource;
    LogTable: TDataSource;
    odsLogQ: TOracleDataSet;
    odsTablesID: TFloatField;
    odsTablesNAME: TStringField;
    odsTablesQUERYST: TStringField;
    odsTablesDESCRT: TStringField;
    SB_ADM: TOraclePackage;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleLogs: TDataModuleLogs;

implementation

uses sboapidatamoduleimpl;

{$R *.DFM}

procedure TDataModuleLogs.DataModuleCreate(Sender: TObject);
var i: Integer;
begin
  for i:=0 to ComponentCount-1 do begin
    if (Components[i] is TOracleDataSet)and (Components[i].tag=1) then
      (Components[i] as TOracleDataSet).Open;
  end;
end;

end.

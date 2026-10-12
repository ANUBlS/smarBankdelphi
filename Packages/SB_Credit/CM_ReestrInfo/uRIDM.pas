unit uRIDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TRIDataMod = class(TDataModule)
    ODSBanks: TOracleDataSet;
    Banks: TDataSource;
    ODSCredits: TOracleDataSet;
    Credits: TDataSource;
    ODSRep: TOracleDataSet;
    ODSNextVal: TOracleDataSet;
    ODSUpdNextVal: TOracleDataSet;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RIDataMod: TRIDataMod;

implementation

uses SboApiDataModuleImpl;

{$R *.DFM}

procedure TRIDataMod.DataModuleCreate(Sender: TObject);
var
  i: Integer;
begin
  for i:=0 to componentcount-1 do
    if (components[i] is TORacleDataSet) and (Components[i].Tag=0) then
      (components[i] as TORacleDataSet).Open;
end;

end.

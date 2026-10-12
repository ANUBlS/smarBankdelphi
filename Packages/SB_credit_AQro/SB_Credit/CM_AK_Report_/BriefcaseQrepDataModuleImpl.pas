unit BriefcaseQrepDataModuleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TBriefcaseQRepDataMod = class(TDataModule)
    ExportDataSet: TOracleDataSet;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BriefcaseQRepDataMod: TBriefcaseQRepDataMod;

implementation

{$R *.DFM}

uses CMOracleAPIDataModuleImpl;

procedure TBriefcaseQRepDataMod.DataModuleCreate(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to ComponentCount-1 do
    if Components[i].Tag = 1 then
      if not (Components[i] as TDataSet).Active then
        (Components[i] as TDataSet).Open;
end;

end.

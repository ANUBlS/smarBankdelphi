unit UnitSMSDataMod;

interface

uses
  SysUtils, Classes;

type
  TSMSDataMod = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SMSDataMod: TSMSDataMod;

implementation

uses sboapiDataModuleImpl;
{$R *.dfm}

end.

unit TrRepDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData;

type
  TDataModuleTrRep = class(TDataModule)
    odsRep: TOracleDataSet;
    odsRepOPTYPE: TFloatField;
    odsRepID: TFloatField;
    odsRepOPER: TWideStringField;
    odsRepCOMMITER: TWideStringField;
    odsRepDELETER: TWideStringField;
    odsRepDAT: TDateTimeField;
    odsRepADDTIME: TDateTimeField;
    odsRepDELETETIME: TDateTimeField;
    odsRepDEBT: TWideStringField;
    odsRepKREDIT: TWideStringField;
    odsRepAMMOUNT: TFloatField;
    odsRepLAMMOUNT: TFloatField;
    odsRepNAME: TWideStringField;
    odsRepOPTP: TWideStringField;
    sysdat: TOracleDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleTrRep: TDataModuleTrRep;

implementation

uses sboapidatamoduleimpl;

{$R *.DFM}

end.

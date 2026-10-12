unit Datamod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData;

type
  TDatamod_law = class(TForm)
    MainSclst: TOracleDataSet;
    datsrc_mainlst: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Datamod_law: TDatamod_law;

implementation


uses sboapiDataModuleImpl, SBTranslateProc  ;

{$R *.dfm}

end.

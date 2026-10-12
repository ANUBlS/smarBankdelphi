unit NewDepositsFrmAccSettingsImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, DBCtrls, XDBCtrls, DB, OracleData, StdCtrls,
  XDBGrids, Grids, DBGrids;

type
  TNewDepositsFrmAccSettings = class(TForm)
    StatusBar1: TStatusBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewDepositsFrmAccSettings: TNewDepositsFrmAccSettings;


      procedure exportproc(S:String);export;

implementation

{$R *.dfm}
uses sboapiDataModuleImpl,CommonDeclsImpl,SBTranslateProc;

procedure exportproc(S:String);export;
begin
   NewDepositsFrmAccSettings.ShowModal;
end;
exports
    exportproc;

    initialization
   NewDepositsFrmAccSettings := TNewDepositsFrmAccSettings.Create(CommonApplication)
end.

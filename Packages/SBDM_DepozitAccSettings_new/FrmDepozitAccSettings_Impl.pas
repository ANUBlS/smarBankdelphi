unit FrmDepozitAccSettings_Impl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, DBCtrls, XDBCtrls, DB, OracleData, StdCtrls,
  XDBGrids, Grids, DBGrids;

type
  TFrmDepozitAccSettings = class(TForm)
    StatusBar1: TStatusBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDepozitAccSettings: TFrmDepozitAccSettings;


      procedure exportproc(S:String);export;

implementation

{$R *.dfm}
uses sboapiDataModuleImpl,CommonDeclsImpl,SBTranslateProc;

procedure exportproc(S:String);export;
begin
   FrmDepozitAccSettings.ShowModal;
end;
exports
    exportproc;

    initialization
   FrmDepozitAccSettings := TFrmDepozitAccSettings.Create(CommonApplication)
end.

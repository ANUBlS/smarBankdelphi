unit InstallationTaskManagerPageImpl;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls, StdCtrls,
  ExtCtrls, Forms, ComServ, ComObj, StdVcl, AxCtrls,
  InstallationTaskEditFrameImpl, Grids, DBGrids, Db, OracleData;

type
  TInstallationTaskManagerPage = class(TPropertyPage)
    DataSource1: TDataSource;
    OracleDataSet1: TOracleDataSet;
    DBGrid1: TDBGrid;
    OracleDataSet1NAME: TStringField;
    OracleDataSet1DYSPLAY_NAME: TStringField;
    InstallationTaskEditFrame: TInstallationTaskEditFrame;
    procedure OracleDataSet1AfterScroll(DataSet: TDataSet);
    procedure PropertyPageDestroy(Sender: TObject);
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    procedure UpdatePropertyPage; override;
    procedure UpdateObject; override;
  end;

const
  Class_InstallationTaskManagerPage: TGUID = '{6352870F-442A-40C8-BEA2-8F36096E61B4}';

implementation

{$R *.DFM}

uses sboapiDataModuleImpl;

procedure TInstallationTaskManagerPage.UpdatePropertyPage;
begin
  { Update your controls from OleObject }
end;

procedure TInstallationTaskManagerPage.UpdateObject;
begin
  with InstallationTaskEditFrame do
    Apply;
end;

procedure TInstallationTaskManagerPage.OracleDataSet1AfterScroll(
  DataSet: TDataSet);
begin
  with InstallationTaskEditFrame do
  begin
    CloseTask;
    TaskName := DataSet.FieldByName('NAME').AsString;
    OpenTask;
  end;
end;

procedure TInstallationTaskManagerPage.PropertyPageDestroy(
  Sender: TObject);
begin
  with InstallationTaskEditFrame do
    Cancel;
end;

initialization
  TActiveXPropertyPageFactory.Create(
    ComServer,
    TInstallationTaskManagerPage,
    Class_InstallationTaskManagerPage);
end.

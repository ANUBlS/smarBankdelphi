unit expertImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, ExtCtrls, DBCtrls, Grids, DBGrids, ComCtrls, DBGridEhGrouping,
  GridsEh, DBGridEh;

type
  TExpert = class(TForm)
    OracleDataSet1: TOracleDataSet;
    DataSource1: TDataSource;
    OracleDataSet2: TOracleDataSet;
    OracleDataSet1ID: TFloatField;
    OracleDataSet1CODE: TWideStringField;
    OracleDataSet1NAME: TWideStringField;
    OracleDataSet1FILIALID: TFloatField;
    OracleDataSet2ID: TFloatField;
    OracleDataSet2NAME: TWideStringField;
    OracleDataSet1filid: TWideStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    OracleDataSet3: TOracleDataSet;
    DataSource2: TDataSource;
    DBNavigator2: TDBNavigator;
    TabSheet3: TTabSheet;
    DBNavigator3: TDBNavigator;
    OracleDataSet4: TOracleDataSet;
    DataSource3: TDataSource;
    DBGrid3: TDBGrid;
    TabSheet4: TTabSheet;
    ProblemliDSet: TOracleDataSet;
    ProblemliDSrc: TDataSource;
    DBGrid4: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBGrid5: TDBGrid;
    DBNavigator4: TDBNavigator;
    ProbUserDSet: TOracleDataSet;
    ProbUserSrc: TDataSource;
    ProbUserDSetID: TFloatField;
    ProbUserDSetDUE_ID: TFloatField;
    ProbUserDSetUSERID: TFloatField;
    UserDSet: TOracleDataSet;
    UserSrc: TDataSource;
    UserDSetID: TFloatField;
    UserDSetNAME: TWideStringField;
    ProblemliDSetID: TFloatField;
    ProblemliDSetBDAY: TFloatField;
    ProblemliDSetEDAY: TFloatField;
    ProbUserDSetuname: TStringField;
    OracleDataSet5: TOracleDataSet;
    DataSource4: TDataSource;
    DBGrid6: TDBGrid;
    DBNavigator5: TDBNavigator;
    OracleDataSet5ID: TFloatField;
    OracleDataSet5QOVID: TFloatField;
    OracleDataSet5USNAM: TWideStringField;
    OracleDataSet5username: TStringField;
    DBGrid7: TDBGrid;
    OracleDataSet6: TOracleDataSet;
    DataSource5: TDataSource;
    DBNavigator6: TDBNavigator;
    OracleDataSet1PHONE: TWideStringField;
    OracleDataSet4ID: TFloatField;
    OracleDataSet4DESCRIPTION: TWideStringField;
    OracleDataSet4ACC_NO: TWideStringField;
    OracleDataSet4SHOP_ID: TFloatField;
    OracleDataSet4CUSTID: TFloatField;
    OracleDataSet4LW_KOD: TWideStringField;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Expert: TExpert;

implementation

{$R *.DFM}
uses sboapiDataModuleImpl;
procedure TExpert.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize:=false
end;

procedure TExpert.FormCreate(Sender: TObject);
begin
PageControl1.Pages[3].TabVisible := False;
OracleDataSet1.open ;
OracleDataSet2.open  ;
OracleDataSet3.open ;
OracleDataSet4.open ;
OracleDataSet5.open ;
ProblemliDSet.Open   ;
ProbUserDSet.Open;
UserDSet.Open
end;

procedure TExpert.FormDestroy(Sender: TObject);
begin
OracleDataSet1.close ;
OracleDataSet2.close  ;
OracleDataSet3.close ;
OracleDataSet4.close ;
OracleDataSet5.close ;
ProblemliDSet.close ;
ProbUserDSet.close;
UserDSet.close
end;

end.

unit crCrTypeImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData,  CMExcelExport, StdCtrls, CheckLst,
  Evanescence, ComCtrls, ExtCtrls, Buttons, KeyListBox, DBCtrls, Grids,
  DBGrids;



type
  TCrTypeMainForm = class(TForm)
    Splitter1: TSplitter;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    DBNavigator2: TDBNavigator;
    ODSVillages: TOracleDataSet;
    ODSRegions: TOracleDataSet;
    DSVillages: TDataSource;
    DSRanges: TDataSource;
    GroupBox3: TGroupBox;
    DBGrid3: TDBGrid;
    DBNavigator3: TDBNavigator;
    ODSRegionsID: TFloatField;
    ODSRegionsNAME: TWideStringField;
    ODSRegionsNAME_ENG: TWideStringField;
    ODSRegionsZONAID: TFloatField;
    ODSVillagesID: TFloatField;
    ODSVillagesNAME: TWideStringField;
    ODSVillagesDEPEND_ID: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
  
  end;

var
  CrTypeMainForm: TCrTypeMainForm;

implementation

{$R *.DFM}

uses
  sboapiDataModuleImpl;


procedure TCrTypeMainForm.FormCreate(Sender: TObject);
begin
   ODSRegions.Open;
   ODSVillages.Open;

end;

procedure TCrTypeMainForm.FormDestroy(Sender: TObject);
begin
   ODSRegions.CloseAll;
   ODSVillages.CloseAll;

end;

end.

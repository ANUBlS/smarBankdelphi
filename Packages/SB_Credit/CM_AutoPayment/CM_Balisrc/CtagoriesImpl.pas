unit CtagoriesImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, DBCtrls, Db, OracleData, StdCtrls, Mask, DBCtrlsEh, DBLookupEh,
  Oracle;

type
  TFrmCatagories = class(TForm)
    DataSource1: TDataSource;
    OracleDataSet1: TOracleDataSet;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    OraclePackage1: TOraclePackage;
    Label1: TLabel;
    OracleDataSet1ID: TFloatField;
    OracleDataSet1DESCRIPTION: TWideStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCatagories: TFrmCatagories;

implementation
uses CMOracleAPIDataModuleImpl,UnitProgress;
{$R *.DFM}

procedure TFrmCatagories.FormCreate(Sender: TObject);
begin
OracleDataSet1.open;
end;

procedure TFrmCatagories.FormDestroy(Sender: TObject);
begin
OracleDataSet1.close;
end;

procedure TFrmCatagories.SpeedButton1Click(Sender: TObject);
 var catid :integer;
begin
catid:=FormProgress.OracleDataSet3.fieldbyname('id').asinteger;
OraclePackage1.CallProcedure('pn3_catADD',[catid,
                                           DBLookupComboboxEh1.ListSource.DataSet.fieldbyname('id').asinteger,
                                           DBLookupComboboxEh1.ListSource.DataSet.fieldbyname('DESCRIPTION').asstring
                                              ]);
DBLookupComboboxEh1.KeyValue:=null;
//FormProgress.OracleDataSet3.refresh;
OracleDataSet1.refresh;
end;

procedure TFrmCatagories.SpeedButton2Click(Sender: TObject);
begin
FormProgress.OracleDataSet3.refresh;
 close;
end;

procedure TFrmCatagories.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_ESCAPE then
               FrmCatagories.close   ;
end;

procedure TFrmCatagories.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize:=false;
end;

end.

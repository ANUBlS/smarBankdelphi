unit frmpbffilialsaccsImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  Db, OracleData, ComCtrls, StdCtrls, Grids, DBGridEh;

type
  TFrmpbfFilialsaccs = class(TForm)
    PBFFilials: TOracleDataSet;
    pbf_filialsaccount: TOracleDataSet;
    pbf_filialsaccountFILIALID: TFloatField;
    pbf_filialsaccountCURRENCY: TFloatField;
    pbf_filialsaccountACCTYPE: TStringField;
    PBFFilialsID: TFloatField;
    PBFFilialsNAME: TStringField;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    StatusBar1: TStatusBar;
    PBFFilialsds: TDataSource;
    pbf_filialsaccountds: TDataSource;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    PBFAccs: TOracleDataSet;
    PBFValutes: TOracleDataSet;
    PBFAccsID: TFloatField;
    PBFAccsACC_NO: TStringField;
    PBFValutesVALUTE: TIntegerField;
    PBFValutesVAL_NAME: TStringField;
    pbf_filialsaccountcurrencyname: TStringField;
    pbf_filialsaccountaccname: TStringField;
    pbf_filialsaccountACCID: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure smKeyPress(Sender: TObject; var Key: Char);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmpbfFilialsaccs: TFrmpbfFilialsaccs;

implementation

{$R *.DFM}
uses sboapiDataModuleImpl;

procedure TFrmpbfFilialsaccs.FormCreate(Sender: TObject);
begin
   PBFFilials.open;
   PBFAccs.open;
   PBFValutes.open;
   pbf_filialsaccount.open;
end;

procedure TFrmpbfFilialsaccs.smKeyPress(Sender: TObject; var Key: Char);
begin
   if ord(key) = VK_ESCAPE then close
end;

procedure TFrmpbfFilialsaccs.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
//  Resize := false
end;

procedure TFrmpbfFilialsaccs.DBGridEh2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (key = VK_DELETE) and (DBGridEh2.DataSource.DataSet.RecordCount>0) then
   if MessageDlg('Силинмясиня яминсинизми?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      DBGridEh2.DataSource.DataSet.Delete;
end;

end.

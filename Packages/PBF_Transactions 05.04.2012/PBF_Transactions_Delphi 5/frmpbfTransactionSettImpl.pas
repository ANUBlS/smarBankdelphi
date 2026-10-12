unit frmpbfTransactionSettImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  ComCtrls, StdCtrls, Grids, DBGridEh, Db, OracleData, ExtCtrls, DBCtrls,
  Buttons, Dialogs, ExtDlgs;

type
  TfrmpbfTransactionSett = class(TForm)
    StatusBar1: TStatusBar;
    pbfsetting: TOracleDataSet;
    pbfsettingchilds: TOracleDataSet;
    pbfsettingds: TDataSource;
    pbfsettingchildsds: TDataSource;
    pbfsettingchildsMAINID: TFloatField;
    pbfsettingchildsDEBIT: TStringField;
    pbfsettingchildsCREDIT: TStringField;
    pbfsettingchildsDESCRIPTION: TStringField;
    pbfsettingFROMFILIAL: TStringField;
    pbfsettingTOFILIAL: TStringField;
    pbfsettingID: TFloatField;
    pbfsettingchildsID: TFloatField;
    pbfsettingchildsDEBITFILIAL: TStringField;
    pbfsettingchildsKREDITFILIAL: TStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    DBGridEh1: TDBGridEh;
    GroupBox2: TGroupBox;
    DBGridEh2: TDBGridEh;
    TabSheet2: TTabSheet;
    GroupBox3: TGroupBox;
    DBGridEh3: TDBGridEh;
    GroupBox4: TGroupBox;
    DBGridEh4: TDBGridEh;
    pbfotypes: TOracleDataSet;
    dspbfotypes: TDataSource;
    pbfotypeoperationsds: TDataSource;
    pbfotypesNAME: TStringField;
    pbfotypesID: TFloatField;
    pbfotypeoperations: TOracleDataSet;
    pbfotypeoperationsID: TFloatField;
    pbfotypeoperationsMAINID: TFloatField;
    pbfotypeoperationsDEBITFILIAL: TStringField;
    pbfotypeoperationsDEBIT: TStringField;
    pbfotypeoperationsKREDITFILIAL: TStringField;
    pbfotypeoperationsCREDIT: TStringField;
    pbfotypeoperationsDESCRIPTION: TStringField;
    pbfotypeoperationsTYPE: TFloatField;
    TabSheet3: TTabSheet;
    DBGridEh5: TDBGridEh;
    pbfothersettings: TOracleDataSet;
    PbfOSFilials: TOracleDataSet;
    pbfothersettingsds: TDataSource;
    pbfothersettingsID: TFloatField;
    pbfothersettingsFILIALID: TFloatField;
    pbfothersettingsSTAMP: TBlobField;
    pbfothersettingsCHIEFSIGN: TBlobField;
    pbfothersettingsACCOUTANTSIGN: TBlobField;
    PbfOSFilialsID: TFloatField;
    PbfOSFilialsNAME: TStringField;
    DBNavigator1: TDBNavigator;
    DBImage1: TDBImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PbfOSFilialsds: TDataSource;
    DBImage2: TDBImage;
    DBImage3: TDBImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure pbfotypeoperationsBeforePost(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmpbfTransactionSett: TfrmpbfTransactionSett;

implementation

{$R *.DFM}
uses sboapiDataModuleImpl, dmpbf_transactionimpl;

procedure TfrmpbfTransactionSett.FormCanResize(Sender: TObject;
  var NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
  //Resize := false;
end;

procedure TfrmpbfTransactionSett.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
   if ORD(KEY) = VK_ESCAPE then close
end;

procedure TfrmpbfTransactionSett.FormCreate(Sender: TObject);
begin
  pbfsetting.open;
  pbfsettingchilds.open;
  pbfotypes.open;
  pbfotypeoperations.open;
  pbfothersettings.open;
  PbfOSFilials.open;

  
end;

procedure TfrmpbfTransactionSett.DBGridEh2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   with Sender as TDBGridEh do begin
   if (key = VK_DELETE) and (DataSource.DataSet.RecordCount>0) then
   if MessageDlg('Силинмясиня яминсинизми?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    DataSource.DataSet.Delete;
   end;
    
end;

procedure TfrmpbfTransactionSett.FormShow(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
     DBGridEh4.Columns[1].PickList.Clear;
   DBGridEh4.Columns[3].PickList.Clear;
   with dmpbf_transaction,kindofaccs do
   begin
      first;
      while not kindofaccs.eof do begin
      DBGridEh4.Columns[1].PickList.Add(fieldbyname('acc_no').asstring);
      DBGridEh4.Columns[3].PickList.Add(fieldbyname('acc_no').asstring);
      kindofaccs.next;
    end;
   end;

  end;

procedure TfrmpbfTransactionSett.pbfotypeoperationsBeforePost(
  DataSet: TDataSet);
begin
   pbfotypeoperations.FieldByName('Type').asInteger := 1;
end;

procedure TfrmpbfTransactionSett.BitBtn1Click(Sender: TObject);
begin
DBImage1.DataSource.DataSet.edit;
 if OpenPictureDialog1.Execute then begin
 DBImage1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
 DBImage1.DataSource.DataSet.Post;
 (DBImage1.DataSource.DataSet as TOracleDataSet).RefreshRecord;
 end;

end;

procedure TfrmpbfTransactionSett.BitBtn2Click(Sender: TObject);
begin
DBImage2.DataSource.DataSet.edit;
 if OpenPictureDialog1.Execute then begin
 DBImage2.Picture.LoadFromFile(OpenPictureDialog1.FileName);
 DBImage2.DataSource.DataSet.Post;
 (DBImage2.DataSource.DataSet as TOracleDataSet).RefreshRecord;
 end;
end;

procedure TfrmpbfTransactionSett.BitBtn3Click(Sender: TObject);
begin
DBImage3.DataSource.DataSet.edit;
 if OpenPictureDialog1.Execute then begin
 DBImage3.Picture.LoadFromFile(OpenPictureDialog1.FileName);
 DBImage3.DataSource.DataSet.Post;
 (DBImage3.DataSource.DataSet as TOracleDataSet).RefreshRecord;
 end;
end;

end.

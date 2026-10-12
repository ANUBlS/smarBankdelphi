unit co_info_unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Oracle, OracleData, ImgList, ExtDlgs, ComCtrls,Jpeg, Buttons, StdCtrls,
  ExtCtrls;

type
  TCO_Infoform = class(TForm)
    ScrollBox1: TScrollBox;
    Panel2: TPanel;
    Panel3: TPanel;
    Image2: TImage;
    BitBtn5: TBitBtn;
    BitBtn2: TBitBtn;
    Panel4: TPanel;
    Image1: TImage;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    Panel14: TPanel;
    Panel15: TPanel;
    Edit13: TEdit;
    Panel16: TPanel;
    Edit11: TEdit;
    Panel17: TPanel;
    Edit8: TEdit;
    Panel18: TPanel;
    Edit7: TEdit;
    Panel19: TPanel;
    Edit6: TEdit;
    Panel20: TPanel;
    Edit5: TEdit;
    Panel21: TPanel;
    Edit4: TEdit;
    Panel22: TPanel;
    Edit3: TEdit;
    Panel23: TPanel;
    Edit2: TEdit;
    Panel24: TPanel;
    Edit1: TEdit;
    Panel25: TPanel;
    Edit12: TEdit;
    Panel26: TPanel;
    Edit10: TEdit;
    Panel11: TPanel;
    Edit14: TEdit;
    Panel1: TPanel;
    Edit9: TEdit;
    Panel5: TPanel;
    Edit15: TEdit;
    Panel6: TPanel;
    Image3: TImage;
    BitBtn6: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox1: TGroupBox;
    Panel7: TPanel;
    Edit16: TEdit;
    Panel8: TPanel;
    Edit19: TEdit;
    Panel9: TPanel;
    Edit18: TEdit;
    Panel12: TPanel;
    Edit17: TEdit;
    Memo1: TMemo;
    Panel10: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    TabControl: TTabControl;
    ScrollBox2: TScrollBox;
    Panel13: TPanel;
    Panel27: TPanel;
    Image4: TImage;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    Panel28: TPanel;
    Image5: TImage;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    Panel29: TPanel;
    Panel30: TPanel;
    Edit20: TEdit;
    Panel31: TPanel;
    Edit21: TEdit;
    Panel32: TPanel;
    Edit22: TEdit;
    Panel33: TPanel;
    Edit23: TEdit;
    Panel34: TPanel;
    Edit24: TEdit;
    Panel35: TPanel;
    Edit25: TEdit;
    Panel36: TPanel;
    Edit26: TEdit;
    Panel37: TPanel;
    Edit27: TEdit;
    Panel38: TPanel;
    Edit28: TEdit;
    Panel39: TPanel;
    Edit29: TEdit;
    Panel40: TPanel;
    Edit30: TEdit;
    Panel41: TPanel;
    Edit31: TEdit;
    Panel42: TPanel;
    Edit32: TEdit;
    Panel43: TPanel;
    Edit33: TEdit;
    Panel44: TPanel;
    Edit34: TEdit;
    Panel45: TPanel;
    Image6: TImage;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    GroupBox2: TGroupBox;
    Panel46: TPanel;
    Edit35: TEdit;
    Panel47: TPanel;
    Edit36: TEdit;
    Panel48: TPanel;
    Edit37: TEdit;
    Panel49: TPanel;
    Edit38: TEdit;
    Memo2: TMemo;
    OpenPictureDlg: TOpenPictureDialog;
    ImageList1: TImageList;
    DSCustImages: TDataSource;
    ODSCustImages: TOracleDataSet;
    ODSCustImagesID: TFloatField;
    sb_custInfo: TOraclePackage;
    CustInfoData: TOracleDataSet;
    CustInfoDataID: TFloatField;
    CustInfoDataIDCUST: TFloatField;
    CustInfoDataSONAME: TStringField;
    CustInfoDataNAME: TStringField;
    CustInfoDataLASTNAME: TStringField;
    CustInfoDataBIRTHDAY: TDateTimeField;
    CustInfoDataBIRTHPLACE: TStringField;
    CustInfoDataPASSER: TStringField;
    CustInfoDataPASPDATE: TDateTimeField;
    CustInfoDataPASPPLACE: TStringField;
    CustInfoDataCITY: TStringField;
    CustInfoDataADDRESS: TStringField;
    CustInfoDataWORKPLACE: TStringField;
    CustInfoDataPHONE_W: TStringField;
    CustInfoDataPHONE_H: TStringField;
    CustInfoDataPHONE_M: TStringField;
    CustInfoDataE_MAIL: TStringField;
    CustInfoDataURL: TStringField;
    CustInfoDataRECOMENDATION: TStringField;
    CustInfoDataGARANTED: TStringField;
    CustInfoDataOTV_PASSPORT: TStringField;
    CustInfoDataOTV_ISSUED: TStringField;
    CustInfoDataOTV_ISDATE: TStringField;
    CustInfoDataNOTE: TStringField;
    CustInfoDataWORK: TStringField;
    CustInfoDataPASPNUM: TFloatField;
    CustInfo: TDataSource;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
     KartOpen: boolean;
    procedure ViewCustInfo(CustomerID: Integer);
  end;
    procedure GetPath;


var
  CO_Infoform: TCO_Infoform;
    Path, Path_B: String;

implementation

uses sboapiDataModuleImpl,CO_datamod_impl, UnitFrmZoom;

{$R *.DFM}

procedure GetPath;
var
  ImagesPath: String;
begin
  ImagesPath := Format('%s\..\Env\Customers', [ExtractFilePath(ParamStr(0))]);
  Path := Format('%s\temp.jpg', [ImagesPath]);
  Path_B := Format('%s\blank.jpg', [ImagesPath]);
end;

procedure TCO_InfoForm.ViewCustInfo(CustomerID: Integer);
begin
 with CO_Datamod, CustInfoData do
 Begin
   Close;
   SetVariable('CustomerID', CustomerID);
   Open;
   if RecordCount=0 then SpeedButton1.Click;
   GetPath;
   ShowModal;
 End;
end;


procedure TCO_Infoform.SpeedButton1Click(Sender: TObject);

begin
{  SpeedButton4Click(SpeedButton4);
  sb_CustInfo.CallProcedure
 ( 'add_custinfo',
 [
   'vidcust'    , CO_DataMod.ActiveCustomerList.FieldByName('ID').AsInteger
  ]
 );  }
end;

procedure TCO_Infoform.SpeedButton4Click(Sender: TObject);
begin


 (*   ODSCustImages.Edit;
    try
      Image1.Picture.SaveToFile(Path);
      TBlobField(ODSCustImages.FieldByName('PHOTO')).LoadFromFile(Path);
      Image2.Picture.SaveToFile(Path);
      TBlobField(ODSCustImages.FieldByName('CUSTSIGN')).LoadFromFile(Path);
      Image3.Picture.SaveToFile(Path);
      TBlobField(ODSCustImages.FieldByName('STAMP')).LoadFromFile(Path);
    except
      ShowMessage('Error during BlobOperation');
    end;
      *)
   { CustInfoData.Refresh;  }
 
end;




procedure TCO_Infoform.BitBtn10Click(Sender: TObject);
begin
 FormZoom := TFormZoom.create(self);
 FormZoom.Height := Image1.Picture.Height;
 FormZoom.Width := Image1.Picture.Width;
 FormZoom.Image1.Height := Image1.Picture.Height;
 FormZoom.Image1.Width := Image1.Picture.Width;

 FormZoom.Image1.Picture := Image1.Picture;
 FormZoom.ShowModal;
end;

procedure TCO_Infoform.BitBtn9Click(Sender: TObject);

type
  TJPEGQualityRange = 1..100;
var
   Bmp: TBitmap;
   Jpg: TJpegImage;
   ExtS: String[4];
begin
  bmp := TBitmap.Create;
  jpg := TJpegImage.Create;

  ODSCustImages.Edit;
   if OpenPictureDlg.Execute then
   begin
     try
   {--Bmp to Jpeg Conertion --}
       ExtS := copy(AnsiUpperCase(ExtractFileExt(OpenPictureDlg.FileName)),2,MaxLongInt);
       if ExtS = 'BMP' then
        begin
          Bmp.LoadFromFile(OpenPictureDlg.FileName);
          Jpg.CompressionQuality := 100;
          Jpg.Assign(bmp);
          Jpg.SaveToFile(Path);
          Image1.Picture.LoadFromFile(Path);
        end else
          Image1.Picture.LoadFromFile(OpenPictureDlg.FileName);
   {--End of Convertion --}
     except
       ShowMessage('Error during picture loading');
     end;
   end;
end;



procedure TCO_Infoform.BitBtn8Click(Sender: TObject);
begin
 FormZoom := TFormZoom.create(self);
 FormZoom.Height := Image2.Picture.Height;
 FormZoom.Width := Image2.Picture.Width;
 FormZoom.Image1.Height := Image2.Picture.Height;
 FormZoom.Image1.Width := Image2.Picture.Width;

 FormZoom.Image1.Picture:=Image2.Picture;
 FormZoom.ShowModal;
end;

procedure TCO_Infoform.BitBtn7Click(Sender: TObject);
type
  TJPEGQualityRange = 1..100;
var
   Bmp: TBitmap;
   Jpg: TJpegImage;
   ExtS: String[4];
begin
  bmp := TBitmap.Create;
  jpg := TJpegImage.Create;

 ODSCustImages.Edit;
   if OpenPictureDlg.Execute then
   begin
     try
   {--Bmp to Jpeg Conertion --}
       ExtS := copy(AnsiUpperCase(ExtractFileExt(OpenPictureDlg.FileName)),2,MaxLongInt);
       if ExtS = 'BMP' then
        begin
          Bmp.LoadFromFile(OpenPictureDlg.FileName);
          Jpg.CompressionQuality := 100;
          Jpg.Assign(bmp);
          Jpg.SaveToFile(Path);
          Image2.Picture.LoadFromFile(Path);
        end else
          Image2.Picture.LoadFromFile(OpenPictureDlg.FileName);
   {--End of Convertion --}
     except
       ShowMessage('Error during picture loading');
     end;
   end;
end;




procedure TCO_Infoform.BitBtn12Click(Sender: TObject);
begin
FormZoom:=TFormZoom.create(self);
 FormZoom.Height := Image3.Picture.Height;
 FormZoom.Width := Image3.Picture.Width;
 FormZoom.Image1.Height := Image3.Picture.Height;
 FormZoom.Image1.Width := Image3.Picture.Width;

 FormZoom.Image1.Picture := Image3.Picture;
 FormZoom.ShowModal;

end;

procedure TCO_Infoform.BitBtn11Click(Sender: TObject);
type
  TJPEGQualityRange = 1..100;
var
   Bmp: TBitmap;
   Jpg: TJpegImage;
   ExtS: String[4];
begin
  bmp := TBitmap.Create;
  jpg := TJpegImage.Create;

 ODSCustImages.Edit;
   if OpenPictureDlg.Execute then
   begin
     try
   {--Bmp to Jpeg Conertion --}
       ExtS := copy(AnsiUpperCase(ExtractFileExt(OpenPictureDlg.FileName)),2,MaxLongInt);
       if ExtS = 'BMP' then
        begin
          Bmp.LoadFromFile(OpenPictureDlg.FileName);
          Jpg.CompressionQuality := 100;
          Jpg.Assign(bmp);
          Jpg.SaveToFile(Path);
          Image3.Picture.LoadFromFile(Path);
        end else
          Image3.Picture.LoadFromFile(OpenPictureDlg.FileName);
   {--End of Convertion --}
     except
       ShowMessage('Error during picture loading');
     end;
   end;
end;



procedure TCO_Infoform.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_ESCAPE then
    Close;
end;

end.

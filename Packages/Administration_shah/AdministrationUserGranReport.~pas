unit AdministrationUserGranReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls,OracleData;

type
  TrptUsers = class(TQuickRep)
    TitleBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText3: TQRDBText;
    UseRight: TQRDBText;
    InsertRight: TQRDBText;
    DelRight: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    UpdateRight: TQRDBText;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    InsertRightPict: TQRImage;
    UseRightPict: TQRImage;
    DelRightPict: TQRImage;
    UpdateRightPict: TQRImage;
    QRStringsBand1: TQRStringsBand;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText2: TQRDBText;
    QRSysData1: TQRSysData;
    QRDBText4: TQRDBText;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
    procedure Review(Standart : Boolean);
  end;

var
  rptUsers: TrptUsers;

implementation

uses AdministrationDataModule, AdministrationMainForm;

{$R *.DFM}
procedure TrptUsers.Review(Standart : Boolean);
var
i: integer;
begin
 for i:=0 to ComponentCount-1 do
   if Components[i].Tag=1 then
      if (Components[i] is  TQRDBText) then
        (Components[i] as  TQRDBText).Enabled:=not(Standart)
      else
      if (Components[i] is  TQRImage) then
        (Components[i] as  TQRImage).Enabled:=Standart;
end;

procedure TrptUsers.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
procedure ResetPicture(QrPicture: TQrImage;QrText: TQRDBText);
  begin
   with QrText do
    if DataSet.FieldByName(DataField).AsString=(DataSet as TOracleDataSet).GetVariable('GRANTED') then
     QrPicture.Picture:=TempPic else
      QrPicture.Picture:=nil;
  end;

begin
 ResetPicture(UseRightPict,UseRight);
 ResetPicture(InsertRightPict,InsertRight);
 ResetPicture(DelRightPict,DelRight);
 ResetPicture(UpdateRightPict,UpdateRight);
end;

end.

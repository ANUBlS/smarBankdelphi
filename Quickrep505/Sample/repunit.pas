unit repunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TReportfrm = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    PageHeaderBand1: TQRBand;
    QRImage1: TQRImage;
    QRMemo1: TQRMemo;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    PSD1: TPrinterSetupDialog;
    Open1: TOpenDialog;
    PD1: TPrintDialog;
    procedure QuickRep1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRep1PrevXEvent(Sender: TObject; eventNum: TPrevEventType;
      cName, CText: string; rec: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Reportfrm: TReportfrm;
  rec : integer;

implementation
uses printers, winspool, qrprntr, qrpdffilt, qrxdocument;
{$R *.dfm}

procedure TReportfrm.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   rec := 0;
end;

procedure TReportfrm.QuickRep1NeedData(Sender: TObject; var MoreData: Boolean);
begin
     qrlabel1.caption := 'Record number : ' + inttostr(rec) + '  ' + chr($9034 + rec);
     inc(rec);
     moredata := rec < 20;
end;

procedure TReportfrm.QuickRep1PrevXEvent(Sender: TObject; eventNum: TPrevEventType;
                          cName, CText: string; rec: Integer);
var
   aPDF : TQRPDFDocumentFilter;
begin
      if eventnum= etSaveButton then
      begin
          apdf := TQRPDFDocumentfilter.Create('savedReport.pdf');
          QuickRep1.exporttofilter(apdf);
          apdf.Free;
          showmessage( 'PDF created');
          exit;
      end;
      if eventnum= etPrintButton then
      begin
          if not PSD1.Execute then exit;
          TQRXDocument(sender).Print(printer);
          exit;
      end;
      if eventnum= etControlClick then
      begin
          showmessage( 'Clicked control: '+cname + ' ' +cText+ '  rec ' + inttostr(rec));
          exit;
      end;
      if eventnum= etMouseOver then
      begin
          screen.Cursor := crHandPoint;
          exit;
      end;
      if eventnum= etMouseOut then
      begin
          screen.Cursor := crDefault;
          exit;
      end;
end;

end.

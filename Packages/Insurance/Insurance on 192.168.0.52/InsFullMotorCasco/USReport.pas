unit USReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TFormReportS = class(TForm)
    SQuickRep: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel16: TQRLabel;
    procedure SQuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormReportS: TFormReportS;

implementation

uses DataUnitFullMotor;

{$R *.DFM}

procedure TFormReportS.SQuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
{var
    s:array[1..10] of string;
    l,i,k,t:integer; }
begin
     { k:=1; t:=15;
      l:=length(QRDBText12.Caption); showmessage(inttostr(l));
      if l>30 then
      begin
         for i:=1 to (l div 15) do
         begin
             s[i]:=copy(QRDBText12.Caption,k,t);
             k:=k+15;
             t:=t+15;
         end;
         QRDBText12.Caption:=s[1];
         for i:=2 to (l div 15) do
         QRDBText12.Caption:=QRDBText12.Caption+#13#10+s[i];
      end;   }
end;



end.

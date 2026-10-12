unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, qrpBaseCtrls, DB, OracleData;

type
  TFormonline = class(TForm)
    QRPQuicActOnline: TQRPQuickrep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabelLastOstat: TQRLabel;
    QRLabelValEnd: TQRLabel;
    QRLabel3: TQRLabel;
    QRMemo1: TQRMemo;
    QRMemo2: TQRMemo;
    QRLabel13: TQRLabel;
    DBTextOpenDate: TQRDBText;
    QRLabel2: TQRLabel;
    OracleDataSet1: TOracleDataSet;
    OracleDataSet1WORK_PLACE: TWideStringField;
    OracleDataSet1WORK_POST: TWideStringField;
    OracleDataSet1WORK_ADRESS: TWideStringField;
    OracleDataSet1TAR: TWideStringField;
    QRLabel10: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    OracleDataSet1INN: TWideStringField;
    odsxx: TOracleDataSet;
    odsxxDAT: TDateTimeField;
    odsxxINV_NUM: TWideStringField;
    odsxxINV_DATE: TDateTimeField;
    odsxxDEBIT: TFloatField;
    odsxxCREDIT: TFloatField;
    odsxxTRANS_DATE: TDateTimeField;
    odsxxPAR1: TWideStringField;
    odsxxPAR3: TWideStringField;
    odsxxPAR4: TWideStringField;
    odsxxPAR5: TWideStringField;
    odsxxPAR6: TWideStringField;
    odsxxPAR7: TWideStringField;
    odsxxPAR8: TWideStringField;
    odsxxPAR9: TWideStringField;
    odsxxMEBLEG: TFloatField;
    odsxxPAR13: TFloatField;
    odsxxPAR14: TFloatField;
    odsxxPAR15: TFloatField;
    odsxxDEBT: TFloatField;
    odsxxAMMOUNT: TFloatField;
    odsxxODENIS: TFloatField;
    odsxxRN: TFloatField;
    odsxxPAR11: TFloatField;
    QRShape1: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape11: TQRShape;
    QRShape10: TQRShape;
    QRShape4: TQRShape;
    QRBand2: TQRBand;
    GroupFooterBand: TQRBand;
    QRShapeFooter: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel38: TQRLabel;
    QRShapeBottom: TQRShape;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr3: TQRExpr;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRPQuicActOnlineBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formonline: TFormonline;

implementation
   uses StatementFrmImpl, unitdata, SBTranslateProc, sboapiDataModuleImpl;
{$R *.dfm}

procedure TFormonline.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
  var name,text,tarx, acc_no:string;
  i:integer  ;
  s,s1,s2,s3 :Variant;
  s4,s5:Variant;
begin
with oracledataset1 do
begin
   close;
      SetVariable('v_id',DataModSTX.ODSMainState.FieldByName('CUSTOMERID').AsInteger);
   open;
end;
// showmessage( DataModSTX.ODSMainState.FieldByName('CUSTOMERID').AsString);

    QRLabel10.Caption:=OracleDataSet1WORK_POST.AsString+'/'+OracleDataSet1TAR.AsString ;
    tarx:=OracleDataSet1WORK_PLACE.AsString+' -ci  il   tarixli - '+ OracleDataSet1WORK_POST.AsString+ '  '+ OracleDataSet1WORK_ADRESS.AsString;

   name:='         Biz asagda imza edenler bir terefden     adsoyad                                    (İcraçı).diger terefden ';
    name := StringReplace( name,
   'adsoyad', DataModSTX.ODSMainStateACCOUNTNAME.asstring, [rfReplaceAll, rfIgnoreCase]);
  QRMemo1.Lines[0] := name;

    acc_no := tarx + '  İcracı   hesabno ';
  acc_no := StringReplace( acc_no,
   'hesabno', DataModSTX.ODSMainStateACCOUNTNUMBER.asstring, [rfReplaceAll, rfIgnoreCase]);
  QRMemo1.Lines[4] := acc_no;

   text:= 'DNN  yuk tarix   -ci  ilde asagıda gosteren meblegde yukdasıma xidmetlerini yerine yetirmisdir';
   text:= StringReplace( text,
   'tarix ', OracleDataSet1TAR.AsString , [rfReplaceAll, rfIgnoreCase]);
    QRMemo1.Lines[6] := text;

  s1:=0;
  s2:=0;
  DataModSTX.ODSExtractTrans.First;
   for i := 0 to DataModSTX.ODSExtractTrans.RecordCount-1 do
    begin
     s:=DataModSTX.ODSExtractTrans.FieldByName('LDebit').AsVariant;
     s3:=DataModSTX.ODSExtractTrans.FieldByName('LKredit').AsVariant;
     s1:=s1+abs(s);
     s2:=s2+abs(s3) ;
     DataModSTX.ODSExtractTrans.Next;
    end;
    s5:=FormatFloat('#,##0.00',(DataModSTX.ODSMainState.FieldByName('POKOSTAT').AsCurrency));
  s4:=s2+s5-s1;
  QRLabelValEnd.Caption:=FormatFloat('#,##0.00',s4);

   QRLabel31.Caption:=DataModSTX.ODSMainStateACCOUNTNUMBER.asstring;
  QRLabel32.Caption:=OracleDataSet1inn.AsString;

//FormatFloat('#,##0.00',(DataModSTX.ODSMainState.FieldByName('EndOstat').AsCurrency));
  QRLabel15.Caption:=DateToStr(StatementFrm.DTP_Begin.DateTime);
  QRLabel16.Caption:=DateToStr(StatementFrm.DTP_End.DateTime);
end;

procedure TFormonline.QRPQuicActOnlineBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
 SBTranslateProc.TranslateAllCompQuickRep(QRPQuicActOnline, sboapiDataModule.OrPack_SL);
end;

end.

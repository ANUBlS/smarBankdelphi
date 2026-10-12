unit CO_Statement_impl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Gauges, ExtCtrls, DBCtrls,Oracle, StdCtrls, Buttons, QRExport;

type
  TCO_Statement_Form = class(TForm)
    GrBoxMain: TGroupBox;
    GrBoxDate: TGroupBox;
    LabelBegDate: TLabel;
    LabelEndDate: TLabel;
    DTP_Begin: TDateTimePicker;
    DTP_End: TDateTimePicker;
    CBTurnOver: TCheckBox;
    CBRateDiff: TCheckBox;
    GrBoxChecking: TGroupBox;
    Label_Acc_No: TLabel;
    Label_Bal_Cn: TLabel;
    LabelCli_Id: TLabel;
    Edit_Acc_No: TEdit;
    Edit_Bal_Cn: TEdit;
    BtnOk: TBitBtn;
    CBoxExtractCheck: TComboBox;
    EditCli_Id: TEdit;
    RGroupPrintMode: TRadioGroup;
    CBCurrency: TCheckBox;
    DBLCBavalute: TDBLookupComboBox;
    DBLCBfilial: TDBLookupComboBox;
    CBFilial: TCheckBox;
    CBUser: TCheckBox;
    dblcbUser: TDBLookupComboBox;
    RGroupSetting: TRadioGroup;
    PanelProgress: TPanel;
    PrBarParent: TGauge;
    PrBarChild: TProgressBar;
    SaveDialog: TSaveDialog;
    QRTextFilter: TQRTextFilter;
    procedure FormActivate(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    Function UpdateStr(InpStr:string):string;
     procedure WMNCACTIVATE(var message: TWMNCActivate); message WM_NCACTIVATE;
    procedure WMNCPaint(var message : TWMNCPaint); message WM_NCPAINT;
   // function SB_SysDate :TDateTime;
      procedure PreviewClick;
    procedure ToExcelClick;
    procedure PostClick;
    procedure ShowTransClick;
    procedure ShowCardState;
     procedure ShowReport;
     procedure ShowReportR;
     procedure ExportDataTable;
    procedure CBCurrencyClick(Sender: TObject);
    procedure CBFilialClick(Sender: TObject);
    procedure CBUserClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  Var
  v_BDate    :TDateTime;
 v_EDate    :TDateTime;
notAccId    :string;
v_filial,
    v_val,
     v_user  :integer;
TurnYesNo,
   RateDif : Integer;
   Exl, Sheet: Variant;
Turn_and_RateDiff :string;

  CO_Statement_Form: TCO_Statement_Form;

implementation

uses ComObj, ComServ, CO_Datamod_impl, co_st_check, Rep_unit, RepR_unit,
  transview_unit, SBTranslateProc, sboapiDataModuleImpl,
  customers_operation_impl;
{$R *.DFM}


procedure TCO_Statement_Form.WMNCACTIVATE(var message:TWMNCActivate);
var
 S:TWMNCPaint;
begin
inherited;
WMNCPaint(s);
end;

procedure TCO_Statement_Form.WMNCPaint(var message: TWMNCPaint);
const Capt = 'Hesabdan çıxarış';
var dc : hDc;
begin
inherited;
Caption:='';
dc := GetWindowDC(Handle);
        SetBkMode(dc,Transparent);
        SetTextColor(dc,clWhite);
        SelectObject(dc, Font.Handle);
        TextOut(dc, 23,6,Capt,Length(Capt));
end;
Function TCO_Statement_Form.UpdateStr(InpStr:string):string;
var
  TempString, EndString:String;
  flag,TempCount ,i, Count, Beg_Index, k : Integer;
const
  Commas='''';
  Comma=',';
  begin
    Result:= InpStr;
    if Result<>'' then
    begin
    TempString:= '';
    EndString:= '';
    Beg_Index:= 1;
    k:= Length(Result);
    TempCount:=0;
    flag:=1;
    for i:=1 to k do
      if Result[i] <> ' ' then
        TempString:= TempString + Result[i];
    InpStr:= TempString;
    Result:= InpStr;
    TempString:= '';
    k:= Length(Result);
    for i:=1 to k do
      begin
        if Result[i] = ',' then
          begin
            Count:= (i-1)-TempCount;
            Result:= Copy(Result, Beg_Index, Count);
            TempString:= TempString + Result+Commas+Comma+Commas;
            Result:= InpStr;
            Beg_Index:= i+1;
            TempCount:=i;
            flag:=0;
          end;
        if flag=1 then
          EndString:= EndString+Result[i]
        else
          begin
            EndString:= '';
            flag:= 1;
          end;
      end;
      Result:= Commas + TempString + EndString + Commas;

    end
    else
      Result:= ''' ''';
  end;


procedure CreateSheet;
begin
  try
   Exl := CreateOleObject('Excel.Application');
   Exl.WorkBooks.add;
   Sheet := Exl.Application.Worksheets.Item[1];
  except
  end;
end;


   { function TCO_Statement_Form.SB_SysDate] :TDateTime;
    begin
             with
                 CO_Datamod.SB_STATEMENT
                                     do
                             begin

               Result:=CallDateFunction('get_date',[]);
                          end;
    end;

{$R *.DFM}

{ TCO_Statement }
   procedure TCO_Statement_Form.ShowReport;
   begin
   FormRep:=TFormRep.Create(Self);
    with FormRep do
     begin
          QRD_Begin.Caption:=DateToStr(v_BDate);
          QRD_End.Caption:=DateToStr(v_EDate);


            case RGroupPrintMode.ItemIndex of
             0 : QRBandDetail.ForceNewPage := False;
             1 : QRBandDetail.ForceNewPage := True;
            end;

         QRep.Preview;
      end;

   end;

   procedure TCO_Statement_Form.ShowReportR;
   begin
   FormRepR:=TFormRepR.Create(Self);
    with FormRepR do
     begin
          QRD_Begin.Caption:=DateToStr(v_BDate);
          QRD_End.Caption:=DateToStr(v_EDate);
             case RGroupPrintMode.ItemIndex of
             0 : QRBandDetail.ForceNewPage := False;
             1 : QRBandDetail.ForceNewPage := True;
            end;
           QRep.Preview;
      end;

   end;

procedure DestroySheet;
begin
  try
   Finalize(Sheet);
   Finalize(Exl);
  except

  end;
end;


procedure ShowSheet;
begin
  try
     Exl.Visible := True;
  except
     DestroySheet;
   end;
end;

procedure TCO_Statement_Form.ToExcelClick;
const
d=6;
f=3;
dd=2;
var
i , j , k ,m ,www :Integer;
t_val :integer;
v_LDebit,v_LKredit,v_Debit,v_Kredit :real;
bash  : string;
begin
 try

    CreateSheet;
    ExportDataTable;
      PanelProgress.Visible:=true;
     PrBarParent.Progress:=0;
      PrBarChild.Position:=0;
     Sheet.Range['A1:A60000'].ColumnWidth:=15;
     Sheet.Range['B1:B60000'].ColumnWidth:=15;
     Sheet.Range['C1:C60000'].ColumnWidth:=10;
     Sheet.Range['D1:D60000'].NumberFormat:='#######';
     Sheet.Range['D1:D60000'].ColumnWidth:=20;
     Sheet.Range['E1:E60000'].NumberFormat:='#,##0.00';
     Sheet.Range['E1:E60000'].ColumnWidth:=12;
     Sheet.Range['F1:F60000'].NumberFormat:='#,##0.00';
     Sheet.Range['F1:F60000'].ColumnWidth:=12;
     Sheet.Range['G1:G60000'].ColumnWidth:=100;

         k:=0;
  with CO_Datamod do  begin
     t_val:= ODSMainState.FieldByName('CurrencyId').AsInteger;

     if t_val=0 then begin

        for i:=1 to  ODSMainState.RecordCount do begin
                PrBarParent.Progress:=(100*i) div ODSMainState.RecordCount;
          bash:=inttostr(i+k);
          Sheet.Cells[i+k,3]:='Hesab N-si:';
          Sheet.Cells[i+k,3].Font.Name:='Tahoma';
          Sheet.Cells[i+k,3].Font.Bold :=true;

          Sheet.Cells[i+k,4]:=ODSMainState.FieldByName('AccountNumber').AsString;

          Sheet.Cells[i+k+1,1]:='Hesabın adı:';
          Sheet.Cells[i+k+1,1].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,1].Font.Bold :=true;
          Sheet.Cells[i+k+1,2].Value:=ODSMainState.FieldByName('AccountName').AsString;
          Sheet.Cells[i+k+1,2].Font.Name:='Tahoma';

          Sheet.Cells[i+k+2,1]:='Valyuta:';
          Sheet.Cells[i+k+2,1].Font.Name:='Tahoma';
          Sheet.Cells[i+k+2,1].Font.Bold :=true;

          Sheet.Cells[i+k+2,2]:=ODSMainState.FieldByName('CurrencyName').AsString;

          Sheet.Cells[i+k+3,1]:='Əməliy. tarixi::';
          Sheet.Cells[i+k+3,1].Font.Name:='Tahoma';
          Sheet.Cells[i+k+3,1].Font.Bold :=true;

          Sheet.Cells[i+k+3,2]:=DTP_Begin.DateTime;
          Sheet.Cells[i+k+3,3]:=DTP_End.DateTime;

          Sheet.Cells[i+k+4,1]:='Əvv. əm. tarixi:';
          Sheet.Cells[i+k+4,1].Font.Name:='Tahoma';
          Sheet.Cells[i+k+4,1].Font.Bold :=true;

          Sheet.Cells[i+k+4,2].Value:=ODSMainState.FieldByName('lastopdate').AsDateTime;

          Sheet.Cells[i+k+5,1]:='Günün əvv. qalıq:';
          Sheet.Cells[i+k+5,1].Font.Name:='Tahoma';
          Sheet.Cells[i+k+5,1].Font.Bold :=true;
          Sheet.Cells[i+k+5,2]:='Manat :';
          Sheet.Cells[i+k+5,3].Value:=FormatFloat('#,##0.00',ABS(ODSMainState.FieldByName('Ostat').AsFloat));



          Sheet.Cells[i+k+6,2]:='Tarix';
          Sheet.Cells[i+k+6,2].Font.Name:='Tahoma';
          Sheet.Cells[i+k+6,2].Font.Bold :=true;
          Sheet.Cells[i+k+6,2].Font.Color:=clBlue;

          Sheet.Cells[i+k+6,3].Value:='Valyuta';
          Sheet.Cells[i+k+6,3].Font.Name:='Tahoma';
          Sheet.Cells[i+k+6,3].Font.Bold :=true;
          Sheet.Cells[i+k+6,3].Font.Color:=clBlue;

          Sheet.Cells[i+k+6,4]:='Qarşı hesab';
          Sheet.Cells[i+k+6,4].Font.Name:='Tahoma';
          Sheet.Cells[i+k+6,4].Font.Bold :=true;
          Sheet.Cells[i+k+6,4].Font.Color:=clBlue;

          Sheet.Cells[i+k+6,5]:='Debet';
          Sheet.Cells[i+k+6,5].Font.Name:='Tahoma';
          Sheet.Cells[i+k+6,5].Font.Bold :=true;
          Sheet.Cells[i+k+6,5].Font.Color:=clBlue;

          Sheet.Cells[i+k+6,6]:='Kredit';
          Sheet.Cells[i+k+6,6].Font.Name:='Tahoma';
          Sheet.Cells[i+k+6,6].Font.Bold :=true;
          Sheet.Cells[i+k+6,6].Font.Color:=clBlue;

          Sheet.Cells[i+k+6,7]:='Təyinatı';
          Sheet.Cells[i+k+6,7].Font.Name:='Tahoma';
          Sheet.Cells[i+k+6,7].Font.Bold :=true;
          Sheet.Cells[i+k+6,7].Font.Color:=clBlue;

                             v_LDebit:=0;
                             v_LKredit:=0;

         for j:=1 to ODSExtractTrans.RecordCount do begin
           PrBarChild.Position:=(100*j) div ODSExtractTrans.RecordCount;
         v_LDebit:=v_LDebit+ODSExtractTrans.FieldByName('LDebit').AsFloat;
         v_LKredit:=v_LKredit+ODSExtractTrans.FieldByName('LKredit').AsFloat;

          Sheet.Cells[i+k+j+d,2]:=ODSExtractTrans.FieldByName('Dat').AsDateTime;
          Sheet.Cells[i+k+j+d,3]:=ODSExtractTrans.FieldByName('PairCurrencyid').AsString;
          Sheet.Cells[i+k+j+d,4]:=ODSExtractTrans.FieldByName('PairAccountName').AsString;
          Sheet.Cells[i+k+j+d,5]:=FormatFloat('#,##0.00',ODSExtractTrans.FieldByName('LDebit').AsFloat);
          Sheet.Cells[i+k+j+d,6]:=FormatFloat('#,##0.00',ODSExtractTrans.FieldByName('LKredit').AsFloat);
          Sheet.Cells[i+k+j+d,7]:=ODSExtractTrans.FieldByName('Name').AsString;
          Sheet.Cells[i+k+j+d,7].Font.Name:='Arial AzLat';

             ODSExtractTrans.Next;
            end;
             PrBarChild.Position:=0;
           m:=ODSExtractTrans.RecordCount;
               Sheet.Cells[i+k+m+d+1,5]:=FormatFloat('#,##0.00',v_LDebit);
               Sheet.Cells[i+k+m+d+1,6]:=FormatFloat('#,##0.00',v_LKredit);
               Sheet.Cells[i+k+m+d+2,1]:='Günün son. qal.:';
               Sheet.Cells[i+k+m+d+2,2]:='Manat:';
               Sheet.Cells[i+k+m+d+2,3]:=FormatFloat('#,##0.00',ABS(ODSMainState.FieldByName('EndOstat').AsFloat));
               Sheet.Cells[i+k+m+d+2,1].Font.Name:='Arial AzLat';
               Sheet.Cells[i+k+m+d+2,1].Font.Bold :=true;
               Sheet.Cells[i+k+m+d+3,1]:='';
               Exl.Range['A'+bash+':G'+inttostr(i+k+m+d+2)].select;
               Exl.Selection.Interior.ColorIndex := 6;
               Sheet.Range['A'+bash+':G'+inttostr(i+k+m+d+2)].Borders.Color:=clRed;

               Exl.Range['A'+Inttostr(i+k+m+d+3)+':G'+Inttostr(i+k+m+d+3)].Select;
               Exl.Selection.Interior.ColorIndex := 8;

            k:=k+d+f+m;
          ODSMainState.Next;
      end;{for}
  end  {if}
  else
  begin

        for i:=1 to  ODSMainState.RecordCount do begin
                PrBarParent.Progress:=(100*i) div ODSMainState.RecordCount;
          bash:=inttostr(i+k);
          Sheet.Cells[i+k,3]:='Hesab N-si:';
          Sheet.Cells[i+k,3].Font.Name:='Tahoma';
          Sheet.Cells[i+k,3].Font.Bold :=true;

          Sheet.Cells[i+k,4]:=ODSMainState.FieldByName('AccountNumber').AsString;

          Sheet.Cells[i+k+1,1]:='Hesabın adı:';
          Sheet.Cells[i+k+1,1].Font.Name:='Tahoma';
          Sheet.Cells[i+k+1,1].Font.Bold :=true;
          Sheet.Cells[i+k+1,2].Value:=ODSMainState.FieldByName('AccountName').AsString;
          Sheet.Cells[i+k+1,2].Font.Name:='Tahoma';

          Sheet.Cells[i+k+2,1]:='Valyuta';
          Sheet.Cells[i+k+2,1].Font.Name:='Tahoma';
          Sheet.Cells[i+k+2,1].Font.Bold :=true;

          Sheet.Cells[i+k+2,2]:=ODSMainState.FieldByName('CurrencyName').AsString;

          Sheet.Cells[i+k+3,1]:='Əməliy. tarixi:';
          Sheet.Cells[i+k+3,1].Font.Name:='Tahoma';
          Sheet.Cells[i+k+3,1].Font.Bold :=true;

          Sheet.Cells[i+k+3,2]:=DTP_Begin.DateTime;
          Sheet.Cells[i+k+3,3]:=DTP_End.DateTime;

          Sheet.Cells[i+k+4,1]:='Əvv. əm. tarixi:';
          Sheet.Cells[i+k+4,1].Font.Name:='Tahoma';
          Sheet.Cells[i+k+4,1].Font.Bold :=true;

          Sheet.Cells[i+k+4,2].Value:=ODSMainState.FieldByName('lastopdate').AsDateTime;

          Sheet.Cells[i+k+5,1]:='Günün əvv. qalıq:';
          Sheet.Cells[i+k+5,1].Font.Name:='Tahoma';
          Sheet.Cells[i+k+5,1].Font.Bold :=true;
          Sheet.Cells[i+k+5,2]:='Valyuta:';
          Sheet.Cells[i+k+5,2].Font.Name:='Tahoma';
          Sheet.Cells[i+k+5,3].Value:=FormatFloat('#,##0.00',ABS(ODSMainState.FieldByName('Ostat').AsFloat));
          Sheet.Cells[i+k+6,2]:='Manat :';
          Sheet.Cells[i+k+6,3]:=FormatFloat('#,##0.00',ABS(ODSMainState.FieldByName('PokOstat').AsCurrency));

          Sheet.Cells[i+k+6,2].Font.Name:='Tahoma';
          Sheet.Cells[i+k+7,2]:='Rəsmi məzənnə:';
          Sheet.Cells[i+k+7,2].Font.Name:='Tahoma';
          Sheet.Cells[i+k+7,3]:=FormatFloat('#,##0.0000',ABS(RatesDataSetBegin.FieldByName('Ostat').AsCurrency));


          Sheet.Cells[i+k+8,2]:='Tarix';
          Sheet.Cells[i+k+8,2].Font.Name:='Tahoma';
          Sheet.Cells[i+k+8,2].Font.Bold :=true;
          Sheet.Cells[i+k+8,2].Font.Color:=clBlue;

          Sheet.Cells[i+k+8,3].Value:='Valyuta';
          Sheet.Cells[i+k+8,3].Font.Name:='Tahoma';
          Sheet.Cells[i+k+8,3].Font.Bold :=true;
          Sheet.Cells[i+k+8,3].Font.Color:=clBlue;

          Sheet.Cells[i+k+8,4]:='Qarşı hesab';
          Sheet.Cells[i+k+8,4].Font.Name:='Tahoma';
          Sheet.Cells[i+k+8,4].Font.Bold :=true;
          Sheet.Cells[i+k+8,4].Font.Color:=clBlue;

          Sheet.Cells[i+k+8,5]:='Debet';
          Sheet.Cells[i+k+8,5].Font.Name:='Tahoma';
          Sheet.Cells[i+k+8,5].Font.Bold :=true;
          Sheet.Cells[i+k+8,5].Font.Color:=clBlue;

          Sheet.Cells[i+k+8,6]:='Kredit';
          Sheet.Cells[i+k+8,6].Font.Name:='Tahoma';
          Sheet.Cells[i+k+8,6].Font.Bold :=true;
          Sheet.Cells[i+k+8,6].Font.Color:=clBlue;

          Sheet.Cells[i+k+8,7]:='Təyinatı';
          Sheet.Cells[i+k+8,7].Font.Name:='Tahoma';
          Sheet.Cells[i+k+8,7].Font.Bold :=true;
          Sheet.Cells[i+k+8,7].Font.Color:=clBlue;
                             www:=0;
                             v_LDebit:=0;  v_Debit:=0;
                             v_LKredit:=0; v_Kredit:=0;
         for j:=1 to ODSExtractTrans.RecordCount do begin
           PrBarChild.Position:=(100*j) div ODSExtractTrans.RecordCount;
           v_Debit:=v_Debit+ODSExtractTrans.FieldByName('Debit').AsFloat;
           v_Kredit:=v_Kredit+ODSExtractTrans.FieldByName('Kredit').AsFloat;
         v_LDebit:=v_LDebit+ODSExtractTrans.FieldByName('LDebit').AsFloat;
         v_LKredit:=v_LKredit+ODSExtractTrans.FieldByName('LKredit').AsFloat;
          Sheet.Cells[i+k+j+d+dd+www,2]:=ODSExtractTrans.FieldByName('Dat').AsDateTime;
          Sheet.Cells[i+k+j+d+dd+www,3]:=ODSExtractTrans.FieldByName('PairCurrencyid').AsString;
          Sheet.Cells[i+k+j+d+dd+www,4]:=ODSExtractTrans.FieldByName('PairAccountName').AsString;
          Sheet.Cells[i+k+j+d+dd+www,5]:=FormatFloat('#,##0.00',ODSExtractTrans.FieldByName('LDebit').AsFloat);
          Sheet.Cells[i+k+j+d+dd+www,6]:=FormatFloat('#,##0.00',ODSExtractTrans.FieldByName('LKredit').AsFloat);
          Sheet.Cells[i+k+j+d+dd+www,7]:=ODSExtractTrans.FieldByName('Name').AsString;
          Sheet.Cells[i+k+j+d+dd+www,7].Font.Name:='Tahoma';


          Sheet.Cells[i+k+j+d+dd+www+1,5]:=FormatFloat('#,##0.00',ODSExtractTrans.FieldByName('Debit').AsFloat);
          Sheet.Cells[i+k+j+d+dd+www+1,5].Font.Bold:=True;
          Sheet.Cells[i+k+j+d+dd+www+1,5].Font.Color:=clMaroon;

          Sheet.Cells[i+k+j+d+dd+www+1,6]:=FormatFloat('#,##0.00',ODSExtractTrans.FieldByName('Kredit').AsFloat);
          Sheet.Cells[i+k+j+d+dd+www+1,6].Font.Bold:=True;
          Sheet.Cells[i+k+j+d+dd+www+1,6].Font.Color:=clMaroon;

             ODSExtractTrans.Next;
          if ODSExtractTrans.FieldByName('PairCurrencyid').AsInteger<>0 then
          begin
            www:=www+1;
          if (j=ODSExtractTrans.RecordCount) and (www<>0) then
            www:=www+1;
          end; {if}

         end;{for}

             PrBarChild.Position:=0;
           m:=ODSExtractTrans.RecordCount;

               Sheet.Cells[i+k+m+d+dd+www,5]:=FormatFloat('#,##0.00',v_LDebit);
               Sheet.Cells[i+k+m+d+dd+www,6]:=FormatFloat('#,##0.00',v_LKredit);

               Sheet.Cells[i+k+m+d+dd+www+1,5]:=FormatFloat('#,##0.00',v_Debit);
               Sheet.Cells[i+k+m+d+dd+www+1,5].Font.Color:=clMaroon;
               Sheet.Cells[i+k+m+d+dd+www+1,5].Font.Bold:=True;
               Sheet.Cells[i+k+m+d+dd+www+1,6]:=FormatFloat('#,##0.00',v_Kredit);
               Sheet.Cells[i+k+m+d+dd+www+1,6].Font.Color:=clMaroon;
               Sheet.Cells[i+k+m+d+dd+www+1,6].Font.Bold:=True;

               Sheet.Cells[i+k+m+d+dd+www+2,1]:='Günün son. qalıq';
               Sheet.Cells[i+k+m+d+dd+www+2,2]:='Valyuta';
               Sheet.Cells[i+k+m+d+dd+www+2,2].Font.Name:='Tahoma';
               Sheet.Cells[i+k+m+d+dd+www+2,3]:=FormatFloat('#,##0.00',ABS(ODSMainState.FieldByName('EndOstat').AsFloat));
               Sheet.Cells[i+k+m+d+dd+www+2,1].Font.Name:='Tahoma';
               Sheet.Cells[i+k+m+d+dd+www+2,1].Font.Bold :=true;
               Sheet.Cells[i+k+m+d+dd+www+3,2]:='Manat :';
               Sheet.Cells[i+k+m+d+dd+www+3,3]:=FormatFloat('#,##0.00',ABS(CO_Datamod.ODSMainState.FieldByName('EndPokOstat').AsCurrency));


               Sheet.Cells[i+k+m+d+dd+www+4,2]:='Rəsmi məzənnə:';
               Sheet.Cells[i+k+m+d+dd+www+4,2].Font.Name:='Tahoma';
               Sheet.Cells[i+k+m+d+dd+www+4,3]:=FormatFloat('#,##0.0000',ABS(RatesDataSet.FieldByName('Ostat').AsCurrency));

               Sheet.Cells[i+k+m+d+dd+www+5,1]:='';
               Exl.Range['A'+bash+':G'+inttostr(i+k+m+d+dd+www+4)].select;
               Exl.Selection.Interior.ColorIndex := 6;
               Sheet.Range['A'+bash+':G'+inttostr(i+k+m+d+dd+www+4)].Borders.Color:=clRed;
               Exl.Range['A'+Inttostr(i+k+m+d+dd+www+5)+':G'+Inttostr(i+k+m+d+dd+www+5)].Select;
               Exl.Selection.Interior.ColorIndex := 8;

            k:=k+d+2*dd+www+f+m;
          ODSMainState.Next;
      end;{for}

  end;  {else}
end;{with}

    ShowSheet;
  finally

   Exl.Range['A1:A1'].Select;
              PanelProgress.Visible:=false;
   Screen.Cursor := crDefault;
   DestroySheet;
  end;


end;

procedure TCO_Statement_Form.PostClick;
begin

  ExportDataTable;
  if not Assigned(FormRep) then
    FormRep := TFormRep.Create(nil);

  with SaveDialog do
  begin
    if Execute then
    begin
      FormRep.QRep.ExportToFilter(TQRAsciiExportFilter.Create(FileName));
    end;
  end;

end;


procedure TCO_Statement_Form.PreviewClick;
begin

   ExportDataTable;

   case RGroupSetting.ItemIndex of
   0: begin ShowReportR; end;
   1: begin ShowReport; end;
   end;
end;





procedure TCO_Statement_Form.ShowTransClick;
begin
ExportDataTable;
 FormTransView:=TFormTransView.Create(Self);
 FormTransView.ShowModal;
end;

procedure TCO_Statement_Form.ShowCardState;
begin
 close;
end;

procedure TCO_Statement_Form.ExportDataTable;
var
  v_Acc_no  :string;
  v_Bal_cn  :string;
  v_Cli_id  :string;
FilterTrans :string;
FilterExt   :string;
 AStrParam  :string;
 BStrParam  :string;
 CStrParam  :string;
i:integer;
S:string;
begin
     Screen.Cursor:=crSQLWait ;

     if CBTurnOver.Checked=true then
     Turn_and_RateDiff:='ch_turn';
     if CBRateDiff.Checked=true then
     Turn_and_RateDiff:='ch_rate';
     if CBTurnOver.Checked=true and CBRateDiff.Checked=true then
       Turn_and_RateDiff:='ch_rate_and_turn';
     if CBTurnOver.Checked=false and CBRateDiff.Checked=true then
       Turn_and_RateDiff:='ch_nothink';


         v_BDate:=Integer(Trunc(DTP_Begin.DateTime));
         v_EDate:=Integer(Trunc(DTP_End.DateTime));

 v_user:=dblcbUser.KeyValue;
 v_val:=DBLCBavalute.KeyValue;
 v_filial:=dblcbfilial.KeyValue;




  if Edit_Bal_Cn.Text = '' then
    v_Bal_cn:= '-1'
  else
    v_Bal_cn:= UpdateStr(Edit_Bal_Cn.Text);

 if Edit_Acc_No.Text = '' then
    v_Acc_no:= '''-1'''
  else
    v_Acc_no:= UpdateStr(Edit_Acc_No.Text);


  if EditCli_Id.Text = '' then
    v_Cli_id:= '-1'
  else
    v_Cli_id:= EditCli_Id.Text;



              if (CBRateDiff.Checked=false)  then
                FilterTrans:=' (OperationCode<>1)  '
               else
              FilterTrans:='';



           CStrParam:=CO_Datamod.SB_STATEMENT.CallStringFunction('notAccId',
                                                      [
                                                      v_BDate,
                                                      v_EDate,
                                                      v_Cli_id,
                                                      v_Acc_no,
                                                      v_Bal_cn,
                                                      v_filial,
                                                      v_val,
                                                      v_user,
                                                      Turn_and_RateDiff
                                                       ]
                                                      );


                if CBTurnOver.Checked=true then
                 begin
                    with CO_Datamod.ODSNotAccId do
                       begin
                           Close;
                            SQL.Clear;
                            SQL.Add(CStrParam);
                           Open;
                        for i:=1 to RecordCount do
                           begin
                         s:=s+'(accountid<>'+inttostr(fieldbyname('accountid').asinteger)+') and ';
                        Next;
                    end;
               S:=Copy(S,1,length(S)-4);
                      end;
                  FilterExt:=S;
                  end
                  else
                  FilterExt:='';

             //inttostr()+
           {AStrParam:=CO_Datamod.SB_STATEMENT.CallStringFunction('GetExtraction',
                                                      [
                                                      v_BDate,
                                                      v_EDate,
                                                      v_Cli_id,
                                                      v_Acc_no,
                                                      v_Bal_cn,
                                                      v_filial,
                                                      v_val,
                                                      v_user
                                                      ]
                                                      );  }
            with CO_Datamod.ODS_GetExtraction do begin
            Close;
            SetVariable('bDate', v_BDate);
            SetVariable('eDate', v_EDate);
            SetVariable('ClientID', v_Cli_id);
            SetVariable('AccountNo', v_Acc_no);
            SetVariable('BalanceNo', v_Bal_cn);
            SetVariable('BranchID', v_filial);
            SetVariable('CurrencyID', v_val);
            SetVariable('UserID', v_user);
            Open;
            AStrParam:=FieldByName('str').AsString;
           end;

           with CO_Datamod.ODS_ExtractionTrans do begin
            Close;
            SetVariable('bDate', v_BDate);
            SetVariable('eDate', v_EDate);
            SetVariable('ClientID', v_Cli_id);
            SetVariable('AccountNo', v_Acc_no);
            SetVariable('BalanceNo', v_Bal_cn);
            SetVariable('BranchID', v_filial);
            SetVariable('CurrencyID', v_val);
            SetVariable('UserID', v_user);
            Open;
            BStrParam:=FieldByName('str').AsString;
           end;

           {
           BStrParam:=CO_Datamod.SB_STATEMENT.CallStringFunction('Extraction_Trans',
                                                      [
                                                      v_BDate,
                                                      v_EDate,
                                                      v_Cli_id,
                                                      v_Acc_no,
                                                      v_Bal_cn,
                                                      v_filial,
                                                      v_val,
                                                      v_user
                                                      ]
                                                      ); }
//RichEdit1.Text:= AStrParam;
with CO_Datamod do
         begin

      with ODSMainState do
       begin
            Close;
           SQL.Clear;
           SQL.Add(AStrParam);
           Filtered:=false;
           Filter:=FilterExt;
           Filtered:=true;
          Open;

        end;
                     with ODSExtractTrans do
                       begin

                         Close;
                             SQL.Clear;
                             DeclareVariable('OwnAccountId',otInteger);
                             SQL.Add(BStrParam);
                             SetVariable('OwnAccountId',ODSMainState.FieldByName('accountid').asInteger);
                             Filtered:=false;
                             Filter:=FilterTrans;
                             Filtered:=true;
                         Open;
                     end;

         Screen.Cursor:=crDefault;

     end;


 end;


procedure TCO_Statement_Form.FormActivate(Sender: TObject);
begin
CO_St_Form.Close;
if CO_ST_Form.Chck1.checked then begin
 CO_DataMod.Account.open;
 CO_DataMod.sysdat.open;
   DTP_Begin.DateTime:=CO_Datamod.Sysdat.fieldbyname('tek_dat').asdatetime;
        DTP_End.DateTime:=CO_Datamod.Sysdat.fieldbyname('tek_dat').asdatetime;
CO_STatement_Form.Edit_acc_no.text :=CO_DataMod.Account.fieldbyname('accno').asstring;
end;
if CO_ST_Form.Chck2.checked then begin
CO_DataMod.customers.open;
  DTP_Begin.DateTime:=CO_Datamod.Sysdat.fieldbyname('tek_dat').asdatetime;
        DTP_End.DateTime:=CO_Datamod.Sysdat.fieldbyname('tek_dat').asdatetime;
CO_STatement_Form.EditCli_Id.text :=CO_DataMod.customers.fieldbyname('id').asstring;

end;
     end;
procedure TCO_Statement_Form.BtnOkClick(Sender: TObject);
begin

case CBoxExtractCheck.ItemIndex of

          0:PreviewClick;
          1:PostClick;
          2:ToExcelClick;
          3:ShowTransClick;
          4:ShowCardState;
          
        end; 


end;

procedure TCO_Statement_Form.FormCreate(Sender: TObject);
begin
 CO_Statement_Form := Self;


if not Assigned(CO_Datamod) then
CO_Datamod:=TCO_Datamod.Create(Self);


     CBoxExtractCheck.ItemIndex:=0;
     DTP_Begin.DateTime:=CO_Datamod.Sysdat.fieldbyname('tek_dat').asdatetime;
        DTP_End.DateTime:=CO_Datamod.Sysdat.fieldbyname('tek_dat').asdatetime;

  dblcbuser.KeyValue:=-1;
  dblcbfilial.KeyValue:=-1;
  dblcbavalute.KeyValue:=-1;
 SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);

end;

procedure TCO_Statement_Form.CBCurrencyClick(Sender: TObject);
begin
if CBCurrency.Checked=true then
  dblcbavalute.KeyValue:=0
else
  dblcbavalute.KeyValue:=-1;

end;

procedure TCO_Statement_Form.CBFilialClick(Sender: TObject);
begin
if CBFilial.Checked=true then
  dblcbfilial.KeyValue:=0
else
  dblcbfilial.KeyValue:=-1;

end;

procedure TCO_Statement_Form.CBUserClick(Sender: TObject);
begin
if CBUser.Checked=true then
  dblcbUser.KeyValue:=0
else
  dblcbUser.KeyValue:=-1;

end;

procedure TCO_Statement_Form.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If key=vk_escape then close;
end;

end.

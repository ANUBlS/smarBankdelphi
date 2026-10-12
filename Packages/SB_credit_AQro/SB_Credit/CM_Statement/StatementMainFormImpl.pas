unit StatementMainFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, ExtCtrls, StdCtrls, Mask, DBCtrls, DBCtrlsEh,
  DBLookupEh, Grids, DBGridEh, Menus, CMExcelExport, Buttons,ComObj;

type
  TCrdStatementMainForm = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    TabSheet2: TTabSheet;
    BtnClose: TButton;
    GroupBox1: TGroupBox;
    DBEdit1: TDBEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    Panel4: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    Panel5: TPanel;
    Label5: TLabel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    Label6: TLabel;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    Label7: TLabel;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    Panel6: TPanel;
    TabSheet1: TTabSheet;
    Panel7: TPanel;
    Label8: TLabel;
    DateTimePickerStart: TDateTimePicker;
    Label9: TLabel;
    DateTimePickerEnd: TDateTimePicker;
    Panel8: TPanel;
    Panel9: TPanel;
    RGChoose: TRadioGroup;
    Button1: TButton;
    Panel10: TPanel;
    GroupBox2: TGroupBox;
    DBGridEh1: TDBGridEh;
    PopupMenu: TPopupMenu;
    RepOr: TMenuItem;
    PopupMenuShedule: TPopupMenu;
    TabSheet3: TTabSheet;
    N1: TMenuItem;
    IntLbl: TLabel;
    Image: TImage;
    LabelInt: TLabel;
    GroupBox6: TGroupBox;
    DTPFullPay: TDateTimePicker;
    EdFullPayAmt: TEdit;
    TabSheet4: TTabSheet;
    GroupBox4: TGroupBox;
    DBGridEh3: TDBGridEh;
    Panel13: TPanel;
    GroupBox5: TGroupBox;
    DBGridEh4: TDBGridEh;
    GroupBox3: TGroupBox;
    DBGridEh2: TDBGridEh;
    SpeedButton1: TSpeedButton;
    Panel11: TPanel;
    Panel12: TPanel;
    EExport: TCMExcelExport;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RepOrClick(Sender: TObject);
    procedure RepOrDrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; Selected: Boolean);
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DTPFullPayChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CrdStatementMainForm: TCrdStatementMainForm;
      Exl, Sheet: Variant;
  procedure InitPlugin(S : String); export;

implementation

uses StatementDataModule,CommonDecls, RestsHistoryImpl, ReportsheduleUnit,RepUnit,InterestshistoryImpl,SbSystem,SBTranslateProc,sboapiDataModuleImpl;

{$R *.DFM}

procedure TCrdStatementMainForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;
end;

procedure InitPlugin(S : String); export;

resourcestring
  rsMineCaption = '%s № li kreditdən "çıxarış" .';

var
  CreditID : Integer;
  CreditNo : String;

begin

  CreditID := Get_SelectedCrdID;
  CreditNo := Get_SelectedCrdNo;

  CrdStatementMainForm.Caption := Format(rsMineCaption, [CreditNo]);

  CrdStatementMainForm.DateTimePickerStart.Date := Get_CurrentDate;
  CrdStatementMainForm.DateTimePickerEnd.Date := Get_CurrentDate;

  with StatementDataMod do
  begin

    with CreditsInfo do
    begin
      if Active then
        Close;
      ClearVariables;
      SetVariable('CRDID',CreditID);
      Open;
    end;

    with DefIntDatSet do
    begin
      if Active then
         Close;
         SetVariable('CrdID',CreditID);
         Open;

         if (integer(trunc(FieldByName('StopCalcDate').AsDateTime))<>0) then
         begin
            with CrdStatementMainForm do
            begin
              LabelInt.Caption :=
              'Faizlərin hesablanması  '+DateToStr(FieldByName('StopCalcDate').AsDateTime)+'  тарихиндян дайандырылыб.';
              Image.Enabled:=True;
            end;
         end
         else
         begin
            with CrdStatementMainForm do
            begin
              LabelInt.Caption :='';
              Image.Visible := False;
            end;
         end;

    end;

    with CreditTypes do
      if not Active then
        Open;

    with Categories do
      if not Active then
        Open;

    with UserGroups do
      if not Active then
        Open;

    with Schedule do
    begin
      if Active then
        Close;
      ClearVariables;
      SetVariable('CRDID',CreditID);
      Open;
    end;

    with Payments do
    begin
      if Active then
        Close;
      ClearVariables;
      SetVariable('CRDID',CreditID);
      Open;
    end;

    with Tranches do
    begin
       if Active then  CloseAll;
        ClearVariables;
        SetVariable('CrdID',CreditID);
        Open;
    end;

    with ProlongationDataSet do
    begin
       if Active then  CloseAll;
        ClearVariables;
        SetVariable('CrdID',CreditID);
        Open;
    end;
    with cust do
    begin
       if Active then  CloseAll;
        ClearVariables;
        SetVariable('id',CreditID);
        Open;
    end;
  end;

  CrdStatementMainForm.ShowModal;

end;

procedure TCrdStatementMainForm.FormCreate(Sender: TObject);
begin
  StatementDataMod := TStatementDataMod.Create(Self);
  ReportForm := TReportForm.Create(Self);
  RestForm := TRestForm.Create(Self);
  InterestsForm := TInterestsForm.Create(Self);
  ReportSheduleForm := TReportSheduleForm.Create(Self);
  SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TCrdStatementMainForm.FormDestroy(Sender: TObject);
begin
  RestForm.Free;
  InterestsForm.Free;
  ReportSheduleForm.Free;
  ReportForm.Free;
  StatementDataMod.Free;
end;

procedure TCrdStatementMainForm.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ORD(Key) = VK_ESCAPE then
    ModalResult := mrOk;
end;

procedure TCrdStatementMainForm.Button1Click(Sender: TObject);

  procedure ShowInterestsForm(CrdID :integer;D1,D2 :TDateTime);
  begin
     with StatementDataMod.IntrInPeriod do
     begin
      ClearVariables;
      SetVariable('CrdID',CrdID);
      SetVariable('D1',D1);
      SetVariable('D2',D2);
      Open;
     end;

     with InterestsForm do
       ShowModal;

    with StatementDataMod.IntrInPeriod do
      Close;

  end;

  procedure ShowRestForm(CrdID : Integer;D1,D2 : TDateTime);
  begin

    with StatementDataMod.RestsInPeriod do
    begin
      ClearVariables;
      SetVariable('CrdID',CrdID);
      SetVariable('D1',D1);
      SetVariable('D2',D2);
      Open;
    end;

    with RestForm do
      ShowModal;

    with StatementDataMod.RestsInPeriod do
      Close;

  end;

var
  CreditID : Integer;
  D1,D2 : TDateTime;
    
begin
  CreditID := Get_SelectedCrdID;
  D1 := DateTimePickerStart.Date;
  D2 := DateTimePickerEnd.Date;
    
  if RGChoose.ItemIndex = 1 then
    ShowRestForm(CreditID,D1,D2);

  if RGChoose.ItemIndex <>1 then
     ShowInterestsForm(CreditID,D1,D2);
end;


exports
  InitPlugin;

procedure TCrdStatementMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with StatementDataMod do
  begin
    with Payments do
      Close;
    with Schedule do
      Close;
  end;
end;



procedure TCrdStatementMainForm.RepOrClick(Sender: TObject);
var  CreditNo :String; CreditId :integer;
begin
  CreditNo := Get_SelectedCrdNo;
  CreditId := Get_SelectedCrdId;
  with StatementDataMod do
    begin
 //      accid := Payments.FieldByName('CREDITID').AsInteger;
      with  ReportDataSet do
       begin
         if Active then CloseAll;
         SetVariable('CRDID',CreditId);
         Open;
         if (FieldByName('LOANACCACCNO').IsNull)
         then FieldByName('LOANACCACCNO').AsString := '0';

         if (FieldByName('INTERESTACCCNO').IsNull)
         then FieldByName('INTERESTACCCNO').AsString := '0';

         if (FieldByName('DUELOANACCNO').IsNull)
         then FieldByName('DUELOANACCNO').AsString := '0';

         if (FieldByName('DUEINTERESTACCNO').IsNull)
         then FieldByName('DUEINTERESTACCNO').AsString := '0';

       end;
end;
  with StatementDataMod,ReportForm do
  begin
     FacticalDebtChild.Enabled := Payments.FieldByName('PAYEDAMT').AsFloat<>0;
     FacticalInterestDebtChild.Enabled := Payments.FieldByName('PAYEDINTAMT').AsFloat<>0;
     OverdueDebtChild.Enabled := Payments.FieldByName('PAYEDDUEAMT').AsFloat<>0;
     QRLVoen.Enabled := ReportDataSet.FieldByName('INN').AsFloat<>0;
     OverdueInterestDebtChild.Enabled := Payments.FieldByName('PAYEDPENALTYAMT').AsFloat<>0;
     QRLContractno.Caption := CreditNo;
     ReportOrder.Preview;
  end;
end;
procedure TCrdStatementMainForm.RepOrDrawItem(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; Selected: Boolean);
var
  LineBottom: Integer;
  SText: String;
  Bar: TRect;

begin
  with ACanvas, Sender as TMenuItem do
  begin
    with Font do
    begin
      Name := 'Azl Sans Serif';
      Charset := RUSSIAN_CHARSET;
      if Default then
        Style := [fsBold];
    end;
    if Caption = '-' then
    begin
      Pen.Color := clBlack;
      LineBottom := (ARect.Top + (ARect.Bottom - ARect.Top) div 2)-1;
      MoveTo(ARect.Left, LineBottom);
      LineTo(ARect.Right, LineBottom);
      inc(LineBottom);
      Pen.Color := clWhite;
      MoveTo(ARect.Left, LineBottom);
      LineTo(ARect.Right, LineBottom);
    end
    else
    begin
      if Selected then
      begin
        Brush.Color := clNavy;
        if Enabled then
          Font.Color := clWhite
        else
          Font.Color := clSilver;
      end
      else
      begin
        Brush.Color := clBtnFace;
        if Enabled then
          Font.Color := clBlack
        else
          Font.Color := clGrayText;
      end;
      Bar := ARect;
     // Inc(Bar.Left, 22);
      FillRect(Bar);
      TextOut(ARect.Left+2, ARect.Top+1, Caption);
    end;
    SText :=ShortCutToText(ShortCut);
    TextOut(ARect.Right-TextWidth(SText)-2, ARect.Top+1, SText);
    if ImageIndex <> -1 then
      with GetParentMenu do
        if Assigned(Images) then
        begin
          if Checked then
          begin
            Bar.Left := ARect.Left + 1;
            Bar.Right := Bar.Left + 16;
            Bar.Top := ARect.Top + 1;
            Bar.Bottom := Bar.Top + 16;

            ACanvas.Brush.Color := clBtnShadow;
            ACanvas.FrameRect(Bar);

            Inc(Bar.Left, 2);
            Inc(Bar.Right, 2);
            Inc(Bar.Top, 2);
            Inc(Bar.Bottom, 2);

            ACanvas.Brush.Color := clBtnHighlight;
            ACanvas.FrameRect(Bar);

            Dec(Bar.Left, 1);
            Dec(Bar.Right, 1);
            Dec(Bar.Top, 1);
            Dec(Bar.Bottom, 1);

            if Selected then
              ACanvas.Brush.Color := clBtnFace
            else
              ACanvas.Brush.Color := clBtnHighlight;
            ACanvas.FillRect(Bar);
          end;
          Images.Draw(ACanvas, ARect.Left, ARect.Top, ImageIndex, Enabled);
        end;
        
  end;
end;


procedure TCrdStatementMainForm.N1Click(Sender: TObject);
var  CreditId :integer; CreditNo :String;
begin
  CreditNo := Get_SelectedCrdNo;
  CreditId := Get_SelectedCrdId;
  with StatementDataMod do
    begin
      with  ReportDataSet do
       begin
         if Active then CloseAll;
         SetVariable('CRDID',CreditId);
         Open;
         if (FieldByName('LOANACCACCNO').IsNull)
         then FieldByName('LOANACCACCNO').AsString := '0';

       end;
  end;
   with StatementDataMod,ReportSheduleForm do
   begin
     FacticalDebtChild1.Enabled := Tranches.FieldByName('trancheamount').AsFloat<>0;
     QRLVoen1.Enabled := ReportDataSet.FieldByName('INN').AsFloat<>0;
     QRLContractno1.Caption := CreditNo;
     QuickRepTR.Preview;
  end;

end;

procedure TCrdStatementMainForm.FormShow(Sender: TObject);
begin
  DTPFullPay.DateTime := Get_CurrentDate;
  with StatementDataMod,CM_AK_REPORTS do
       EdFullPayAmt.Text :=
        FloatToStr(CallFloatFunction('Get_CreditFullPayAmt',
        [Get_SelectedCrdID,Get_CurrentDate])) ;

  PageControl1.ActivePageIndex := 0      
end;

procedure TCrdStatementMainForm.DTPFullPayChange(Sender: TObject);
var PayDat : TDateTime;
begin
  PayDat := Integer(Trunc(DTPFullPay.DateTime));
  with StatementDataMod,CM_AK_REPORTS do
       EdFullPayAmt.Text :=
        FloatToStr(CallFloatFunction('Get_CreditFullPayAmt',
        [Get_SelectedCrdID,PayDat]))
end;

procedure TCrdStatementMainForm.SpeedButton2Click(Sender: TObject);

 var
 RestsStr,chpayStr: String;
 ADDITIONALPARAMS,FilterStr,CheckStr:String;
 sysdat :Tdatetime;

const
number_format='#,##0.00';
number_format_r='#,##0.00%';
n='yyy';
d=2;
f=3;


procedure CreateSheet;
begin
  try
   Exl := CreateOleObject('Excel.Application');
   Exl.WorkBooks.add;
   Sheet := Exl.Application.Worksheets.Item[1];
  except
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
var
s,l,cell, r,i , j , k ,m ,w :Integer;
tt,dat,dd :tdatetime;
rc,t_val :integer;
bash: string;
ll,vv,ss :real;
begin

          CreateSheet;
 try

     Sheet.Range['A1:A60000'].ColumnWidth:=10;
     Sheet.Range['B1:B60000'].ColumnWidth:=15;
     Sheet.Range['C1:C60000'].ColumnWidth:=15;
     Sheet.Range['D1:D60000'].ColumnWidth:=15;
    Sheet.Range['E1:E60000'].ColumnWidth:=15;
     Sheet.Range['F1:F60000'].ColumnWidth:=35;
    {  Sheet.Range['G1:A60000'].ColumnWidth:=35;
     Sheet.Range['P1:A60000'].ColumnWidth:=35; }

 /////////////////////////////////////////////////////////////////////////// /
 Sheet.Cells[2,5]:='Express-Bank';
   Sheet.Cells[2,5].Font.Name:='Azl Sans Serif';
   Sheet.Cells[2,5].Font.Bold :=true;
   Sheet.Cells[2,5].Font.Color:=clolive;
   Sheet.Cells[2,5].Font.size :=22;
/////////////////////////////////////////////////////////////////////////////
       k:=7 ; i:=0;

      sheet.Cells[i+3,1]:='Юдямялидир ';
      Sheet.Cells[i+3,1].Font.Name:='Azl Sans Serif';
      Sheet.Cells[i+3,1].Font.Bold :=true;
      Sheet.Cells[i+3,1].Font.Color:=clred;
      Sheet.Cells[i+3,1].Font.size :=13;

          sheet.Cells[i+4,3]:=' Мцгавилянин № си:';
          Sheet.Cells[i+4,3].Font.Name:='Azl Sans Serif';
          Sheet.Cells[i+4,3].Font.Bold :=true;
          Sheet.Cells[i+4,3].Font.Color:=clred;
          Sheet.Cells[i+4,3].Font.size :=13;

          sheet.Cells[i+4,4]:=' '+StatementDataMod.cust.FieldByName('numberofcredit').asstring;
          Sheet.Cells[i+4,4].Font.Name:='Azl Sans Serif';
          Sheet.Cells[i+4,4].Font.Bold :=true;
          Sheet.Cells[i+4,4].Font.Color:=clblack;
       //   Sheet.Cells[i+4,4].NumberFormat:='##########';

          sheet.Cells[i+4,5]:=' Боржаланын ады:';
          Sheet.Cells[i+4,5].Font.Name:='Azl Sans Serif';
          Sheet.Cells[i+4,5].Font.Bold :=true;
          Sheet.Cells[i+4,5].Font.Color:=clred;
          Sheet.Cells[i+4,5].Font.size :=13;

          sheet.Cells[i+4,6]:=StatementDataMod.cust.FieldByName('name').asstring;
          Sheet.Cells[i+4,6].Font.Name:='Azl Sans Serif';
          Sheet.Cells[i+4,6].Font.Bold :=true;
          Sheet.Cells[i+4,6].Font.Color:=clblack;
 ///////////////////////////////////====================//////////////////

          Sheet.Cells[i+k+1,1]:='Сыра №';
          Sheet.Cells[i+k+1,1].Font.Name:='Azl Sans Serif';
          Sheet.Cells[i+k+1,1].Font.Bold :=true;
          Sheet.Cells[i+k+1,1].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,2].Value:=' Тарих';
          Sheet.Cells[i+k+1,2].Font.Name:='Azl Sans Serif';
          Sheet.Cells[i+k+1,2].Font.Bold :=true;
          Sheet.Cells[i+k+1,2].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,3].Value:=' Ясас борждан';
          Sheet.Cells[i+k+1,3].Font.Name:='Azl Sans Serif';
          Sheet.Cells[i+k+1,3].Font.Bold :=true;
          Sheet.Cells[i+k+1,3].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,4]:=' Щесабланмыш % дян';
          Sheet.Cells[i+k+1,4].Font.Name:='Azl Sans Serif';
          Sheet.Cells[i+k+1,4].Font.Bold :=true;
          Sheet.Cells[i+k+1,4].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,5]:=' Жями';
          Sheet.Cells[i+k+1,5].Font.Name:='Azl Sans Serif';
          Sheet.Cells[i+k+1,5].Font.Bold :=true;
          Sheet.Cells[i+k+1,5].Font.Color:=clBlue;
         StatementDataMod.Schedule.first;
         ShowSheet;
       ss:=0; vv:=0;
       rc:=StatementDataMod.Schedule.RecordCount ;
      for i:=1 to rc do  begin

        Sheet.Cells[i+k+1,1].Font.Name:='Azl Sans Serif';
        Sheet.Cells[i+k+1,1].Font.Bold :=true;
        Sheet.Cells[i+k+1,1]:=StatementDataMod.Schedule.FieldByName('sira').asinteger;

        Sheet.Cells[i+k+1,2].Font.Name:='Azl Sans Serif';
        Sheet.Cells[i+k+1,2].Font.Bold :=true;
        Sheet.Cells[i+k+1,2]:=StatementDataMod.Schedule.FieldByName('PAYMENTDATE').asdatetime;

        Sheet.Cells[i+k+1,3].Font.Name:='Azl Sans Serif';
        Sheet.Cells[i+k+1,3].Font.Bold :=true;
        Sheet.Cells[i+k+1,3]:=StatementDataMod.Schedule.FieldByName('principal').asfloat;

        Sheet.Cells[i+k+1,4].Font.Name:='Azl Sans Serif';
        Sheet.Cells[i+k+1,4].Font.Bold :=true;
        Sheet.Cells[i+k+1,4]:=StatementDataMod.Schedule.FieldByName('interest').asfloat;

        Sheet.Cells[i+k+1,5].Font.Name:='Azl Sans Serif';
        Sheet.Cells[i+k+1,5].Font.Bold :=true;
        Sheet.Cells[i+k+1,5]:=StatementDataMod.Schedule.FieldByName('sm').asfloat;
        Sheet.Cells[i+k+1,5].Font.Color:=clred;

        ss:=ss+StatementDataMod.Schedule.FieldByName('principal').asfloat;
        vv:=vv+StatementDataMod.Schedule.FieldByName('interest').asfloat;
        ll:=ll+StatementDataMod.Schedule.FieldByName('sm').asfloat;
      //  Sheet.Cells[i+k+1,5].Font.Bold :=true;
      //  Sheet.Cells[i+k+2,5]:=

        StatementDataMod.Schedule.Next;
       end;
        Sheet.Cells[rc+k+2,1].Font.Name:='Azl Sans Serif';
        Sheet.Cells[rc+k+2,1].Font.Bold :=true;
        Sheet.Cells[rc+k+2,1]:='Жям';
        Sheet.Cells[rc+k+2,1].Font.Color:=clGreen;

        Sheet.Cells[rc+k+1,3].Font.Name:='Azl Sans Serif';
        Sheet.Cells[rc+k+1,3].Font.Bold :=true;
        Sheet.Cells[rc+k+2,3].Font.Color:=clGreen;
        Sheet.Cells[rc+k+2,3]:=ss;

        Sheet.Cells[rc+k+1,4].Font.Name:='Azl Sans Serif';
        Sheet.Cells[rc+k+1,4].Font.Bold :=true;
        Sheet.Cells[rc+k+2,4].Font.Color:=clGreen;
        Sheet.Cells[rc+k+2,4]:=vv;

        Sheet.Cells[rc+k+1,5].Font.Name:='Azl Sans Serif';
        Sheet.Cells[rc+k+1,5].Font.Bold :=true;
        Sheet.Cells[rc+k+2,5].Font.Color:=clGreen;
        Sheet.Cells[rc+k+2,5]:=ll;
                   bash:=inttostr(k+1);

     // ShowMessage(inttostr(m)); exit;
      Exl.Range['A'+bash+':E'+inttostr(m+k+1)].select;
      Sheet.Range['A'+bash+':E'+inttostr(m+k+1)].Borders.Color:=clBlack;

  finally

   Exl.Range['A1:A1'].Select;

   Screen.Cursor := crDefault;
   DestroySheet;
  StatementDataMod.Schedule.EnableControls;
  end;
//  main.close;

end;




procedure TCrdStatementMainForm.SpeedButton3Click(Sender: TObject);

 var
 RestsStr,chpayStr: String;
 ADDITIONALPARAMS,FilterStr,CheckStr:String;
 sysdat :Tdatetime;

const
number_format='#,##0.00';
number_format_r='#,##0.00%';
n='yyy';
d=2;
f=3;


procedure CreateSheet;
begin
  try
   Exl := CreateOleObject('Excel.Application');
   Exl.WorkBooks.add;
   Sheet := Exl.Application.Worksheets.Item[1];
  except
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
var
s,l,cell, r,i , j , k ,m ,w :Integer;
tt,dat,dd :tdatetime;
rc,t_val :integer;
bash: string;
ll,vv,ss :real;
begin

          CreateSheet;
 try

     Sheet.Range['A1:A60000'].ColumnWidth:=10;
     Sheet.Range['B1:B60000'].ColumnWidth:=15;
     Sheet.Range['C1:C60000'].ColumnWidth:=15;
     Sheet.Range['D1:D60000'].ColumnWidth:=15;
    Sheet.Range['E1:E60000'].ColumnWidth:=15;
     Sheet.Range['F1:F60000'].ColumnWidth:=35;
    {  Sheet.Range['G1:A60000'].ColumnWidth:=35;
     Sheet.Range['P1:A60000'].ColumnWidth:=35; }

 /////////////////////////////////////////////////////////////////////////// /
 Sheet.Cells[2,5]:='';
   Sheet.Cells[2,5].Font.Name:='Azl Sans Serif';
   Sheet.Cells[2,5].Font.Bold :=true;
   Sheet.Cells[2,5].Font.Color:=clolive;
   Sheet.Cells[2,5].Font.size :=22;
/////////////////////////////////////////////////////////////////////////////
       k:=7 ; i:=0;

      sheet.Cells[i+3,1]:='Юдямишдир ';
      Sheet.Cells[i+3,1].Font.Name:='Azl Sans Serif';
      Sheet.Cells[i+3,1].Font.Bold :=true;
      Sheet.Cells[i+3,1].Font.Color:=clred;
      Sheet.Cells[i+3,1].Font.size :=13;

          sheet.Cells[i+4,3]:=' Мцгавилянин № си:';
          Sheet.Cells[i+4,3].Font.Name:='Azl Sans Serif';
          Sheet.Cells[i+4,3].Font.Bold :=true;
          Sheet.Cells[i+4,3].Font.Color:=clred;
          Sheet.Cells[i+4,3].Font.size :=13;

          sheet.Cells[i+4,4]:=' '+StatementDataMod.cust.FieldByName('numberofcredit').asstring;
          Sheet.Cells[i+4,4].Font.Name:='Azl Sans Serif';
          Sheet.Cells[i+4,4].Font.Bold :=true;
          Sheet.Cells[i+4,4].Font.Color:=clblack;
       //   Sheet.Cells[i+4,4].NumberFormat:='##########';

          sheet.Cells[i+4,5]:=' Боржаланын ады:';
          Sheet.Cells[i+4,5].Font.Name:='Azl Sans Serif';
          Sheet.Cells[i+4,5].Font.Bold :=true;
          Sheet.Cells[i+4,5].Font.Color:=clred;
          Sheet.Cells[i+4,5].Font.size :=13;

          sheet.Cells[i+4,6]:=StatementDataMod.cust.FieldByName('name').asstring;
          Sheet.Cells[i+4,6].Font.Name:='Azl Sans Serif';
          Sheet.Cells[i+4,6].Font.Bold :=true;
          Sheet.Cells[i+4,6].Font.Color:=clblack;
 ///////////////////////////////////====================//////////////////

          Sheet.Cells[i+k+1,1]:='Сыра №';
          Sheet.Cells[i+k+1,1].Font.Name:='Azl Sans Serif';
          Sheet.Cells[i+k+1,1].Font.Bold :=true;
          Sheet.Cells[i+k+1,1].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,2].Value:=' Тарих';
          Sheet.Cells[i+k+1,2].Font.Name:='Azl Sans Serif';
          Sheet.Cells[i+k+1,2].Font.Bold :=true;
          Sheet.Cells[i+k+1,2].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,3].Value:=' Ясас борждан';
          Sheet.Cells[i+k+1,3].Font.Name:='Azl Sans Serif';
          Sheet.Cells[i+k+1,3].Font.Bold :=true;
          Sheet.Cells[i+k+1,3].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,4]:='Ясас борж. фаиздян';
          Sheet.Cells[i+k+1,4].Font.Name:='Azl Sans Serif';
          Sheet.Cells[i+k+1,4].Font.Bold :=true;
          Sheet.Cells[i+k+1,4].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,5]:=' Эежикмиш Борждан';
          Sheet.Cells[i+k+1,5].Font.Name:='Azl Sans Serif';
          Sheet.Cells[i+k+1,5].Font.Bold :=true;
          Sheet.Cells[i+k+1,5].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,6]:=' Эежикмиш Б Фаиздян';
          Sheet.Cells[i+k+1,6].Font.Name:='Azl Sans Serif';
          Sheet.Cells[i+k+1,6].Font.Bold :=true;
          Sheet.Cells[i+k+1,6].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,7]:=' Пенйадан';
          Sheet.Cells[i+k+1,7].Font.Name:='Azl Sans Serif';
          Sheet.Cells[i+k+1,7].Font.Bold :=true;
          Sheet.Cells[i+k+1,7].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,8]:=' Жями';
          Sheet.Cells[i+k+1,8].Font.Name:='Azl Sans Serif';
          Sheet.Cells[i+k+1,8].Font.Bold :=true;
          Sheet.Cells[i+k+1,8].Font.Color:=clred;

       ss:=0; vv:=0;
       StatementDataMod.Payments.first;
       rc:=StatementDataMod.Payments.RecordCount ;
      // showmessage(inttostr(rc));exit;
         ShowSheet;
      for i:=1 to rc do  begin

        Sheet.Cells[i+k+1,1].Font.Name:='Azl Sans Serif';
        Sheet.Cells[i+k+1,1].Font.Bold :=true;
        Sheet.Cells[i+k+1,1]:=StatementDataMod.Payments.FieldByName('sira').asinteger;

        Sheet.Cells[i+k+1,2].Font.Name:='Azl Sans Serif';
        Sheet.Cells[i+k+1,2].Font.Bold :=true;
        Sheet.Cells[i+k+1,2]:=StatementDataMod.Payments.FieldByName('paydate').asdatetime;

        Sheet.Cells[i+k+1,3].Font.Name:='Azl Sans Serif';
        Sheet.Cells[i+k+1,3].Font.Bold :=true;
        Sheet.Cells[i+k+1,3]:=StatementDataMod.Payments.FieldByName('payedamt').asfloat;

        Sheet.Cells[i+k+1,4].Font.Name:='Azl Sans Serif';
        Sheet.Cells[i+k+1,4].Font.Bold :=true;
        Sheet.Cells[i+k+1,4]:=StatementDataMod.Payments.FieldByName('payedintamt').asfloat;

        Sheet.Cells[i+k+1,5].Font.Name:='Azl Sans Serif';
        Sheet.Cells[i+k+1,5].Font.Bold :=true;
        Sheet.Cells[i+k+1,5]:=StatementDataMod.Payments.FieldByName('payeddueamt').asfloat;

        Sheet.Cells[i+k+1,6].Font.Name:='Azl Sans Serif';
        Sheet.Cells[i+k+1,6].Font.Bold :=true;
        Sheet.Cells[i+k+1,6]:=StatementDataMod.Payments.FieldByName('payeddueintamt').asfloat;

        Sheet.Cells[i+k+1,7].Font.Name:='Azl Sans Serif';
        Sheet.Cells[i+k+1,7].Font.Bold :=true;
        Sheet.Cells[i+k+1,7]:=StatementDataMod.Payments.FieldByName('PAYEDPENALTYAMT').asfloat;
        Sheet.Cells[i+k+1,7].Font.Color:=clred;

        Sheet.Cells[i+k+1,8].Font.Name:='Azl Sans Serif';
        Sheet.Cells[i+k+1,8].Font.Bold :=true;
        Sheet.Cells[i+k+1,8]:=StatementDataMod.Payments.FieldByName('sm').asfloat;
        Sheet.Cells[i+k+1,8].Font.Color:=clred;

        ss:=ss+StatementDataMod.Payments.FieldByName('payedamt').asfloat;
        vv:=vv+StatementDataMod.Payments.FieldByName('payedintamt').asfloat;
        ll:=ll+StatementDataMod.Payments.FieldByName('sm').asfloat;
      //  Sheet.Cells[i+k+1,5].Font.Bold :=true;
      //  Sheet.Cells[i+k+2,5]:=

        StatementDataMod.Payments.Next;
       end;
        Sheet.Cells[rc+k+2,1].Font.Name:='Azl Sans Serif';
        Sheet.Cells[rc+k+2,1].Font.Bold :=true;
        Sheet.Cells[rc+k+2,1]:='Жям';
        Sheet.Cells[rc+k+2,1].Font.Color:=clGreen;

        Sheet.Cells[rc+k+1,3].Font.Name:='Azl Sans Serif';
        Sheet.Cells[rc+k+1,3].Font.Bold :=true;
        Sheet.Cells[rc+k+2,3].Font.Color:=clGreen;
        Sheet.Cells[rc+k+2,3]:=ss;

        Sheet.Cells[rc+k+1,4].Font.Name:='Azl Sans Serif';
        Sheet.Cells[rc+k+1,4].Font.Bold :=true;
        Sheet.Cells[rc+k+2,4].Font.Color:=clGreen;
        Sheet.Cells[rc+k+2,4]:=vv;

        Sheet.Cells[rc+k+1,5].Font.Name:='Azl Sans Serif';
        Sheet.Cells[rc+k+1,5].Font.Bold :=true;
        Sheet.Cells[rc+k+2,5].Font.Color:=clGreen;
        Sheet.Cells[rc+k+2,5]:='=sum(E9:E'+inttostr(rc+8)+')';

        Sheet.Cells[rc+k+1,6].Font.Name:='Azl Sans Serif';
        Sheet.Cells[rc+k+1,6].Font.Bold :=true;
        Sheet.Cells[rc+k+2,6].Font.Color:=clGreen;
        Sheet.Cells[rc+k+2,6]:='=sum(F9:F'+inttostr(rc+8)+')';

        Sheet.Cells[rc+k+1,7].Font.Name:='Azl Sans Serif';
        Sheet.Cells[rc+k+1,7].Font.Bold :=true;
        Sheet.Cells[rc+k+2,7].Font.Color:=clGreen;
        Sheet.Cells[rc+k+2,7]:=ll;
                   bash:=inttostr(k+1);

     // ShowMessage(inttostr(m)); exit;
       Exl.Range['A'+inttostr(rc+8)+':D'+inttostr(m+k+1)].select;
      Sheet.Range['A'+inttostr(rc+8)+':D'+inttostr(m+k+1)].Borders.Color:=clBlack;
  finally

   Exl.Range['A1:A1'].Select;

   Screen.Cursor := crDefault;
   DestroySheet;
   StatementDataMod.Payments.EnableControls;
  end;
//  main.close;

end;


procedure TCrdStatementMainForm.SpeedButton4Click(Sender: TObject);
begin
//StatementDataMod.payments.open ;
//CreditId := Get_SelectedCrdId;

    with StatementDataMod.Payments do
    begin
      if Active then
        Close;
      ClearVariables;
      SetVariable('CRDID',Get_SelectedCrdId);
      Open;
    end;
         with StatementDataMod.ReportDataSet do
    begin
      if Active then
        Close;
      ClearVariables;
      SetVariable('CRDID',Get_SelectedCrdId);
      Open;
    end;


    ReportForm.ReportOrder.Preview;
//ReportForm.ShowModal   ;

end;

procedure TCrdStatementMainForm.SpeedButton5Click(Sender: TObject);
begin
   with EExport do
   begin
      DBGridEh3.DataSource.DataSet.Last;
      Connect;
      ExportDataset(DBGridEh3.DataSource.DataSet,'TRANSH',True);
      Disconnect;
   end;
end;

initialization
  CrdStatementMainForm := TCrdStatementMainForm.Create(CommonApplication);

end.

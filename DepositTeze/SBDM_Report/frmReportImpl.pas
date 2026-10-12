unit frmReportImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrlsEh, DBLookupEh, ExtCtrls, ComCtrls, CheckLst,
  Buttons,  CMExcelExport;

type
  TfrmReport = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    CBAvalute: TCheckBox;
    LCBValutes: TDBLookupComboboxEh;
    GroupBox2: TGroupBox;
    LCBDepositTypes: TDBLookupComboboxEh;
    CBDepositTypes: TCheckBox;
    GroupBox3: TGroupBox;
    LCBFilials: TDBLookupComboboxEh;
    CBFilial: TCheckBox;
    Panel2: TPanel;
    GroupBox4: TGroupBox;
    CBCustomer: TCheckBox;
    LCBCustomer: TDBLookupComboboxEh;
    GroupBox5: TGroupBox;
    LCBAccno: TDBLookupComboboxEh;
    CBAccno: TCheckBox;
    GroupBox6: TGroupBox;
    LCBCodCust: TDBLookupComboboxEh;
    CBCodCust: TCheckBox;
    Panel3: TPanel;
    GroupBox7: TGroupBox;
    CBPersons: TCheckBox;
    LCBPersons: TDBLookupComboboxEh;
    GroupBox8: TGroupBox;
    LCBCategories: TDBLookupComboboxEh;
    CBCategories: TCheckBox;
    GroupBox9: TGroupBox;
    Label1: TLabel;
    CBOpenedDep: TCheckBox;
    DTPOpenDate: TDateTimePicker;
    DTPCloseDate: TDateTimePicker;
    Panel4: TPanel;
    GroupBox11: TGroupBox;
    CLBTypes: TCheckListBox;
    GroupBox12: TGroupBox;
    CLBStatus: TCheckListBox;
    GroupBox10: TGroupBox;
    Label2: TLabel;
    CBCloseDep: TCheckBox;
    DTPCls1: TDateTimePicker;
    DTPCls2: TDateTimePicker;
    Panel5: TPanel;
    Label3: TLabel;
    DTPReport: TDateTimePicker;
    BitBtnOk: TBitBtn;
    BitBtnCancel: TBitBtn;
    EExport: TCMExcelExport;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
   function BuildFilterString : String;
  public
    { Public declarations }
  end;

var
  frmReport: TfrmReport;

  procedure exportproc(S:String);export;

implementation

{$R *.DFM}

uses CommonDeclsImpl,dmReportImpl,SBTranslateProc,sboapiDataModuleimpl;


procedure exportproc(S:String);export;
begin
   with TfrmReport.Create(CommonApplication) do
     try
       ShowModal;
     finally
       Release;

   end;
end;

exports
   exportproc;


function TfrmReport.BuildFilterString : String;

  procedure ConcatFilter(var S: String; const Prefix : String; Checked : Boolean; KeyValue : Variant);
  const
     csFormat = '(%s=%s)';
  var
    Temp : String;   
  begin

    if Checked then
    begin
      Temp := Format(csFormat,[Prefix,Keyvalue]);
      if S = '' then
        S := Temp
      else
        S :=S + 'and ' + Temp;
    end;
    
  end;  // Concat Filter

  procedure  ConcatFilter1(var S: String; var Prefix : String;  ch :boolean);
  var chS :String;
  begin
      if ch then ChS := ' and  ' else chS := ' or ';

     if (S <> '') and (Prefix <> '') then S := '('+S+ChS+Prefix+')';
     if (S = '') and (Prefix <> '') then S := Prefix;
  end;

var
  FStatus,FopenDat1,FopenDat2,
  FopenDat,FType,FStatus2,FStatus1,
  FType2,FType1 ,FCloseDat,FCloseDat1,FCloseDat2: String;
begin

  Result := '';
  FStatus := '';
  FopenDat1 := '';
  FopenDat2 := '';
  FopenDat := '';
  ConcatFilter(Result,'cont.CURRENCY',CBaValute.Checked,LCBValutes.KeyValue);
  ConcatFilter(Result,'cont.BRANCHID',CBFilial.Checked,LCBFilials.KeyValue);
  ConcatFilter(Result,'cont.PERSONALTYPE',CBPersons.Checked,LCBPersons.KeyValue);
  ConcatFilter(Result,'cont.CLIENTTYPE',CBCategories.Checked,LCBCategories.KeyValue);
  ConcatFilter(Result,'cont.ContractType',CBDepositTypes.Checked,LCBDepositTypes.KeyValue);
  ConcatFilter(Result,'acc.contractaccid',CBCustomer.Checked,LCBCustomer.KeyValue);
  ConcatFilter(Result,'cont.CUSTOMERID',CBCodCust.Checked,LCBCodCust.KeyValue);
  ConcatFilter(Result,'cont.id',CBAccno.Checked,LCBAccno.KeyValue);

  with CLBStatus do
  begin
  if Checked[0] then FStatus1 := '(h.calculationenabled = 1)' else FStatus1 := '';
  if Checked[1] then FStatus2 := '(h.calculationenabled = 0)' else FStatus2 := '';

  ConcatFilter1(FStatus,FStatus1,false);
  ConcatFilter1(FStatus,FStatus2,false);
  end;


  with CLBTypes do
  begin
  if Checked[0] then FType1 := '(cont.type# = 3)' else FType1 := '';
  if Checked[1] then FType2 := '(cont.type# = 4)' else FType2 := '';

  ConcatFilter1(FType,FType1,false);
  ConcatFilter1(FType,FType2,false);
  end;


  if  CBOpenedDep.Checked then
  begin
     FopenDat1 := ' opendate >=  '''+FormatDateTime('dd-MMM-yyyy',DTPOpenDate.Date)+'''';
     FopenDat2 := ' opendate <=  '''+FormatDateTime('dd-MMM-yyyy',DTPCloseDate.Date)+'''';
     FopenDat := '('+'('+FopenDat1+')'+' and '+'('+FopenDat2+')'+')';
  end;

  if  CBCloseDep.Checked then
  begin
     FCloseDat1 := ' opendate >=  '''+FormatDateTime('dd-MMM-yyyy',DTPOpenDate.Date)+'''';
     FCloseDat2 := ' opendate <=  '''+FormatDateTime('dd-MMM-yyyy',DTPCloseDate.Date)+'''';
     FCloseDat := '('+'('+FCloseDat1+')'+' and '+'('+FCloseDat2+')'+')';
  end;

  ConcatFilter1(Result,FStatus,True);
  ConcatFilter1(Result,FType,True);
  ConcatFilter1(Result,FCloseDat,True);
  ConcatFilter1(Result,FopenDat,True);

 // ShowMessage(Result)

end;


procedure TfrmReport.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False

end;

procedure TfrmReport.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Ord(Key) = VK_ESCAPE then Close;
end;

procedure TfrmReport.BitBtnCancelClick(Sender: TObject);
begin
   Close
end;

procedure TfrmReport.FormCreate(Sender: TObject);
begin
   dmReport := TdmReport.Create(Self);
   SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TfrmReport.FormDestroy(Sender: TObject);
begin
   dmReport.Free;
end;

procedure TfrmReport.BitBtnOkClick(Sender: TObject);
var Dat :TDateTime;
begin
   Dat := Integer(Trunc(DTPReport.DateTime));


   with dmReport,ReportData do
   begin
      if Active then CloseAll;
      SQL[45] := ' and '+BuildFilterString;
      SetVariable('Dat',Dat);
      Open;
   end;



   with EExport do
   begin
      Connect;
      ExportDataset(dmReport.ReportData,'Мис шесабаты',true);
   end;  

end;

procedure TfrmReport.FormShow(Sender: TObject);
begin
   with CLBTypes do
   begin
      Checked[0] := True;
      Checked[1] := True;
   end;

   with CLBStatus do
   begin
      Checked[0] := True;
      Checked[1] := True;
   end;

  DTPReport.DateTime := Get_BankDate;
  DTPOpenDate.DateTime := Get_BankDate;
  DTPCloseDate.DateTime := Get_BankDate;
  DTPCls1.DateTime := Get_BankDate;
  DTPCls2.DateTime := Get_BankDate;
  
end;

initialization

    frmReport := TfrmReport.Create(CommonApplication)
end.

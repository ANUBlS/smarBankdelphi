unit NewDepositsFrmReportofBalanceImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, CMExcelExport, OracleData, ComCtrls, Mask,
  DBCtrlsEh, DBLookupEh, ExtCtrls, DBGridEh, XFSCtrls;

type
  TNewDepositsFrmReport = class(TForm)
    CreditTypes: TOracleDataSet;
    CreditTypesID: TFloatField;
    CreditTypesTYPE: TWideStringField;
    CustomerTypes: TOracleDataSet;
    CustomerTypesID: TFloatField;
    CustomerTypesCATEGORY: TWideStringField;
    ExcelExport: TCMExcelExport;
    Filials: TOracleDataSet;
    FilialsID: TFloatField;
    FilialsNAME: TWideStringField;
    query: TOracleDataSet;
    querySMR: TFloatField;
    Persons: TOracleDataSet;
    PersonsID: TFloatField;
    PersonsNAME: TWideStringField;
    Results: TOracleDataSet;
    ResultsCONTRACTNO: TWideStringField;
    ResultsOPENDATE: TDateTimeField;
    ResultsCLOSEDATE: TDateTimeField;
    ResultsBALANCE: TFloatField;
    ResultsINTRATE: TFloatField;
    ResultsPERIOD: TWideStringField;
    ResultsVALUTE: TWideStringField;
    ResultsBREST: TFloatField;
    ResultsTRAMT: TFloatField;
    ResultsPAYAMT: TFloatField;
    ResultsEREST: TFloatField;
    ResultsROUNDINT: TFloatField;
    Valutes: TOracleDataSet;
    ValutesVALUTE: TIntegerField;
    ValutesVALU_NAME: TWideStringField;
    ValutesDatSrc: TDataSource;
    FilialsDatSrc: TDataSource;
    CustTypeDatSrc: TDataSource;
    PersonsDatSrc: TDataSource;
    CredTypeDatScr: TDataSource;
    XFPanel1: TXFPanel;
    XFGroupBox1: TXFGroupBox;
    XFGroupBox2: TXFGroupBox;
    CheckBox1: TXFCheckBox;
    CheckBox2: TXFCheckBox;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    XFPanel2: TXFPanel;
    XFGroupBox3: TXFGroupBox;
    CheckBox7: TXFCheckBox;
    XFGroupBox4: TXFGroupBox;
    CheckBox8: TXFCheckBox;
    DBLookupComboboxEh7: TDBLookupComboboxEh;
    DBLookupComboboxEh8: TDBLookupComboboxEh;
    XFPanel3: TXFPanel;
    XFGroupBox5: TXFGroupBox;
    CheckBox10: TXFCheckBox;
    XFGroupBox6: TXFGroupBox;
    DBLookupComboboxEh9: TDBLookupComboboxEh;
    BeginDate: TDateTimePicker;
    EndDate: TDateTimePicker;
    XFLabel1: TXFLabel;
    XFLabel2: TXFLabel;
    XFButton1: TXFButton;
    XFButton2: TXFButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure XFButton1Click(Sender: TObject);
    procedure XFButton2Click(Sender: TObject);
  private
   function BuildFilterString :String;
  public
    { Public declarations }
  end;

var
  NewDepositsFrmReport: TNewDepositsFrmReport;

    procedure exportproc(S:String);export;

implementation

{$R *.DFM}

uses sboapiDataModuleImpl,NewCommonDeclsImpl,SBTranslateProc;


procedure exportproc(S:String);export;
begin
   NewDepositsFrmReport.ShowModal;
end;
exports
   exportproc;



function TNewDepositsFrmReport.BuildFilterString : String;

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

  end;
begin
  Result := '';
  ConcatFilter(Result,'CURRENCY',CheckBox1.Checked,DBLookupComboboxEh1.KeyValue);
  ConcatFilter(Result,'BRANCHID',CheckBox2.Checked,DBLookupComboboxEh2.KeyValue);
  ConcatFilter(Result,'PERSONALTYPE',CheckBox8.Checked,DBLookupComboboxEh8.KeyValue);
  ConcatFilter(Result,'CLIENTTYPE',CheckBox7.Checked,DBLookupComboboxEh7.KeyValue);
  ConcatFilter(Result,'CONTRACTTYPE',CheckBox10.Checked,DBLookupComboboxEh9.KeyValue);
end;

procedure TNewDepositsFrmReport.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize := False
end;

procedure TNewDepositsFrmReport.FormCreate(Sender: TObject);
begin
   Valutes.Open;
   Filials.Open;
   CustomerTypes.Open;
   Persons.Open;
   CreditTypes.Open;
   SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TNewDepositsFrmReport.FormDestroy(Sender: TObject);
begin
   Valutes.CloseAll;
   Filials.CloseAll;
   CustomerTypes.CloseAll;
   Persons.CloseAll;
   CreditTypes.CloseAll;
end;

procedure TNewDepositsFrmReport.FormKeyPress(Sender: TObject; var Key: Char);
begin
   If Ord(Key) = VK_ESCAPE then close;
end;
   procedure TNewDepositsFrmReport.XFButton1Click(Sender: TObject);

var
  StartDate ,FinDate :TDateTime;
  s,cs :String;
  sm :real;
begin
   sm := 0;
   StartDate := integer(trunc(BeginDate.DateTime));
   FinDate := integer(trunc(EndDate.DateTime));
   cs := ' order by  balance ' ;
   s := BuildFilterString;
   with query do begin
       if Active then close;
        if s <>'' then sql[1] := ' where id# in (select id from sbcm_contracts where '+s +' and type# in (3,4) )';
          //Memo1.text := sql.text;
        open;
        sm := fieldByName('SMR').AsFloat;
        if sm = 0 then sm :=1;


   end;

   with Results do
   begin
     if  s <> '' then s := ' where  '+s+ ' and type# in (3,4) ' +cs else s := ' where  type# in (3,4) ' +cs;
     SQL[13] := s;
      if Active then CloseAll;
      SetVariable('bdat',StartDate) ;
      SetVariable('edat',FinDate) ;
      SetVariable('sm',sm);

      Open;
       with ExcelExport do
       begin
          Connect;
          ExportDataset(Results,'Щесабат',True);
          Disconnect;
       end;
   end;

end;

procedure TNewDepositsFrmReport.XFButton2Click(Sender: TObject);
begin
Close
end;

initialization
   NewDepositsFrmReport:= TNewDepositsFrmReport.Create(CommonApplication)
end.

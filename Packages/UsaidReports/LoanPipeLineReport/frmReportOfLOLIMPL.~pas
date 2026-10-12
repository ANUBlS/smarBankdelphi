unit frmReportOfLOLIMPL;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrlsEh, DBLookupEh, ExtCtrls, Buttons, ComCtrls,
  CMExcelExport,oracle,oracledata;

type
  TfrmReportOflpl = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    GroupBox3: TGroupBox;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    CheckBox2: TCheckBox;
    Panel2: TPanel;
    Panel5: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox2: TGroupBox;
    LCBStatus: TComboBox;
    CBStatus: TCheckBox;
    GroupBox4: TGroupBox;
    CheckBox3: TCheckBox;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    GroupBox5: TGroupBox;
    CheckBox4: TCheckBox;
    DBLookupComboboxEh4: TDBLookupComboboxEh;
    GroupBox7: TGroupBox;
    CBOpendat: TCheckBox;
    EExportReplpl: TCMExcelExport;
    DBLookupComboboxEh5: TDBLookupComboboxEh;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
  private
    function BuildFilterString : String;
    procedure InitFilter(Ds :TOracleDataSet;n :integer);
    procedure exportex(Ds:TOracleDataSet;ShName:String);
  public
    { Public declarations }
  end;

var
  frmReportOflpl: TfrmReportOflpl;

implementation

{$R *.DFM}
uses dmLoanPipeLineReportImpl;

function TfrmReportOflpl.BuildFilterString : String;

  procedure ConcatFilter(var S: String; const Prefix : String; Checked : Boolean; KeyValue : Variant;check :boolean);
  const
     csFormat = '(%s=%s)';
  var
    Temp,op : String;

  begin

     if check then op := ' and ' else op := ' or ';

    if Checked then
    begin
      Temp := Format(csFormat,[Prefix,Keyvalue]);
      if S = '' then
        S := Temp
      else
        S :=S + op + Temp;
    end;

  end;

  procedure  ConcatFilter1(var S: String; var Prefix : String);
  begin
     if (S <> '') and (Prefix <> '') then S := S+' and '+Prefix;
     if (S = '') and (Prefix <> '') then S := Prefix;
  end;

  
var  FStatus,FopenDat1,FopenDat2,FopenDat : String;
begin
  Result := '';
  FStatus := '';
  FopenDat1 := '';
  FopenDat2 := '';
  FopenDat := '';

  ConcatFilter(Result,'clp.CURRENCY',CheckBox1.Checked,DBLookupComboboxEh1.KeyValue,true);
  ConcatFilter(Result,'clp.branchid',CheckBox2.Checked,DBLookupComboboxEh2.KeyValue,true);
  ConcatFilter(Result,'clp.credittype',CheckBox3.Checked,DBLookupComboboxEh3.KeyValue,true);
  ConcatFilter(Result,'clp.usid',CBOpendat.Checked,DBLookupComboboxEh5.KeyValue,true);
  ConcatFilter(Result,'clp.id',CheckBox4.Checked,DBLookupComboboxEh4.KeyValue,true);

  if CBStatus.Checked then
     Case LCBStatus.ItemIndex of
          0: FStatus := '((clp.deny is null) and (clp.wait is null))';
          1: FStatus := '((clp.deny is null) and (clp.wait is not null))';
          2: FStatus := '((clp.deny is not null ) and (clp.wait is null))';
     end;

  ConcatFilter1(Result,FStatus);
//  ConcatFilter1(Result,FopenDat);

end;


procedure TfrmReportOflpl.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := false
end;

procedure TfrmReportOflpl.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if ord(key) = VK_ESCAPE then close;
end;

procedure TfrmReportOflpl.InitFilter(Ds :TOracleDataSet;n :integer);
begin
    //ShowMessage(BuildFilterString);
   with Ds do begin
        if active then CloseAll;
        if BuildFilterString <> '' then
        SQL[n] := ' and '+BuildFilterString;
        Open;
   end;
end;

procedure TfrmReportOflpl.exportex(Ds:TOracleDataSet;ShName:String);
begin

   with EExportReplpl do begin
        //ConnectTo := ConnTo;

        //Connect;
        ExportDataset(Ds,ShName,true,false);
        //Disconnect;
   end;
end;

procedure TfrmReportOflpl.BitBtn1Click(Sender: TObject);
begin

   with dmLoanPipeLineReport do begin //1
        InitFilter(RepApp,33);
        InitFilter(RepDoc,39);
        InitFilter(RepARisk,19);
        InitFilter(RepOp,32);
        InitFilter(RepPayPr,23);
        EExportReplpl.Connect;
        exportex(RepPayPr,'PaymentProcess');
        exportex(RepOp,'OpComitee');
        exportex(RepARisk,'AnaliysOfRisk');
        exportex(RepDoc,'Documents');
        exportex(RepApp,'Applications');
        EExportReplpl.Disconnect;

   end ; //1
end;

end.

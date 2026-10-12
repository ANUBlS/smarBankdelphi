unit frmReserveInfImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrlsEh, DBLookupEh, ExtCtrls, Buttons, CMExcelExport,
  NLSLocalizer, ComCtrls;

type
  TfrmReserveInf = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    CBaValute: TCheckBox;
    LCBValutes: TDBLookupComboboxEh;
    GroupBox3: TGroupBox;
    LCBFilials: TDBLookupComboboxEh;
    CBFilial: TCheckBox;
    Panel2: TPanel;
    GroupBox4: TGroupBox;
    CBCategories: TCheckBox;
    LCBCategories: TDBLookupComboboxEh;
    GroupBox6: TGroupBox;
    LCBPersons: TDBLookupComboboxEh;
    CBPersons: TCheckBox;
    Panel3: TPanel;
    GroupBox7: TGroupBox;
    CBReserve: TCheckBox;
    GroupBox9: TGroupBox;
    LCBCreditType: TDBLookupComboboxEh;
    CBCreditType: TCheckBox;
    NLSLocalizer1: TNLSLocalizer;
    EExport: TCMExcelExport;
    BitBtnOk: TBitBtn;
    BitBtnCancel: TBitBtn;
    DTPDat: TDateTimePicker;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
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
  frmReserveInf: TfrmReserveInf;
  procedure InitPlugin(s:string);export;

implementation

{$R *.DFM}

uses dmReserveInfImpl,CommonDecls,systemstate;

procedure InitPlugin(s:string);export;
begin
   frmReserveInf.ShowModal;
end;
exports
     InitPlugin;




procedure TfrmReserveInf.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := false;
end;

procedure TfrmReserveInf.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if ord(key) = VK_ESCAPE then close
end;


function TfrmReserveInf.BuildFilterString : String;

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




begin

  Result := '';

  
  ConcatFilter(Result,'p.CURRENCY',CBaValute.Checked,LCBValutes.KeyValue);
  ConcatFilter(Result,'p.BRANCHID',CBFilial.Checked,LCBFilials.KeyValue);
  ConcatFilter(Result,'p.PERSONALTYPE',CBPersons.Checked,LCBPersons.KeyValue);
  ConcatFilter(Result,'p.CustomerTYPE',CBCategories.Checked,LCBCategories.KeyValue);
  ConcatFilter(Result,'p.CreditType',CBCreditType.Checked,LCBCreditType.KeyValue);

 // ShowMessage(Result)

end;


procedure TfrmReserveInf.FormCreate(Sender: TObject);
begin
  dmReserveInf := TdmReserveInf.create(Self);
end;

procedure TfrmReserveInf.FormDestroy(Sender: TObject);
begin
   dmReserveInf.free;
end;


procedure TfrmReserveInf.BitBtnOkClick(Sender: TObject);
var repdat : TDateTime;
begin
    repdat := integer(trunc(DTPDat.DateTime));
    with dmReserveInf,ReserveInf do
    begin
         if Active then CloseAll;
         SetVariable('dat',repdat);
         SQL[70] := BuildFilterString;
         open;
    end;

    with EExport do begin
        Connect;
        ExportDataset(dmReserveInf.ReserveInf,'Åשעטייאעכאנ צקצם  שוסאבאע',true,false);
        Disconnect;
    end;
    
end;

procedure TfrmReserveInf.FormShow(Sender: TObject);
begin
   DTPDat.DateTime := Get_CurrentDate
end;

initialization
   frmReserveInf := TfrmReserveInf.Create(CommonApplication);
end.

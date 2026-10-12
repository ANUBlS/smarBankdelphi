unit FormStatementLmpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Gauges, ExtCtrls, DBCtrls, Buttons;

type

     TFormStatement = class(TForm)
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
    RGroupValView: TRadioGroup;
    PanelProgress: TPanel;
    PrBarParent: TGauge;
    PrBarChild: TProgressBar;
    RichEdit1: TRichEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
     Function UpdateStr(InpStr:string):string;
      function SB_SysDate :TDateTime;

     public
  { Public declarations }
  end;

var
  FormStatement: TFormStatement;

implementation
uses UnitDataModPCustService;

   Function TFormStatement.UpdateStr(InpStr:string):string;
var
  TempString, EndString:String;
  flag,TempCount ,i, Count, Beg_Index, k : Integer;
const
  Commas='''';
  Comma=',';
  begin
    Result:= InpStr;
    if Result<>'' then
{}    begin
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

{}    end
    else
      Result:= ''' ''';
  end;



   function TStatementFrm.SB_SysDate :TDateTime;
    begin
             with
                 DataModPCustService.SB_STATEMENT
                                     do
                             begin

               Result:=CallDateFunction('get_date',[]);
                          end;
    end;
     {$R *.dfm}

procedure TFormStatement.FormCreate(Sender: TObject);
begin
 //StatementFrm := Self;
  //if not Assigned(DataModSTX) then DataModSTX:=TDataModSTX.Create(Self);
  CBoxExtractCheck.ItemIndex:=0;
  DTP_Begin.DateTime:=SB_SysDate;
  DTP_End.DateTime:=SB_SysDate;

  dblcbuser.KeyValue:=-1;
  dblcbfilial.KeyValue:=-1;
  dblcbavalute.KeyValue:=-1;

 //- SBTranslateProc.TranslateAllComponents(Self,sboapiDataModule.OrPack_SL);
end;

end.

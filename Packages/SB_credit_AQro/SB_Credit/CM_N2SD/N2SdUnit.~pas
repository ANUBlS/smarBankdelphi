unit N2SdUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NLSLocalizer, CMExcelExport, Buttons, ComCtrls, StdCtrls, Mask,
  DBCtrlsEh, DBLookupEh, ExtCtrls;

type
  TFormSd = class(TForm)
    NLSLocalizer1: TNLSLocalizer;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    GroupBox4: TGroupBox;
    DBLookupComboboxEhBr: TDBLookupComboboxEh;
    CheckBoxBr: TCheckBox;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    DBLookupComboboxEhReg: TDBLookupComboboxEh;
    CheckBoxReg: TCheckBox;
    GroupBox3: TGroupBox;
    DBLookupComboboxEhVal: TDBLookupComboboxEh;
    CheckBoxVal: TCheckBox;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    BeginDate: TDateTimePicker;
    EndDate: TDateTimePicker;
    ChBPeriod: TCheckBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBLookupComboboxEhPR: TDBLookupComboboxEh;
    ProgressBar: TProgressBar;
    CMExcelExport1: TCMExcelExport;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    
  private
    { Private declarations }
  public
    function BuildFilterString : String;
  end;

var
  FormSd: TFormSd;

implementation

{$R *.DFM}

uses CommonDecls,PrUnit,DatModN2SdImpl,SystemState;

procedure InitPlugin(s:string);export;
begin
   FormSd.ShowModal;
end;

exports
 initplugin;

function TFormSd.BuildFilterString : String;

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
        S :=S + 'AND' + Temp;
    end;
    
  end;
begin

  Result := '';
  ConcatFilter(Result,'CURRENCY',CheckBoxVal.Checked,DBLookupComboboxEhVal.KeyValue);
  ConcatFilter(Result,'BRANCHID',CheckBoxBr.Checked,DBLookupComboboxEhBr.KeyValue);
 //ConcatFilter(Result,'regid',CheckBoxReg.Checked,DBLookupComboboxEhReg.KeyValue);
  ConcatFilter(Result,'PERIOD',ChBPeriod.Checked,DBLookupComboboxEhPR.KeyValue);
end;

procedure TFormSd.FormCreate(Sender: TObject);
begin
   BeginDate.DateTime := Get_CurrentDate;
   EndDate.DateTime   := Get_CurrentDate;
   DatModN2Sd := TDatModN2Sd.Create(Self);
  // FormPr := TFormPr.Create(Self);
end;

procedure TFormSd.SpeedButton1Click(Sender: TObject);
var FilterStr :String;
bdate ,edate :TDateTime;
S ,D   : String;
begin

   bdate := Begindate.DateTime ;
   edate := EndDate.DateTime;
   FilterStr := BuildFilterString;


    if CheckBoxReg.Checked then begin
    S := 'where id in (select creditid from cm_business_plan bp,agro_region r,agro_village v  where v.depend_id = r.ID and  bp.villageid = v.ID and  r.id= '+  DatModN2Sd.RegDatSet.FieldByName('ID').AsString+' )';
     end  else s:='';

   with DatModN2Sd do
   begin

      with CrdinfoDatSet do
      begin
         Filtered := False;
         Filter := FilterStr;
         Filtered := True;
         close ;
            SQL[3]:=S;
         open;
      Session.Commit;

      with ProgressBar do
      begin
      Position := 0;
      Max := RecordCount;
      Step := 1;
      end;

    // FormPr.Show;
    // FormPr.Update;
     FormSd.Height:=207;
     Self.Update;
     First;


        while not EOF do
        begin

           CM_N3_SD.CallProcedure('pn2_sdf',[
                                             'p_creditid',FieldByName('ID').AsInteger,
                                             'p_bdate',bdate,
                                             'p_edate',edate
                                             ]);
        ProgressBar.Position := RecNo + 1;
         Next;
        end;

       FormSd.Height:=188;;

      end;

      with ResultDatSet do
      begin
        if Active then CloseAll;
        Open;
      end;
      with CMExcelExport1 do
      begin
         Connect;
         ExportDataset(ResultDatSet,'Ôîðìà Í2-ÑÄ',true);
         Disconnect;
      end;
   end;

end;



procedure TFormSd.SpeedButton2Click(Sender: TObject);
begin
close
end;

initialization

 FormSd := TFormSd.Create(CommonApplication);
end.

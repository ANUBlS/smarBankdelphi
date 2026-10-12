unit SdNewUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, StdCtrls, ComCtrls, CMExcelExport, Mask, DBCtrlsEh,
  DBLookupEh, NLSLocalizer;

type
  TSDForm = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    NatVal: TCheckBox;
    Freeval: TCheckBox;
    FreeNotVal: TCheckBox;
    GroupBox3: TGroupBox;
    LegalPerson: TCheckBox;
    NaturalPerson: TCheckBox;
    GroupBox2: TGroupBox;
    NLSLocalizer1: TNLSLocalizer;
    ExcelExport: TCMExcelExport;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    FirstDateTime: TDateTimePicker;
    LastDateTime: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
 //   procedure AppSd(var bdate,edate :TDateTime;var bval :boolean;var bper:boolean)
  public
    { Public declarations }
  end;

var
  SDForm: TSDForm;

implementation
 Uses CommonDecls,SdNewDatModImpl,ProgressSDUnit,SystemState;
{$R *.DFM}

procedure InitPlugin(s:string);export;
begin
   SDForm.ShowModal;
end;

exports
  InitPlugin;
procedure TSDForm.FormCreate(Sender: TObject);
begin
   FirstDateTime.DateTime := Get_CurrentDate;
   LastDateTime.DateTime := Get_CurrentDate;
   DatModSdNew := TDatModSdNew.Create(self);
   ProgressForm := TProgressForm.Create(self);
end;

procedure TSDForm.FormDestroy(Sender: TObject);
begin
  with DatModSdNew do
  begin
     CrdInfo.CloseAll;
     Free;
  end;
end;


procedure TSDForm.BitBtn1Click(Sender: TObject);
var FDate :TDateTime;
    LDate :TDateTime;
begin

  Fdate := Integer(trunc(FirstDateTime.DateTime));
  LDate := Integer(trunc(LastDateTime.DateTime));

   with DatModSdNew do
   begin
     DataSetSD.Session.Commit;
     LogInformation('Ихраж башланды');
     CM_SD.CallProcedure('run_result',[
                          'bdate',Fdate,
                          'edate',LDate,
                          'n_val',NatVal.checked,
                          'f_val',Freeval.checked,
                          'fn_val',FreeNotVal.checked,
                          'natper',NaturalPerson.checked,
                          'legper',LegalPerson.checked]);
    LogInformation('Ихраж битди');
    DataSetSD.CloseAll;
    DataSetSD.Open;

    with ExcelExport do
    begin

      Connect;

      ExportDataset(DataSetSD,'СД1 Щесабаты ',true);

      Disconnect;
    end;

   end;
end;

procedure TSDForm.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TSDForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False;
end;



procedure TSDForm.BitBtn2Click(Sender: TObject);
begin
 Close
end;

initialization
   SDForm := TSDForm.Create(CommonApplication);
end.

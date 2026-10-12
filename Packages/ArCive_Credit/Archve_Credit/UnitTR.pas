unit UnitTR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, OracleData;

type
  TFormTr = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    StartDateEdit: TDateTimePicker;
    EndDateEdit: TDateTimePicker;
    OkButton: TButton;
    CancelButton: TButton;
    ods_sys: TOracleDataSet;
    ods_sysTEK_DAT: TDateTimeField;
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure StartDateEditChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EndDateEditChange(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTr: TFormTr;
    bdat: TDateTime;
   Edat: TDateTime;
implementation
         uses ArchiveCredUnit,sboapiDataModuleImpl;
{$R *.dfm}

procedure TFormTr.CancelButtonClick(Sender: TObject);
begin
FormTr.Close;
end;

procedure TFormTr.EndDateEditChange(Sender: TObject);
begin
Edat:=TRUNC(EndDateEdit.DateTime);
end;

procedure TFormTr.FormShow(Sender: TObject);
begin
  StartDateEdit.DateTime:=ods_sysTEK_DAT.AsVariant;
  EndDateEdit.DateTime:=ods_sysTEK_DAT.AsVariant;

  bdat:=TRUNC(StartDateEdit.DateTime);
  Edat:=TRUNC(EndDateEdit.DateTime);
end;

procedure TFormTr.OkButtonClick(Sender: TObject);
  begin

if MessageDlg('Ümidsiz kreditlərin ödənilməsini  istəyirsinizmi ?',
   mtConfirmation, mbYesNoCancel, 0) = mrYes then

     begin
  DataMArchiveCr.cm_bad_loans.CallProcedure('bad_loans_trans',[bdat,Edat]);

  end;
end;

procedure TFormTr.StartDateEditChange(Sender: TObject);
begin

bdat:=TRUNC(StartDateEdit.DateTime);

end;

end.

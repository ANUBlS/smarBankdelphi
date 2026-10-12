unit EditTrUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, NLSLocalizer;

type
  TEditTrForm = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    EditAmount: TEdit;
    DateTimePicker: TDateTimePicker;
    Label1: TLabel;
    Label5: TLabel;
    NLSLocalizer1: TNLSLocalizer;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditTrForm: TEditTrForm;

implementation

{$R *.DFM}
uses CorrectDatModImpl,CommonDecls,systemState;

procedure TEditTrForm.SpeedButton1Click(Sender: TObject);
var
   P_CrdID :integer;
   P_TrancheDate :TDateTime;
   P_TrchAmount :Real;

begin

  P_CrdID := Get_SelectedCrdID;
  P_TrchAmount := StrToFloat(EditAmount.Text);
  P_TrancheDate := integer(trunc(DateTimePicker.DateTime));

   with CorrectDatMod ,CM_CORR_TRCH_PAY ,Tranches do
   begin
     CallProcedure('edit_tranches',[P_CrdID,P_TrancheDate,P_TrchAmount]);
     Refresh;
   end;

   with EditTrForm do
   Close;
  end;

procedure TEditTrForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if ord(Key) = VK_ESCAPE then Close;
end;

procedure TEditTrForm.FormCreate(Sender: TObject);
begin
      DateTimePicker.DateTime := Get_CurrentDate;
      EditAmount.Text := '0';
end;

procedure TEditTrForm.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

end.

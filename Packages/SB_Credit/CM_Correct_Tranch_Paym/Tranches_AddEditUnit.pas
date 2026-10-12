unit Tranches_AddEditUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrlsEh, StdCtrls, Mask, Buttons, ComCtrls;

type
  TTranches_AddEditForm = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    EditAmount: TEdit;
    DateTimePicker: TDateTimePicker;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Tranches_AddEditForm: TTranches_AddEditForm;

implementation

{$R *.DFM}
uses CorrectDatModImpl,CommonDecls;

procedure TTranches_AddEditForm.SpeedButton1Click(Sender: TObject);
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
     CallProcedure('add_tranches',[P_CrdID,P_TrancheDate,P_TrchAmount]);
     Refresh;
   end;

   with Tranches_AddEditForm do
   Close;

end;

procedure TTranches_AddEditForm.SpeedButton2Click(Sender: TObject);
begin
   with CorrectDatMod ,Tranches do
        Cancel;
   with Tranches_AddEditForm do
        Close;
end;

end.

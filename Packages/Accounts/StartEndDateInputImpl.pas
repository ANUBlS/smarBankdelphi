unit StartEndDateInputImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls;

type
  TStartEndDateInputForm = class(TForm)
    GroupBox1: TGroupBox;
    OkButton: TButton;
    CancelButton: TButton;
    Label1: TLabel;
    Label2: TLabel;
    StartDateEdit: TDateTimePicker;
    EndDateEdit: TDateTimePicker;
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FCommited: Boolean;
    FStartDate: TDateTime;
    FEndDate: TDateTime;
    procedure SetStartDate(Value: TDateTime);
    procedure SetEndDate(Value: TDateTime);
  public
    { Public declarations }
    function Execute: Boolean;
    property StartDate: TDateTime read FStartDate write SetStartDate;
    property EndDate: TDateTime read FEndDate write SetEndDate;
  end;

var
  StartEndDateInputForm: TStartEndDateInputForm;

implementation

{$R *.DFM}

procedure TStartEndDateInputForm.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TStartEndDateInputForm.OkButtonClick(Sender: TObject);
begin
  Close;
  FCommited := True;
end;

procedure TStartEndDateInputForm.SetStartDate(Value: TDateTime);
begin
  StartDateEdit.DateTime := Value;
  FStartDate := Value;
end;

procedure TStartEndDateInputForm.SetEndDate(Value: TDateTime);
begin
  EndDateEdit.DateTime := Value;
  FEndDate := Value;
end;

function TStartEndDateInputForm.Execute: Boolean;
begin
  FCommited := False;
  ShowModal;
  FStartDate := StartDateEdit.DateTime;
  FEndDate := EndDateEdit.DateTime;
  Result := FCommited;
end;

procedure TStartEndDateInputForm.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Ord(Key) = VK_ESCAPE then
    Close;
end;

end.

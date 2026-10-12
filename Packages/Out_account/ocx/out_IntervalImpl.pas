unit out_IntervalImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls;

type
  TFormInterval = class(TForm)
    OkButton: TButton;
    CancelButton: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    StartDateEdit: TDateTimePicker;
    EndDateEdit: TDateTimePicker;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormInterval: TFormInterval;

implementation

{$R *.DFM}


procedure TFormInterval.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_ESCAPE then
    Close;
end;

procedure TFormInterval.FormShow(Sender: TObject);
begin
 ActiveControl :=StartDateEdit;
end;

end.

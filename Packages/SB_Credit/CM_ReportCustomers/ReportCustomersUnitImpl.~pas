unit ReportCustomersUnitImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NLSLocalizer, CMExcelExport, StdCtrls, Mask, DBCtrlsEh, DBLookupEh,
  ComCtrls, Buttons;

type
  TForm1 = class(TForm)
    DateTimePicker1: TDateTimePicker;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    NLSLocalizer1: TNLSLocalizer;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CMExcelExport1: TCMExcelExport;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key) = VK_ESCAPE then close
end;

end.

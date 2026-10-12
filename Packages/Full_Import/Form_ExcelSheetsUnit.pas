unit Form_ExcelSheetsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, ExtCtrls;

type
  TForm_ExcelSheets = class(TForm)
    Panel1: TPanel;
    CheckListBox1: TCheckListBox;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_ExcelSheets: TForm_ExcelSheets;

implementation

{$R *.dfm}

procedure TForm_ExcelSheets.Button1Click(Sender: TObject);
begin
close
end;

end.

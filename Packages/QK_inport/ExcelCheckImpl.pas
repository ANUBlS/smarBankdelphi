unit ExcelCheckImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, CheckLst, XFSCtrls, ExtCtrls;

type
  TExcelCheck = class(TForm)
    XFPanel1: TXFPanel;
    XFPanel2: TXFPanel;
    CheckListBox1: TCheckListBox;
    XFButton1: TXFButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure XFButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ExcelCheck: TExcelCheck;

implementation

{$R *.dfm}

procedure TExcelCheck.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TExcelCheck.XFButton1Click(Sender: TObject);
begin
close
end;

end.

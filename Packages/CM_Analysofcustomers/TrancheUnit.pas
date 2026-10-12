unit TrancheUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, NLSLocalizer, ExtCtrls, DBCtrlsEh, Grids,
  DBGridEh;

type
  TTrancheForm = class(TForm)
    Panel1: TPanel;
    NLSLocalizer1: TNLSLocalizer;
    GroupBox1: TGroupBox;
    DBGridEh1: TDBGridEh;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TrancheForm: TTrancheForm;

implementation
  uses CustAnalysDataModuleImpl;
{$R *.DFM}

procedure TTrancheForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False;
end;

procedure TTrancheForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if ord(Key) = VK_ESCAPE then Close;
end;

end.

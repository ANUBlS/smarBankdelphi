unit FormSD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  NLSLocalizer, ComCtrls, StdCtrls, Mask, DBCtrlsEh;

type
  TStandartPluginForm = class(TForm)
    Localizer: TNLSLocalizer;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StandartPluginForm: TStandartPluginForm;

implementation

uses CommonDecls;

{$R *.DFM}

procedure TStandartPluginForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_ESCAPE then
    ModalResult := mrCancel
end;

procedure TStandartPluginForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;
end;

end.

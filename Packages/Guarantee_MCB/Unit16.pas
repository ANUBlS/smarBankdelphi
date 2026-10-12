unit Unit16;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckLst, Evanescence, Buttons;

type
  TFormGua_creditDel = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DelOtherPAPERNO: TEvanescence;
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGua_creditDel: TFormGua_creditDel;

implementation
  uses DataMGuarantee;
{$R *.DFM}

procedure TFormGua_creditDel.FormKeyPress(Sender: TObject; var Key: Char);
begin
if ord(key) = VK_ESCAPE then close
end;


end.

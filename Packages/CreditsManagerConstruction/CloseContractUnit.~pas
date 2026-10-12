unit CloseContractUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TCloseContractForm = class(TForm)
    GroupBox1: TGroupBox;
    EditDescription: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CloseContractForm: TCloseContractForm;

implementation

{$R *.DFM}

procedure TCloseContractForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;
end;

procedure TCloseContractForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(key) = VK_ESCAPE Then close;
end;

procedure TCloseContractForm.BitBtn2Click(Sender: TObject);
begin
  close
end;

end.

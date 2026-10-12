unit transferimpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TTransfer = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Transfer: TTransfer;

implementation

{$R *.DFM}

procedure TTransfer.Button1Click(Sender: TObject);
begin
try
transfer :=transfer.create(self);
transfer.showmodal;
finally
transfer.release;

end;
  end;
end.

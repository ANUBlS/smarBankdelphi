unit About;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TAdmLogsAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowAdmLogsAbout;

implementation

{$R *.DFM}

procedure ShowAdmLogsAbout;
begin
  with TAdmLogsAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.

unit CableAbout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TCableManAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowCableManAbout;

implementation

{$R *.DFM}

procedure ShowCableManAbout;
begin
  with TCableManAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.

unit AccountAboutImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TAccountMainFormAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowAccountMainFormAbout;

implementation

{$R *.DFM}

procedure ShowAccountMainFormAbout;
begin
  with TAccountMainFormAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.

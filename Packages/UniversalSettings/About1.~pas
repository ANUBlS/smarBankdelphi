unit About1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TSBUniversalSettingsAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowSBUniversalSettingsAbout;

implementation

{$R *.DFM}

procedure ShowSBUniversalSettingsAbout;
begin
  with TSBUniversalSettingsAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.

unit About1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TSBLogsAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowSBLogsAbout;

implementation

{$R *.DFM}

procedure ShowSBLogsAbout;
begin
  with TSBLogsAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.

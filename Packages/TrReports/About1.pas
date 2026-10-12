unit About1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TTransactionReportsAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowTransactionReportsAbout;

implementation

{$R *.DFM}

procedure ShowTransactionReportsAbout;
begin
  with TTransactionReportsAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.

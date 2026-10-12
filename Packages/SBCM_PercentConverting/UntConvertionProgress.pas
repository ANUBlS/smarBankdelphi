unit UntConvertionProgress;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls;

type
  TFrmProgress = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    BtnDetails: TButton;
    ProgressBar: TProgressBar;
    NoteMemo: TMemo;
    LblResult: TLabel;
    CurrentContractLabel: TStaticText;
    procedure BtnDetailsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProgress: TFrmProgress;

implementation

{$R *.DFM}

procedure TFrmProgress.BtnDetailsClick(Sender: TObject);
begin
   NoteMemo.Visible :=not NoteMemo.Visible
end;

end.

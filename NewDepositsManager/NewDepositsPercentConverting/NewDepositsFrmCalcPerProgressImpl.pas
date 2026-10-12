unit NewDepositsFrmCalcPerProgressImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls;

type
  TNewDepositsFrmCalcPerProgress = class(TForm)
    Panel1: TPanel;
    StaticText1: TStaticText;
    CurrentDeposit: TStaticText;
    ProgressBar: TProgressBar;
    BtnDetails: TButton;
    BtnClose: TButton;
    GroupBox1: TGroupBox;
    LblResult: TLabel;
    STCapitalizationsCount: TStaticText;
    STWithdrawsCount: TStaticText;
    STContractsCount: TStaticText;
    DetailsMemo: TMemo;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnDetailsClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewDepositsFrmCalcPerProgress: TNewDepositsFrmCalcPerProgress;

implementation

{$R *.DFM}

procedure TNewDepositsFrmCalcPerProgress.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Ord(Key) = VK_ESCAPE then Close;
end;

procedure TNewDepositsFrmCalcPerProgress.BtnDetailsClick(Sender: TObject);
begin
  DetailsMemo.Visible := not DetailsMemo.Visible
end;

procedure TNewDepositsFrmCalcPerProgress.BtnCloseClick(Sender: TObject);
begin
   Close;
end;

end.

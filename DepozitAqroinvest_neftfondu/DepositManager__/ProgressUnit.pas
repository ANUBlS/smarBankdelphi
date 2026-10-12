unit ProgressUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls;

type
  TProgressForm = class(TForm)
    Panel1: TPanel;
    StaticText1: TStaticText;
    CurrentDeposit: TStaticText;
    ProgressBar: TProgressBar;
    BtnDetails: TButton;
    BtnClose: TButton;
    DetailsMemo: TMemo;
    GroupBox1: TGroupBox;
    LblResult: TLabel;
    STCapitalizationsCount: TStaticText;
    STWithdrawsCount: TStaticText;
    STContractsCount: TStaticText;
    procedure BtnDetailsClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ProgressForm: TProgressForm;

implementation

{$R *.DFM}

procedure TProgressForm.BtnDetailsClick(Sender: TObject);
begin
  DetailsMemo.Visible := not DetailsMemo.Visible
end;

procedure TProgressForm.BtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TProgressForm.FormShow(Sender: TObject);
begin
  LblResult.Caption := '';
  STContractsCount.Caption :='';
  STCapitalizationsCount.Caption :='';
  STWithdrawsCount.Caption :='';
end;

end.

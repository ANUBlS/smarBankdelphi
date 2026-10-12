unit frmCalcPerProgressImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls;

type
  TfrmCalcPerProgress = class(TForm)
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
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalcPerProgress: TfrmCalcPerProgress;

implementation

{$R *.DFM}
uses SBTranslateProc,sboapiDataModuleimpl;

procedure TfrmCalcPerProgress.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TfrmCalcPerProgress.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Ord(Key) = VK_ESCAPE then Close;
end;

procedure TfrmCalcPerProgress.BtnDetailsClick(Sender: TObject);
begin
  DetailsMemo.Visible := not DetailsMemo.Visible
end;

procedure TfrmCalcPerProgress.BtnCloseClick(Sender: TObject);
begin
   Close;
end;

end.

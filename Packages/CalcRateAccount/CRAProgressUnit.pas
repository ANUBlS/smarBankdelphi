unit CRAProgressUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls;

type
  TFormCRAProgress = class(TForm)
    ProgressBar: TProgressBar;
    Panel1: TPanel;
    Label1: TLabel;
    StaticTextContNo: TStaticText;
    Button1: TButton;
    Button2: TButton;
    MemoD: TMemo;
    GroupBox1: TGroupBox;
    LblResult: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCRAProgress: TFormCRAProgress;

implementation
uses sbtranslateproc,sboapiDataModuleimpl;

{$R *.DFM}

procedure TFormCRAProgress.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormCRAProgress.FormCreate(Sender: TObject);
begin
  SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TFormCRAProgress.Button1Click(Sender: TObject);
begin
   MemoD.Visible := not MemoD.Visible;
end;

end.

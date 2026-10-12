unit frmpbfPayRepNumImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TfrmpbfPayRepNum = class(TForm)
    BitBtn1: TBitBtn;
    Label2: TLabel;
    Edit2: TEdit;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmpbfPayRepNum: TfrmpbfPayRepNum;

implementation

uses frmpbfReportImpl,SBTranslateProc,sboapiDataModuleImpl;

{$R *.DFM}

procedure TfrmpbfPayRepNum.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := false;
end;

procedure TfrmpbfPayRepNum.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TfrmpbfPayRepNum.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if ord(key) = VK_ESCAPE then close
end;

procedure TfrmpbfPayRepNum.FormShow(Sender: TObject);
begin
   //Edit1.Text := '';
   Edit2.Text := '';
   Edit2.SetFocus;
end;

procedure TfrmpbfPayRepNum.BitBtn1Click(Sender: TObject);
begin
  with frmpbfReport do
  begin
     //QRLabel3.Caption := Edit1.Text;
     //QRLabel2.Caption := Edit2.Text;
  end;
end;

end.

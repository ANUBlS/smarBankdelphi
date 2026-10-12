unit PaymentsUnit1pas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, XDBGrids, ExtCtrls, XFSCtrls, StdCtrls, Buttons;

type
  TFormPayments = class(TForm)
    XFPanel1: TXFPanel;
    XFPanel2: TXFPanel;
    XDBGrid2: TXDBGrid;
    XFBitBtn1: TXFBitBtn;
    procedure XFBitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPayments: TFormPayments;

implementation
uses DataAnalyz,sboapiDataModuleImpl,SBTranslateProc;
{$R *.dfm}

procedure TFormPayments.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self, sboapiDataModule.OrPack_SL);
end;

procedure TFormPayments.XFBitBtn1Click(Sender: TObject);
begin
FormPayments.close
end;

end.

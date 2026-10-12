unit SeduleUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, XFSCtrls, Grids, XDBGrids, StdCtrls, Buttons;

type
  TFormSedule = class(TForm)
    XFPanel1: TXFPanel;
    XFPanel2: TXFPanel;
    XFBitBtn1: TXFBitBtn;
    XDBGrid1: TXDBGrid;
    procedure XFBitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSedule: TFormSedule;

implementation
uses DataAnalyz,sboapiDataModuleImpl,SBTranslateProc;
{$R *.dfm}

procedure TFormSedule.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self, sboapiDataModule.OrPack_SL);
end;

procedure TFormSedule.XFBitBtn1Click(Sender: TObject);
begin
FormSedule.Close ;
end;

end.

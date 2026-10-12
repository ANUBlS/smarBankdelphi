unit UnitFrm_Zoom;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

type
  TFormZoom = class(TForm)
    Image1: TImage;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormZoom: TFormZoom;

implementation
uses  SBTranslateProc, sboapiDataModuleImpl;
{$R *.DFM}

procedure TFormZoom.FormCreate(Sender: TObject);
begin
 SBTranslateProc.TranslateAllCompForms(Self, sboapiDataModule.OrPack_SL);
end;

procedure TFormZoom.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key=#27 then  FormZoom.Close;
end;

end.

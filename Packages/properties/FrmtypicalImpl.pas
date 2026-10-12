unit FrmtypicalImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls;

type
  TFrmTypical = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    DBNavigator1: TDBNavigator;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTypical: TFrmTypical;

implementation
 uses DMprop, sboapiDataModuleImpl,SBTranslateProc;
{$R *.DFM}

procedure TFrmTypical.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(key) = VK_ESCAPE then close
end;

procedure TFrmTypical.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize:=false
end;

procedure TFrmTypical.FormCreate(Sender: TObject);
begin
DMproperties.LinksDSet.open;
DMproperties.EhtiyatDSet.open;
 SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TFrmTypical.FormDestroy(Sender: TObject);
begin
DMproperties.LinksDSet.closeall;
DMproperties.EhtiyatDSet.closeall;
end;

end.

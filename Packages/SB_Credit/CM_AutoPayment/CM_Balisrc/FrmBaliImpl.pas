unit FrmBaliImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids;

type
  TFrmBali = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBali: TFrmBali;

implementation

{$R *.DFM}
 uses sboapiDataModuleImpl, SBTranslateProc, BaliSrcImpl;
procedure TFrmBali.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TFrmBali.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if ord(Key) = VK_ESCAPE then Close;
end;

end.

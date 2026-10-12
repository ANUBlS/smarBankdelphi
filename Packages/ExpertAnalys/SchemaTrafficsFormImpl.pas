 unit SchemaTrafficsFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Grids, DBGrids;

type
  TSchemaTrafficsForm = class(TForm)
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    DBEdit1: TDBEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SchemaTrafficsForm: TSchemaTrafficsForm;

implementation

uses ExpertDataModule,sboapiDataModuleImpl, SBTranslateProc;

{$R *.DFM}

procedure TSchemaTrafficsForm.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TSchemaTrafficsForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key =VK_ESCAPE) then Close;
end;

end.

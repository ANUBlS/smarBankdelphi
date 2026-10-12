unit transview_unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids;

type
  TFormTransView = class(TForm)
    GroupBoxAcc: TGroupBox;
    DBGridMainState: TDBGrid;
    PanelN: TPanel;
    LabelTurnFirst: TLabel;
    LabelTurnEnd: TLabel;
    DBEditTurnBeg: TDBEdit;
    DBEditTurnEnd: TDBEdit;
    GroupBoxTrans: TGroupBox;
    DBGridExtractTrans: TDBGrid;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTransView: TFormTransView;

implementation

uses SBTranslateProc, sboapiDataModuleImpl;
{$R *.DFM}

procedure TFormTransView.FormCreate(Sender: TObject);
begin
  SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

end.

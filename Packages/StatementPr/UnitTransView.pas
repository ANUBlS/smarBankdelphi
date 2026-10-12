unit UnitTransView;
      //SB_STATEMENT
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, StdCtrls, Mask, DBCtrls;

type
  TFormTransView = class(TForm)
    GroupBoxAcc: TGroupBox;
    DBGridMainState: TDBGrid;
    PanelN: TPanel;
    GroupBoxTrans: TGroupBox;
    DBGridExtractTrans: TDBGrid;
    DBEditTurnBeg: TDBEdit;
    DBEditTurnEnd: TDBEdit;
    LabelTurnFirst: TLabel;
    LabelTurnEnd: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTransView: TFormTransView;

implementation

uses UnitData, SBTranslateProc, sboapiDataModuleImpl;

{$R *.DFM}

procedure TFormTransView.FormCreate(Sender: TObject);
begin
  SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

end.

unit UnitWaresArSent;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGridEh, StdCtrls, Buttons, DBGridEhGrouping, GridsEh;

type
  TArWaresS = class(TForm)
    DBGridEhGroupNB: TDBGridEh;
    DBGridWaresNB: TDBGridEh;
    GroupBox1: TGroupBox;
    lbArWaresCommit: TLabel;
    btnArWaresCommit: TBitBtn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ArWaresS: TArWaresS;

implementation

uses sboapiDataModuleImpl,UnitData, UnitDat,SBTranslateProc;
{$R *.DFM}

procedure TArWaresS.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

end.

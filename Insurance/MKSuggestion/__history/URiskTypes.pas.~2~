unit URiskTypes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids;

type
  TfmRiskTypes = class(TForm)
    DBGrid1: TDBGrid;
    btAdd: TBitBtn;
    btOk: TBitBtn;
    procedure btOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmRiskTypes: TfmRiskTypes;

implementation

uses MKSuggestionImpl,sboapiDataModuleimpl,SBTranslateProc;

{$R *.DFM}

procedure TfmRiskTypes.btOkClick(Sender: TObject);
begin
  ModalResult := mrOk
end;

procedure TfmRiskTypes.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

end.

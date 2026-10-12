unit URiskTypes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids;

type
  TfmRiskTypes = class(TForm)
    DBGrid1: TDBGrid;
    btOk: TBitBtn;
    btAdd: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
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

{$R *.dfm}
      uses DMMKSuggestionImpl,SBTranslateProc,sboapiDataModuleImpl;
procedure TfmRiskTypes.btOkClick(Sender: TObject);
begin
  ModalResult := mrOk
end;

procedure TfmRiskTypes.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TfmRiskTypes.FormKeyPress(Sender: TObject; var Key: Char);
begin
if ord(key)=vk_escape  then close;

end;

end.

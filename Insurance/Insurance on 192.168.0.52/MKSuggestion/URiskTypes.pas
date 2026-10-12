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
    procedure btAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmRiskTypes: TfmRiskTypes;

implementation

uses MKSuggestionImpl;

{$R *.DFM}

procedure TfmRiskTypes.btOkClick(Sender: TObject);
begin
  ModalResult := mrOk
end;

procedure TfmRiskTypes.btAddClick(Sender: TObject);
begin
   with fmMKSuggestion, memRisk  do begin
    if Text <> '' then Text := Text + ', ';
     Text:= Text+ODSRisktypesNAME.Value;
   end;
end;

procedure TfmRiskTypes.FormCreate(Sender: TObject);
begin
if fmMKSuggestion.ODSRisktypes.IsEmpty then btAdd.Enabled := False;
DBGrid1.DataSource := fmMKSuggestion.DSRisktypes;
end;

end.

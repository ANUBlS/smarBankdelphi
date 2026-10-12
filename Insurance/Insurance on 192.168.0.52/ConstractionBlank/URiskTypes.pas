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
    procedure btAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmRiskTypes: TfmRiskTypes;

implementation

uses UConstraction;

{$R *.DFM}

procedure TfmRiskTypes.btAddClick(Sender: TObject);
begin
     with Constraction, memRisk  do
     begin
          if Text <> '' then Text := Text + ', ';
          Text:= Text+ODSRisktypeNAME.Value;
     end;
end;

procedure TfmRiskTypes.FormCreate(Sender: TObject);
begin
      if Constraction.ODSRisktype.IsEmpty then btAdd.Enabled := False;
      DBGrid1.DataSource := Constraction.RisktypeData;
end;

procedure TfmRiskTypes.btOkClick(Sender: TObject);
begin
     ModalResult:=mrOk;
end;

end.

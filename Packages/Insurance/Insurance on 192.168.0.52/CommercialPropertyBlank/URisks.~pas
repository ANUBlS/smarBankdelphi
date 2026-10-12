unit URisks;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids;

type
  TRiskForm = class(TForm)
    DBGrid1: TDBGrid;
    btAdd: TBitBtn;
    btOk: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure btAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RiskForm: TRiskForm;

implementation

uses UCProperty;

{$R *.DFM}

procedure TRiskForm.FormCreate(Sender: TObject);
begin
    if CProperty.ODSRiskType.IsEmpty then btAdd.Enabled:=false;
    DBGrid1.DataSource := CProperty.RisktypeData;
end;

procedure TRiskForm.btOkClick(Sender: TObject);
begin
     ModalResult:=mrOk;
end;

procedure TRiskForm.btAddClick(Sender: TObject);
begin
     with CProperty, memRisk  do
     begin
          if Text <> '' then Text := Text + ', ';
          Text:= Text+ODSRisktypeNAME.Value;
     end;
end;

end.

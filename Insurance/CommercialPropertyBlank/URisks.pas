unit URisks;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TRiskForm = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
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

uses UCProperty, UDModule,SBTranslateProc,sboapiDataModuleimpl;

{$R *.DFM}

procedure TRiskForm.FormCreate(Sender: TObject);
begin
    if DModule.ODSRiskType.IsEmpty then btAdd.Enabled:=false;
    DBGrid1.DataSource := DModule.RisktypeData;

SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);

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
          Text:= Text+DModule.ODSRisktypeNAME.Value;
     end;
end;

end.

unit frmTranchRestImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NLSLocalizer, StdCtrls, Buttons, Grids, DBGridEh, ExtCtrls, CMExcelExport;

type
  TfrmTranchRest = class(TForm)
    NLSLocalizer1: TNLSLocalizer;
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    BitBtn1: TBitBtn;
    CMExcelExport1: TCMExcelExport;
    BitBtn2: TBitBtn;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTranchRest: TfrmTranchRest;

implementation

{$R *.DFM}

uses DMCardPercentImpl;

procedure TfrmTranchRest.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := false
end;

procedure TfrmTranchRest.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key) = VK_ESCAPE then close
end;

procedure TfrmTranchRest.BitBtn2Click(Sender: TObject);
begin
  with DMCardPercent do
  begin
     with CMExcelExport1 do
     begin
        Connect;
        ExportDataset(Tranchrest,'Òנאםש צחנÿ דאכûדכאנ',true)
     end;
  end;
end;

end.

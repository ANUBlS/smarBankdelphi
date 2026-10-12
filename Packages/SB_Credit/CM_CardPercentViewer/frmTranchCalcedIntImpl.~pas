unit frmTranchCalcedIntImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NLSLocalizer, StdCtrls, Buttons, Grids, DBGridEh, ExtCtrls, CMExcelExport;

type
  TfrmTranchCalcedInt = class(TForm)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    BitBtn1: TBitBtn;
    NLSLocalizer1: TNLSLocalizer;
    BitBtn2: TBitBtn;
    CMExcelExport1: TCMExcelExport;
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
  frmTranchCalcedInt: TfrmTranchCalcedInt;

implementation

{$R *.DFM}
uses DMCardPercentImpl;

procedure TfrmTranchCalcedInt.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := false
end;

procedure TfrmTranchCalcedInt.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if ord(Key) = VK_ESCAPE then close
end;

procedure TfrmTranchCalcedInt.BitBtn2Click(Sender: TObject);
begin
  with DMCardPercent do
  begin
     with CMExcelExport1 do
     begin
        Connect;
        ExportDataset(TranchcalcedPer,'Òנאםש צחנÿ שוסאבכאםלûש %-כÿנ',true)
     end;
  end;
end;

end.

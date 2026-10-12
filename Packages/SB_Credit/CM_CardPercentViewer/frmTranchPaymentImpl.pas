unit frmTranchPaymentImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGridEh, ExtCtrls, NLSLocalizer, CMExcelExport;

type
  TfrmTranchPayment = class(TForm)
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
  frmTranchPayment: TfrmTranchPayment;

implementation

{$R *.DFM}

uses DMCardPercentImpl;

procedure TfrmTranchPayment.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := false
end;

procedure TfrmTranchPayment.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if ord(key) = VK_ESCAPE then close;
end;

procedure TfrmTranchPayment.BitBtn2Click(Sender: TObject);
begin
  with DMCardPercent do
  begin
     with CMExcelExport1 do
     begin
        Connect;
        ExportDataset(Tranchpayments,'Транщ цзря юдянишляр',true)
     end;
  end;

end;

end.

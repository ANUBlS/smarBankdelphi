unit CrTrSchedUpdImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NLSLocalizer, ExtCtrls, StdCtrls, ComCtrls, ImgList,
  ToolWin, CMCurrencyEdit;

type
  TfrmUpdTrSched = class(TForm)
    Panel1: TPanel;
    Localizer: TNLSLocalizer;
    Label1: TLabel;
    Label2: TLabel;
    trchDate: TDateTimePicker;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ImageList1: TImageList;
    trchAmount: TCMCurrencyEdit;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUpdTrSched: TfrmUpdTrSched;

implementation

uses crCommonDecls, CrTrancheScheduleDataModuleImpl;

{$R *.DFM}

procedure TfrmUpdTrSched.ToolButton1Click(Sender: TObject);
begin
  with TrancheSheduleDataMod, CR_SCHEDULE do begin
    CallProcedure('TrSchedule_Edit', [TrancheScheduleDataSetID.AsVariant
                                   , trchDate.DateTime
                                   , trchAmount.Value]);
    Session.Commit;
    TrancheScheduleDataSet.Refresh;
  end;
  Close;
end;

procedure TfrmUpdTrSched.ToolButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmUpdTrSched.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key)=VK_ESCAPE then begin
     Key := #0;
     Close;  
  end;
end;

end.

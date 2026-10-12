unit TrancheScheduleImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NLSLocalizer, ExtCtrls, StdCtrls, DBCtrls, Grids, DBGrids;

type
  TTrancheScheduleForm = class(TForm)
    Localizer: TNLSLocalizer;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    stCValute: TStaticText;
    dbtCValute: TDBText;
    Panel3: TPanel;
    dbtCustName: TDBText;
    stCustomerName: TStaticText;
    Panel4: TPanel;
    dbtCAmount: TDBText;
    stCAmount: TStaticText;
    Panel5: TPanel;
    dbgTranche: TDBGrid;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    procedure ShowTrancheSchedule;
  end;

var
  TrancheScheduleForm: TTrancheScheduleForm;

implementation

uses TrancheScheduleDataModuleImpl, CommonDecls;

{$R *.DFM}

procedure TTrancheScheduleForm.ShowTrancheSchedule;      
resourcestring
  rsScheludeCaption = '%s № ли мцгавиля цчцн верилмя планы.';       
var
  CreditID : Integer;
begin
  TrancheSheduleDataMod := TTrancheSheduleDataMod.Create(Self);

  Localizer.Caption := Format(rsScheludeCaption,[Get_SelectedCrdNo]);
  CreditID := Get_SelectedCrdID;

  with TrancheSheduleDataMod do begin
    AboutContractDataSet.SetVariable('ID', CreditID);
    AboutContractDataSet.Open;
    TrancheScheduleDataSet.SetVariable('ID', CreditID);
    TrancheScheduleDataSet.Open;
  end;

  ShowModal;
end;

procedure TTrancheScheduleForm.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ORD(Key) = VK_ESCAPE then
  begin
    Key := #0;
    Close;
  end;
end;

end.

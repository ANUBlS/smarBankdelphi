unit InsPaymentPlan;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Grids, DBGrids, ToolWin, StdCtrls, Buttons, ExtCtrls, ImgList,
  HintBox, Oracle;

type
  TfmPaymentPlan = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ImageList1: TImageList;
    ToolButton5: TToolButton;
    hbError: THintBox;
    ToolButton7: TToolButton;
    ToolButton9: TToolButton;
    ToolButton8: TToolButton;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPaymentPlan: TfmPaymentPlan;

implementation

uses InsDataModule, InsPlanForm, InsPlanBuilder;

{$R *.DFM}

procedure TfmPaymentPlan.ToolButton1Click(Sender: TObject);
begin
   try
     fmPlanBuilder := TfmPlanBuilder.Create(Self);
     fmPlanBuilder.ShowModal;
   finally
     fmPlanBuilder.Free;
   end;

end;

procedure TfmPaymentPlan.ToolButton3Click(Sender: TObject);
begin
 if MessageDlg('Plan legv olunacaq!', mtWarning,
                                     mbYesNoCancel, 0 ) = mrYes then
 with InsDataMod, OPCOMMON, ODSContracts do
 try
  CallProcedure('clearplan', [FieldByName('ID').asInteger]);
  ODSPayPlan.refresh;
 except
  on E:EOracleError do
      hbError.ShowMessage(IntToStr(E.ErrorCode)+' '+E.Message);
  end;

end;

procedure TfmPaymentPlan.ToolButton5Click(Sender: TObject);
begin
 with InsDataMod do
   SaveData();
end;

procedure TfmPaymentPlan.ToolButton4Click(Sender: TObject);
begin
 with InsDataMod, ODSPayPlan do begin
   Refresh;
 end;

end;

procedure TfmPaymentPlan.BitBtn1Click(Sender: TObject);
begin
 with InsDataMod do
   SaveData();
end;

procedure TfmPaymentPlan.ToolButton2Click(Sender: TObject);
begin
 if MessageDlg('Odeme aparilsin!', mtConfirmation,
                                     mbYesNoCancel, 0 ) = mrYes then
 with InsDataMod, OPCOMMON, ODSPayPlan do
 try
   if FieldByName('STATUS').asInteger > 0 then begin
     //MessageDlg('Emeliyyat artiq aparilib!', mtWarning, [mbOK], 0);
     hbError.ShowMessage('Emeliyyat artiq aparilib!');
     Exit;
   end;

  if CallBooleanFunction('addpayment', [ODSContractsID.value,
                                        FieldByName('AMMOUNT').asCurrency,
                                        FieldByName('ID').asInteger]) then
   MessageDlg('Emeliyyat yerine yetirildi.', mtInformation, [mbOK], 0);
  ODSPayPlan.RefreshRecord;
 except
  on E:EOracleError do
      hbError.ShowMessage(IntToStr(E.ErrorCode)+' '+E.Message);
  end;

end;

procedure TfmPaymentPlan.ToolButton7Click(Sender: TObject);
begin
  fmPlanForm := TfmPlanForm.Create(Self);
  try
   with InsDataMod, ODSPayPlan do
   Insert;
   fmPlanForm.ShowModal;
  finally
   fmPlanForm.Free;
  end;

end;

procedure TfmPaymentPlan.DBGrid1DblClick(Sender: TObject);
begin
  fmPlanForm := TfmPlanForm.Create(Self);
  try
   with InsDataMod, ODSPayPlan do
   Edit;
   fmPlanForm.ShowModal;
  finally
   fmPlanForm.Free;
  end;
end;

procedure TfmPaymentPlan.ToolButton9Click(Sender: TObject);
var
  traDelAskRes : Boolean;
begin

  with InsDataMod do
   if MessageDlg('Secilmish plan pozulsun?',
        mtWarning, [mbYes, mbNo], 0) = mrYes then
        begin

          if ODSPayPlan.FieldByName('status').asInteger > 0 then begin
            traDelAskRes := MessageDlg('Odeme emeliyyati pozlsun?', mtWarning, [mbYes, mbNo], 0) = mrYes;
            OPCOMMON.CallProcedure('deleteplan', [ODSPayPlan.FieldByName('ID').asInteger, traDelAskRes]);
          end;

          ODSPayPlan.Refresh;
        end;


end;

procedure TfmPaymentPlan.BitBtn2Click(Sender: TObject);
begin
 with InsDataMod, ODSPayPlan do
   RedoData();

end;

procedure TfmPaymentPlan.ToolButton8Click(Sender: TObject);
begin

 with InsDataMod, OPCOMMON do
  if ODSPayPlan.FieldByName('STATUS').asInteger > 0 then 
   if MessageDlg('Odeme pozulsun?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    if CallBooleanFunction('delpaybyplan',
             [ODSPayPlan.FieldByName('ID').asInteger]) then begin
               MessageDlg('Odeme pozuldu.', mtInformation, [mbOK], 0);
               ODSPayPlan.RefreshRecord;
             end;


end;

end.

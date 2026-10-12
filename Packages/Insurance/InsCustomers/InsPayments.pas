unit InsPayments;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Grids, DBGrids, ToolWin, StdCtrls, Buttons, ExtCtrls, ImgList,
  HintBox, Oracle;

type
  TfmPayments = class(TForm)
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
    ToolButton6: TToolButton;
    hbError: THintBox;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPayments: TfmPayments;

implementation

uses InsDataModule;

{$R *.DFM}

procedure TfmPayments.ToolButton1Click(Sender: TObject);
begin
 if MessageDlg('Plan hazirlansin', mtConfirmation,
                                     mbYesNoCancel, 0 ) = mrYes then
 with InsDataMod, OPCOMMON, ODSContracts do
 try
  CallBooleanFunction('makeplan', [FieldByName('ID').asInteger]);
  ODSPayPlan.refresh;
 except
  on E:EOracleError do
  begin
    case E.ErrorCode of
     20001 : hbError.ShowMessage('Сыьорта мялуматлары там дейил!');
     20002 : hbError.ShowMessage('Сыьорта тапылмайыб!');
    else
      ShowMessage(IntToStr(E.ErrorCode)+' '+E.Message);
    end
  end;

 end;
end;

procedure TfmPayments.ToolButton3Click(Sender: TObject);
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

procedure TfmPayments.ToolButton5Click(Sender: TObject);
begin
 with InsDataMod do
   SaveData();
end;

procedure TfmPayments.ToolButton4Click(Sender: TObject);
begin
 with InsDataMod, ODSPayPlan do begin
   RedoData();
   Refresh;
 end;

end;

procedure TfmPayments.BitBtn1Click(Sender: TObject);
begin
 with InsDataMod do
   SaveData();
end;

procedure TfmPayments.ToolButton2Click(Sender: TObject);
begin
 if MessageDlg('Odeme aparilsin!', mtConfirmation,
                                     mbYesNoCancel, 0 ) = mrYes then
 with InsDataMod, OPCOMMON, ODSPayPlan do
 try
   if FieldByName('STATUS').asInteger > 0 then begin
     MessageDlg('Emeliyyat artiq aparilib!', mtWarning, [mbOK], 0);
     Exit;
   end;

  if CallBooleanFunction('setpayment', [FieldByName('ID').asInteger]) then
   MessageDlg('Emeliyyat yerine yetirildi.', mtInformation, [mbOK], 0);
  ODSPayPlan.RefreshRecord;
 except
  on E:EOracleError do
      hbError.ShowMessage(IntToStr(E.ErrorCode)+' '+E.Message);
  end;

end;

end.

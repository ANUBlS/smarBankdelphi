unit InsPaymentPlan;
    //DSPaymentInfo
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Grids, DBGrids, ToolWin, StdCtrls, Buttons, ExtCtrls, ImgList,
  HintBox, Oracle, XFSCtrls, Mask, DBCtrls, CMCurrencyEdit, CMExcelExport;

type
  TfmPaymentPlan = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ImageList1: TImageList;
    hbError: THintBox;
    ExcelExport: TCMExcelExport;
    XFPanel3: TXFPanel;
    XFPanel1: TXFPanel;
    XFRadioButton1: TXFRadioButton;
    XFRadioButton2: TXFRadioButton;
    XFGroupBox1: TXFGroupBox;
    ToolBar1: TToolBar;
    ToolButton7: TToolButton;
    ToolButton1: TToolButton;
    ToolButton4: TToolButton;
    ToolButton3: TToolButton;
    XFGroupBox2: TXFGroupBox;
    CMCurrencyEdit1: TCMCurrencyEdit;
    CMCurrencyEdit3: TCMCurrencyEdit;
    CMCurrencyEdit2: TCMCurrencyEdit;
    XFCheckBox3: TXFCheckBox;
    XFCheckBox2: TXFCheckBox;
    XFCheckBox1: TXFCheckBox;
    XFButton1: TXFButton;
    XFSpeedButton1: TXFSpeedButton;
    CMCurrencyEdit4: TCMCurrencyEdit;
    CMCurrencyEdit5: TCMCurrencyEdit;
    CMCurrencyEdit6: TCMCurrencyEdit;
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
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure XFRadioButton1Click(Sender: TObject);
    procedure XFRadioButton2Click(Sender: TObject);
    procedure CMCurrencyEdit1Change(Sender: TObject);
    procedure XFButton1Click(Sender: TObject);
    procedure XFSpeedButton1Click(Sender: TObject);
    procedure CMCurrencyEdit4Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPaymentPlan: TfmPaymentPlan;

implementation

uses InsDataModule, InsPlanForm, InsPlanBuilder,sboapiDataModuleimpl,SBTranslateProc,CommanParametrs;

{$R *.DFM}

procedure TfmPaymentPlan.ToolButton1Click(Sender: TObject);
begin



 with InsDataMod,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['ADDPAYMET_PLAN']);
 end;

 if contractstatus=1 then
 begin
   showmessage('Diqqət! Bu müqavilə bağlanmış müqavilə olduğundan heç bir deyişiklik oluna bilməz.');
   exit;
 end;
   try
     fmPlanBuilder := TfmPlanBuilder.Create(Self);
     fmPlanBuilder.ShowModal;
   finally
     fmPlanBuilder.Free;
   end;

end;

procedure TfmPaymentPlan.ToolButton3Click(Sender: TObject);
begin

 with InsDataMod,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['DELETEPAYMET_PLAN']);
 end;

 if contractstatus=1 then
 begin
   showmessage('Diqqət! Bu müqavilə bağlanmış müqavilə olduğundan heç bir deyişiklik oluna bilməz.');
   exit;
 end;
 if MessageDlg('Plan ləğv olunacaq!', mtWarning,
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
 if contractstatus=1 then
 begin
   showmessage('Diqqət! Bu müqavilə bağlanmış müqavilə olduğundan heç bir deyişiklik oluna bilməz.');
   exit;
 end;
 with InsDataMod do
   SaveData();
end;

procedure TfmPaymentPlan.ToolButton4Click(Sender: TObject);
begin
 if contractstatus=1 then
 begin
   showmessage('Diqqət! Bu müqavilə bağlanmış müqavilə olduğundan heç bir deyişiklik oluna bilməz.');
   exit;
 end;
 with InsDataMod, ODSPayPlan do begin
   Refresh;
 end;

end;

procedure TfmPaymentPlan.BitBtn1Click(Sender: TObject);
begin
 if contractstatus=1 then
 begin
   showmessage('Diqqət! Bu müqavilə bağlanmış müqavilə olduğundan heç bir deyişiklik oluna bilməz.');
   exit;
 end;
 with InsDataMod do
   SaveData();
end;

procedure TfmPaymentPlan.ToolButton2Click(Sender: TObject);
begin
 if contractstatus=1 then
 begin
   showmessage('Diqqət! Bu müqavilə bağlanmış müqavilə olduğundan heç bir deyişiklik oluna bilməz.');
   exit;
 end;
 if MessageDlg('Ödəmə aparılsın!', mtConfirmation,
                                     mbYesNoCancel, 0 ) = mrYes then
 with InsDataMod, OPCOMMON, ODSPayPlan do
 try
   if FieldByName('STATUS').asInteger > 0 then begin
     //MessageDlg('Emeliyyat artiq aparilib!', mtWarning, [mbOK], 0);
     hbError.ShowMessage('Emeliyyat artiq aparilib!');
     Exit;
   end;


  // showmessage(FieldByName('AMMOUNT').AsString);
   //exit;

  if CallBooleanFunction('addpayment', [ODSContractsID.value,
                                        FieldByName('AMMOUNT').asCurrency,
                                        FieldByName('ID').asInteger]) then
   MessageDlg('Əməliyyat yerinə yetirildi.', mtInformation, [mbOK], 0);
  ODSPayPlan.RefreshRecord;
 except
  on E:EOracleError do
      hbError.ShowMessage(IntToStr(E.ErrorCode)+' '+E.Message);
  end;

end;

procedure TfmPaymentPlan.ToolButton7Click(Sender: TObject);
begin

 with InsDataMod,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['ADDPAYMET_PLAN']);
 end;

 if contractstatus=1 then
 begin
   showmessage('Diqqət! Bu müqavilə bağlanmış müqavilə olduğundan heç bir deyişiklik oluna bilməz.');
   exit;
 end;
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

procedure TfmPaymentPlan.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TfmPaymentPlan.FormShow(Sender: TObject);
begin


InsDataMod.ODSPayPlan.Close;
InsDataMod.ODSPayPlan.SetVariable('insid',contactid);
InsDataMod.ODSPayPlan.Open;

InsDataMod.DSplancontract.Close;
InsDataMod.DSplancontract.SetVariable('p_id',contactid);
InsDataMod.DSplancontract.Open;

InsDataMod.DSPaymentsetting.Close;
InsDataMod.DSPaymentsetting.SetVariable('pcid',contactid);
InsDataMod.DSPaymentsetting.Open;
InsDataMod.DSPaymentsetting.edit;

InsDataMod.DSmesuliyyetShaqqi.Close;
InsDataMod.DSmesuliyyetShaqqi.SetVariable('pcid',contactid);
InsDataMod.DSmesuliyyetShaqqi.Open;


InsDataMod.DSFerdiqezaShaqqi.Close;
InsDataMod.DSFerdiqezaShaqqi.SetVariable('pcid',contactid);
InsDataMod.DSFerdiqezaShaqqi.Open;

//showmessage(InsDataMod.DSPaymentsetting.FieldByName('percent').AsString);





 if InsDataMod.DSPaymentsetting.RecordCount=0  then
 begin
    XFRadioButton2.Checked:=false;
    XFRadioButton1.Checked:=false;
    XFGroupBox1.Enabled:=false;
CMCurrencyEdit1.Value:=0;
CMCurrencyEdit2.Value:=0;
CMCurrencyEdit3.Value:=0;
CMCurrencyEdit4.Value:=0;
CMCurrencyEdit5.Value:=0;
CMCurrencyEdit6.Value:=0;
CMCurrencyEdit1.Enabled:=false;
CMCurrencyEdit2.Enabled:=false;
CMCurrencyEdit3.Enabled:=false;
CMCurrencyEdit4.Enabled:=false;
CMCurrencyEdit5.Enabled:=false;
CMCurrencyEdit6.Enabled:=false;
CMCurrencyEdit1.Visible:=false;
CMCurrencyEdit2.Visible:=false;
CMCurrencyEdit3.Visible:=false;
CMCurrencyEdit4.Visible:=false;
CMCurrencyEdit5.Visible:=false;
CMCurrencyEdit6.Visible:=false;
XFCheckBox1.Visible:=false;
XFCheckBox2.Visible:=false;
XFCheckBox3.Visible:=false;

 end
 else
 begin
 if InsDataMod.DSPaymentsetting.FieldByName('payment_type').AsInteger=1 then
      begin
    XFRadioButton2.Checked:=false;
    XFRadioButton1.Checked:=true;

 CMCurrencyEdit1.Value:=0;
CMCurrencyEdit2.Value:=0;
CMCurrencyEdit3.Value:=0;
CMCurrencyEdit4.Value:=0;
CMCurrencyEdit5.Value:=0;
CMCurrencyEdit6.Value:=0;

CMCurrencyEdit1.Enabled:=false;
CMCurrencyEdit2.Enabled:=false;
CMCurrencyEdit3.Enabled:=false;
CMCurrencyEdit4.Enabled:=false;
CMCurrencyEdit5.Enabled:=false;
CMCurrencyEdit6.Enabled:=false;

CMCurrencyEdit1.Visible:=false;
CMCurrencyEdit2.Visible:=false;
XFCheckBox1.Visible:=false;

if InsDataMod.DSplancontract.FieldByName('CHM').AsInteger=1 then
begin
XFCheckBox2.Visible:=false;
CMCurrencyEdit3.Visible:=false;
CMCurrencyEdit4.Visible:=false;
end;
if InsDataMod.DSplancontract.FieldByName('CHFQ').AsInteger=1 then
begin
CMCurrencyEdit5.Visible:=false;
CMCurrencyEdit6.Visible:=false;
XFCheckBox3.Visible:=false;
end;



      end
      else
      begin
    XFRadioButton1.Checked:=false;
    XFRadioButton2.Checked:=true;

CMCurrencyEdit1.Value:=InsDataMod.DSPaymentsetting.FieldByName('percent').AsFloat;
CMCurrencyEdit2.Value:=InsDataMod.DSPaymentsetting.FieldByName('percent_f').AsFloat;
CMCurrencyEdit3.Value:=InsDataMod.DSPaymentsetting.FieldByName('percent_m').AsFloat;
CMCurrencyEdit4.Value:=InsDataMod.DSPaymentsetting.FieldByName('Ammount').AsFloat;
CMCurrencyEdit5.Value:=InsDataMod.DSPaymentsetting.FieldByName('Ammount_f').AsFloat;
CMCurrencyEdit6.Value:=InsDataMod.DSPaymentsetting.FieldByName('Ammount_m').AsFloat;

CMCurrencyEdit1.Enabled:=true;
CMCurrencyEdit2.Enabled:=false;
CMCurrencyEdit3.Enabled:=false;
CMCurrencyEdit4.Enabled:=true;
CMCurrencyEdit5.Enabled:=false;
CMCurrencyEdit6.Enabled:=false;

CMCurrencyEdit1.Visible:=true;
CMCurrencyEdit2.Visible:=true;
XFCheckBox1.Visible:=true;

if InsDataMod.DSplancontract.FieldByName('CHM').AsInteger=1 then
begin
XFCheckBox2.Visible:=true;
CMCurrencyEdit3.Visible:=true;
CMCurrencyEdit4.Visible:=true;
end;
if InsDataMod.DSplancontract.FieldByName('CHFQ').AsInteger=1 then
begin
CMCurrencyEdit5.Visible:=true;
CMCurrencyEdit6.Visible:=true;
XFCheckBox3.Visible:=true;
end;



      end;

 XFGroupBox1.Enabled:=false;


 end;
//end;


if InsDataMod.DSplancontract.FieldByName('state').AsInteger=0 then
begin
  XFButton1.Enabled:=true;
  if InsDataMod.DSPaymentsetting.RecordCount=0  then
  begin
  XFGroupBox1.Enabled:=false;
  end
  else
  begin
  XFGroupBox1.Enabled:=true;
  end;

  XFPanel1.Enabled:=true;
end
else
begin
XFButton1.Enabled:=false;
XFGroupBox1.Enabled:=false;
XFPanel1.Enabled:=false;
end;


end;

procedure TfmPaymentPlan.ToolButton9Click(Sender: TObject);
var
  traDelAskRes : Boolean;
begin
 if contractstatus=1 then
 begin
   showmessage('Diqqət! Bu müqavilə bağlanmış müqavilə olduğundan heç bir deyişiklik oluna bilməz.');
   exit;
 end;
  with InsDataMod do
   if MessageDlg('Seçilmiş plan pozulsun?',
        mtWarning, [mbYes, mbNo], 0) = mrYes then
        begin

          if ODSPayPlan.FieldByName('status').asInteger > 0 then begin
            traDelAskRes := MessageDlg('Ödəmə əməliyyatı pozlsun?', mtWarning, [mbYes, mbNo], 0) = mrYes;
            OPCOMMON.CallProcedure('deleteplan', [ODSPayPlan.FieldByName('ID').asInteger, traDelAskRes]);
          end;

          ODSPayPlan.Refresh;
        end;


end;

procedure TfmPaymentPlan.XFButton1Click(Sender: TObject);
var
ppayment_type:integer;
begin

 with InsDataMod,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['COMMITPAYMENT_PLAN_SETTING']);
 end;

if (XFRadioButton1.Checked=false)and (XFRadioButton2.Checked=false) then
begin
  showmessage('Diqqət! Heç bir plan növü seçilməyib');
  exit;
end;

if (CMCurrencyEdit4.Text='') or (CMCurrencyEdit4.Value=0) then
begin
  CMCurrencyEdit4.Value:=0;
  CMCurrencyEdit1.Value:=0;
end;

if XFRadioButton1.Checked=true then
ppayment_type:=1
else
ppayment_type:=2;

with InsDataMod do
begin
DSPaymentsetting.Edit;
  DSPaymentsetting.FieldByName('cid').AsFloat:=contactid;
  DSPaymentsetting.FieldByName('payment_type').AsFloat:=ppayment_type;
  DSPaymentsetting.FieldByName('percent').AsFloat:=CMCurrencyEdit1.Value;
  DSPaymentsetting.FieldByName('percent_f').AsFloat:=CMCurrencyEdit2.Value;
  DSPaymentsetting.FieldByName('percent_m').AsFloat:=CMCurrencyEdit3.Value;
  DSPaymentsetting.FieldByName('AMMOUNT').AsFloat:=CMCurrencyEdit4.Value;
  DSPaymentsetting.FieldByName('AMMOUNT_f').AsFloat:=CMCurrencyEdit5.Value;
  DSPaymentsetting.FieldByName('AMMOUNT_m').AsFloat:=CMCurrencyEdit6.Value;
  DSPaymentsetting.FieldByName('op_id').AsFloat:=0;
  DSPaymentsetting.Post;
  DSPaymentsetting.RefreshRecord;
   Showmessage('Plan haqqındaki məlumat təsdiqləndi.');
      if XFRadioButton2.Checked=true  then
       begin
   XFGroupBox1.Enabled:=true;
       end;
end;

end;

procedure TfmPaymentPlan.XFRadioButton1Click(Sender: TObject);
begin
if XFRadioButton1.Checked=true then
begin
 { XFCheckBox1.Checked:=false;
  XFCheckBox2.Checked:=false;
  XFCheckBox3.Checked:=false; }
  //if InsDataMod.DSPaymentsetting.FieldByName('percent').AsFloat=0 then
//begin
  CMCurrencyEdit1.Value:=0;
//end;
  CMCurrencyEdit2.Value:=0;
  CMCurrencyEdit3.Value:=0;
  CMCurrencyEdit5.Value:=0;
  CMCurrencyEdit6.Value:=0;

  CMCurrencyEdit1.Enabled:=false;
  CMCurrencyEdit2.Enabled:=false;
  CMCurrencyEdit3.Enabled:=false;
  CMCurrencyEdit5.Enabled:=false;
  CMCurrencyEdit6.Enabled:=false;

  XFGroupBox1.Enabled:=false;

  XFCheckBox1.Visible:=false;
  XFCheckBox2.Visible:=false;
  XFCheckBox3.Visible:=false;

  CMCurrencyEdit1.Visible:=false;
  CMCurrencyEdit2.Visible:=false;
  CMCurrencyEdit3.Visible:=false;
  CMCurrencyEdit4.Visible:=false;
  CMCurrencyEdit5.Visible:=false;
  CMCurrencyEdit6.Visible:=false;

end ;




end;

procedure TfmPaymentPlan.XFRadioButton2Click(Sender: TObject);
begin

if XFRadioButton2.Checked=true then
begin
  //XFCheckBox1.Visible:=false;
  //XFCheckBox1.Checked:=true;
  //if InsDataMod.DSPaymentsetting.FieldByName('percent').AsFloat=0 then
//begin
  CMCurrencyEdit1.Value:=0;
  CMCurrencyEdit4.Value:=0;
//end;
  XFCheckBox1.Visible:=true;
  CMCurrencyEdit1.Enabled:=true;
  CMCurrencyEdit4.Enabled:=true;
  CMCurrencyEdit1.Visible:=true;
  CMCurrencyEdit4.Visible:=true;

if InsDataMod.DSplancontract.FieldByName('type_id').AsInteger=4 then
begin
if InsDataMod.DSplancontract.FieldByName('CHM').AsInteger=1 then
begin
  XFCheckBox3.Visible:=true;
  CMCurrencyEdit3.Visible:=true;
  CMCurrencyEdit3.Value:=100;
  CMCurrencyEdit6.Visible:=true;
  CMCurrencyEdit6.Value:=InsDataMod.DSmesuliyyetShaqqi.FieldByName('SIGHAQQIM').AsFloat;
end
else
begin
  XFCheckBox3.Visible:=false;
  CMCurrencyEdit3.Visible:=false;
  CMCurrencyEdit3.Value:=0;
  CMCurrencyEdit6.Visible:=false;
  CMCurrencyEdit6.Value:=0;
end;

if InsDataMod.DSplancontract.FieldByName('CHFQ').AsInteger=1 then
begin
  XFCheckBox2.Visible:=true;
  CMCurrencyEdit2.Visible:=true;
  CMCurrencyEdit2.Value:=100;
  CMCurrencyEdit5.Visible:=true;
  CMCurrencyEdit5.Value:=InsDataMod.DSFerdiqezaShaqqi.FieldByName('SIGHAQQIF').AsFloat;;
end
else
begin
  XFCheckBox2.Visible:=false;
  CMCurrencyEdit2.Visible:=false;
  CMCurrencyEdit2.Value:=0;
  CMCurrencyEdit5.Visible:=false;
  CMCurrencyEdit5.Value:=0;
end;

end;

end;

end;

procedure TfmPaymentPlan.XFSpeedButton1Click(Sender: TObject);
begin
 with InsDataMod,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['EXCELPAYMET_PLAN']);
 end;

 if DBGrid1.DataSource.DataSet.RecordCount=0 then
 begin
 showmessage('Heç bir məlumat yoxdur!');
 exit;
 end;

with ExcelExport do
   begin
      Connect;
      ExportDataset(DBGrid1.DataSource.DataSet,'Ödəmə Planı.',True,false);
      Disconnect;
   end
end;

procedure TfmPaymentPlan.BitBtn2Click(Sender: TObject);
begin
 with InsDataMod, ODSPayPlan do
   RedoData();

end;

procedure TfmPaymentPlan.CMCurrencyEdit1Change(Sender: TObject);
begin
if CMCurrencyEdit1.Text='' then
begin
   CMCurrencyEdit1.Value:=0;
end;

end;

procedure TfmPaymentPlan.CMCurrencyEdit4Change(Sender: TObject);
begin
if CMCurrencyEdit4.Value>InsDataMod.DSplancontract.FieldByName('AMMOUNT').AsFloat then
begin
  Showmessage('Daxil olunan məbləğ sığorta haqqından böyük olmamalıdır!');
  CMCurrencyEdit4.Value:=InsDataMod.DSplancontract.FieldByName('AMMOUNT').AsFloat;
  exit;
end
else
begin
     CMCurrencyEdit1.Value:=((CMCurrencyEdit4.Value)*100)/InsDataMod.DSplancontract.FieldByName('AMMOUNT').AsFloat;
end;

if (CMCurrencyEdit4.Text='') or (CMCurrencyEdit4.Value=0)then
begin
   CMCurrencyEdit4.Value:=0;
   CMCurrencyEdit1.Value:=0;
end;


end;

procedure TfmPaymentPlan.ToolButton8Click(Sender: TObject);
begin

 if contractstatus=1 then
 begin
   showmessage('Diqqət! Bu müqavilə bağlanmış müqavilə olduğundan heç bir deyişiklik oluna bilməz.');
   exit;
 end;
 with InsDataMod, OPCOMMON do
  if ODSPayPlan.FieldByName('STATUS').asInteger > 0 then
   if MessageDlg('Ödəmə pozulsun?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    if CallBooleanFunction('delpaybyplan',
             [ODSPayPlan.FieldByName('ID').asInteger]) then begin
               MessageDlg('Ödəmə pozuldu.', mtInformation, [mbOK], 0);
               ODSPayPlan.RefreshRecord;
             end;


end;

end.

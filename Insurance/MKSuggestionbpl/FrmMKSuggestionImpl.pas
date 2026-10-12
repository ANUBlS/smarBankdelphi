unit FrmMKSuggestionImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XFSCtrls, ExtCtrls, Grids, DBGrids, DBCtrls, Mask, Buttons,
  INSWordExporter,ActiveX, AxCtrls, StdVcl,HintBox, Db, OracleData, ComCtrls,Oracle;
 const
   WM_ModalResult = WM_USER+139;
   fmCaption = 'Kasko siğortası təklifnamə forması: (%s)';
   pSuggMaking = 2;
   pSuggDone   = 3;
type
  TFrmMKSuggestion = class(TForm)
    XFPanel1: TXFPanel;
    btPrint: TBitBtn;
    btApply: TBitBtn;
    btOk: TBitBtn;
    btPolicy: TBitBtn;
    BitBtn2: TBitBtn;
    lbNonUnicode: TListBox;
    Panel2: TXFPanel;
    XFPanel3: TXFPanel;
    XFLabel1: TXFLabel;
    XFLabel2: TXFLabel;
    DBEdit1: TDBEdit;
    Edit1: TEdit;
    XFGroupBox1: TXFGroupBox;
    XFLabel3: TXFLabel;
    XFLabel4: TXFLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    XFGroupBox2: TXFGroupBox;
    cbRisk: TCheckBox;
    cbDifRisk: TCheckBox;
    gbGrid: TXFPanel;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    gbSame: TXFGroupBox;
    XFLabel5: TXFLabel;
    XFLabel6: TXFLabel;
    XFLabel7: TXFLabel;
    XFLabel8: TXFLabel;
    XFLabel9: TXFLabel;
    XFLabel10: TXFLabel;
    DBEdit9: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit5: TDBEdit;
    SuggestionReport: TINSWordExporter;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbRiskClick(Sender: TObject);
    procedure cbDifRiskClick(Sender: TObject);
    procedure DBEdit5Change(Sender: TObject);
    procedure DBEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure btPrintClick(Sender: TObject);
    procedure btApplyClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure btPolicyClick(Sender: TObject);
  private
    { Private declarations }
        ID : Integer;
    IsSaved : Boolean;
        procedure DisableControls(ControlName : TCustomControl; disable : boolean = true);
        function  SaveData():Boolean;
  public
    { Public declarations }
  end;

var
  FrmMKSuggestion: TFrmMKSuggestion;

  CID:integer;
        procedure InitPlugin(s:string);export;
implementation

{$R *.dfm}
uses ComObj,CommanParametrs,DMMKSuggestionImpl,sboapiDataModuleImpl, URiskTypes,MKSUnderTable,SBTranslateProc;


procedure InitPlugin(s:string);export;
begin


   FrmMKSuggestion.ShowModal;
end;
exports
     InitPlugin;


procedure TFrmMKSuggestion.BitBtn2Click(Sender: TObject);
begin
     FrmMKSuggestion.close;
end;

procedure TFrmMKSuggestion.btApplyClick(Sender: TObject);
begin

 if SaveData() then
  begin
    btPrint.Enabled := True;
    btPolicy.Enabled := True;
    btApply.Enabled := False;
  end;
end;


function TFrmMKSuggestion.SaveData():Boolean;
var
  res : boolean;
begin
    res := False;
          //showmessage(inttostr(id));
 with DMMKSuggestion,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['SUGGESTIONCOMMITCONTRACT_KASKO']);
 end;
  with DMMKSuggestion do
 begin
    if cbRisk.Checked then
    with ODSPolicy do
    if State in [dsEdit, dsInsert] then
    begin
      Fieldbyname('THEFT').AsFloat := ODSMotorKaskoFRANSHIZ.AsFloat;
      Fieldbyname('FIRE').AsFloat := ODSMotorKaskoFRANSHIZ.AsFloat;
      Fieldbyname('EXPLOSION').AsFloat := ODSMotorKaskoFRANSHIZ.AsFloat;
      Fieldbyname('TRAFFICACCIDENT').AsFloat := ODSMotorKaskoFRANSHIZ.AsFloat;
      Fieldbyname('IMPACTANYOBJECT').AsFloat := ODSMotorKaskoFRANSHIZ.AsFloat;
      Fieldbyname('CID').Asinteger := id;
      Post;
     // RefreshRecord();
    end;

  with ODSContracts do
  begin
     Edit;
     if FieldByName('state').AsInteger<3 then
        FieldByName('state').AsInteger := pSuggMaking;
     Post;
     RefreshRecord;
    // OPCommon.CallBooleanFunction('commitsuggestion',[id]);
     res := True;
  end;
 end;
  Result := res;

end;


procedure TFrmMKSuggestion.btOkClick(Sender: TObject);
begin
  if SaveData() or IsSaved then
  FrmMKSuggestion.Close;
    //PostMessage(FOwnerHandle, WM_ModalResult, mrOk, 0);
end;

procedure TFrmMKSuggestion.btPolicyClick(Sender: TObject);

var
  PolicFormGuid : TGuid;
  Params : TStringList;
begin

 with DMMKSuggestion,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['POLISCONTRACT_KASKO']);
 end;

  if not IsSaved then
    btApplyClick(Sender); //Save data

  with  DMMKSuggestion,ODSContracts do
  begin
    FieldByName('state').AsInteger := pSuggDone;

  //Params := TStringList.Create;
  //PolicFormGuid := StringToGUID('{3C454A4C-C304-4633-AAAD-4C46C68BB8EE}');
  //Params.Values['MKS_ID'] := FloatToStr(ODSMKID.Value);
  //Params.Values['CID'] := FloatToStr(ODSContractsID.Value);
  end;
    loadPlugin('MKPolicybpl.bpl','');
  {with DMMKSuggestion,pmcPolicy do
  begin
   ShowModal(PolicFormGuid, Params);
  Params.Free;
  end;   }


end;

procedure TFrmMKSuggestion.btPrintClick(Sender: TObject);

const
    months : array [1..12] of String = ('Yanvar', 'Fevral', 'Mart', 'Aprel', 'May', 'Iyun',
                                         'Iyul', 'Avqust', 'Sentyabr', 'Oktyabr', 'Noyabr', 'Dekabr');
var
  DocFile : TFileName;
  str,str1,strDate,ErrorStr,FileName : String;
  day, month, year : word;
  WordApp:OleVariant;
  wrdDataDoc,wrdApp,wrdSelection : Variant;
  n,i:integer;
begin

with DMMKSuggestion,sb_aca do
 begin
      CallProcedure('checkadvancedobjectaccess',['SUGGESTIONPRINTCONTRACT_KASKO']);
 end;
  with DMMKSuggestion,sb_aca do
 begin
   ODSAValute.Locate('valute',ODSContractsValute_ID.Value,[]);
   ODSActivity.SetVariable('id',ODSCustsAct_Id.Value);
   ODSActivity.Open;
   StrDate := IntToStr(Trunc((ODSContractsEND_DATE.Value - ODSContractsBEGIN_DATE.Value)/30));

   ODSContracts.Close;
   ODSContracts.SetVariable('CID',ID);
   ODSContracts.Open;

   ODSReport.Close;
   ODSReport.SetVariable('CID',ID);
   ODSReport.Open;

   if DMMKSuggestion.ODSReportSex.Value=0 then str:='oğlu'
      else if DMMKSuggestion.ODSReportSex.Value=1 then str:='qızı';

   try
   FileName:=ExtractFilePath(Application.ExeName)+ '\KascoSuggestion.doc';
   wrdApp := CreateOleObject('Word.Application');
   wrdApp.Visible := True;
   wrdDataDoc := wrdApp.Documents.Open(FileName);
   wrdSelection:=wrdApp.Selection;
   except
      raise;
   end;

   try

   wrdSelection.GoTo(-1,unAssigned,unAssigned,'sugnum');
   wrdSelection.TypeText((ODSReportSugnum.AsString));

   wrdSelection.GoTo(-1,unAssigned,unAssigned,'name');
   wrdSelection.TypeText((ODSReportNAME.Value));

   wrdSelection.GoTo(-1,unAssigned,unAssigned,'str');
   wrdSelection.TypeText((str));

   wrdSelection.GoTo(-1,unAssigned,unAssigned,'activity');
   wrdSelection.TypeText((ODSActivityName.Value));


   wrdSelection.GoTo(-1,unAssigned,unAssigned,'period');
   wrdSelection.TypeText((strDate));

   wrdSelection.GoTo(-1,unAssigned,unAssigned,'mark');
   wrdSelection.TypeText((ODSReportInsuredModel.AsString));

   wrdSelection.GoTo(-1,unAssigned,unAssigned,'type');
   wrdSelection.TypeText((ODSReportInsuredType.AsString));

   wrdSelection.GoTo(-1,unAssigned,unAssigned,'ammount');
   wrdSelection.TypeText((ODSReportInsSumm.AsString+' '+ODSReportValute.AsString));

   wrdSelection.GoTo(-1,unAssigned,unAssigned,'tarif');
   wrdSelection.TypeText((ODSReportTariff.AsString));

   wrdSelection.GoTo(-1,unAssigned,unAssigned,'inssumm');
   wrdSelection.TypeText((ODSReportAmmount.AsString+' '+ODSReportValute.AsString));

   wrdSelection.GoTo(-1,unAssigned,unAssigned,'franshiz');
   wrdSelection.TypeText((ODSReportFranshiz.AsString+' '+ODSReportValute.AsString));

   wrdSelection.GoTo(-1,unAssigned,unAssigned,'date');
   wrdSelection.TypeText((ODSReportBeginDate.AsString));



   except
      raise;
   end;

 end;
   try
   //wrdSelection.GoTo(-1,unAssigned,unAssigned,'undertable');
   fmUndertable := TfmUndertable.Create(Self);
   with fmUndertable do
   begin
      fmUndertable.Show;
      OleContainer1.OleObject.Application.Selection.WholeStory;
      OleContainer1.OleObject.Application.Selection.Copy;
      try
        fmUndertable.Free;
      except
        ErrorStr:='urra!';
      end;
        wrdSelection.Paste;
   end;
   except
      raise;
   end;

end;

procedure TFrmMKSuggestion.cbDifRiskClick(Sender: TObject);
begin
  if cbDifRisk.Checked=true then
     begin
     gbSame.Visible:=false;
     cbRisk.Checked:=false;
     gbGrid.Visible:=true;
     end;
    {gbGrid.Visible:=cbDifRisk.Checked;
    gbSame.Visible:=not(cbDifRisk.Checked);
    cbRisk.Checked:=false; }
    btApply.Enabled:=true;
end;

procedure TFrmMKSuggestion.cbRiskClick(Sender: TObject);
begin
     if cbRisk.Checked=true then
     begin
     gbSame.Visible:=true;
     cbDifRisk.Checked:=false;
     gbGrid.Visible:=false;
     end;

     btApply.Enabled:=true;
end;

procedure TFrmMKSuggestion.DBEdit5Change(Sender: TObject);
begin
     btApply.Enabled:=true;
end;

procedure TFrmMKSuggestion.DBEdit5KeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
     begin
       FindNextControl(ActiveControl,true,true,false).SetFocus;
       Key := #0
     end else btApply.Enabled := True;
end;

procedure TFrmMKSuggestion.FormCreate(Sender: TObject);
begin
DMMKSuggestion:=TDMMKSuggestion.create(self);
fmRiskTypes:=TfmRiskTypes.create(self);
fmUndertable:=TfmUndertable.create(self);
     id := contactid;
     with DMMKSuggestion do
     begin

       ODSCusts.Close;
       ODSCusts.SetVariable('id',ins_cutsid);
       ODSCusts.Open;

       ODSContracts.Close;
       ODSContracts.SetVariable('cid', id);
       ODSContracts.Open;

       ODSMotorKasko.Close;
       ODSMotorKasko.SetVariable('cid', id);
       ODSMotorKasko.Open;

       ODSPolicy.Close;
       ODSPolicy.SetVariable('CID',id);
       ODSPolicy.Open;

       IsSaved := True;

       if ODSPolicy.isEmpty then begin   //-----Insert mod
         ODSPolicy.Insert;
         ODSContracts.FieldByName('INSSUMM').asFloat := ODSMotorKaskoDRIVECOST.Value;
         Caption := format(fmCaption, ['Yeni teklifname']);
       end
       else begin  //-----Edit mod
         ODSPolicy.Edit;
         Caption := format(fmCaption, ['Redakte']);
         btPrint.Enabled := True;
         btPolicy.Enabled := True;
         btApply.Enabled := False;
       //-----------Disable controls -------------
       with OPCOMMON do
         if CallIntegerFunction('get_state',[ODSContracts.FieldByName('ID').asInteger]) = 6 {is disable?} then
           DisableControls(Panel2, false);
       end;
//    end;
  //Result := S_OK;
     end;

  SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TFrmMKSuggestion.FormDestroy(Sender: TObject);
begin
DMMKSuggestion.Destroy;
fmRiskTypes.Destroy;
fmUndertable.Destroy;
end;

procedure TFrmMKSuggestion.FormKeyPress(Sender: TObject; var Key: Char);
begin
if ord(key)=vk_escape then close;

end;

procedure TFrmMKSuggestion.DisableControls(ControlName : TCustomControl; disable : boolean = true);

  procedure DisableControl(CName : TCustomControl);
  var i : Integer;
  begin
    with CName do
      for i := 0 to ControlCount -1 do begin
        if (Controls[i] is TCustomControl) then
          DisableControl(Controls[i] as TCustomControl);
        Controls[i].Enabled := disable;
      end
  end;

begin
    with DMMKSuggestion do
     begin
  if OPCOMMON.CallIntegerFunction('disablepolicies', []) = 0 then
    Exit;

  DisableControl(ControlName);
  btApply.Enabled := Disable;
  btOk.Enabled := Disable;

     end;
end;


initialization
 FrmMKSuggestion := TFrmMKSuggestion.Create(Application);
end.

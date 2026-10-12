unit AdministrationClassEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, DBCGrids, StdCtrls, DBCtrls, ComCtrls, Buttons,DB,OracleNavigator,
  Menus, ImgList;

type
  TfmClassEdit = class(TForm)
    Panel1: TPanel;
    OracleNavigator1: TOracleNavigator;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    HeaderControl1: THeaderControl;
    cgClassEdit: TDBCtrlGrid;
    edrole: TDBText;
    DBCheckBox1: TDBCheckBox;
    Panel3: TPanel;
    btApply: TBitBtn;
    btClose: TBitBtn;
    edClassCL: TEdit;
    edDescrCl: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    PopupMenu1: TPopupMenu;
    miSelAll: TMenuItem;
    N2: TMenuItem;
    miDeSelAll: TMenuItem;
    ImageList1: TImageList;
    SpeedButton1: TSpeedButton;
    CheckBox1: TCheckBox;
    SpeedButton2: TSpeedButton;
    Label3: TLabel;
    procedure cgClassEditPaintPanel(DBCtrlGrid: TDBCtrlGrid;
      Index: Integer);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBCheckBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cgClassEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btApplyMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure miSelAllDrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure miSelAllClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure cgClassEditDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmClassEdit: TfmClassEdit;

implementation

uses AdministrationDataModule, AdministrationMainForm, AdmBarForm,
  adm_classesAdvInfoImpl, adm_classesGrants, AdministrationProfOptions;

{$R *.DFM}

procedure TfmClassEdit.cgClassEditPaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
begin
  if Index = DBCtrlGrid.PanelIndex then
    edrole.Font.Color := clWhite
  else
   edrole.Font.Color := clBlack;
end;

procedure TfmClassEdit.Button1Click(Sender: TObject);
begin
 Close;
end;

procedure TfmClassEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
AdministrationData.clsf.Edit;
if CheckBox1.Checked then AdministrationData.clsf.fieldbyname('finger3').asinteger:=1
else AdministrationData.clsf.fieldbyname('finger3').asinteger:=0;
AdministrationData.clsf.post;
AdministrationData.clsf.Close;
end;

procedure TfmClassEdit.FormCreate(Sender: TObject);
begin
with AdministrationData.Classesdata do
 begin
  edClassCL.Text:=FieldByName('obj').AsString;
  edDescrCl.Text:=FieldByName('description').AsString;
  Caption := 'Sinif: "'+FieldByName('obj').AsString+'"';
 end;
 frmClassesAdvInfo := TfrmClassesAdvInfo.Create(Self);
 frmClassGrants := TfrmClassGrants.Create(Self);
end;

procedure TfmClassEdit.FormShow(Sender: TObject);
begin
AdministrationData.clsf.close;
AdministrationData.clsf.SetVariable('cls',edClassCL.text);
AdministrationData.clsf.SetVariable('t','C');
AdministrationData.clsf.open;
if AdministrationData.clsf.FieldByName('finger3').asinteger=1 then CheckBox1.Checked:=true else  CheckBox1.Checked:=false;

end;

procedure TfmClassEdit.DBCheckBox1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if cgClassEdit.CanFocus then
 cgClassEdit.SetFocus;
end;

procedure TfmClassEdit.cgClassEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_space then
 with (Sender as TDBCtrlGrid).DataSource.DataSet do
  begin
   if not(Active) then Exit;
   Edit;
   FieldByName(DBCheckBox1.DataField).AsInteger:=
   BoolToInt(not(IntToBool(FieldByName(DBCheckBox1.DataField).AsInteger)));
   Post;
  end;
end;

procedure TfmClassEdit.btApplyMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
bk: TBookmark;
BRForm: TBarForm;
begin
BRForm:=TBarForm.Create(self);
 with AdministrationData,cgClassEdit.DataSource.DataSet do
  try
   BrForm.Execute('Class Access','Sinfin hüquqları','Yerinə yetirilməsi...',10,40);
   Snd(BrForm);
   bk:=GetBookmark;
   DisableControls;
   First;
    while not(EOF) do
     begin
      pcADM.CallProcedure('updateclassgrants',[Classesdata.FieldByName('id').AsInteger,
      FieldByName('Class').AsString,IntToBool(FieldByName('Acc').ASInteger)]);
      Next;
     end;
   Snd(BrForm);
   GotoBookmark(bk);
   EnableControls;

   if ((edClassCL.Text<>Classesdata.FieldByName('obj').ASString) and (edClassCL.Text<>''))or
   ((edDescrCl.Text<>Classesdata.FieldByName('description').ASString) and (edDescrCl.Text<>''))then
    pcADM.CallProcedure('updateclass',[Classesdata.FieldByName('id').AsInteger,edClassCL.Text,edDescrCl.Text]);
    BrForm.BarCaption.Caption:='Sinfin bütün istifadəçiləri üzrə hüquqların dəyişdirilməsi';
   Snd(BrForm);
    pcADM.CallProcedure('updateallusersbyclass',[Classesdata.FieldByName('id').AsInteger]);
   Snd(BrForm);
    pcADM.CallProcedure('applyclassgrants',[edClassCL.Text]);
    Classesdata.Close;
    Classesdata.open;
    Classesdata.Locate('obj',edClassCL.Text,[]);
    Caption := 'Sinif: ' + edClassCL.Text;
  finally
   if Assigned(BrForm) then
   BrForm.Release;
  end;
end;

procedure TfmClassEdit.miSelAllDrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
var
  LineBottom: Integer;
  SText: String;
  Bar: TRect;
begin
  with ACanvas, Sender as TMenuItem do
  begin
    with Font do
    begin
      Name := 'Tahoma';
      Charset := DEFAULT_CHARSET;
      if Default then
        Style := [fsBold];
    end;
    if Caption = '-' then
    begin
      Pen.Color := clBlack;
      LineBottom := (ARect.Top + (ARect.Bottom - ARect.Top) div 2)-1;
      MoveTo(ARect.Left, LineBottom);
      LineTo(ARect.Right, LineBottom);
      inc(LineBottom);
      Pen.Color := clWhite;
      MoveTo(ARect.Left, LineBottom);
      LineTo(ARect.Right, LineBottom);
    end
    else
    begin
      if Selected then
        Brush.Color := clNavy
      else
        Brush.Color := clBtnFace;
      Bar := ARect;
      Inc(Bar.Left, 22);
      FillRect(Bar);
      TextOut(ARect.Left+{17}22, ARect.Top+1, Caption);
    end;
    // draw shortcut
    SText := ShortCutToText(ShortCut);
    TextOut(ARect.Right-TextWidth(SText)-2, ARect.Top+1, SText);
    if ImageIndex <> -1 then
      with GetParentMenu do
        if Assigned(Images) then
        begin
          if Checked then
          begin
            Bar.Left := ARect.Left + 1;
            Bar.Right := Bar.Left + 16;
            Bar.Top := ARect.Top + 1;
            Bar.Bottom := Bar.Top + 16;

            ACanvas.Brush.Color := clBtnShadow;
            ACanvas.FrameRect(Bar);

            Inc(Bar.Left, 2);
            Inc(Bar.Right, 2);
            Inc(Bar.Top, 2);
            Inc(Bar.Bottom, 2);

            ACanvas.Brush.Color := clBtnHighlight;
            ACanvas.FrameRect(Bar);

            Dec(Bar.Left, 1);
            Dec(Bar.Right, 1);
            Dec(Bar.Top, 1);
            Dec(Bar.Bottom, 1);

            if Selected then
              ACanvas.Brush.Color := clBtnFace
            else
              ACanvas.Brush.Color := clBtnHighlight;
            ACanvas.FillRect(Bar);
          end;

          Images.Draw(ACanvas, ARect.Left, ARect.Top, ImageIndex, Enabled);
        end;
  end;
end;

procedure TfmClassEdit.miSelAllClick(Sender: TObject);
begin
with AdministrationData do
   SelAlll(ModEditData,'ACC',Sender=miSelAll)
end;

procedure TfmClassEdit.SpeedButton1Click(Sender: TObject);
var
  i: Integer;
begin
  with AdministrationData, odsAccFlags, frmClassesAdvInfo do begin
    Caption := 'Sinif: "'+Classesdata.FieldByName('obj').AsString+'"';
    evFlags.Close;
    odsAccFlags.Close;
    ClearVariables;
    SetVariable('classname', Classesdata.FieldByName('obj').AsString);
    evFlags.Open;

    for i := 0 to evFlags.Items.Count-1 do begin
      Locate('description', evFlags.Items[i],[]);
      evFlags.Checked[i] := odsAccFlagsACC.AsInteger=1;
    end;
    cbOpType.KeyValue := 1;
    with odsClsBalAcc do begin
      Close;
      SetVariable('op', 1);
      SetVariable('classname', Classesdata.FieldByName('obj').AsString);
      evBalAccs.Open;
      for i := 0 to evBalAccs.Items.Count-1 do begin
        Locate('bal_cn', evBalAccs.Items[i],[]);
        evBalAccs.Checked[i] := odsClsBalAccACC.AsInteger=1;
      end;
    end;
    ShowModal;
  end;
end;

procedure TfmClassEdit.SpeedButton2Click(Sender: TObject);
var
fmProfiles: TfmProfOptions;
begin
 fmProfiles:=TfmProfOptions.Create(self);
 try
  fmProfiles.userName := AdministrationData.Classesdata.FieldByName('obj').AsString;
  fmProfiles.Execute();
  fmProfiles.ShowModal;
 finally
 if Assigned(fmProfiles) then
  fmProfiles.Release;
 end;
end;

procedure TfmClassEdit.cgClassEditDblClick(Sender: TObject);
var
  i: Integer;
  mid: Integer;
begin
  with AdministrationData, odsClsModAdvGrant, frmClassGrants do begin
    //Caption := 'Modul: "'+Modeditdata.FieldByName('trvdesc').AsString+'"';
    evAdvGrants.Close;
    odsClsModAdvGrant.Close;
    ClearVariables;
    SetVariable('mid', ModeditdataMODID.AsVariant);
    SetVariable('classname', Classesdata.FieldByName('obj').AsString);
    ModAdvancedGrantsData.ClearVariables;
    ModAdvancedGrantsData.Close;
    ModAdvancedGrantsData.SetVariable('modid', ModeditdataMODID.AsVariant);
    ModAdvancedGrantsData.SetVariable('usernam', Classesdata.FieldByName('obj').AsString);
    ModAdvancedGrantsData.Open;
    ModeditDataX.Close;
    ModeditDataX.ClearVariables;
    ModeditDataX.SetVariable('clsid',ClassesdataID.AsInteger);
    ModeditDataX.SetVariable('modid', ModeditdataMODID.AsInteger);
    ModeditDataX.Open;
    evAdvGrants.Open;

    for i := 0 to evAdvGrants.Items.Count-1 do begin
      Locate('description', evAdvGrants.Items[i],[]);
      evAdvGrants.Checked[i] := odsClsModAdvGrantACC.AsInteger=1;
    end;

    cbIns.Enabled := ModeditdataCNI.AsInteger = 1;
    cbUpd.Enabled := ModeditdataCNU.AsInteger = 1;
    cbDel.Enabled := ModeditdataCND.AsInteger = 1;

    cbIns.Checked := ModeditdataXINS.AsInteger = 1;
    cbUpd.Checked := ModeditdataXUPD.AsInteger = 1;
    cbDel.Checked := ModeditdataXDEL.AsInteger = 1;

    ShowModal;
  end;
end;

end.

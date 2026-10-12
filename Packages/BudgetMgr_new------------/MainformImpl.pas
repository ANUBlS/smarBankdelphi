unit MainformImpl;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, Budcet_new_TLB, StdVcl, StdCtrls, ComCtrls, ExtCtrls,
  Buttons, ImgList, CurrencyEdit, Menus;

type
  EItemNotFound = class(Exception);
  TMainForm = class(TActiveForm, IMainForm)
    Panel1: TPanel;
    ImageList1: TImageList;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    TreeView1: TTreeView;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    GroupBox3: TGroupBox;
    Panel3: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Panel4: TPanel;
    CheckBox1: TCheckBox;
    BitBtn9: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    RadioGroup1: TRadioGroup;
    Label6: TLabel;
    Edit6: TEdit;
    CurrencyEdit1: TCurrencyEdit;
    Memo1: TMemo;
    Memo2: TMemo;
    SpeedButton1: TSpeedButton;
    BitBtn10: TBitBtn;
    CurrencyEdit2: TCurrencyEdit;
    PopupMenu1: TPopupMenu;
    A1: TMenuItem;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    procedure ActiveFormCreate(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TreeView1GetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn10Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure A1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
  private
    { Private declarations }
    FEvents: IMainFormEvents;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure MouseEnterEvent(Sender: TObject);
    procedure MouseLeaveEvent(Sender: TObject);
    procedure PaintEvent(Sender: TObject);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function Get_Active: WordBool; safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    function Get_AlignDisabled: WordBool; safecall;
    function Get_AlignWithMargins: WordBool; safecall;
    function Get_AutoScroll: WordBool; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_BorderWidth: Integer; safecall;
    function Get_Caption: WideString; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_DockSite: WordBool; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    function Get_ExplicitHeight: Integer; safecall;
    function Get_ExplicitLeft: Integer; safecall;
    function Get_ExplicitTop: Integer; safecall;
    function Get_ExplicitWidth: Integer; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_HelpFile: WideString; safecall;
    function Get_KeyPreview: WordBool; safecall;
    function Get_MouseInClient: WordBool; safecall;
    function Get_ParentCustomHint: WordBool; safecall;
    function Get_ParentDoubleBuffered: WordBool; safecall;
    function Get_PixelsPerInch: Integer; safecall;
    function Get_PopupMode: TxPopupMode; safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    function Get_Scaled: WordBool; safecall;
    function Get_ScreenSnap: WordBool; safecall;
    function Get_SnapBuffer: Integer; safecall;
    function Get_UseDockManager: WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    procedure _Set_Font(var Value: IFontDisp); safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    procedure Set_AlignWithMargins(Value: WordBool); safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_BorderWidth(Value: Integer); safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_DockSite(Value: WordBool); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    procedure Set_ParentCustomHint(Value: WordBool); safecall;
    procedure Set_ParentDoubleBuffered(Value: WordBool); safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    procedure Set_PopupMode(Value: TxPopupMode); safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    procedure Set_ScreenSnap(Value: WordBool); safecall;
    procedure Set_SnapBuffer(Value: Integer); safecall;
    procedure Set_UseDockManager(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
  public

    { Public declarations }
    procedure Initialize; override;
    procedure FormingTreeView;
   function GetNodeByText (ATree : TTreeView; AValue:String; AVisible: Boolean): TTreeNode;
  end;
 var
reng,m,st,ss,nex,pid,previd,a, IndexTN_FOrganStruc:integer;
 Add, Edit, StructChng:Boolean;
acc,ad,kod, nam :string;
ay,rub,yil,il,fay,frub,fyil,fil:Real;
implementation

uses ComObj, ComServ, DmBudcetImpl, AddEditFrmImpl, MaddeAddImpl,
  AccountAddImpl, ReportImpl, SettingImpl, ClearImpl, BcTrasactionImpl;

{$R *.DFM}

{ TMainForm }

procedure TMainForm.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_MainFormPage); }
end;

procedure TMainForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
If ord(key) = 13 then
BitBtn9.Click
end;

procedure TMainForm.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IMainFormEvents;
  inherited EventSinkChanged(EventSink);
end;

procedure TMainForm.Initialize;
begin
  inherited Initialize;
  OnActivate := ActivateEvent;
  OnClick := ClickEvent;
  OnCreate := CreateEvent;
  OnDblClick := DblClickEvent;
  OnDeactivate := DeactivateEvent;
  OnDestroy := DestroyEvent;
  OnKeyPress := KeyPressEvent;
  OnMouseEnter := MouseEnterEvent;
  OnMouseLeave := MouseLeaveEvent;
  OnPaint := PaintEvent;
end;

function TMainForm.Get_Active: WordBool;
begin
  Result := Active;
end;

function TMainForm.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TMainForm.Get_AlignDisabled: WordBool;
begin
  Result := AlignDisabled;
end;

function TMainForm.Get_AlignWithMargins: WordBool;
begin
  Result := AlignWithMargins;
end;

function TMainForm.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TMainForm.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TMainForm.Get_BorderWidth: Integer;
begin
  Result := Integer(BorderWidth);
end;

function TMainForm.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TMainForm.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TMainForm.Get_DockSite: WordBool;
begin
  Result := DockSite;
end;

function TMainForm.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TMainForm.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TMainForm.Get_ExplicitHeight: Integer;
begin
  Result := ExplicitHeight;
end;

function TMainForm.Get_ExplicitLeft: Integer;
begin
  Result := ExplicitLeft;
end;

function TMainForm.Get_ExplicitTop: Integer;
begin
  Result := ExplicitTop;
end;

function TMainForm.Get_ExplicitWidth: Integer;
begin
  Result := ExplicitWidth;
end;

function TMainForm.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TMainForm.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TMainForm.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TMainForm.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TMainForm.Get_MouseInClient: WordBool;
begin
  Result := MouseInClient;
end;

function TMainForm.Get_ParentCustomHint: WordBool;
begin
  Result := ParentCustomHint;
end;

function TMainForm.Get_ParentDoubleBuffered: WordBool;
begin
  Result := ParentDoubleBuffered;
end;

function TMainForm.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TMainForm.Get_PopupMode: TxPopupMode;
begin
  Result := Ord(PopupMode);
end;

function TMainForm.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TMainForm.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TMainForm.Get_ScreenSnap: WordBool;
begin
  Result := ScreenSnap;
end;

function TMainForm.Get_SnapBuffer: Integer;
begin
  Result := SnapBuffer;
end;

function TMainForm.Get_UseDockManager: WordBool;
begin
  Result := UseDockManager;
end;

function TMainForm.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TMainForm.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TMainForm._Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TMainForm.A1Click(Sender: TObject);
begin
if TreeView1.items.GetFirstNode <> nil then
TreeView1.items[IndexTN_FOrganStruc].Expand(True);
end;

procedure TMainForm.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;
 procedure TMainForm.FormingTreeView;
var
  TempSubdivision : String;
  TempSubdivid : integer;
  i: Real;
begin

  with TreeView1.Items do begin
    Clear;
    //MirrorView.Items.Clear;
    with DmBudcet.StructurDSet do begin
    Close;
    OPen;

      First;
      while not eof do begin
        try
          if FieldByName('previd').Value=0 then
         begin
            TreeView1.Items.Add(nil, FieldByName('name').Value);
 //          MirrorView.Items.Add(nil, FloatToStr(FieldByName('ID').asFloat));
          end
          else
            begin
              TempSubdivid:= FieldByName('id').Value;
              TempSubdivision:= FieldByName('name').Value;
              i:= fieldByName('id').Value;
              Locate('id', FieldByName('previd').Value, []);
              TreeView1.Items.AddChild(TreeView1.Items[FieldByName('Index_by_name').Value],TempSubdivision); { Add a root node }
//    MirrorView.Items.AddChild(MirrorView.Items[FieldByName('Index_by_name').Value],FloatToStr(i)); { Add a root node }
              Locate('id', TempSubdivid, []);
            end;


          Next;
        except
          raise EItemNotFound.CreateFmt('Item (id=%d) not found',[1]{, [PrevID]});
          Next;
        end;
      end;
    end;
  end;
end;

procedure TMainForm.ActiveFormCreate(Sender: TObject);
begin
  DmBudcet:=TDmBudcet.Create(self);
  AddEditFrm:=TAddEditFrm.Create(Self);
  MaddeAdd:=TMaddeAdd.Create(Self);
  AccountAddFrm:=TAccountAddFrm.Create(self);
  ReportFrm:=TReportFrm.Create(self);
  FrmSetting:=TFrmSetting.Create(self);
  ClearFrm:=TClearFrm.Create(self);
  FrmTrasaction:=TFrmTrasaction.Create(self);
  FormingTreeView;


   panel2.Height:=Screen.DesktopHeight-GroupBox3.Height;
   panel3.Width:=Screen.DesktopWidth-RadioGroup1.Width-212;
   //panel3.Width:=Width-RadioGroup1.Width;
  //TreeView1.FullExpand;
end;



procedure TMainForm.BitBtn10Click(Sender: TObject);
begin
if TreeView1.items.GetFirstNode <> nil then
TreeView1.items[IndexTN_FOrganStruc].Expand(True);
  // TreeView1.items.GetFirstNode.Expand(True);
end;

procedure TMainForm.BitBtn11Click(Sender: TObject);
var
  tn : TTreeNode;
  a :integer;
begin
a:=IndexTN_FOrganStruc;
  FormingTreeView;
   DmBudcet.StructurDSet.Refresh   ;
    if a<>0 then
    begin
      tn:=TreeView1.Items[a];
      TreeView1.SetFocus;
      tn.Selected := True;
    end;
end;

procedure TMainForm.BitBtn12Click(Sender: TObject);
begin
FrmSetting.ShowModal
end;

procedure TMainForm.BitBtn13Click(Sender: TObject);
begin
 DmBudcet.TrDataSet.close;
  DmBudcet.TrDataSet.SetVariable('bdg_code',kod);
   FrmTrasaction.ShowModal  ;
end;

procedure TMainForm.BitBtn14Click(Sender: TObject);
begin
DmBudcet.Closeyear.open;
if MessageDlg('İl '+DmBudcet.Closeyear.FieldByName('il').AsString+ ' > '+DmBudcet.Closeyear.FieldByName('il1').AsString+   ' Bağlanacaq '+     #13' Əminsinizmi?',
    mtWarning, [mbYes, mbCancel], 0)= mrYes then
    begin
     DmBudcet.PackgSubdiv.CallProcedure('close_year',['p_year',DmBudcet.Closeyear.FieldByName('il1').asinteger]);
     DmBudcet.OracleDataSet9.Refresh;
     ShowMessage('İl bağlandı');
     BitBtn11.Click;
    end;

end;

procedure TMainForm.BitBtn1Click(Sender: TObject);
begin
ReportFrm.ShowModal;
end;

procedure TMainForm.BitBtn2Click(Sender: TObject);
var
  tn : TTreeNode;
begin
DmBudcet.adm.CallProcedure('checkadvancedobjectaccess',['INSERTBUDCET']);
ss:=0;
a:=0;
 if DmBudcet.AccControl.Active then
 DmBudcet.AccControl.close;
  DmBudcet.AccControl.SetVariable('id',pid);
 DmBudcet.AccControl.open;
 //ShowMessage(DmBudcet.AccControl.FieldByName('balans').AsString+inttostr(pid));
 //ShowMessage(inttostr(pid)+' '+inttostr(DmBudcet.DelControl.RecordCount));
 if DmBudcet.AccControl.FieldByName('balans').AsString<>'' then
  begin
  ShowMessage('Öncə sazlanmış hesabları ləğv etmək lazımdır !');
  exit;
  end;

  if DmBudcet.AccControl.FieldByName('account').AsString<>'' then
  begin
    ShowMessage('Öncə sazlanmış hesabları ləğv etmək lazımdır !');
    exit;
  end;

  if SpeedButton1.Visible=True then
   SpeedButton1.Visible:=false;
  Edit:= False;
   Add:= True;
   AddEditFrm.Caption:='Əlavə et';
    AddEditFrm.ShowModal;
   if a=1 then
  begin
   FormingTreeView;
 //  TreeView1.FullExpand;


  if ad<>'' then
    begin
      tn:=GetNodeByText(TreeView1,ad,true);
      TreeView1.SetFocus;
      tn.Selected := True;
    end;
  end;
end;

procedure TMainForm.BitBtn3Click(Sender: TObject);
var
   ID, val:Real;
begin

DmBudcet.adm.CallProcedure('checkadvancedobjectaccess',['DELETBUDCET']);
{ if DmBudcet.DelControl.Active then
 DmBudcet.DelControl.close;
  DmBudcet.DelControl.SetVariable('id',pid);
 DmBudcet.DelControl.open;
 //ShowMessage(inttostr(pid)+' '+inttostr(DmBudcet.DelControl.RecordCount));
 if DmBudcet.DelControl.RecordCount>0 then
  begin
  ShowMessage('Önce alt maddəni silin !');
  exit;
  end;
  if previd=0 then
  begin
  ShowMessage('Əsas maddəni ancaq maddələr bölməsindən silə bilərsiz!');
  exit;
  end;
        }
if MessageDlg(' Seçilmiş sub maddə silinəcək !'#13' Əminsinizmi?',
    mtWarning, [mbYes, mbCancel], 0)= mrYes then
 with DmBudcet.StructurDSet do
   begin
    Locate('Index_By_Name', IndexTN_FOrganStruc, []);
    ID := Fields[0].AsFloat;
    val:=TreeView1.Items[IndexTN_FOrganStruc].Count+1;
    DmBudcet.PackgSubdiv.CallProcedure('del_subdiv',['index_by_Name$', IndexTN_FOrganStruc, 'rec_id', ID, 'value', val]);

      //  TreeView1.FullExpand;
   if  DmBudcet.Sil.Active  then
     DmBudcet.Sil.close;
     DmBudcet.Sil.SetVariable('prewid',previd);
     DmBudcet.Sil.open;
       FormingTreeView;
   //  ShowMessage(inttostr(previd));
    // exit;
     TreeView1.Selected := TreeView1.Items[DmBudcet.Sil.FieldByName('index_by_name').asinteger];
     TreeView1.SetFocus;
     TreeView1.items[DmBudcet.Sil.FieldByName('index_by_name').asinteger].Expand(True);
   end;
end;

procedure TMainForm.BitBtn4Click(Sender: TObject);
var
  tn : TTreeNode;
  index :integer;
begin
index:=IndexTN_FOrganStruc;
DmBudcet.adm.CallProcedure('checkadvancedobjectaccess',['EDITBUDCET']);
  ss:=1;
 if previd=0 then
  begin
    ShowMessage(' Maddəni redaktə etmək olmaz !');
    exit;
  end;
   Edit:= true;
   Add:= false;
   AddEditFrm.Memo1.Text:=nam;
   AddEditFrm.edit2.Text:=kod;
   AddEditFrm.DBLookupComboBox1.KeyValue:=reng;
  AddEditFrm.Caption:='Redaktə et';
  AddEditFrm.ShowModal;
  if a=2 then
  begin
    TreeView1.Selected.Text:=AddEditFrm.memo1.Text;
    DmBudcet.StructurDSet.Refresh;
      FormingTreeView;
   //  TreeView1.FullExpand;
  end;

     tn:=TreeView1.Items[index];
      TreeView1.SetFocus;
      tn.Selected := True;

end;

procedure TMainForm.BitBtn5Click(Sender: TObject);
begin
  if SpeedButton1.Visible=True then
   SpeedButton1.Visible:=false;
  TreeView1.FullExpand;
end;

procedure TMainForm.BitBtn6Click(Sender: TObject);
begin
  if SpeedButton1.Visible=True then
   SpeedButton1.Visible:=false;
TreeView1.FullCollapse   ;
 // BitBtn2.Enabled:=false;
  BitBtn3.Enabled:=false;
  BitBtn4.Enabled:=false;
  BitBtn7.Enabled:=false;
 //  RadioGroup1.Enabled:=false;
end;

procedure TMainForm.BitBtn7Click(Sender: TObject);
begin
DmBudcet.adm.CallProcedure('checkadvancedobjectaccess',['ACCOUNTBUDCET']);
 if DmBudcet.DelControl.Active then
 DmBudcet.DelControl.close;
  DmBudcet.DelControl.SetVariable('id',pid);
 DmBudcet.DelControl.open;
 //ShowMessage(inttostr(pid)+' '+inttostr(DmBudcet.DelControl.RecordCount));
 if DmBudcet.DelControl.RecordCount>0 then
  begin
  ShowMessage('Hesablar ən sona sazlanmalıdr. !');
  exit;
  end;

 AccountAddFrm.Edit1.Text:=kod;
  AccountAddFrm.Edit2.Text:=nam;
 with DmBudcet.OracleDataSet1 do
 begin
 if Active then
  close;
  SetVariable('id',pid);
  open;
  Edit;
 end;
   with DmBudcet.OracleDataSet3 do
 begin
 if Active then
  close;
  SetVariable('id',pid);
  open;
  Edit;
 end;
  AccountAddFrm.ShowModal;
 DmBudcet.StructurDSet.Refresh;
   CurrencyEdit1.Value:= DmBudcet.PackgSubdiv.CallFloatFunction('get_prognoz',['p_id',pid,'p_status',RadioGroup1.ItemIndex+1]);

  DmBudcet.StructurDSet.Locate('Index_by_name', IndexTN_FOrganStruc, []);
  CurrencyEdit2.Value:= DmBudcet.StructurDSet.Fields[11].AsFloat;
  fay:= DmBudcet.StructurDSet.Fields[11].AsFloat;
  frub:=DmBudcet.StructurDSet.Fields[12].AsFloat;
  fyil:=DmBudcet.StructurDSet.Fields[13].AsFloat;
  fil:= DmBudcet.StructurDSet.Fields[14].AsFloat;
  memo1.Text:= DmBudcet.StructurDSet.Fields[10].AsString ;
  end;

procedure TMainForm.BitBtn8Click(Sender: TObject);
var
  tn : TTreeNode;
  a :integer;
begin
DmBudcet.adm.CallProcedure('checkadvancedobjectaccess',['BUDCETMADDE']);
a:=IndexTN_FOrganStruc;
DmBudcet.MaddeDSet.open;
MaddeAdd.ShowModal ;
if st=1 then
a:=m;
if st=2 then
a:=0;
   FormingTreeView;
   DmBudcet.StructurDSet.Refresh   ;
    if a<>0 then
    begin
       tn:=TreeView1.Items[a];
      TreeView1.SetFocus;
      tn.Selected := True;
    end;
  // TreeView1.FullExpand;
end;
procedure TMainForm.BitBtn9Click(Sender: TObject);
var
  tn : TTreeNode;
  s :string;
begin
 SpeedButton1.Visible:=false;
    if edit1.Text<>'' then
    s:=s+' and code='+''''+edit1.Text+'''';

    if edit2.Text<>'' then
    s:=s+' and upper(name) like upper('+''''+'%'+edit2.Text+'%'+''''+')';

    if memo1.Text<>'' then
    s:=s+
     'and (bc_package.find_vergul_ids(balans,'+''''+ memo1.Text+''''+
     ')=1 or bc_package.find_vergul_ids(account,'+''''+memo1.Text+''''+
     ')=1 or bc_package.find_vergul_ids(dntaccount,'+''''+memo1.Text+''''+')=1)';
     if CurrencyEdit1.Value<>0 then
     begin
     if RadioGroup1.ItemIndex=0 then
       s:=s+' and ayliq='+ floattostr(CurrencyEdit1.Value);
     if RadioGroup1.ItemIndex=1 then
       s:=s+' and rubluk='+ floattostr(CurrencyEdit1.Value);
     if RadioGroup1.ItemIndex=2 then
       s:=s+' and yarimillik='+ floattostr(CurrencyEdit1.Value);
     if RadioGroup1.ItemIndex=3 then
       s:=s+' and illik='+ floattostr(CurrencyEdit1.Value);

       end;
    // ShowMessage(s);
    // Memo2.Text:=s;
     with DmBudcet.Axtar do
     begin
     if Active then
     close;
     sql[3]:=s;
     open;
     Edit6.Text:=inttostr(RecordCount);
     Memo2.Text:=sql.Text    ;
     if RecordCount=1 then
     begin
   //  tn:=GetNodeByText(TreeView1,FieldByName('name').AsString,CheckBox1.Checked);
   //   TreeView1.SetFocus;
    //  tn.Selected := True;
        TreeView1.Selected := TreeView1.Items[DmBudcet.Axtar.FieldByName('index_by_name').AsInteger];
    TreeView1.SetFocus;
     end;
     if RecordCount=1 then
     begin
         Label6.Visible:=true;
         Edit6.Visible:=true;
     end;
    if RecordCount>1 then
     begin
     nex:=2;
     SpeedButton1.Visible:=True;
     Label6.Visible:=true;
     Edit6.Visible:=true;
   //  tn:=GetNodeByText(TreeView1,FieldByName('name').AsString,CheckBox1.Checked);
   //   TreeView1.SetFocus;
    //  tn.Selected := True;
    TreeView1.Selected := TreeView1.Items[DmBudcet.Axtar.FieldByName('index_by_name').AsInteger];
    TreeView1.SetFocus;
     end;
     end;

  { tn:=GetNodeByText(TreeView1,Edit1.Text,CheckBox1.Checked);
   if tn = nil then
    ShowMessage('Not found!')
   else
    begin
      TreeView1.SetFocus;
      tn.Selected := True;
    end;
      }
end;


function TMainForm.GetNodeByText (ATree : TTreeView; AValue:String; AVisible: Boolean): TTreeNode;
var
    Node: TTreeNode;
begin
  Result := nil;
  if ATree.Items.Count = 0 then Exit;
  Node := ATree.Items[0];
  while Node <> nil do
  begin
    if UpperCase(Node.Text) = UpperCase(AValue) then
    begin
      Result := Node;
      if AVisible then
        Result.MakeVisible;
      Break;
    end;
    Node := Node.GetNext;
  end;
end;
procedure TMainForm.CheckBox1Click(Sender: TObject);
begin
Edit6.Text:='';
if CheckBox1.Checked then
begin
//RadioGroup1.Enabled:=true;
RadioGroup1.ItemIndex:=0;
panel3.Enabled:=true;
BitBtn9.Enabled:=true;
Edit1.Text:='';
Edit2.Text:='';
Memo1.Clear;
CurrencyEdit1.Value:=0;
CurrencyEdit2.Value:=0;
end else
begin
panel3.Enabled:=false;
BitBtn9.Enabled:=false ;
SpeedButton1.Visible:=false;
     Label6.Visible:=false;
     Edit6.Visible:=false;
//RadioGroup1.Enabled:=false;
  edit1.Text:=kod;
  edit2.Text:=nam;
  Memo1.Text:= acc;
    CurrencyEdit1.Value:= ay;
    CurrencyEdit2.Value:= fay;
end;
end;

procedure TMainForm.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TMainForm.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TMainForm.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TMainForm.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TMainForm.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TMainForm.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TMainForm.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
 if not (Key in ['A'..'Z','a'..'z','0'..'9',#8] )then
begin
 Key:=#0;
end;
If ord(key) = 13 then
BitBtn9.Click
end;

procedure TMainForm.MouseEnterEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnMouseEnter;
end;

procedure TMainForm.MouseLeaveEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnMouseLeave;
end;

procedure TMainForm.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TMainForm.RadioGroup1Click(Sender: TObject);
begin
if RadioGroup1.ItemIndex=0 then
begin
  CurrencyEdit1.Value:=DmBudcet.PackgSubdiv.CallFloatFunction('get_prognoz',['p_id',pid,'p_status',1]);
  CurrencyEdit2.Value:=fay;
end;
  if RadioGroup1.ItemIndex=1 then
  begin
  CurrencyEdit1.Value:=DmBudcet.PackgSubdiv.CallFloatFunction('get_prognoz',['p_id',pid,'p_status',2]);
  CurrencyEdit2.Value:=frub;
  end;
    if RadioGroup1.ItemIndex=2 then
    begin
   CurrencyEdit1.Value:=DmBudcet.PackgSubdiv.CallFloatFunction('get_prognoz',['p_id',pid,'p_status',3]); ;
   CurrencyEdit2.Value:=fyil ;
    end;
    if RadioGroup1.ItemIndex=3 then
    begin
    CurrencyEdit1.Value:=DmBudcet.PackgSubdiv.CallFloatFunction('get_prognoz',['p_id',pid,'p_status',4]);  ;
    CurrencyEdit2.Value:=fil  ;
    end;
end;

procedure TMainForm.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TMainForm.Set_AlignWithMargins(Value: WordBool);
begin
  AlignWithMargins := Value;
end;

procedure TMainForm.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TMainForm.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TMainForm.Set_BorderWidth(Value: Integer);
begin
  BorderWidth := TBorderWidth(Value);
end;

procedure TMainForm.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TMainForm.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TMainForm.Set_DockSite(Value: WordBool);
begin
  DockSite := Value;
end;

procedure TMainForm.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TMainForm.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TMainForm.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TMainForm.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TMainForm.Set_HelpFile(const Value: WideString);
begin
  HelpFile := string(Value);
end;

procedure TMainForm.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TMainForm.Set_ParentCustomHint(Value: WordBool);
begin
  ParentCustomHint := Value;
end;

procedure TMainForm.Set_ParentDoubleBuffered(Value: WordBool);
begin
  ParentDoubleBuffered := Value;
end;

procedure TMainForm.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TMainForm.Set_PopupMode(Value: TxPopupMode);
begin
  PopupMode := TPopupMode(Value);
end;

procedure TMainForm.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TMainForm.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TMainForm.Set_ScreenSnap(Value: WordBool);
begin
  ScreenSnap := Value;
end;

procedure TMainForm.Set_SnapBuffer(Value: Integer);
begin
  SnapBuffer := Value;
end;

procedure TMainForm.Set_UseDockManager(Value: WordBool);
begin
  UseDockManager := Value;
end;

procedure TMainForm.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TMainForm.SpeedButton1Click(Sender: TObject);
begin
{for I := 1 to DmBudcet.Axtar.RecordCount do
    begin
      TreeView1.Selected := TreeView1.Items[1];
      TreeView1.SetFocus;

      DmBudcet.Axtar.Next:=True;
    end;    }
    DmBudcet.Axtar.Next;
    TreeView1.Selected := TreeView1.Items[DmBudcet.Axtar.FieldByName('index_by_name').AsInteger];
    TreeView1.SetFocus;
    //if DmBudcet.Axtar.Last=true then

     if  DmBudcet.Axtar.RecordCount <nex then
     begin
      nex:=2;
          if MessageDlg(
              'Axtarış sona çatıb.'+#13+'əvvəldən başlamaq istəyirsinizmi?'
             ,mtInformation
             ,[mbNo , mbYes]
             ,0
             ) = mrYes  then
             begin
            DmBudcet.Axtar.First;
             nex:=1;
              //  DmBudcet.Axtar.Next;
             TreeView1.Selected := TreeView1.Items[DmBudcet.Axtar.FieldByName('index_by_name').AsInteger];
             TreeView1.SetFocus;
             end;
     end ;

         inc(nex);

  //Edit:= False;
//  Add:= True;
  //  AddEditFrm.ShowModal;
    //FormingTreeView;
   // TreeView1.FullExpand;

end;

procedure TMainForm.TreeView1Change(Sender: TObject; Node: TTreeNode);
 //var
//  LastNode, TempNode : TTreeNode;
begin
//LastNode:=Node;
 //LastNode:= LastNode.;
// ShowMessage(inttostr(LastNode.StateIndex));
  //Index:=Node.AbsoluteIndex;

  IndexTN_FOrganStruc:= Node.AbsoluteIndex;
  DmBudcet.StructurDSet.Locate('Index_by_name', Node.AbsoluteIndex, []);
  nam:= DmBudcet.StructurDSet.Fields[1].AsString;
  pid:= DmBudcet.StructurDSet.Fields[0].Asinteger;
  previd:=DmBudcet.StructurDSet.Fields[2].Asinteger;
  kod:= DmBudcet.StructurDSet.Fields[5].AsString;
  acc:=DmBudcet.StructurDSet.Fields[10].AsString ;
  ay:= DmBudcet.StructurDSet.Fields[6].AsFloat;
  CurrencyEdit1.Value:= DmBudcet.PackgSubdiv.CallFloatFunction('get_prognoz',['p_id',pid,'p_status',1]);
   fay:= DmBudcet.StructurDSet.Fields[11].AsFloat;
   CurrencyEdit2.Value:= fay;

  rub:=DmBudcet.StructurDSet.Fields[7].AsFloat;
  frub:=DmBudcet.StructurDSet.Fields[12].AsFloat;
  yil:=DmBudcet.StructurDSet.Fields[8].AsFloat;
  fyil:=DmBudcet.StructurDSet.Fields[13].AsFloat;
  il:= DmBudcet.StructurDSet.Fields[9].AsFloat;
  fil:= DmBudcet.StructurDSet.Fields[14].AsFloat;
  reng:= DmBudcet.StructurDSet.Fields[15].asinteger;
  RadioGroup1.ItemIndex:=0;
  if CheckBox1.Checked=false then
  begin
     edit1.Text:=DmBudcet.StructurDSet.Fields[5].asstring;
     edit2.Text:=DmBudcet.StructurDSet.Fields[1].AsString;
     Memo1.Text:= acc;
  end;
if DmBudcet.DelControl.Active then
 DmBudcet.DelControl.close;
  DmBudcet.DelControl.SetVariable('id',pid);
 DmBudcet.DelControl.open;
 //ShowMessage(inttostr(pid)+' '+inttostr(DmBudcet.DelControl.RecordCount));
 if DmBudcet.DelControl.RecordCount=0 then
  begin
  BitBtn3.Enabled:=true;
  BitBtn7.Enabled:=true;
  BitBtn13.Enabled:=true;
  end;
  if previd<>0 then
  begin
  BitBtn3.Enabled:=true;
  BitBtn7.Enabled:=true;
  BitBtn13.Enabled:=true;
  BitBtn4.Enabled:=true;
  end;
    if DmBudcet.DelControl.RecordCount>0 then
  begin
  BitBtn3.Enabled:=false;
  BitBtn7.Enabled:=false;
  BitBtn13.Enabled:=false;
  end;
  if previd=0 then
  begin
  BitBtn3.Enabled:=false;
 // BitBtn7.Enabled:=false;
  BitBtn4.Enabled:=false;
  end;

  BitBtn2.Enabled:=true;
 // BitBtn4.Enabled:=true;

  RadioGroup1.Enabled:=true;
end;

procedure TMainForm.TreeView1GetImageIndex(Sender: TObject; Node: TTreeNode);
begin
Node.ImageIndex:=6;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TMainForm,
    Class_MainForm,
    2,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

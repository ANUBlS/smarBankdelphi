unit ControlTapeImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, Out_control_tape_TLB, StdVcl, Grids, DBGrids, DBCtrls,
  StdCtrls, ComCtrls, ExtCtrls;

type
  TFrmControlTape = class(TActiveForm, IActiveFormX)
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    Button4: TButton;
    Button3: TButton;
    Button1: TButton;
    Button2: TButton;
    GroupBox2: TGroupBox;
    CBCurrency: TComboBox;
    GroupBox1: TGroupBox;
    DoDate: TDateTimePicker;
    Panel3: TPanel;
    EditBalances: TEdit;
    Toggle: TCheckBox;
    GroupBox4: TGroupBox;
    DBLookupBranch: TDBLookupComboBox;
    ViewerGrid: TDBGrid;
    ComboBox_balans: TComboBox;
    procedure ActiveFormCreate(Sender: TObject);
    procedure ActiveFormDestroy(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    FEvents: IActiveFormXEvents;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure PaintEvent(Sender: TObject);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function Get_Active: WordBool; safecall;
    function Get_AutoScroll: WordBool; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    function Get_Caption: WideString; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_HelpFile: WideString; safecall;
    function Get_KeyPreview: WordBool; safecall;
    function Get_PixelsPerInch: Integer; safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    function Get_Scaled: WordBool; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(var Value: IFontDisp); safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
  public
    { Public declarations }
    { Public declarations }Rate     :array of Integer;
    str:string;

    procedure Full;
    function BuildFilter(Toggle: Boolean): string;
    procedure MouseWheelHandler(var Message: TMessage); override;
    procedure Initialize; override;

  end;

var
 FrmControlTape: TFrmControlTape;

implementation

uses ComObj, ComServ,sboapiDataModuleImpl, untdatamod, untrep1, Untrep2,
  QRPTransactionView, SBTranslateProc;
{$R *.DFM}

{ TActiveFormX }

procedure TFrmControlTape.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_ActiveFormXPage); }
end;

procedure TFrmControlTape.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IActiveFormXEvents;
end;

procedure TFrmControlTape.Initialize;
begin
  inherited Initialize;
  OnActivate := ActivateEvent;
  OnClick := ClickEvent;
  OnCreate := CreateEvent;
  OnDblClick := DblClickEvent;
  OnDeactivate := DeactivateEvent;
  OnDestroy := DestroyEvent;
  OnKeyPress := KeyPressEvent;
  OnPaint := PaintEvent;
end;

function TFrmControlTape.Get_Active: WordBool;
begin
  Result := Active;
end;

function TFrmControlTape.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TFrmControlTape.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TFrmControlTape.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TFrmControlTape.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TFrmControlTape.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TFrmControlTape.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TFrmControlTape.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TFrmControlTape.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TFrmControlTape.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TFrmControlTape.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TFrmControlTape.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TFrmControlTape.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TFrmControlTape.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TFrmControlTape.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TFrmControlTape.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TFrmControlTape.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TFrmControlTape.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TFrmControlTape._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TFrmControlTape.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TFrmControlTape.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TFrmControlTape.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TFrmControlTape.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TFrmControlTape.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TFrmControlTape.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TFrmControlTape.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TFrmControlTape.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TFrmControlTape.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TFrmControlTape.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TFrmControlTape.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TFrmControlTape.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TFrmControlTape.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TFrmControlTape.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TFrmControlTape.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TFrmControlTape.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TFrmControlTape.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TFrmControlTape.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TFrmControlTape.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TFrmControlTape.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TFrmControlTape.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TFrmControlTape.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TFrmControlTape.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TFrmControlTape.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

function TFrmControlTape.BuildFilter(Toggle: Boolean): string;
begin
 Result :='';
 if Toggle then
  begin
   if (Trim(EditBalances.Text)<>'') then
     if ComboBox_balans.ItemIndex=0 then
    Result :=' a.bal_cn1 in (' + EditBalances.Text + ') and '
    else
    Result :=' a.bal_cn2 in (' + EditBalances.Text + ') and '
   else
    Result :=' a.bal_cn1 in ('+'-1'+') and ';
  end;
end;
procedure TFrmControlTape.ActiveFormCreate(Sender: TObject);
begin
 FrmControlTape :=Self;

 control_tape_mod :=Tcontrol_tape_mod.Create(Self);
 QTransactionView :=TQTransactionView.Create(self);
 control_tape_mod.Branch.active :=true;
 ComboBox_balans.ItemIndex:=0;
  with control_tape_mod do
   begin
    ForMoney.open;
    ForTable.open;
    BanksName.open;
    Group.open;
   end;
  QR1 :=TQR1.Create(Self);
  QR2 :=TQR2.Create(Self);
 Full;
 CBCurrency.ItemIndex:=0;
 DBLookupBranch.KeyValue :=-1;
 DoDate.DateTime:=control_tape_mod.OraclePackage1.CallDateFunction('GetBankDay',[]);
 SBTranslateProc.TranslateAllComponents(Self,sboapiDataModule.OrPack_SL);
end;
 
procedure TFrmControlTape.MouseWheelHandler(var Message: TMessage);
begin
 Inherited;
 if ViewerGrid.Focused then
  with TCMMouseWheel(Message), ViewerGrid.DataSource.DataSet do
    if WheelDelta < 0 then
      Next
    else
      Prior;
   ViewerGrid.Repaint;
end;

procedure TFrmControlTape.Full;
var
    RateIndex :Integer;
begin
  RateIndex:=0;
   with   CBCurrency.Items  do
   begin
     Clear;
     Add('Bütün valyutalar')
   end;
  with  control_tape_mod.ForMoney  do
  begin
    Open;
    SetLength(Rate,RecordCount);
    First;
    while  not EOF  do
    begin
      Rate[RateIndex] :=FieldByName('Valute').AsInteger;
      CBCurrency.Items.Add(FieldByName('Valu_Name').AsString);
      Inc(RateIndex);
      Next
    end;
  end;
end;


procedure TFrmControlTape.ActiveFormDestroy(Sender: TObject);
begin
 if assigned(rate)  then setlength(rate,0);
  QR1.Free;
  QR2.Free;
end;

procedure TFrmControlTape.Button3Click(Sender: TObject);
var
  V:Variant;
  BranchFilter: string;
begin

 BranchFilter :=' ';
 if DBLookupBranch.keyvalue <> -1 then
  BranchFilter :=' a.filial = ' + IntToStr(DBLookupBranch.keyvalue) + ' and  ';
 //ShowMessage(BranchFilter);
 V :=Integer(Trunc(DoDate.DateTime));
 control_tape_mod.ForTable.Active:=false;
 control_tape_mod.ForTable.SQL.Clear;
 str:=IntToStr(rate[CBCurrency.ItemIndex-1]);
 case ComboBox_balans.ItemIndex of

 0:begin
 if CBCurrency.ItemIndex=0 then
  control_tape_mod.ForTable.SQL.Add('select a.bal_cn1, Sum(p.ammount) as AMMOUNTS,Sum(p.lammount) as LAMMOUNTS  from Out_provarch p, Out_account a'+
   ' where a.id=p.debt and ' + BranchFilter + BuildFilter(Toggle.Checked)+ 'p.dat=:ADate Group By a.Bal_cn1 order by a.bal_cn1')
 else control_tape_mod.ForTable.SQL.Add('select a.bal_cn1, sum(p.ammount) as AMMOUNTS, sum(p.lammount) as LAMMOUNTS  from Out_provarch p, Out_account a'+
   ' where a.id=p.debt and ' + BranchFilter + BuildFilter(Toggle.Checked) + 'p.dat=:ADate and a.Val_Acc='+str+
   ' Group by bal_cn1 order by bal_cn1');
  control_tape_mod.ForTable.SetVariable('ADate',V);
 control_tape_mod.ForTable.Open;
 end;

 1:begin
    if CBCurrency.ItemIndex=0 then
  control_tape_mod.ForTable.SQL.Add('select a.bal_cn2 as bal_cn1, Sum(p.ammount) as AMMOUNTS,Sum(p.lammount) as LAMMOUNTS  from Out_provarch p, Out_account a'+
   ' where a.id=p.debt and ' + BranchFilter + BuildFilter(Toggle.Checked)+ 'p.dat=:ADate Group By a.Bal_cn2 order by a.bal_cn2')
 else control_tape_mod.ForTable.SQL.Add('select a.bal_cn2 as bal_cn1, sum(p.ammount) as AMMOUNTS, sum(p.lammount) as LAMMOUNTS  from Out_provarch p, Out_account a'+
   ' where a.id=p.debt and ' + BranchFilter + BuildFilter(Toggle.Checked) + 'p.dat=:ADate and a.Val_Acc='+str+
   ' Group by bal_cn2 order by bal_cn2');
  control_tape_mod.ForTable.SetVariable('ADate',V);
 control_tape_mod.ForTable.Open;
 end;
 end;
end;


procedure TFrmControlTape.Button1Click(Sender: TObject);
var
    V:Variant;
    BranchFilter: string;
    TableName: String;
begin
 BranchFilter :=' ';
 V :=Integer(Trunc(DoDate.DateTime));

 if DBLookupBranch.keyvalue <> -1 then
  BranchFilter :=' a.filial = ' + IntToStr(DBLookupBranch.keyvalue) + ' and  ';

   if DoDate.DateTime = control_tape_mod.OraclePackage1.CallDateFunction('GetBankDay',[]) then
    TableName:=' out_provdoc p,'
   else
    TableName :=' out_provarch p,';

 control_tape_mod.Group.Active:=false;
 control_tape_mod.Group.SQL.Clear;
 str:=IntToStr(rate[CBCurrency.ItemIndex-1]);

 case ComboBox_balans.ItemIndex of
 0:begin
 if CBCurrency.ItemIndex=0 then
  control_tape_mod.Group.SQL.Add('select a.bal_cn1,p.val_acc,Out_sb_complex_transactions.getcurrencyname(p.val_acc) as currencyname, ' +
                                  ' p.ammount ,p.lammount  from '+ TableName +' Out_account a '+
   ' where a.id=p.debt and ' + BuildFilter(Toggle.Checked) + BranchFilter + 'p.dat=:ADate Order By a.Bal_cn1 ,p.val_acc,p.ammount')
 else
  control_tape_mod.Group.SQL.Add('select a.bal_cn1,p.val_acc,Out_sb_complex_transactions.getcurrencyname(p.val_acc) as currencyname, '+
  'p.ammount,p.lammount from '+ TableName+' out_account a '+
   ' where a.id=p.debt and ' + BuildFilter(Toggle.Checked) + BranchFilter + 'p.dat=:ADate and a.Val_Acc='+str+
   ' Order by bal_cn1 ,p.val_acc ,p.ammount');
 control_tape_mod.Group.SetVariable('ADate',V);
 control_tape_mod.Group.Open;
 with QR1 do
  begin
   QRLabelDate.Caption :=FormatDateTime('dd/mm/yyyy',DoDate.DateTime);
   Preview;
  end;
 end;
  1:begin
   if CBCurrency.ItemIndex=0 then
  control_tape_mod.Group.SQL.Add('select a.bal_cn2 as bal_cn1 ,p.val_acc,Out_sb_complex_transactions.getcurrencyname(p.val_acc) as currencyname, ' +
                                  ' p.ammount ,p.lammount  from '+ TableName +' Out_account a '+
   ' where a.id=p.debt and ' + BuildFilter(Toggle.Checked) + BranchFilter + 'p.dat=:ADate Order By a.Bal_cn2  ,p.val_acc,p.ammount')
 else
  control_tape_mod.Group.SQL.Add('select a.bal_cn2 as bal_cn1,p.val_acc,Out_sb_complex_transactions.getcurrencyname(p.val_acc) as currencyname, '+
  'p.ammount,p.lammount from '+ TableName+' out_account a '+
   ' where a.id=p.debt and ' + BuildFilter(Toggle.Checked) + BranchFilter + 'p.dat=:ADate and a.Val_Acc='+str+
   ' Order by bal_cn2 ,p.val_acc ,p.ammount');
 control_tape_mod.Group.SetVariable('ADate',V);
 control_tape_mod.Group.Open;
 with QR1 do
  begin
   QRLabelDate.Caption :=FormatDateTime('dd/mm/yyyy',DoDate.DateTime);
   Preview;
 end;
 end;

 end;
end;



procedure TFrmControlTape.Button2Click(Sender: TObject);
begin
 Button3.Click;
control_tape_mod.BanksName.Open;
 QR2.QRLabel2.Caption:=FormatDateTime('dd/mm/yyyy',DoDate.Date);
 Qr2.QRLabel7.Caption:=CBCurrency.Text;
 Qr2.QRDBText2.font.Color:=clWhite;
 Qr2.QRExpr1.font.Color:=clWhite;
 if control_tape_mod.ForMoney.Locate('valu_name',CBCurrency.Text,[]) then
  begin
     Qr2.QRDBText2.font.Color:=clBlack;
     Qr2.QRExpr1.font.Color:=clBlack;
  end;
 QR2.Preview;
 control_tape_mod.BanksName.Close;
end;

procedure TFrmControlTape.Button4Click(Sender: TObject);
var
 OperationDate :Variant;
begin
 Button3.Click;
 str:=IntToStr(rate[CBCurrency.ItemIndex-1]);
 OperationDate :=Integer(Trunc(DoDate.DateTime));

 case ComboBox_balans.ItemIndex  of

0:begin
  if CBCurrency.ItemIndex=0 then
   begin
    with control_tape_mod.ODSTransactionView ,QTransactionView do
     begin
      Close;
      SQL.Clear;
      SQL.Text :=' Select d.bal_cn1 BalanceAccount,d.acc_no Debit,d.val_acc DebitCurrency,dc.val_name DValName'+
                        ',c.acc_no Credit,c.val_acc CreditCurrency,cc.val_name CValName,p.ammount DebitAmmount'+
                           ',p.ammount_c CreditAmmount,p.lammount CommonAmmount,p.name '+
                 ' From '+
                    'Out_Provarch p,'+
                     'Out_Account d,'+
                      'Out_Account c,'+
                       'Avalute dc,'+
                        'Avalute cc'+
                 ' Where '+
                    'p.debt = d.id and '+
                     'p.kredit = c.id and '+
                      'd.val_acc = dc.valute and '+
                       'c.val_acc = cc.valute and '+
                        'p.dat =:TransactionDate '+
                 ' Order by d.bal_cn1';
      SetVariable('TransactionDate',OperationDate);
      Open;
      Preview;
     end;
   end
 else
  begin
    with control_tape_mod.ODSTransactionView ,QTransactionView do
     begin
      Close;
      SQL.Clear;
      SQL.Text :=' Select d.bal_cn1 BalanceAccount,d.acc_no Debit,d.val_acc DebitCurrency,dc.val_name DValName'+
                        ',c.acc_no Credit,c.val_acc CreditCurrency,cc.val_name CValName,p.ammount DebitAmmount'+
                           ',p.ammount_c CreditAmmount,p.lammount CommonAmmount,p.name '+
                 ' From '+
                    'Out_Provarch p,'+
                     'Out_Account d,'+
                      'Out_Account c,'+
                       'Avalute dc,'+
                        'Avalute cc'+
                 ' Where '+
                    'p.debt = d.id and '+
                     'p.kredit = c.id and '+
                      'd.val_acc= '+str+' and '+
                       'd.val_acc = dc.valute and '+
                        'c.val_acc = cc.valute and '+
                         'p.dat =:TransactionDate '+
                 ' Order by d.bal_cn1';
      SetVariable('TransactionDate',OperationDate);
      Open;
      Preview;
     end;
   end
end;

1:begin
if CBCurrency.ItemIndex=0 then
   begin
    with control_tape_mod.ODSTransactionView ,QTransactionView do
     begin
      Close;
      SQL.Clear;
      SQL.Text :=' Select d.bal_cn2  BalanceAccount,d.acc_no Debit,d.val_acc DebitCurrency,dc.val_name DValName'+
                        ',c.acc_no Credit,c.val_acc CreditCurrency,cc.val_name CValName,p.ammount DebitAmmount'+
                           ',p.ammount_c CreditAmmount,p.lammount CommonAmmount,p.name '+
                 ' From '+
                    'Out_Provarch p,'+
                     'Out_Account d,'+
                      'Out_Account c,'+
                       'Avalute dc,'+
                        'Avalute cc'+
                 ' Where '+
                    'p.debt = d.id and '+
                     'p.kredit = c.id and '+
                      'd.val_acc = dc.valute and '+
                       'c.val_acc = cc.valute and '+
                        'p.dat =:TransactionDate '+
                 ' Order by d.bal_cn2';
      SetVariable('TransactionDate',OperationDate);
      Open;
      Preview;
     end;
   end
 else
  begin
    with control_tape_mod.ODSTransactionView ,QTransactionView do
     begin
      Close;
      SQL.Clear;
      SQL.Text :=' Select d.bal_cn2 BalanceAccount,d.acc_no Debit,d.val_acc DebitCurrency,dc.val_name DValName'+
                        ',c.acc_no Credit,c.val_acc CreditCurrency,cc.val_name CValName,p.ammount DebitAmmount'+
                           ',p.ammount_c CreditAmmount,p.lammount CommonAmmount,p.name '+
                 ' From '+
                    'Out_Provarch p,'+
                     'Out_Account d,'+
                      'Out_Account c,'+
                       'Avalute dc,'+
                        'Avalute cc'+
                 ' Where '+
                    'p.debt = d.id and '+
                     'p.kredit = c.id and '+
                      'd.val_acc= '+str+' and '+
                       'd.val_acc = dc.valute and '+
                        'c.val_acc = cc.valute and '+
                         'p.dat =:TransactionDate '+
                 ' Order by d.bal_cn2';
      SetVariable('TransactionDate',OperationDate);
      Open;
      Preview;
     end;
   end
end;
 end;
end;
initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TFrmControlTape,
    Class_FrmControlTape,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

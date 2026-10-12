unit BalanceImpl1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, Balance_TLB, StdVcl, ComCtrls, Buttons, Mask, DBCtrls,
  StdCtrls;

type
  TBalanceX = class(TActiveForm, IBalanceX)
    GroupBox4: TGroupBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label9: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    ComboBoxForm: TComboBox;
    ComboBoxPok: TComboBox;
    ComboBoxPlan: TComboBox;
    ComboBoxAvalute: TComboBox;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Edit3: TEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    BitBtnAnaliz: TBitBtn;
    BitBtnOk: TBitBtn;
    BitBtnClose: TBitBtn;
    ProgressBar1: TProgressBar;
    Button1: TButton;
    procedure ActiveFormCreate(Sender: TObject);
    procedure ComboBoxAvaluteChange(Sender: TObject);
    procedure BitBtnAnalizClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FEvents: IBalanceXEvents;
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
    procedure Initialize; override;
    procedure KursKod;
    procedure Balance;
  end;

Var
  n, b, v : Integer;
  Kn, Kk : array [0..20] of String;

implementation

uses ComObj, ComServ, sboapiDataModuleImpl, SBCore, UnDataMod, UnAnaliz,
  UnBalOborot;

{$R *.DFM}

{ TBalanceX }

procedure TBalanceX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_BalanceXPage); }
end;

procedure TBalanceX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IBalanceXEvents;
end;

procedure TBalanceX.Initialize;
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

function TBalanceX.Get_Active: WordBool;
begin
  Result := Active;
end;

function TBalanceX.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TBalanceX.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TBalanceX.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TBalanceX.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TBalanceX.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TBalanceX.Get_Cursor: Smallint;
begin
  Result := Smallint(Cursor);
end;

function TBalanceX.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TBalanceX.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TBalanceX.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TBalanceX.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TBalanceX.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TBalanceX.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TBalanceX.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TBalanceX.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TBalanceX.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TBalanceX.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TBalanceX.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TBalanceX._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TBalanceX.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TBalanceX.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TBalanceX.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TBalanceX.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TBalanceX.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TBalanceX.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TBalanceX.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TBalanceX.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TBalanceX.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TBalanceX.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TBalanceX.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TBalanceX.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TBalanceX.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TBalanceX.Set_Cursor(Value: Smallint);
begin
  Cursor := TCursor(Value);
end;

procedure TBalanceX.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TBalanceX.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TBalanceX.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TBalanceX.Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TBalanceX.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TBalanceX.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TBalanceX.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TBalanceX.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TBalanceX.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TBalanceX.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

procedure TBalanceX.KursKod;
begin
  With DataMod do
    begin
      AvaluteDataSet.Open;
      ComboBoxAvalute.Clear;
        n := 0;
          ComboBoxAvalute.Items.Add('¡ˆÚˆÌ ‚‡ÎÈÛÚ‡Î‡');
          Kk[n] := '-1';
      AvaluteDataSet.First;
        n := 1;
          While not AvaluteDataSet.EOF do
            begin
              Kn[n] := AvaluteDataSet['VALU_NAME'];
                Kk[n] := AvaluteDataSet['VALUTE'];
                  ComboBoxAvalute.Items.Add(Kn[n]);
              inc(n);
              AvaluteDataSet.Next;
            end;
      AvaluteDataSet.Close;
     end;
end;

procedure TBalanceX.Balance;
var
  d1,d2 : Tdatetime;
  UserName : String;
begin
  d1:= trunc(DateTimePicker1.DateTime);
    d2:= trunc(DateTimePicker2.DateTime);
      DataMod.opP_BALANCE.CallProcedure('GetBalance', [ComboBoxPlan.ItemIndex+1,Kk[n], ComboBoxPok.ItemIndex, d1, d2]);
        UserName:= DataMod.opP_BALANCE.CallStringFunction('GetUserName',[]);

  DataMod.BalanceDataSet.Close;
    DataMod.BalanceDataSet.SQL[1] := 'BALANCE_'+ UserName+' b';
      DataMod.BalanceDataSet.Open;
end;

procedure TBalanceX.ActiveFormCreate(Sender: TObject);
begin
  DateTimePicker1.Date := Sb_GetSystemDate;
  DateTimePicker2.Date := Sb_GetSystemDate;
  KursKod;
  ComboBoxAvalute.ItemIndex:= 0;
  ComboBoxForm.ItemIndex:= 0;
  ComboBoxPlan.ItemIndex:= 0;
  ComboBoxPok.ItemIndex:= 0;
end;

procedure TBalanceX.ComboBoxAvaluteChange(Sender: TObject);
begin
  n := ComboBoxAvalute.ItemIndex;
end;

procedure TBalanceX.BitBtnAnalizClick(Sender: TObject);
begin
  Balance;
  FormAnaliz.FormCreate(nil);
  FormAnaliz.ShowModal;
end;

procedure TBalanceX.Button1Click(Sender: TObject);
begin
  QRFormOborot.Preview;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TBalanceX,
    Class_BalanceX,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

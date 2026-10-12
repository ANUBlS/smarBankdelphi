unit AdministrationOwnerSheep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Gauges, SearchCombo,sbcore;

 const
   WM_EXCEPTIONMESSAGE = WM_USER + 400;

type


  TOwnThread=class(TThread)
  protected
   Owner,NewOwner: Integer;
   procedure ChangeOwner;
   procedure IncBar;
  public
   SomeExcept: Exception;
   procedure Execute;override;
  end;

  TFmOwnerSheep = class(TForm)
    grOwn: TGroupBox;
    Panel1: TPanel;
    btExit: TBitBtn;
    btApply: TBitBtn;
    btnAdvanced: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    SC: TSearchCombo;
    edID1: TEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    SC2: TSearchCombo;
    edID2: TEdit;
    gaProc: TGauge;
    memCaution: TMemo;
    MonTimer: TTimer;
    procedure SCChange(Sender: TObject);
    procedure SC2Change(Sender: TObject);
    procedure btApplyClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure edID1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAdvancedClick(Sender: TObject);
    procedure MonTimerTimer(Sender: TObject);
    procedure WM_USERMY(var Message: TMessage); message WM_EXCEPTIONMESSAGE;
    procedure btExitClick(Sender: TObject);
  private
    ErrorExit: Boolean;
    ErrorStr: string;
    function QueryToExit : Boolean;
  end;

var
  FmOwnerSheep: TFmOwnerSheep;
  MainTh: TOwnThread;
implementation

uses AdministrationDataModule, AdministrationOwnerSheepAdvanced;

{$R *.DFM}

procedure TFmOwnerSheep.WM_USERMY(var Message: TMessage);
begin
 raise  Exception.Create(ErrorStr);
end;

procedure TOwnThread.ChangeOwner;
begin
 with FmOwnerSheep,AdministrationData.pcADM do
  begin

   Synchronize(IncBar);
    CallBooleanFunction('changeownerincustomers',[StrToInt(edID1.Text),StrToInt(edID2.Text)]);
   Synchronize(IncBar);
    CallBooleanFunction('changeownerinAccount',[StrToInt(edID1.Text),StrToInt(edID2.Text)]);
   Synchronize(IncBar);
    CallBooleanFunction('changeownerinTransaction',[StrToInt(edID1.Text),StrToInt(edID2.Text)]);
   Synchronize(IncBar);
    CallBooleanFunction('changeownerinContracts',[StrToInt(edID1.Text),StrToInt(edID2.Text)]);
   Synchronize(IncBar);
    Sb_Commit;
   Synchronize(IncBar);
  end;
end;

procedure TOwnThread.IncBar;
begin
 with FmOwnerSheep.gaProc do
     Progress:=Progress+10;
end;

procedure TOwnThread.Execute;
begin
 try
   ChangeOwner;
  except
    on E : Exception do
     if Assigned(FmOwnerSheep) then
      begin
      FmOwnerSheep.ErrorStr:=E.Message;
      PostMessage(FmOwnerSheep.Handle,WM_EXCEPTIONMESSAGE,Integer(E),0);
      end;
  end;
end;

procedure TFmOwnerSheep.SCChange(Sender: TObject);
begin
 with AdministrationData.UsersData do
  edID1.Text:=FieldByName('USER#').AsString;
end;

procedure TFmOwnerSheep.SC2Change(Sender: TObject);
begin
 with AdministrationData.UsersData do
  edID2.Text:=FieldByName('USER#').AsString;
end;

procedure TFmOwnerSheep.btApplyClick(Sender: TObject);
begin
if (edID1.Text<>EmptyStr) and (edID2.Text<>EmptyStr) then
 try
  gaProc.Progress:=0;
 if Assigned(MainTh) then
  begin
   MainTh.Terminate;
   MainTh:=nil;
  end;
  MainTh:=TOwnThread.Create(false);
 except
  ErrorExit:=True;
  raise;
 end;
end;

procedure TFmOwnerSheep.FormDestroy(Sender: TObject);
begin
 FmOwnerSheep:=nil;
 if Assigned(MainTh) then
  begin
   MainTh.Terminate;
   MainTh:=nil;
  end;
end;

function TFmOwnerSheep.QueryToExit: Boolean;
begin
  if not(Assigned(MainTh) and (gaProc.Progress<>gaProc.MaxValue)) or ErrorExit then
   Result:=True else Result:=False;
end;

procedure TFmOwnerSheep.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if not(QueryToExit) then
 Action:=caNone;
end;

procedure TFmOwnerSheep.FormCreate(Sender: TObject);
begin
 FmOwnerSheep:=self;
 MonTimer.Enabled:=True;
 ErrorExit:=False;
end;

procedure TFmOwnerSheep.edID1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
Ref: ^TSearchCombo;
begin
if (Sender as TEdit).Text='' then Exit;
if Sender=edID1 then
 Ref:=@Sc else Ref:=@sc2;

 with Ref^,AdministrationData.UsersData do
 if Locate('USER#',StrToInt((Sender as TEdit).Text),[]) then
   ItemIndex:=Items.IndexOf(FieldByName('NAME').AsString)
 else ItemIndex:=0;
end;

procedure TFmOwnerSheep.btnAdvancedClick(Sender: TObject);
var
 fmOwnerSheepAdv: TfmAdmOwnerChangeAdvanced;
begin
 fmOwnerSheepAdv:=TfmAdmOwnerChangeAdvanced.Create(self);
  try
   fmOwnerSheepAdv.ShowModal;
  finally
   fmOwnerSheepAdv.Release;
  end;
end;

procedure TFmOwnerSheep.MonTimerTimer(Sender: TObject);
begin
 with  (Sender as TComponent) do
  begin
 Tag:=Tag+1;
 if Tag>16 then (Sender as TTimer).Enabled:=False;
  if (Tag mod 5) = 0 then memCaution.Font.Color:=clRed
  else memCaution.Font.Color:=clBlack;
  end;
end;

procedure TFmOwnerSheep.btExitClick(Sender: TObject);
begin
 if Assigned(MainTh) then
  begin
   MainTh.Terminate;
   MainTh:=nil;
  end;
   ErrorExit:=True;
end;

end.

unit AdministrationProfOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, HintBox;

type
  ECheckOptions = class(Exception);

  
  TfmProfOptions = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    hbErrorBx: THintBox;
    Label8: TLabel;
    chkLockStatus: TCheckBox;
    Label1: TLabel;
    PASSWORD_LIFE_TIME: TComboBox;
    PASSWORD_GRACE_TIME: TComboBox;
    PASSWORD_REUSE_TIME: TComboBox;
    PASSWORD_REUSE_MAX: TComboBox;
    FAILED_LOGIN_ATTEMPTS: TComboBox;
    PASSWORD_LOCK_TIME: TComboBox;
    edMinPassLength: TComboBox;
    Label7: TLabel;
    Bevel1: TBevel;
    Label9: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure LockUnlockUserExecute(Sender: TObject);
    procedure isLockedExecute(Sender: TObject);
    function  CheckObjectInfo(Sender : TObject):Boolean;
    function  CheckAllObjectsInfo():Boolean;
    procedure edMinPassLengthChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    usern : String;
    function  Get_UserName() : String;
    function  CheckUser() : Boolean;
    procedure DisableControls();
    procedure EnableControls();
    procedure readParams;
    procedure saveParams();
    function GetUsern : String;
    procedure SetUsern(Value : String);
  public
    procedure Execute();
    { Public declarations }
  published
     property userName: String read GetUsern write SetUsern;
  end;

var
  fmProfOptions: TfmProfOptions;

implementation

uses AdministrationDataModule;

{$R *.DFM}

function TfmProfOptions.GetUsern : String;
begin
  Result := usern;
end;

procedure TfmProfOptions.SetUsern(Value : String);
begin
  usern := value;
end;

function TfmProfOptions.Get_UserName() : String;
begin
  Result := '';
  with AdministrationData.pcADM do
    Result := CallStringFunction('getusername', []);
end;

procedure TfmProfOptions.DisableControls();
  var i : Integer;
begin
  with GroupBox1 do
    for i:=0  to ControlCount-1  do
      if (Controls[i] is TComboBox) then
      begin
         (Controls[i] as TComboBox).Enabled := False;
         (Controls[i] as TComboBox).Color := clBtnFace;
      end;
end;

procedure TfmProfOptions.EnableControls();
  var i : Integer;
begin
  with GroupBox1 do
    for i:=0  to ControlCount-1  do
      if Controls[i] is TComboBox then
      begin
         (Controls[i] as TComboBox).Enabled := True;
         (Controls[i] as TComboBox).Color := clWindow;
      end;
end;

function TfmProfOptions.CheckUser() : Boolean;
begin
  Result := false;
  with AdministrationData do
  if pcAca.CallBooleanFunction('isadm',[UpperCase(get_UserName)]) then Result := true;
end;

procedure TfmProfOptions.readParams();
  var i : Integer;
begin
  with GroupBox1  do
  for i:=0  to ControlCount-1  do
  if (Controls[i] is TComboBox)  then
    try
     with AdministrationData.pcADM  do
       (Controls[i] as TComboBox).Text := CallStringFunction('getprofilevalues', [usern, (Controls[i] as TComboBox).name]);
    except  
        on E:Exception do ShowMessage(E.Message);
      //ShowMessage(usern+'  '+(Controls[i]).name);
    end;
end;

procedure TfmProfOptions.saveParams();
  var i : Integer;
begin
  with GroupBox1 do
  for i:=0  to ControlCount-1  do
  if Controls[i] is TComboBox then
     with AdministrationData.pcADM  do
      try
       if not CallBooleanFunction('setprofilevalues',
                [usern, (Controls[i] as TComboBox).name, (Controls[i] as TComboBox).Text]) then
       raise ECheckOptions.Create((Controls[i] as TComboBox).Name);

      except
        on E:ECheckOptions do hbErrorBx.ShowMessage(E.Message);
      end;

end;

function CheckNumber(val : String) : Boolean;
var i : integer;
begin
 result := true;
  for i:=1 to Length(val) do
   if not (val[i] in ['0'..'9', '.']) then
   begin
     result := false;
     break;
   end;
end;

function TfmProfOptions.CheckObjectInfo(Sender : TObject):Boolean;
var value : String;
begin
  result := false;
  if (Sender is TComboBox) then
  begin
     value := (Sender as TComboBox).Text;
     if value = '' then exit;
     if (value = 'UNLIMITED') or (CheckNumber(value)) then
         result := true;
  end;
end;

function TfmProfOptions.CheckAllObjectsInfo():Boolean;
  var i : Integer;
begin
  result := true;
  with GroupBox1 do
  for i:=0  to ControlCount-1  do
  if Controls[i] is TComboBox then
     with AdministrationData.pcADM  do
      try
       if not CheckObjectInfo((Controls[i] as TComboBox)) then
       raise ECheckOptions.Create((Controls[i] as TComboBox).Name);

      except
        on E:ECheckOptions do
         begin
           hbErrorBx.ShowMessage(E.Message);
           hbErrorBx.Visible := true;
           result := false;
         end;  
      end;
end;

procedure TfmProfOptions.BitBtn1Click(Sender: TObject);
begin
  if not CheckUser() then Close;
  if not CheckAllObjectsInfo() then  ModalResult := mrNone;
  Screen.Cursor := crHourGlass;
  try
    DisableControls();
    saveParams();
  finally
    Screen.Cursor := crDefault;
    EnableControls();
  end;
  Close;
end;

procedure TfmProfOptions.Execute();
begin
  fmProfOptions:=self;
  if not CheckUser() then
  begin
    DisableControls();
    exit;
  end;
  readParams();
  isLockedExecute(Self);
end;

procedure TfmProfOptions.LockUnlockUserExecute(Sender: TObject);
begin
 try
  screen.Cursor := crHourGlass;
  with AdministrationData.pcADM do
    CallProcedure('lockunlockuser',[usern, chkLockStatus.Checked]);
 finally
  isLockedExecute(Sender);
  screen.Cursor := crDefault;
  BitBtn1.Enabled := True
 end;
end;

procedure TfmProfOptions.isLockedExecute(Sender: TObject);
begin
  with AdministrationData.pcADM do
   chkLockStatus.Checked := CallBooleanFunction('islocked',[usern]);
end;

procedure TfmProfOptions.edMinPassLengthChange(Sender: TObject);
begin
   BitBtn1.Enabled := True
end;

procedure TfmProfOptions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if hbErrorBx.Visible then Action := caNone
end;

end.


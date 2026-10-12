unit administrationUsersRefresh;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, CheckLst, ComCtrls, Gauges;

const
  WM_EXCEPTIONSMESSAGE = WM_USER + 401;

type
  TRefreshThread = class(TThread)
  private
    procedure CreateSynonyms(ObType, Sowner, Suser: string);
    procedure DropSynonyms(Sowner, Suser: string);
    procedure IncrementStep;
    procedure Snd;
    procedure EndExecuting;
  public
    procedure RefreshSynonyms;
    procedure Execute; override;
  end;

  TfmUsersRefresh = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btApply: TBitBtn;
    btExit: TBitBtn;
    GroupBox1: TGroupBox;
    gbDatabaseObjects: TGroupBox;
    cbTables: TCheckBox;
    cbViews: TCheckBox;
    cbPackages: TCheckBox;
    cbProcedures: TCheckBox;
    cbFunctions: TCheckBox;
    cbSynonyms: TCheckBox;
    cbAll: TCheckBox;
    btMainBar: TGauge;
    rgRules: TRadioGroup;
    Ok: TBitBtn;
    PB1: TProgressBar;
    GroupBox2: TGroupBox;
    clbUsers: TCheckListBox;
    procedure cbAllClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btApplyClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure rgRulesClick(Sender: TObject);
    procedure OkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    ErrorStr: string;
    procedure WM_EXCEPTIONMESSAGE(var Message: TMessage);
      message WM_EXCEPTIONSMESSAGE;
  end;

const
  Inc_Step = 10;
  Oper_count = 7;

var
  fmUsersRefresh: TfmUsersRefresh;
  CanClose: Boolean = True;
  Ref: TRefreshThread;

implementation

uses AdministrationDataModule;

{$R *.DFM}

procedure TRefreshThread.Execute;
begin
  try
    RefreshSynonyms;
    Synchronize(EndExecuting);
  except
    on E: Exception do
    begin
      if Assigned(fmUsersRefresh) then
        with fmUsersRefresh do
        begin
          ErrorStr := E.Message;
          PostMessage(fmUsersRefresh.Handle, WM_EXCEPTIONSMESSAGE,
            Integer(E), 0);
        end;
    end;
  end;
end;

procedure TRefreshThread.CreateSynonyms(ObType, Sowner, Suser: string);
begin
  with AdministrationData.pcADM do
    CallProcedure('create_synonyms', [ObType, Sowner, Suser, True]);
end;

procedure TRefreshThread.DropSynonyms(Sowner, Suser: string);
begin
  with AdministrationData.pcADM do
    CallProcedure('DropAllSynonims', [Sowner, Suser]);
end;

procedure TRefreshThread.IncrementStep;
begin
  if Assigned(fmUsersRefresh) then
    with fmUsersRefresh do
      btMainBar.Progress := btMainBar.Progress + Inc_Step;
end;

procedure TRefreshThread.EndExecuting;
begin
  with fmUsersRefresh do
    btApply.Enabled := True;
end;

procedure TRefreshThread.Snd;
begin
  Synchronize(IncrementStep);
end;

procedure TRefreshThread.RefreshSynonyms;

  function GetCount: Integer;
  var
    z: Integer;
  begin
    Result := 0;
    with fmUsersRefresh.clbUsers do
      if Enabled then
      begin
        for z := 0 to Items.Count - 1 do
          if Checked[z] then
            Inc(Result);
      end
      else
        Result := Items.Count - 1;
  end;

var
  i: Integer;
begin
  with fmUsersRefresh do // ,fmUsersRefresh.clbUsers
  begin
    btMainBar.MaxValue := GetCount * Oper_count * 10;
    // for i:=0 to Items.Count-1 do
    // begin
    // if (Checked[i] or not(Enabled)) and (not(Items[i]=Sm_Own)) then
    // begin
    { if rgRules.ItemIndex=1 then
      DropSynonyms(Sm_Own,Items[i]);
      Snd; }
    if cbTables.Checked then
      CreateSynonyms('TABLE', Sm_Own, ''); // Items[i]
    Snd;
    if cbViews.Checked then
      CreateSynonyms('VIEW', Sm_Own, '');
    Snd;
    if cbPackages.Checked then
      CreateSynonyms('PACKAGE', Sm_Own, '');
    Snd;
    if cbProcedures.Checked then
      CreateSynonyms('PROCEDURE', Sm_Own, '');
    Snd;
    if cbFunctions.Checked then
      CreateSynonyms('FUNCTION', Sm_Own, '');
    Snd;
    if cbSynonyms.Checked then
      CreateSynonyms('SYNONYM', Sm_Own, '');
    Snd;
    // end;
    // end;
  end;
end;

procedure TfmUsersRefresh.cbAllClick(Sender: TObject);
begin
  clbUsers.Enabled := not(cbAll.Checked);
end;

procedure TfmUsersRefresh.WM_EXCEPTIONMESSAGE(var Message: TMessage);
begin
  raise Exception.Create(ErrorStr);
end;

procedure TfmUsersRefresh.FormCreate(Sender: TObject);

  function GetOwnerDatats: Integer;
  begin
    with AdministrationData.pcADM do
      try
        Result := CallIntegerFunction('getusertablespaceid', [Sm_Own]);
      except
        Result := -1;
      end
  end;

var
  OwnerTS,i: Integer;
begin
  fmUsersRefresh := self;
  clbUsers.Items.Clear;
  OwnerTS := GetOwnerDatats;

  with AdministrationData.UsersData do
  begin
    First;
    while not(EOF) do
    begin
      with clbUsers do
      begin
        if (FieldByName('DATATS#').AsInteger = OwnerTS) or (OwnerTS = -1) then
        begin
          Items.Add(FieldByName('NAME').AsString);
          if FieldByName('NAME').AsString = Sm_Own then
            ItemEnabled[Items.Count - 1] := False;
        end;
      end;
      Next;
    end;
  end;

         with  fmUsersRefresh, fmUsersRefresh.clbUsers, AdministrationData do begin
       for i := 0 to fmUsersRefresh.clbUsers.Items.Count-1 do begin
       clbUsers.Items.Strings[i];
       checksynonyms.close;
       checksynonyms.SetVariable('USRNM',clbUsers.Items.Strings[i]);
       checksynonyms.open;

          if checksynonyms.RecordCount>0 then
           clbUsers.Checked[i]:=true
           else
           clbUsers.Checked[i]:=false;
                                                              end;
                                                                              end;
end;

procedure TfmUsersRefresh.btApplyClick(Sender: TObject);
begin
  btApply.Enabled := False;
  btMainBar.Progress := 0;
  Ref := TRefreshThread.Create(True);
  try
    Ref.Priority := tpLowest;
    Ref.Resume;
    CanClose := False
  except
    Ref.Terminate;
  end;
end;

procedure TfmUsersRefresh.FormActivate(Sender: TObject);
var
i : integer;
begin

   with  fmUsersRefresh, fmUsersRefresh.clbUsers, AdministrationData do begin
       for i := 0 to fmUsersRefresh.clbUsers.Items.Count-1 do begin
       clbUsers.Items.Strings[i];
       checksynonyms.close;
       checksynonyms.SetVariable('USRNM',clbUsers.Items.Strings[i]);
       checksynonyms.open;
          if checksynonyms.RecordCount>0 then
           clbUsers.Checked[i]:=true
           else
           clbUsers.Checked[i]:=false;
       end;
   end;
end;

procedure TfmUsersRefresh.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not(CanClose) then
    CanClose := btApply.Enabled;
  if CanClose then
  begin
    if Assigned(Ref) then
      Ref.Terminate;
    Action := caFree;
  end
  else
    Action := caNone;
end;

procedure TfmUsersRefresh.FormDestroy(Sender: TObject);
begin
  fmUsersRefresh := nil;
end;

procedure TfmUsersRefresh.OkClick(Sender: TObject);
var
i : integer;
sowner: string;
begin

sowner:='SMART';
    with fmUsersRefresh, fmUsersRefresh.clbUsers, AdministrationData do begin
         for i := 0 to fmUsersRefresh.clbUsers.Items.Count-1 do begin
         pcADM.CallProcedure('branchgrant',[clbUsers.Items.Strings[i],sowner,clbUsers.Checked[i]]);
         end;
    end;

  if rgRules.ItemIndex=1 then
       begin
                    with AdministrationData.pcADM do
                    CallProcedure('DropAllSynonims', ['', '']);
       end;

  with fmUsersRefresh do // ,fmUsersRefresh.clbUsers
       begin
                    PB1.Position:=10;
                      if cbTables.Checked then
                        Ref.CreateSynonyms('TABLE', Sm_Own, '');
                    PB1.Position:=30;
                      if cbViews.Checked then
                        Ref.CreateSynonyms('VIEW', Sm_Own, '');
                    PB1.Position:=60;
                      if cbPackages.Checked then
                        Ref.CreateSynonyms('PACKAGE', Sm_Own, '');
                    PB1.Position:=70;
                      if cbProcedures.Checked then
                        Ref.CreateSynonyms('PROCEDURE', Sm_Own, '');
                    PB1.Position:=80;
                      if cbFunctions.Checked then
                        Ref.CreateSynonyms('FUNCTION', Sm_Own, '');
                    PB1.Position:=90;
                      if cbSynonyms.Checked then
                       Ref.CreateSynonyms('SYNONYM', Sm_Own, '');
                    PB1.Position:=100;
        end;
end;

procedure TfmUsersRefresh.rgRulesClick(Sender: TObject);
var
  i: Integer;
begin
  with gbDatabaseObjects do
    for i := 0 to ControlCount - 1 do
      if (Controls[i] is TCheckBox) then
        TCheckBox(Controls[i]).Checked := TRadioGroup(Sender).ItemIndex = 1;
end;

end.

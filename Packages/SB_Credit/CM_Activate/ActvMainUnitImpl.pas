unit ActvMainUnitImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Mask, DBCtrls, ExtCtrls, ActnList;

type
  TMainForm = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    StatusPanel: TPanel;
    ButtonAccept: TButton;
    ButtonClose: TButton;
    CbOblication: TCheckBox;
    CbPledgPrice: TCheckBox;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtonAcceptClick(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ShowActivationForm;
    { Public declarations }
  end;

var
  MainForm: TMainForm;

procedure InitPlugin (S: String); export;
   
implementation

uses ActvDataModuleImpl, CommonDecls, sbsystem;

{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  ActvDataMod := TActvDataMod.Create(Self);
  ActiveControl := ButtonAccept;

end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  ActvDataMod.Free
end;

procedure TMainForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_ESCAPE then
  begin
    Close;
    Key := #0;
  end;
end;

procedure TMainForm.ShowActivationForm;
resourcestring
  rsCaption = '%s №-Li kreditin ödəlik və girovunu B.K. Otuzdurulması.';
  rsAlreadyActive = 'Kreditin girov və öhtəliyi  %s tarixində Б.К. otuzdurulub.';
  rsNotActivatedYet = 'Kreditin girov və öhdəliyi B.K.  otuzdurulmayıb!';
var
  CreditID : Integer;
  CreditNo : String;
begin
  CreditID := Get_SelectedCrdID;
  CreditNo := Get_SelectedCrdNo;
  Caption := Format(rsCaption,[CreditNo]);

  with ActvDataMod do
  begin

    with CreditInfo do
    begin
      ClearVariables;
      SetVariable('ID',CreditID);
      Open;
    end;

    with ActvInfo do
    begin
      ClearVariables;
      SetVariable('CreditID',CreditID);
      Open;
      if RecordCount > 0 then
      begin
        StatusPanel.Font.Color := clNavy;
        StatusPanel.Caption := Format(rsAlreadyActive,[FieldByName('ACTVDATE').AsString]);
       Button1.Enabled:=true;
      end else
      begin
        StatusPanel.Font.Color := clRed;
        StatusPanel.Caption := rsNotActivatedYet;
         Button1.Enabled:=false;
      end;
    end;

  end; // with Data Mod

  ShowModal;
  
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with ActvDataMod do
  begin
    ActvInfo.CloseAll;
    CreditInfo.CloseAll;
  end;
end;

procedure TMainForm.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.ButtonAcceptClick(Sender: TObject);
resourcestring
  rsTrFormCaption = 'B.K. - a öhtəlik və girovun otuzdurulması.';
  rsConfirmOpAll = 'Kreditin girov və öhdəliyi B.K. otuzdurulacaq  . Əminsiniz?';
  rsConfirmOpPledg = 'Kreditin girovu B.K. oturacaq . Əminsiniz?';
  rsConfirmOpObl = 'Kreditin öhdəliyi B.K.  oturacaq . Əminsiniz?';
  rsbk ='B.K. - a öhdəlik tam olaraq azaldılacaq  . Əminsiniz?'   ;
var
  Date : TDateTime;
  DefOperation ,
  CreditID : Integer;
  CommitOperation :Boolean;
  MsgDlg :String;
  ab  : Integer;
begin
  ab := 100;

  if CbOblication.Checked then begin
     DefOperation := 2;
     MsgDlg := rsConfirmOpObl;
  end;

  if CbPledgPrice.Checked then begin
     DefOperation := 1;
     MsgDlg := rsConfirmOpPledg;
  end;

  if CbOblication.Checked and
     CbPledgPrice.Checked then  begin
     DefOperation := 0;
     MsgDlg := rsConfirmOpAll;
  end;

  if MessageDlg(
       MsgDlg,
       mtConfirmation,
       [mbYes,mbNo],
       0) <> mrYes
  then       Exit;

  CreditID := Get_SelectedCrdID;
  Date := Integer(Trunc(Get_CurrentDate));
    try

   with ActvDataMod.ActivationPckg do
   begin

    CallProcedure('ActivateCredit',[
         'p_CreditID', CreditID,
         'p_Date', Date ,
         'p_Activate',DefOperation ,'p_ab',ab
        ]);


    CommitOperation := TrDelayed_Show(Self,rsTrFormCaption);
      Update;

      CallProcedure('CommitActivation',[
           'DoCommit', CommitOperation
          ]);

     if CommitOperation then
        Self.ModalResult := mrOk;
        Self.Update;
    end;
  except
   with ActvDataMod.ActivationPckg do
     CallProcedure('CommitActivation',[
         'DoCommit', False
        ]);

    raise;

  end;
end;

procedure InitPlugin (S: String); export;
begin
  MainForm.ShowActivationForm;
end;

exports
  InitPlugin;

procedure TMainForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False
end;


procedure TMainForm.Button1Click(Sender: TObject);
resourcestring
  rsTrFormCaption = 'B.K. - a öhtəlik və girovun otuzdurulması.';
  rsConfirmOpAll = 'Kreditin öhdalik və girovu B.K. azaldılacaq . Əminsiniz?';
  rsConfirmOpPledg = 'Kreditin girovu B.K. azaldılacaq . Əminsiniz?';
  rsConfirmOpObl = 'Kreditin öhtəliyi B.K. azaldılacaq . Əminsiniz?';
 var
  Date : TDateTime;
  DefOperation ,
  CreditID : Integer;
  CommitOperation :Boolean;
  MsgDlg :String;
  ab  : Integer;
begin
  ab := 3;

  if CbOblication.Checked then begin
     DefOperation := 2;
     MsgDlg := rsConfirmOpObl;
  end;

  if CbPledgPrice.Checked then begin
     DefOperation := 1;
     MsgDlg := rsConfirmOpPledg;
  end;

  if CbOblication.Checked and
     CbPledgPrice.Checked then  begin
     DefOperation := 0;
     MsgDlg := rsConfirmOpAll;
  end;

  if MessageDlg(
       MsgDlg,
       mtConfirmation,
       [mbYes,mbNo],
       0) <> mrYes
  then       Exit;

  CreditID := Get_SelectedCrdID;
  Date := Integer(Trunc(Get_CurrentDate));
    try

   with ActvDataMod.ActivationPckg do
   begin

    CallProcedure('ActivateCredit',[
         'p_CreditID', CreditID,
         'p_Date', Date ,
         'p_Activate',DefOperation ,'p_ab',ab
        ]);


    CommitOperation := TrDelayed_Show(Self,rsTrFormCaption);
      Update;

      CallProcedure('CommitActivation',[
           'DoCommit', CommitOperation
          ]);

     if CommitOperation then
       Self.ModalResult := mrOk;
       Self.Update;
    end;
  except
   with ActvDataMod.ActivationPckg do
    CallProcedure('CommitActivation',[
         'DoCommit', False
        ]);

    raise;

  end;


end;

initialization
  MainForm := TMainForm.Create(CommonApplication);

end.

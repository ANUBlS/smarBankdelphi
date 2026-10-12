unit AcceptTransUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls;

type
  TFormAcceptTransaction = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    GroupBox1: TGroupBox;
    Edit_Referens: TEdit;
    SpeedButton3: TSpeedButton;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Edit_ReferensKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAcceptTransaction: TFormAcceptTransaction;

implementation

uses Data_Unit, LVPCSSImpl,sboapiDataModuleImpl, SBTranslateProc;

{$R *.DFM}

procedure TFormAcceptTransaction.SpeedButton1Click(Sender: TObject);
begin
 Screen.Cursor := crSQLWait;
 try
  if CheckBox2.Checked then
  begin
    if Edit_Referens.Text = DataMod.XS_BATCHS.fieldbyname('TRANS_REF').AsString then
    begin
      MessageDlg('New Reference must be different of current reference !', mtWarning,[mbOk], 0);
      Exit;
    end;
    if Trim(Edit_Referens.Text) = EmptyStr then
    begin
      MessageDlg('Please enter Reference !', mtWarning,[mbOk], 0);
      Exit;
    end;
    DataMod.PackTemp.CallProcedure('UpdateBatchReference',
                                    [DataMod.XS_BATCHS.fieldbyname('ID').ASinteger,
                                     Edit_referens.Text]);
  end;
  if not CheckBox1.Checked then
  begin
     DataMod.PackTemp.CallIntegerFunction('xs_Batchs_ChangeStatus',
                                          [DataMod.XS_BATCHS.fieldbyname('ID').ASinteger,
                                           1]);
     DataMod.XS_BATCHS.RefreshRecord;
  end
  else
   begin
     with LVPCSSform do
      AcceptTransForCreated := True;
   end;
  finally
   Screen.Cursor := crDefault;
  end;
  close;
end;

procedure TFormAcceptTransaction.SpeedButton2Click(Sender: TObject);
begin
  with LVPCSSform do
   AcceptTransForCreated := False;
  close;
end;

procedure TFormAcceptTransaction.SpeedButton3Click(Sender: TObject);
begin
    {NEW REF NUMBER}
    Edit_Referens.text := DataMod.GetReference.
                          CallStringfunction('GetNewBatchRefrence',[0]);
end;

procedure TFormAcceptTransaction.CheckBox2Click(Sender: TObject);
begin
  GroupBox1.Enabled := TCheckBox(Sender).Checked;
end;

procedure TFormAcceptTransaction.Edit_ReferensKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['a'..'z', 'A'..'Z', '0'..'9',#8]) then
     key := #0; 
end;

procedure TFormAcceptTransaction.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

end.

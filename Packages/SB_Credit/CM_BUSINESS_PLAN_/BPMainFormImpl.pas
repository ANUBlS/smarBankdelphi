unit BPMainFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NLSLocalizer, StdCtrls, ExtCtrls, Mask, DBCtrls, DBCtrlsEh, ActnList,
  DBLookupEh;

type
  TBPMainForm = class(TForm)
    Localizer: TNLSLocalizer;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    DBEdit1: TDBEdit;
    GroupBox3: TGroupBox;
    EditCrdNo: TEdit;
    Label1: TLabel;
    DBNumberEditEh1: TDBNumberEditEh;
    Label2: TLabel;
    DBNumberEditEh2: TDBNumberEditEh;
    Label3: TLabel;
    DBNumberEditEh3: TDBNumberEditEh;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    Label13: TLabel;
    DBEdit8: TDBEdit;
    GroupBox5: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit15: TDBEdit;
    Button1: TButton;
    Button2: TButton;
    ActionsList: TActionList;
    ActionSave: TAction;
    ActionDismis: TAction;
    DBEdit13: TDBEdit;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActionSaveUpdate(Sender: TObject);
    procedure ActionSaveExecute(Sender: TObject);
    procedure ActionDismisExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboboxEh1KeyValueChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BPMainForm: TBPMainForm;

procedure InitPlugin(S : String);export;

implementation

{$R *.DFM}

uses
  CommonDecls, SystemState, BPDataModuleImpl, LegalMeasuresImpl;

procedure TBPMainForm.FormCreate(Sender: TObject);
begin
  BPDataModule := TBPDataModule.Create(Self);
end;

procedure TBPMainForm.FormDestroy(Sender: TObject);
begin
  BPDataModule.Free;
end;

procedure InitPlugin(S : String);export;
begin
  if S='BP' then
  BPMainForm.ShowModal
  else
  if S='LM' then
   LMMainForm.ShowModal;
end;

procedure TBPMainForm.ActionSaveUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := BPDataModule.BPData.Modified;
end;

procedure TBPMainForm.ActionSaveExecute(Sender: TObject);
begin
  with BPDataModule.BPData do
  Post;
  Close;
end;

procedure TBPMainForm.ActionDismisExecute(Sender: TObject);
begin
  with BPDataModule.BPData do
  Cancel;
  Close;
end;

procedure TBPMainForm.FormShow(Sender: TObject);
resourcestring
  rsFormCaption = '%s номряли кредит цчцн Бизес - План'; 
begin
  Localizer.Caption := Format(rsFormCaption,[Get_SelectedCrdNo]);
  EditCrdNo.Text := Get_SelectedCrdNo;
  with BPDataModule do
  begin
  
    with CreditInfo do
    begin
      if Active then CloseAll;
      ClearVariables;
      SetVariable('CreditID',Get_SelectedCrdID);
      Open;
    end;

    with BPData do
    begin
      if Active then CloseAll;
      ClearVariables;
      SetVariable('CreditID',Get_SelectedCrdID);
      Open;
      Edit;
      if FieldByName('CreditID').IsNull then
        FieldByName('CreditID').AsInteger := Get_SelectedCrdID;
    end;
    
  end;
end;

exports
  InitPlugin;

procedure TBPMainForm.DBLookupComboboxEh1KeyValueChanged(Sender: TObject);
begin
 with (Sender as TDBLookupComboboxEh) do
 if DataSource.DataSet.Active then 
 UpdateData;
end;

procedure TBPMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with BPDataModule do
  begin
    BPData.CloseAll;
    CreditInfo.CloseAll;
  end;
end;

initialization
BPMainForm := TBPMainForm.Create(CommonApplication);
LMMainForm := TLMMainForm.Create(CommonApplication);

end.

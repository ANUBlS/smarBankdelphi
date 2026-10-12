unit AddAccountUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TFrmAddAccount = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    Button1: TButton;
    Button2: TButton;
    procedure ComboBox1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAddAccount: TFrmAddAccount;

implementation

uses ExcangeDataModule, UntExchangeImpl, sboapiDataModuleImpl, SBTranslateProc;

{$R *.DFM}

procedure TFrmAddAccount.ComboBox1Click(Sender: TObject);

begin
  ComboBox2.Items.Clear;
  with ExchangeDataMod.ExAccount do
  begin
    Active := false;
    SetVariable('cod', FrmExchange.Rate[ComboBox1.ItemIndex]);
    Open;
    First;
    while not EOF do
    begin
      ComboBox2.Items.Add(FieldByName('acc_no').AsString);
      Next;
    end;
  end;
end;

procedure TFrmAddAccount.BitBtn1Click(Sender: TObject);
begin
  if FrmExchange.i = 3 then
  begin
    TRY
      with ExchangeDataMod.TakeAccountID do
      begin
        Active := false;
        SetVariable('acc_cod', ComboBox2.Text);
        Open;
      end;
      with ExchangeDataMod do
      begin
        OPacExchange.CallProcedure('add_excaccount',
          [ViewGrid.FieldByName('ID').AsInteger, TakeAccountID.FieldByName('ID')
          .AsInteger]);
        Grid2.Refresh;
      end;
    EXCEPT
      ShowMessage('The accounts are repeating!' + #13 +
        'One of the sectores is free!');
      Abort;
    end;
  end
  else if FrmExchange.i = 4 then
  begin
    TRY
      with ExchangeDataMod.TakeAccountID do
      begin
        Active := false;
        SetVariable('acc_cod', ComboBox2.Text);
        Open;
      end;
      with ExchangeDataMod do
      begin
        OPacExchange.CallProcedure('upd_excaccount',
          [ViewGrid.FieldByName('ID').AsInteger, TakeAccountID.FieldByName('ID')
          .AsInteger, Grid2.FieldByName('accountID').AsInteger]);
        Grid2.Refresh;
      end;
    EXCEPT
      ShowMessage('The accounts are repeating!' + #13 +
        'One of the sectores is free!');
      Abort;
    end;
  end;
  Close;
end;

procedure TFrmAddAccount.FormCreate(Sender: TObject);
begin
  SBTranslateProc.TranslateAllCompForms(Self, sboapiDataModule.OrPack_SL);
end;

procedure TFrmAddAccount.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
    Close;
end;

procedure TFrmAddAccount.Button2Click(Sender: TObject);
begin
  if FrmExchange.i = 3 then
  begin
    TRY
      with ExchangeDataMod.TakeAccountID do
      begin
        Active := false;
        SetVariable('acc_cod', ComboBox2.Text);
        Open;
      end;
      with ExchangeDataMod do
      begin
        OPacExchange.CallProcedure('add_excaccount',
          [ViewGrid.FieldByName('ID').AsInteger, TakeAccountID.FieldByName('ID')
          .AsInteger]);
        Grid2.Refresh;
      end;
    EXCEPT
      ShowMessage('The accounts are repeating!' + #13 +
        'One of the sectoes is free!');
      Abort;
    end;
  end
  else if FrmExchange.i = 4 then
  begin
    TRY
      with ExchangeDataMod.TakeAccountID do
      begin
        Active := false;
        SetVariable('acc_cod', ComboBox2.Text);
        Open;
      end;
      with ExchangeDataMod do
      begin
        OPacExchange.CallProcedure('upd_excaccount',
          [ViewGrid.FieldByName('ID').AsInteger, TakeAccountID.FieldByName('ID')
          .AsInteger, Grid2.FieldByName('accountID').AsInteger]);
        Grid2.Refresh;
      end;
    EXCEPT
      ShowMessage('The accounts are repeating!' + #13 +
        'One of the sectores is free!');
      Abort;
    end;
  end;
  Close;
end;

procedure TFrmAddAccount.Button1Click(Sender: TObject);
begin
  Close;
end;

end.

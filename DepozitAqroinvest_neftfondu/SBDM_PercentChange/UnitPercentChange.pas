unit UnitPercentChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CMCurrencyEdit, StdCtrls, ExtCtrls,OracleData, Oracle, DB;

type
  TFormPercentChange = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    CMCurrencyEdit1: TCMCurrencyEdit;
    OracleDataSet1: TOracleDataSet;
    OraclePackage1: TOraclePackage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    CanRefReshDeposit :Boolean;
  end;

var
  FormPercentChange: TFormPercentChange;
  procedure exportproc(S :String);export;

implementation

{$R *.dfm}

uses sboapiDataModuleImpl,CommonDeclsImpl;

procedure exportproc(S :String);export;
var ContractID,
    CustAccID,CustID:Integer;

begin
  ContractID := Get_SelectedContID;
  with FormPercentChange do
  begin
    OracleDataSet1.Close;
    OracleDataSet1.SetVariable('contid',ContractID);
    OracleDataSet1.Open;
    Edit1.Clear;
    CMCurrencyEdit1.Clear;
    CMCurrencyEdit1.Text:='0.00';
    Edit1.Text:=OracleDataSet1.FieldByName('contractno').AsString;
  end;

  FormPercentChange.ShowModal;
end;

exports
  exportproc;


procedure TFormPercentChange.Button1Click(Sender: TObject);
var
  s:Real;
begin
   if MessageDlg('Faizin dəyişdirilməsinə əminsiniz?',
             mtConfirmation, [mbYes, mbNo], 0) = mrNo
    then Exit;
  s:=CMCurrencyEdit1.Value;
  OraclePackage1.CallProcedure('UpdatePercentTranches',['v_id#',    Get_SelectedContID,
                                                        'v_id',     0,
                                                        'v_percent',s]);
  close;
end;

procedure TFormPercentChange.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormPercentChange.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if not(CanRefReshDeposit) then
      RefreshWithSavely(True);
   OracleDataSet1.CloseAll;
end;

initialization
   FormPercentChange := TFormPercentChange.Create(CommonApplication);

end.

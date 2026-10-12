unit UnitNewDepositsContractReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, OracleData, NLSLocalizer, XFSCtrls;

type
  TNewDepositsFrmContractReport = class(TForm)
    ODSDepozitWithDraw: TOracleDataSet;
    ODSDepozitMoney: TOracleDataSet;
    ODSContarcts: TOracleDataSet;
    XFLabel1: TXFLabel;
    XFGroupBox1: TXFGroupBox;
    XFRadioButton1: TXFRadioButton;
    XFRadioButton2: TXFRadioButton;
    XFButton1: TXFButton;
    XFButton2: TXFButton;
    procedure FormDestroy(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure XFButton1Click(Sender: TObject);
    procedure XFButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
  FContractID:Longint;
    RefreshAfterClose :Boolean;
    { Public declarations }
  end;

var
  NewDepositsFrmContractReport: TNewDepositsFrmContractReport;

  procedure exportproc(S :String);export;

implementation

uses SBTranslateProc,sboapiDataModuleImpl, UnitNewDepositsDepozitMoneyReport,
  UnitNewDepositsWithDrawReoprt,CommonDeclsImpl;
{$R *.DFM}


procedure exportproc(S :String);export;
begin
   NewDepositsFrmContractReport.ShowModal;
end;

exports
   exportproc;

procedure TNewDepositsFrmContractReport.FormDestroy(Sender: TObject);
begin
ODSDepozitMoney.close;
ODSDepozitWithDraw.close;
end;

  procedure TNewDepositsFrmContractReport.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False;
end;

procedure TNewDepositsFrmContractReport.FormCreate(Sender: TObject);
begin
  SBTranslateProc.TranslateAllCompForms(self,sboapiDataModule.OrPack_SL);
end;

procedure TNewDepositsFrmContractReport.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if ord(Key) = VK_ESCAPE then close; 
end;

procedure TNewDepositsFrmContractReport.XFButton1Click(Sender: TObject);
var ContractID:Integer;
begin
ContractID:= Get_SelectedContID;
      with ODSContarcts do
       begin
          if Active then CloseAll;
          SetVariable('CONTID',ContractID);
          Open;
       end;
if XFRadioButton1.Checked=True then
begin
     with ODSDepozitMoney do
       begin
          if Active then CloseAll;
          SetVariable('CONTID',ContractID);
          Open;
       end;
NewDepositsFrmDepozitMoneyReport :=TNewDepositsFrmDepozitMoneyReport.Create(Self);
NewDepositsFrmDepozitMoneyReport.QRPDepozitMoney.Preview;
end
else
begin
     with ODSDepozitWithDraw do
       begin
          if Active then CloseAll;
          SetVariable('CONTID',ContractID);
          Open;
       end;
NewDepositsFrmWithDrawReoprt :=TNewDepositsFrmWithDrawReoprt.Create(Self);
NewDepositsFrmWithDrawReoprt.QRPWithDraw.Preview;
end;

end;

procedure TNewDepositsFrmContractReport.XFButton2Click(Sender: TObject);
begin
close;
end;

initialization
      NewDepositsFrmContractReport := TNewDepositsFrmContractReport.Create(CommonApplication);

end.

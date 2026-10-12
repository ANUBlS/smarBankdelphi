unit UnitContractReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, OracleData;

type
  TfrmContractReport = class(TForm)
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    ODSDepozitWithDraw: TOracleDataSet;
    ODSDepozitMoney: TOracleDataSet;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    ODSContarcts: TOracleDataSet;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
  FContractID:Longint;
    RefreshAfterClose :Boolean;
    { Public declarations }
  end;

var
  frmContractReport: TfrmContractReport;

 // procedure InitPlugin;export;

implementation

uses sboapiDataModuleImpl,DepositDataModuleUnit, UnitDepozitMoneyReport,
  UnitWithDrawReoprt,CommonDeclsImpl;
{$R *.DFM}

procedure TfrmContractReport.FormCreate(Sender: TObject);
//var ContractID:Integer;
begin
 {ContractID:=DepositDataModule.Deposits.FieldByName('ID').AsInteger;
      with ODSDepozitMoney do
       begin
          if Active then CloseAll;
          SetVariable('CONTID',ContractID);
          Open;
       end;
     with ODSDepozitWithDraw do
       begin
          if Active then CloseAll;
          SetVariable('CONTID',ContractID);
          Open;
       end;
       with ODSContarcts do
       begin
          if Active then CloseAll;
          SetVariable('CONTID',ContractID);
          Open;
       end;   }

end;

procedure TfrmContractReport.BitBtn1Click(Sender: TObject);
var ContractID:Integer;
begin
ContractID:=DepositDataModule.Deposits.FieldByName('ID').AsInteger;
      with ODSContarcts do
       begin
          if Active then CloseAll;
          SetVariable('CONTID',ContractID);
          Open;
       end;
if RadioButton1.Checked=True then
begin
     with ODSDepozitMoney do
       begin
          //if Active then CloseAll;
          SetVariable('CONTID',ContractID);
          Open;
       end;
frmDepozitMoneyReport :=TfrmDepozitMoneyReport.Create(Self);
frmDepozitMoneyReport.QRPDepozitMoney.Preview;
end
else
begin
     with ODSDepozitWithDraw do
       begin
          //if Active then CloseAll;
          SetVariable('CONTID',ContractID);
          Open;
       end;
frmWithDrawReoprt :=TfrmWithDrawReoprt.Create(Self);
frmWithDrawReoprt.QRPWithDraw.Preview;
end;
end;

procedure TfrmContractReport.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TfrmContractReport.FormDestroy(Sender: TObject);
begin
ODSDepozitMoney.close;
ODSDepozitWithDraw.close;
end;

end.

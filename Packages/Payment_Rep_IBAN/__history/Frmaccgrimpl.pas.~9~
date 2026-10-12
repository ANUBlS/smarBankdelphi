unit Frmaccgrimpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData,  DBCtrls, StdCtrls, Buttons, ExtCtrls,
  Grids, DBGridEh, NLSLocalizer;

type
  TPaymentACC = class(TForm)
    GroupBox2: TGroupBox;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    DBNavigator1: TDBNavigator;
    DBGridEh1: TDBGridEh;
    DataSetAccNo: TOracleDataSet;
    DataSrcAccNo: TDataSource;
    DataSetAccNoACC: TFloatField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PaymentACC: TPaymentACC;

implementation
uses sboapiDataModuleImpl,SBTranslateProc;
{$R *.DFM}

procedure TPaymentACC.SpeedButton1Click(Sender: TObject);
begin
close
end;

procedure TPaymentACC.FormCreate(Sender: TObject);
begin
DataSetAccNo.open;
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TPaymentACC.FormDestroy(Sender: TObject);
begin
DataSetAccNo.CloseAll;
end;

end.

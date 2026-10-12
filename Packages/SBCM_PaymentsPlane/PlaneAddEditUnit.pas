unit PlaneAddEditUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, CurrencyEdit;

type
  TPlaneGridState = (pgsInsert , pgsEdit);

type
  TPlaneAddEditForm = class(TForm)
    DTPPaymentDate: TDateTimePicker;
    MainDebtEdit: TCurrencyEdit;
    PercentEdit: TCurrencyEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    ApplyBtn: TButton;
    CancelBtn: TButton;
    CBPayed: TCheckBox;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ApplyBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    PlaneGridState : TPlaneGridState;
    ContractID : Integer;
    { Public declarations }
  end;

var
  PlaneAddEditForm: TPlaneAddEditForm;

implementation

uses PaymentsPlaneDataModuleUnit;

{$R *.DFM}

procedure TPlaneAddEditForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  CancelBtn.Click
end;

procedure TPlaneAddEditForm.ApplyBtnClick(Sender: TObject);
var
  HDate : TDateTime;
  MainDebt : Real;
  InterestDebt : Real;
  Payed : Char;
  ID : Integer;
begin
  HDate := Trunc(DTPPaymentDate.DateTime);
  MainDebt := MainDebtEdit.Value;
  InterestDebt := PercentEdit.Value;
  if CBPayed.Checked then
    Payed := 'P'
  else
    Payed := 'N';

  with  PlaneDataModule.PaymentsPlane do
  if  PlaneGridState = pgsInsert then
  CallProcedure('Payments_Plane_Add',[
        ContractID
      , HDate
      , MainDebt
      , InterestDebt
      , Payed
      ])
  else
  begin
  ID := PlaneDataModule.PaymentsPlaneData.FieldByName('ID').AsInteger;
  CallProcedure('Payments_Plane_Upd',[
        ID
      , HDate
      , MainDebt
      , InterestDebt
      , Payed
      ])
  end;
  ModalResult := mrOk;
end;

procedure TPlaneAddEditForm.FormShow(Sender: TObject);
begin
  if  PlaneGridState = pgsEdit then
  with  PlaneDataModule , PaymentsPlaneData do
  begin
    DTPPaymentDate.DateTime := FieldByName('HDate').AsDateTime;
    MainDebtEdit.Value := FieldByName('FACTICALDEBTPAYMENT').AsCurrency;
    PercentEdit.Value := FieldByName('INTERESTDEBTPAYMENT').AsCurrency;
    CBPayed.Checked := FieldByName('Paid').AsString = 'P'
  end;
end;

end.

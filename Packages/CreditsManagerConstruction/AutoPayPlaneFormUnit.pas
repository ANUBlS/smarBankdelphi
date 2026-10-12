unit AutoPayPlaneFormUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, CMCurrencyEdit, ComCtrls;

type
  TAutoPayPlaneForm = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DTPStartDate: TDateTimePicker;
    GroupBox4: TGroupBox;
    AmountEdit: TCMCurrencyEdit;
    GroupBox5: TGroupBox;
    CmbBoxPeriodRate: TComboBox;
    Panel1: TPanel;
    GroupBox6: TGroupBox;
    NPeriodsEdit: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AutoPayPlaneForm: TAutoPayPlaneForm;

implementation

{$R *.DFM}
uses DatModConstructionImpl,PaymentPlaneMgrUnit;

procedure TAutoPayPlaneForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;
end;

procedure TAutoPayPlaneForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key) = VK_ESCAPE then close;
end;

procedure TAutoPayPlaneForm.Button1Click(Sender: TObject);
var PerRate :integer;
begin
  case CmbBoxPeriodRate.ItemIndex of
      0 : PerRate := 1;
      1 : PerRate := 3;
      2 : PerRate := 6;
    else
      PerRate := 12;
    end; // Case

    with DatModConstruction, sbcm_construction do
     begin
         CallProcedure('add_payment_plane',[
             'p_CreditID',Credits.FieldByName('ID').AsInteger ,
             'p_Amount',AmountEdit.Value ,
             'p_Rate',0  ,
             'p_FirstPayDate' ,DTPStartDate.DateTime ,
             'p_StartDate',Credits.FieldbyName('OpenDate').AsDateTime ,
             'p_Periods',StrToInt(NPeriodsEdit.Text) ,
             'p_PeriodRate',PerRate]);
     end;

     PaymentPlaneForm.PlanInfo.RefResh;
     Close;
end;

end.

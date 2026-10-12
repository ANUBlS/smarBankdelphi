unit PayPlanAddEditFormMgrUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrlsEh, Mask;

type
  TPayPlanAddEditForm = class(TForm)
    StaticText1: TStaticText;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    StaticText2: TStaticText;
    DBEditEh1: TDBEditEh;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PayPlanAddEditForm: TPayPlanAddEditForm;

implementation

{$R *.DFM}

uses PaymentPlaneMgrUnit;

procedure TPayPlanAddEditForm.Button1Click(Sender: TObject);
begin
   with PaymentPlaneForm.PlanInfo do
   begin
      post;
      RefResh;
   end;
   close
end;

end.

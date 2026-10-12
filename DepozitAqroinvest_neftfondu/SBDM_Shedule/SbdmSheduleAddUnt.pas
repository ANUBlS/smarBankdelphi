unit SbdmSheduleAddUnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrlsEh, Mask;

type
  TSbdmAddEditForm = class(TForm)
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBEditEh1: TDBEditEh;
    DBEditEh2: TDBEditEh;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    Button1: TButton;
    Button2: TButton;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBEditEh1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SbdmAddEditForm: TSbdmAddEditForm;

implementation
uses SbdmScheduleDataModuleImpl,CommonDeclsImpl;

{$R *.dfm}

procedure TSbdmAddEditForm.DBEditEh1Enter(Sender: TObject);
var id:integer;
    depositid:integer;
    IntPer:real;
begin
  id:=Get_SelectedContID;
  depositid:=Get_SelectedContID;
  with  SbdmScheduleDataModule,SBCM_PAYMENT_SCHEDULE1 do
  IntPer:=CallFloatFunction('PaymentSchedule_Percent',
                            ['p_id'   ,id,
                             'p_depid',depositid,
                             'p_date' ,DBDateTimeEditEh1.Value]);
  DBEditEh2.Value:=IntPer;

end;

procedure TSbdmAddEditForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;
end;

procedure TSbdmAddEditForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Ord(Key) = VK_ESCAPE then
  Close;
end;

end.

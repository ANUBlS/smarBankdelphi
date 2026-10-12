unit NewDepositsFrmAddStopcalculationImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, LDialogs,
   ComCtrls, StdCtrls, Buttons, XFSCtrls;

type
  TNewDepositsFrmAddStopCalculation = class(TForm)
    XFGroupBox1: TXFGroupBox;
    DTPLast: TDateTimePicker;
    XFGroupBox2: TXFGroupBox;
    DTPNew: TDateTimePicker;
    BitBtnOk: TXFButton;
    BitBtnClose: TXFButton;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BitBtnOkClick(Sender: TObject);
    procedure XFButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewDepositsFrmAddStopCalculation: TNewDepositsFrmAddStopCalculation;

implementation

{$R *.dfm}
  uses NewDepositsFrmStopcalculationImpl,NewCommonDeclsImpl,SBTranslateProc,sboapiDataModuleimpl;
procedure TNewDepositsFrmAddStopCalculation.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize := False;
end;

procedure TNewDepositsFrmAddStopCalculation.FormCreate(Sender: TObject);
begin
  SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TNewDepositsFrmAddStopCalculation.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Ord(Key) = VK_ESCAPE then close
end;

procedure TNewDepositsFrmAddStopCalculation.FormShow(Sender: TObject);
begin
   DTPNew.DateTime :=  Get_BankDate;
   DTPLast.DateTime := NewDepositsFrmStopCalculation.DepositInf.FieldByName('CloseDate').AsDateTime;
end;

procedure TNewDepositsFrmAddStopCalculation.BitBtnOkClick(Sender: TObject);
const
  rsInvalidDate = 'Müqavilənin dayandırılma vaxtı bağlanma tarixindən böyük ola bilməz !';
var
  CloseDate, ProlongDate : TDateTime;
  ContractID : Integer;
  Check : integer;
begin

  ProlongDate := Integer(Trunc(DTPNew.DateTime));
  CloseDate := NewDepositsFrmStopCalculation.DepositInf.FieldByName('CloseDate').AsDateTime;
  ContractID := Get_SelectedContID;

  if ProlongDate > CloseDate then
    MessageDlg(rsInvalidDate, mtWarning, [mbOK],0)
  else
  begin
    with NewDepositsFrmStopCalculation,sbcm_prolongation do
    begin
      Check:=CallIntegerFunction('ProlongationCheck',[ContractID]);
      if Check=0 then
      begin
        CallProcedure('AddProlongation',[
        ContractID ,
        Get_BankDate ,
        ProlongDate
        ]);

        stopcalculation.Refresh;
        DepositInf.Refresh;

        ModalResult := mrOk;
      end
      else
      begin
        ShowMessage('Bu müqavil?nin vaxt?n? uzatmaq qada?and?r !!!');
        exit;
      end;

    end;


   end;


end;

procedure TNewDepositsFrmAddStopCalculation.XFButton2Click(Sender: TObject);
begin
  Close
end;

end.

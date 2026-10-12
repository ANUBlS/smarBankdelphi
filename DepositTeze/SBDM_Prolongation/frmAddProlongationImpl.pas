unit frmAddProlongationImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
   ComCtrls, StdCtrls, Buttons;

type
  TfrmAddProlongation = class(TForm)
    GroupBox1: TGroupBox;
    DTPLast: TDateTimePicker;
    GroupBox2: TGroupBox;
    DTPNew: TDateTimePicker;
    BitBtnOk: TBitBtn;
    BitBtnClose: TBitBtn;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddProlongation: TfrmAddProlongation;

implementation

{$R *.DFM}
uses frmProlongationImpl,CommonDeclsImpl,SBTranslateProc,sboapiDataModuleimpl;

procedure TfrmAddProlongation.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False;
end;

procedure TfrmAddProlongation.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TfrmAddProlongation.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Ord(Key) = VK_ESCAPE then close
end;

procedure TfrmAddProlongation.BitBtnCloseClick(Sender: TObject);
begin
   Close
end;

procedure TfrmAddProlongation.FormShow(Sender: TObject);
begin
   DTPNew.DateTime :=  Get_BankDate;
   DTPLast.DateTime := frmProlongation.DepositInf.FieldByName('CloseDate').AsDateTime;
end;

procedure TfrmAddProlongation.BitBtnOkClick(Sender: TObject);
const
  rsInvalidDate = 'Тарихи дцзэцн  дахил един !';
var
  CloseDate, ProlongDate : TDateTime;
  ContractID : Integer;

begin

  ProlongDate := Integer(Trunc(DTPNew.DateTime));
  CloseDate := frmProlongation.DepositInf.FieldByName('CloseDate').AsDateTime;
  ContractID := Get_SelectedContID;
  
  if ProlongDate <= CloseDate then
    MessageDlg(rsInvalidDate, mtWarning, [mbOK],0)
  else
  begin
      with frmProlongation,sbcm_prolongation do
      begin
      CallProcedure('AddProlongation',[
       ContractID ,
       Get_BankDate ,
       ProlongDate
      ]);

       prolongations.Refresh;
       DepositInf.Refresh;
      end;

      ModalResult := mrOk;

   end;

end;

end.

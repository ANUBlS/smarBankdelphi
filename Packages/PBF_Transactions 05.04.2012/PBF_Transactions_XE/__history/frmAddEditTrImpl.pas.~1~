unit frmAddEditTrImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrlsEh, CMDBSearchEdit, DBLookupEh, Buttons, ComCtrls;

type
  TfrmAddEditTr = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CMSearchEdit1: TCMSearchEdit;
    DBLookupComboboxEh9: TDBLookupComboboxEh;
    Label28: TLabel;
    DBEditEh1: TDBEditEh;
    DBEditEh2: TDBEditEh;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBEditEh1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddEditTr: TfrmAddEditTr;

implementation

{$R *.DFM}
uses dmpbf_transactionimpl;

procedure TfrmAddEditTr.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := false 
end;

procedure TfrmAddEditTr.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Ord(Key) = VK_ESCAPE then close;
end;

procedure TfrmAddEditTr.FormShow(Sender: TObject);
begin
   DateTimePicker1.DateTime := dmpbf_transaction.CurrDat.FieldByName('TEK_DAT').AsDateTime
end;

procedure TfrmAddEditTr.BitBtn1Click(Sender: TObject);
begin
   with dmpbf_transaction,PBFOperations do
   begin
        TrDat := integer(trunc(DateTimePicker1.datetime));
        Post;
   end;
        Close;
end;

procedure TfrmAddEditTr.BitBtn2Click(Sender: TObject);
begin
   with dmpbf_transaction,PBFOperations do
        Cancel;
end;

procedure TfrmAddEditTr.DBEditEh1KeyPress(Sender: TObject; var Key: Char);
begin
  if ORD(Key) = VK_RETURN then
  if Sender is TWinControl then
  with Sender as TWinControl do begin
  SelectNext(Sender as TWinControl ,True ,True);
  Key := #0;
  end;

end;

end.

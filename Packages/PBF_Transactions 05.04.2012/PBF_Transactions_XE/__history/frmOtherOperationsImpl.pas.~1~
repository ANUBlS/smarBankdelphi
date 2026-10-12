unit frmOtherOperationsImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrlsEh, Buttons, ComCtrls, DBCtrls;

type
  TfrmOtherOperations = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    DBEditEh1: TDBEditEh;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    DateTimePicker1: TDateTimePicker;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOtherOperations: TfrmOtherOperations;

implementation

uses dmpbf_transactionimpl;

{$R *.DFM}

procedure TfrmOtherOperations.ComboBox1Change(Sender: TObject);
begin
   with dmpbf_transaction  do
        OperType1 := ComboBox1.text;
end;

procedure TfrmOtherOperations.BitBtn1Click(Sender: TObject);
begin
   with dmpbf_transaction,PBFOperations do
   begin
       OperType1 := ComboBox1.text;
       TrDat := integer(trunc(DateTimePicker1.datetime));
        Post;
   end;
   Close;
end;

procedure TfrmOtherOperations.BitBtn2Click(Sender: TObject);
begin
   with dmpbf_transaction,PBFOperations do
        Cancel;
end;

procedure TfrmOtherOperations.FormShow(Sender: TObject);
begin
   DateTimePicker1.DateTime := dmpbf_transaction.CurrDat.FieldByName('TEK_DAT').AsDateTime ;
   ComboBox1.Items.Clear;
   with dmpbf_transaction,PBFOpertionTypes do
   begin
      first;
      while not eof do
      begin
         ComboBox1.Items.Add(fieldbyname('name').asstring);
         next;
      end;
   end;
end;

end.

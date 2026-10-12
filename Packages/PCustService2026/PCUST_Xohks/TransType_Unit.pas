unit TransType_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, ComCtrls, ImgList;

type
  TTransCodeForm = class(TForm)
    But_Ok: TBitBtn;
    But_cancel: TBitBtn;
    TreeView1: TTreeView;
    ImageList1: TImageList;
    BtnOK: TButton;
    BtnCancel: TButton;
    procedure But_cancelClick(Sender: TObject);
    procedure But_OkClick(Sender: TObject);
    procedure TreeView1Changing(Sender: TObject; Node: TTreeNode;
      var AllowChange: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TreeView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
     typecode  :Integer;
     typetext  :String;
    { Public declarations }
  end;

var
  TransCodeForm: TTransCodeForm;

implementation

uses XohksPayment_Det;

{$R *.DFM}

procedure TTransCodeForm.But_cancelClick(Sender: TObject);
begin
   close;
end;

procedure TTransCodeForm.But_OkClick(Sender: TObject);
begin
   if (typecode=2) then
   begin
       FormPayment_Det.Edit_TransCode.Text:=IntToStr(TreeView1.Selected.StateIndex);
       close;
   end;
end;

procedure TTransCodeForm.TreeView1Changing(Sender: TObject;
  Node: TTreeNode; var AllowChange: Boolean);
begin
      typecode:=Node.ImageIndex;
      typetext:=Node.Text;
end;

procedure TTransCodeForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = Vk_escape then close;
end;

procedure TTransCodeForm.TreeView1DblClick(Sender: TObject);
begin
   But_Ok.Click;
end;

end.

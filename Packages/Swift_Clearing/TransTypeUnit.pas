unit TransTypeUnit;

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
    DBGrid1: TDBGrid;
    procedure But_cancelClick(Sender: TObject);
    procedure But_OkClick(Sender: TObject);
    procedure TreeView1Changing(Sender: TObject; Node: TTreeNode;
      var AllowChange: Boolean);
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

uses Payment_Det;

{$R *.DFM}

procedure TTransCodeForm.But_cancelClick(Sender: TObject);
begin
   close;
end;

procedure TTransCodeForm.But_OkClick(Sender: TObject);
begin
   if (typecode=2) then
   begin
       PaymentDetalsForm.Edit_TransCode.Text:=typetext;
       close;
   end;
end;

procedure TTransCodeForm.TreeView1Changing(Sender: TObject;
  Node: TTreeNode; var AllowChange: Boolean);
begin
      typecode:=Node.ImageIndex;
      typetext:=Node.Text;
end;

end.

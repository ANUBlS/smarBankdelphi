unit SettingCodeImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, ImgList, StdCtrls, Buttons;

type
 EItemNotFound = class(Exception);
  TSettingCodeFrm = class(TForm)
    TreeView1: TTreeView;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    ImageList1: TImageList;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
      procedure FormingTreeView;
  public
    { Public declarations }
  end;

var
  SettingCodeFrm: TSettingCodeFrm;

implementation

uses DmBudcetImpl;

{$R *.dfm}
procedure TSettingCodeFrm.BitBtn1Click(Sender: TObject);
var i:integer;
s:string;
begin
if DmBudcet.OracleDataSet6.FieldByName('id').AsInteger=0 then
begin
 ShowMessage('Hesabı seçməmisiniz!');
 exit;
end;
   for I :=0 to TreeView1.Items.Count-1 do
    begin

     if TreeView1.Items[i].StateIndex =2 then
       // ShowMessage(TreeView1.Items[i].AbsoluteIndex );
    s:= DmBudcet.PackgSubdiv.CallStringFunction('add_account_code',['p_idxid',TreeView1.Items[i].AbsoluteIndex,
                                                'P_bcaccid',DmBudcet.OracleDataSet6.FieldByName('id').AsInteger]);
    end;
    DmBudcet.OracleDataSet7.Refresh;
    close;
end;

procedure TSettingCodeFrm.BitBtn2Click(Sender: TObject);
begin
close
end;

procedure TSettingCodeFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
TreeView1.FullCollapse;
FormingTreeView
end;

procedure TSettingCodeFrm.FormCreate(Sender: TObject);
begin
FormingTreeView
end;

procedure TSettingCodeFrm.FormingTreeView;
var
  TempSubdivision : String;
  TempSubdivid : integer;
  i: Real;
begin

  with TreeView1.Items do begin
    Clear;
    //MirrorView.Items.Clear;
    with DmBudcet.StructurDSet do begin
    Close;
    OPen;

      First;
      while not eof do begin
        try
          if FieldByName('previd').Value=0 then
         begin
            TreeView1.Items.Add(nil, FieldByName('name').Value);
 //          MirrorView.Items.Add(nil, FloatToStr(FieldByName('ID').asFloat));
          end
          else
            begin
              TempSubdivid:= FieldByName('id').Value;
              TempSubdivision:= FieldByName('name').Value;
              i:= fieldByName('id').Value;
              Locate('id', FieldByName('previd').Value, []);
              TreeView1.Items.AddChild(TreeView1.Items[FieldByName('Index_by_name').Value],TempSubdivision); { Add a root node }
              Locate('id', TempSubdivid, []);
              if DmBudcet.DelControl.Active then
 DmBudcet.DelControl.close;
  DmBudcet.DelControl.SetVariable('id',TempSubdivid);
 DmBudcet.DelControl.open;
       if DmBudcet.DelControl.RecordCount=0 then
              TreeView1.Items[FieldByName('Index_by_name').Value].StateIndex:=1;
            end;


          Next;
        except
          raise EItemNotFound.CreateFmt('Item (id=%d) not found',[1]{, [PrevID]});
          Next;
        end;
      end;
    end;
  end;
end;


procedure TSettingCodeFrm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ORD(Key) = VK_ESCAPE then
    Close else
end;

procedure TSettingCodeFrm.TreeView1Click(Sender: TObject);
var
  P:TPoint;
  Node:TTreeNode;
begin
  Node:=TreeView1.Selected;
  GetCursorPos(P);
  P := TreeView1.ScreenToClient(P);
  if (htOnStateIcon in TreeView1.GetHitTestInfoAt(P.X,P.Y)) then
     if Assigned(Node) then
  begin
    if Node.StateIndex = 1 then
      Node.StateIndex := 2
    else if Node.StateIndex = 2 then
      Node.StateIndex := 1
  end;
end;

end.

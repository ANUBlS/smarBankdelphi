unit TreeViewIni;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, IniSource, ImgList, Commctrl;

type
  TTreeViewIni = class(TTreeView)
  private
    { Private declarations }
    FActive: Boolean;
    FIniSource: TIniSource;
    FIniSection: String;
    FAutoSave: Boolean;
    FRecurseFolderScan: Boolean;
    procedure SetActive(Value: Boolean);
    procedure SetIniSection(const Value: String);
    procedure DoAdvancedDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState;
      Stage: TCustomDrawStage; var PaintImages, DefaultDraw: Boolean);
  protected
    { Protected declarations }
    procedure SetIniSource(Value: TIniSource); virtual;
    procedure LoadFromSource(Source: TIniSource); virtual;
    procedure SaveToSource(Source: TIniSource); virtual;
    procedure ReadNodes(ParentNode: TTreeNode; Recursive: Boolean); virtual;
    procedure WriteNodes(ParentNode: TTreeNode; Recursive: Boolean); virtual;
    procedure ReadNode(Node: TTreeNode); virtual;
    procedure WriteNode(Node: TTreeNode); virtual;
    procedure DoOpen; virtual;
    procedure DoClose; virtual;
    function BuildSectionName(Node: TTreeNode): String; virtual;
    procedure DragOver(Source: TObject; X, Y: Integer; State: TDragState;
      var Accept: Boolean); override;
    procedure DoStartDrag(var DragObject: TDragObject); override;
    procedure CNNotify(var Message: TWMNotify); message CN_NOTIFY;
  public
    { Public declarations }
    procedure Open;
    procedure Close;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    { Published declarations }
    procedure DragDrop(Source: TObject; X, Y: Integer); override;
    property Active: Boolean read FActive write SetActive;
    property AutoSave: Boolean read FAutoSave write FAutoSave;
    property IniSection: String read FIniSection write SetIniSection;
    property IniSource: TIniSource read FIniSource write SetIniSource;
    property RecurseFolderScan: Boolean read FRecurseFolderScan write FRecurseFolderScan;
  end;

implementation

uses DsgnIntf;

type
  TTreeNodeDragObject = class(TDragObject)
  private
    FNode: TTreeNode;
  protected
    function GetDragImages: TDragImageList; override;
  public
    constructor Create(Node: TTreeNode);
    property Node: TTreeNode read FNode;
  end;

  { TTreeNodeDragObject }

constructor TTreeNodeDragObject.Create(Node: TTreeNode);
begin
  inherited Create;
  FNode := Node;
end;

{$R SBCommon50.dcr}

function TTreeNodeDragObject.GetDragImages: TDragImageList;
var
  Image: TBitmap;
begin
  Result := TDragImageList.CreateSize(160, 16);
{  if not Result.ResInstLoad(HInstance, rtBitmap, 'TREENODEDRAGIMAGE', clWhite) then
    RaiseLastWin32Error;}
  Image := TBitmap.Create;
  with Image do
  try
    Width := 160;
    Height := 16;
    Canvas.Font := (Node.TreeView as TTreeView).Font;
    Canvas.TextOut(15, 0, Node.Text);
    Result.Add(Image, nil);
  finally
    Free;
  end;
end;

  { TTreeViewIni }

constructor TTreeViewIni.Create(AOwner: TComponent);
begin
  inherited;
  OnAdvancedCustomDrawItem := DoAdvancedDrawItem;
end;

destructor TTreeViewIni.Destroy;
begin
  Close;
  inherited;
end;

procedure TTreeViewIni.SetActive(Value: Boolean);
begin
  if Value then
    Open
  else
    Close;
end;

procedure TTreeViewIni.SetIniSource(Value: TIniSource);
begin
  FIniSource := Value;
end;

procedure TTreeViewIni.SetIniSection(const Value: String);
begin
  FIniSection := Value;
end;

procedure TTreeViewIni.Open;
begin
  if not Active then
    DoOpen;
end;

procedure TTreeViewIni.Close;
begin
  if Active then
    DoClose;
end;

procedure TTreeViewIni.DoOpen;
begin
//  DoClose;
  LoadFromSource(IniSource);
  FActive := True;
end;

procedure TTreeViewIni.DoClose;
begin
  if AutoSave and not (csDesigning in ComponentState) then
    SaveToSource(IniSource);
  Items.Clear;
  FActive := False;
end;

function TTreeViewIni.BuildSectionName(Node: TTreeNode): String;
begin
  Result := '';
  while Node <> nil do
  begin
    Result := Format('Item%d\%s', [Node.Index, Result]);
    Node := Node.Parent;
  end;
  Result := Format('%s\Sections\%s', [IniSection, Result]);
  System.Delete(Result, Length(Result), 1);
end;

procedure TTreeViewIni.LoadFromSource(Source: TIniSource);
begin
  ReadNodes(nil, RecurseFolderScan);
  if ComponentState = [csDesigning] then
    FullExpand;
end;

procedure TTreeViewIni.SaveToSource;
var
  Index: Integer;
begin
//  with IniSource.IniFile do
//  begin
    for Index := 0 to Items.Count-1 do
      WriteNodes(Items[Index], True);
//  end;
end;

procedure TTreeViewIni.ReadNodes(ParentNode: TTreeNode; Recursive: Boolean);
var
  Index: Integer;
  CurrentSection: String;
  NewSection: String;
  NewNode: TTreeNode;
begin
  CurrentSection := BuildSectionName(ParentNode);
  with IniSource do
    for Index := 0 to ReadValue(CurrentSection, 'Count', 0)-1 do
    begin
      NewSection := Format('%s\Item%d', [CurrentSection, Index]);
      NewNode := Items.AddChild(ParentNode, ReadValue(NewSection, 'Caption', '<no data>'));
      ReadNode(NewNode);
      if Recursive then
        ReadNodes(NewNode, Recursive);
    end;
end;

procedure TTreeViewIni.WriteNodes(ParentNode: TTreeNode; Recursive: Boolean);
var
  I: Integer;
begin
  with IniSource, ParentNode do
  begin
    for I := 0 to Count-1 do
      WriteNode(Item[I]);
    WriteValue(BuildSectionName(ParentNode), 'Count', Count, 0);
  end;
end;

procedure TTreeViewIni.ReadNode(Node: TTreeNode);
begin
  with Node do
  begin
    ImageIndex := -1;
    SelectedIndex := -1;
  end;
end;

procedure TTreeViewIni.WriteNode(Node: TTreeNode);
begin
  with IniSource do
    WriteValue(
      Format('%s\Item%d',[BuildSectionName(Node.Parent), Node.Index]),
      'Caption',
      Node.Text,
      0);
end;

procedure TTreeViewIni.DragOver(Source: TObject; X, Y: Integer; State: TDragState;
  var Accept: Boolean);
var
  Node: TTreeNode;
begin
  Node := GetNodeAt(X, Y);
  {$B-}
  Accept := Assigned(Node) and Assigned(Selected) and IniSource.ReadValue(BuildSectionName(Node), 'AllowDrop', True)
  {$B+}
end;

procedure TTreeViewIni.DragDrop(Source: TObject; X, Y: Integer);
var
  Node: TTreeNode;
  HitTestInfo: THitTests;
  Mode: TNodeAttachMode;
begin
  if Selected = nil then
    Exit;
  HitTestInfo := GetHitTestInfoAt(X, Y);
  Node := GetNodeAt(X, Y);
  if (HitTestInfo - [htOnItem, htOnIcon, htNowhere, htOnIndent] <> HitTestInfo) then
  begin
    if (htOnItem in HitTestInfo) or (htOnIcon in HitTestInfo) then
      Mode := naAddChild
    else
      if htNowhere in HitTestInfo then
        Mode := naAdd
    else
      if htOnIndent in HitTestInfo then
        Mode := naInsert
      else
        Mode := naAdd;
    Selected.MoveTo(Node, Mode);
  end;
end;

procedure TTreeViewIni.DoStartDrag(var DragObject: TDragObject);
begin
  if Assigned(Selected) then
    DragObject := TTreeNodeDragObject.Create(Selected);
end;

procedure TTreeViewIni.CNNotify(var Message: TWMNotify);
begin
  inherited;
end;

procedure TTreeViewIni.DoAdvancedDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState;
  Stage: TCustomDrawStage; var PaintImages, DefaultDraw: Boolean);
begin
  if Node.Count <> 0 then
    Canvas.Font.Style := [fsBold];
end;

end.

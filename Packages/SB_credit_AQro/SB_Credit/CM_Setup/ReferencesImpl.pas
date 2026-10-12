unit ReferencesImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, Db, OracleData,Oracle, StdCtrls, NLSLocalizer,
  ActnList;

type
  TMainReferForm = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    TV: TTreeView;
    Refers: TOracleDataSet;
    Temp: TOracleDataSet;
    CmbBoxValue: TComboBox;
    Button1: TButton;
    SetupPackage: TOraclePackage;
    ActionLst: TActionList;
    SaveActn: TAction;
    RefersID: TFloatField;
    RefersPARENTID: TFloatField;
    RefersINAME: TWideStringField;
    RefersDESCRIPTION: TWideStringField;
    RefersINTEGERVALUE: TFloatField;
    RefersCHARVALUE: TWideStringField;
    RefersAVAILABLEVALUES: TWideStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TVChange(Sender: TObject; Node: TTreeNode);
    procedure SaveActnExecute(Sender: TObject);
    procedure SaveActnUpdate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    TreeLst : TList; 
    procedure TVAddNode(Node :TTreeNode;ID :Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainReferForm: TMainReferForm;

implementation

{$R *.DFM}

uses
  sboapiDataModuleImpl;

procedure TMainReferForm.TVAddNode(Node :TTreeNode;ID :Integer);
begin
  with  TOracleDataSet.Create(nil)  do
  try
    Session :=Temp.Session;
    SQL.Assign(Temp.SQL);
    DeclareVariable('AParentID',otInteger);
    SetVariable('AParentID',ID);
    Open;
    First;
    while  not EOF  do
    begin
      TreeLst.Add(Pointer(FieldByName('ID').AsInteger));
      TVAddNode(TV.Items.AddChild(Node,FieldByName('DESCRIPTION').AsString),FieldByName('ID').AsInteger);
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TMainReferForm.FormCreate(Sender: TObject);
begin
  TreeLst := TList.Create;
  Refers.Open;
  TVAddNode(nil,0);
end;

procedure TMainReferForm.FormDestroy(Sender: TObject);
begin
  TreeLst.Free;
end;

procedure TMainReferForm.TVChange(Sender: TObject; Node: TTreeNode);
var
  NodeID : Integer;
  RefID : Integer;
  ValueList : String;
begin
  NodeID := Node.AbsoluteIndex;
  RefID := Integer(TreeLst[NodeID]);
  with Refers do
  begin
    if Locate('ID',RefID,[]) then
    if FieldByName('ParentID').AsInteger <> 0 then
    begin
      CmbBoxValue.Enabled := True;
      if not FieldByName('AVAILABLEVALUES').IsNull then
      begin
        ValueList := FieldByName('AVAILABLEVALUES').AsString;
        CmbBoxValue.Style := csDropDownList;
        CmbBoxValue.Items.CommaText := ValueList;
        CmbBoxValue.ItemIndex := FieldByName('IntegerValue').AsInteger;
      end else
      begin
        CmbBoxValue.Style := csSimple;
        CmbBoxValue.Text := FieldByName('IntegerValue').AsString;
      end;
    end else
    with CmbBoxValue do
    begin
      Style := csSimple;
      Text := '';
      Enabled := False;
    end; 
  end;
end;

procedure TMainReferForm.SaveActnExecute(Sender: TObject);

  procedure SafeRefresh;
  var
    SavePlace : TBookmark;
  begin
    with Refers do
    begin
      SavePlace := GetBookmark;
      Refresh;
      GotoBookmark(SavePlace);
    end;
  end;
  
var
  ID : Integer;
  Value : Integer;
begin
  ID := RefersID.AsInteger ;
  try
    Value := StrToInt(CmbBoxValue.Text) ;
  except
    Value := CmbBoxValue.ItemIndex;
  end;

  with SetupPackage do
  CallProcedure('SetSetupIntValue',[
    'p_ID',ID,
    'p_NewValue',Value
  ]);

  SafeRefresh

end;

procedure TMainReferForm.SaveActnUpdate(Sender: TObject);
begin
  SaveActn.Enabled := CmbBoxValue.Enabled
end;

procedure TMainReferForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ORD(Key) = VK_ESCAPE then
    Close 
end;

end.

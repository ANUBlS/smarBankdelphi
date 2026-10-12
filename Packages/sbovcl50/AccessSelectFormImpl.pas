unit AccessSelectFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, ExtCtrls, ActnList, Db, OracleData, SBSecurity,
  CheckLst;

type
  TAccessSelectForm = class;
  TAddAccessEvent = procedure(Sender: TAccessSelectForm; AccessID: Integer) of object;

  TAccessSelectForm = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    ActionList1: TActionList;
    Accept: TAction;
    Cancel: TAction;
    AccessData: TOracleDataSet;
    GroupBox1: TGroupBox;
    AccessDataID: TFloatField;
    AccessCB: TCheckListBox;
    AccessDataNAME: TWideStringField;
    AccessDataDESCRIPTION: TWideStringField;
    procedure AcceptExecute(Sender: TObject);
    procedure CancelExecute(Sender: TObject);
    procedure AccessDataAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FCommited: Boolean;
    FSid: Integer;
    FLinkID: Integer;
    FAddAccess: TAddAccessEvent;
    procedure AddAccess(AccessID: Integer);
  public
    { Public declarations }
    function ViewPermissions(Sid: TSid; LinkID: Integer): Boolean;
    property Commited: Boolean read FCommited;
    property OnAddAccess: TAddAccessEvent read FAddAccess write FAddAccess;
  end;

var
  AccessSelectForm: TAccessSelectForm;

implementation

{$R *.DFM}

uses sboapiDataModuleImpl;

function TAccessSelectForm.ViewPermissions(Sid: TSid; LinkID: Integer): Boolean;
begin
  FCommited := False;
  FSid := Sid;
  FLinkID := LinkID;
  with AccessData do
  begin
    Close;
    SetVariable('SID', FSid);
    SetVariable('LinkID', FLinkID);
    Open;
  end;
  ShowModal;
  Result := FCommited;
end;

procedure TAccessSelectForm.AcceptExecute(Sender: TObject);
var
  Index: Integer;
begin
  FCommited := True;
  with AccessCB do
    for Index := 0 to Items.Count-1 do
      if Checked[Index] then
        with AccessData do
        begin
          RecNo := Index;
          AddAccess(AccessDataID.AsInteger);
        end;
  Close;
end;

procedure TAccessSelectForm.CancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TAccessSelectForm.AccessDataAfterOpen(DataSet: TDataSet);
begin
  with DataSet, AccessCB.Items do
  begin
    First;
    while not Eof do
    begin
      Add(AccessDataDESCRIPTION.Value);
      Next;
    end;
  end;
end;

procedure TAccessSelectForm.AddAccess(AccessID: Integer);
begin
  if Assigned(FAddAccess) then
    FAddAccess(Self, AccessID);
end;

end.

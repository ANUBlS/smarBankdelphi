unit ODLookupComboBox;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,DB;

type
  EODLookupCmbBoxError = class(Exception);
type
  TODLookupComboBox = class(TComboBox)
  private
    FDataLink        :TDataLink;
    FListSource      :TDataSource;
    FListField       :String;
    FFirstAfterOpen  :Boolean;
    FShowNeutralItem :Boolean;
    FNeutralItem     :String;
    NeutralValue     :Variant;
    { Private declarations }
  protected
    procedure  SetListSource(const Value :TDataSource);
    procedure  Change;override;
    procedure  DataSetChanged;
    procedure  DataSetScrolled(Distance :Integer);
    { Protected declarations }
  public
    constructor Create(AOwner :TComponent);override;
    destructor  Destroy;override;
    procedure   RefreshList;
    function    CheckListSourceAssigned :Boolean;
    function    CheckDataSetActive :Boolean;
    { Public declarations }
  published
    property   ListSource :TDataSource read FListSource write SetListSource;
    property   ListField  :String read FListField write FListField;
    property   FirstAfterOpen :Boolean read FFirstAfterOpen write FFirstAfterOpen;
    property   NeutralItem :String read FNeutralItem write FNeutralItem ;
    property   ShowNeutral :Boolean read FShowNeutralItem write FShowNeutralItem default False;
    { Published declarations }
  end;

procedure Register;

implementation

type
   TODLookupComboBoxDataLink = class(TDataLink)
    private
      FFirstScrolled : Boolean;
      FODLookupComboBox: TODLookupComboBox;
    protected
      procedure ActiveChanged; override;
      procedure DataSetScrolled(Distance: Integer); override;
      procedure DataSetChanged; override;
      procedure LayoutChanged;override;
    public
      property ODLookupComboBox: TODLookupComboBox read FODLookupComboBox write FODLookupComboBox;
      constructor Create;
   end;

var
   IsScrollEnabled : Boolean = False;

constructor TODLookupComboBoxDataLink.Create;
begin
  FFirstScrolled :=True;
  inherited;
end;
procedure TODLookupComboBoxDataLink.LayoutChanged;
begin
 // ShowMessage('Layout Changed');
end;
procedure TODLookupComboBoxDataLink.ActiveChanged;
begin
  //.........
  //ShowMessage('ActiveGhanged');
end;
procedure TODLookupComboBoxDataLink.DataSetScrolled;
begin
  ODLookupComboBox.DataSetScrolled(Distance);
end;
procedure TODLookupComboBoxDataLink.DataSetChanged;
begin
 // ShowMessage('DataSetGhanged');
  ODLookupComboBox.DataSetChanged;
end;

     { TODLookupComboBox }

constructor  TODLookupComboBox.Create(AOwner :TComponent);
begin
   inherited;
   FDataLink :=TODLookupComboBoxDataLink.Create;
   with  FDataLink as TODLookupComboBoxDataLink do
   begin
     ODLookupComboBox :=Self;
     VisualControl :=True;
   end;
   FFirstAfterOpen :=False;
   NeutralValue :=VarNull;
end;
destructor  TODLookupComboBox.Destroy;
begin
  FDataLink.Free;
  inherited;
end;
procedure  TODLookupComboBox.Change;
begin
  FListSource.DataSet.Locate(FListField,Text,[]);
end;
procedure  TODLookupComboBox.SetListSource(const Value :TDataSource);
begin
  FListSource :=Value;
  FDatalink.DataSource :=FListSource;
end;
procedure  TODLookupComboBox.DataSetChanged;
begin
//  ShowMessage('DataSetGhanged');
end;
procedure  TODLookupComboBox.DataSetScrolled(Distance :Integer);
begin
 if IsScrollEnabled  then
 ShowMessage(IntToStr(Distance));
  if CheckListSourceAssigned
      and CheckDataSetActive
      and IsScrollEnabled  then

  //...
end;
procedure  TODLookupComboBox.RefreshList;
begin
  Enabled :=True;
  IsScrollEnabled :=False;
  if    CheckListSourceAssigned
    and CheckDataSetActive  then

  with  Items,FListSource.DataSet do
  try
    First;
    Clear;
    if FShowNeutralItem then
       Add(FNeutralItem);
    while not EOF do
    begin
      Add(FieldByName(FListField).AsString);
      Next;
    end;
//    if  FFirstAfterOpen then
//      ItemIndex :=0;
      
  except
    on EDataBaseError  do
    begin
     ShowMessage(Format('Field %s not Found!',[FListField]));
     Enabled :=False;
    end
  end
    else
     raise  EODLookupCmbBoxError.Create('Unable To  Refresh List');
  IsScrollEnabled :=True;   
    //...
end;
function  TODLookupComboBox.CheckListSourceAssigned :Boolean;
begin
  Result :=   Assigned(FListSource)
          and Assigned(FListSource.DataSet)
          and (FListField <> '');
end;
function  TODLookupComboBox.CheckDataSetActive :Boolean;
begin
  Result :=FListSource.DataSet.Active;
end;
procedure Register;
begin
  RegisterComponents('Smart', [TODLookupComboBox]);
end;

end.

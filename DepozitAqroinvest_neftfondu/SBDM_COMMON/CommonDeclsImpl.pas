unit CommonDeclsImpl;

interface

uses
  SysUtils, Classes, Controls, DBGridEh, Forms ,Messages , LDialogs,
   DB,Windows,TemporaryTransactionsFormImpl;


type
  ENoDepositSelected = class(Exception);
  TRefreshMode = (rmLocateAfterRefresh, rmGoBookmarkAfterRefresh, rmMoveRecNoAfterRefresh, rmRefreshOnly);

var
  CommonApplication : TApplication;
  CommonScreen : TScreen;
  CommonGrid : TDBGridEh;
  Get_BankDate : TDateTime;
  Get_FilialID : Integer;
  ApplicationPath : String;

  function Get_SelectedContID : Longint;
  function Get_SelectedContNo : String;
  function TrDelayed_Show(AOwner : TComponent;SCaption : String = '') : Boolean;
  procedure RefreshWithSavely(SaveType :Boolean;RefreshMode : TRefreshMode = rmMoveRecNoAfterRefresh);
  procedure LoadPlugin(PluginName :String;PluginParam :String);
  procedure UnLoadPlugin(PluginHandle :THandle);
  
implementation

procedure LoadPlugin(PluginName :String;PluginParam :String);
var PluginHandle :THandle;
    exportproc : procedure(s:String);
begin
   PluginHandle := LoadPackage(ApplicationPath+PluginName);
   if PluginHandle > 0 then
   begin
      @exportproc := GetProcAddress(PluginHandle,'exportproc');
      exportproc(PluginParam);
   end;
end;

procedure UnLoadPlugin(PluginHandle :THandle);
begin
   if PluginHandle > 0 then
   UnloadPackage(PluginHandle);
end;

function Get_SelectedContID : Integer;
begin
  if CommonGrid.DataSource.DataSet.FieldByName('ID').IsNull then
   raise ENoDepositSelected.Create('Heç bir depozit seçilməyib !');
  Result := CommonGrid.DataSource.DataSet.FieldByName('ID').AsInteger;
end;

procedure RefreshWithSavely(SaveType :Boolean;
RefreshMode :TRefreshMode=rmMoveRecNoAfterRefresh);
var
  SavePoint : TBookmark;
  SaveID : Integer;
  SaveRecNo : Integer;
begin
  with CommonGrid.DataSource.DataSet do
  case RefreshMode of
    rmLocateAfterRefresh : begin
      SaveID := Get_SelectedContID;
      Refresh;
      Locate('ID',SaveID,[]);
    end;
    rmGoBookmarkAfterRefresh :begin
      SavePoint := GetBookmark;
      Refresh;
      if BookmarkValid(SavePoint) then
      GotoBookmark(SavePoint);
    end;
    rmMoveRecNoAfterRefresh :begin
      SaveRecNo := RecNo;
      Refresh;
      if SaveRecNo > RecordCount then
        SaveRecNo := RecordCount;

      RecNo := SaveRecNo;
    end;
    rmRefreshOnly : Refresh;
  end; // CASE

  if SaveType then
  with CommonGrid do
    SelectedRows.Clear;

end;


function Get_SelectedContNo : String;
begin
  if CommonGrid.DataSource.DataSet.FieldByName('ID').IsNull then
   raise ENoDepositSelected.Create('Heç bir depozit seçilməyib !');
  Result := CommonGrid.DataSource.DataSet.FieldByName('Contractno').AsString;
end;



function TrDelayed_Show(AOwner : TComponent;SCaption : String = '') : Boolean;
begin
  with TTransactionsViewForm.Create(AOwner) do
  try
    if  SCaption <> '' then
      Caption := SCaption;
    Result := ShowModal = mrOk;
    Update;
  finally
    Release
  end;
end;

end.
 
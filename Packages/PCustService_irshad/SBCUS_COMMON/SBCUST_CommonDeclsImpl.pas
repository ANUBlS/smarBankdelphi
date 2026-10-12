unit SBCUST_CommonDeclsImpl;

interface

uses
  SysUtils, Classes, Controls, DBGridEh,XDBGrids, Forms ,Messages , Dialogs,
   DB,Windows,SBCUST_TemporaryTransactionsFormImpl;


type
  ENoDepositSelected = class(Exception);


var
  CommonApplication : TApplication;
  CommonScreen : TScreen;
  CommonGrid : TXDBGrid;
  CommonGridArchive: TXDBGrid;
  Get_BankDate : TDateTime;
  Get_FilialID : Integer;
  ApplicationPath : String;

  function Get_SelectedContID : Longint;
  function Get_SelectedArchiveContID: Longint;
  function Get_SelectedContNo : String;
  function Get_SelectedArchiveContNo: String;
  function TrDelayed_Show(AOwner : TComponent;SCaption : String = '') : Boolean;
  procedure RefreshWithSavely(SaveType :Boolean);
  procedure RefreshWithSavelyArchive(SaveType :Boolean);
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
   raise ENoDepositSelected.Create('Heç bir Depozit seçilməyib !');
  Result := CommonGrid.DataSource.DataSet.FieldByName('ID').AsInteger;

end;

function Get_SelectedArchiveContID : Integer;
begin
  if CommonGridArchive.DataSource.DataSet.FieldByName('ID').IsNull then
   raise ENoDepositSelected.Create('Heç bir Depozit seçilməyib !');
  Result := CommonGridArchive.DataSource.DataSet.FieldByName('ID').AsInteger;

end;


procedure RefreshWithSavely(SaveType :Boolean);
var SaveID : Integer;
begin
   CommonGrid.SelectedRows.Clear;
   //CommonGrid.DataSource.DataSet.ApplyUpdates;
  //CommonGrid.DisablePosition;
  // TRY
   with CommonGrid,DataSource,DataSet do
   begin

      SaveID := Get_SelectedContID;
      CLOSE;
      OPEN;
      Locate('ID',SaveID,[]);
   end;
  // finally
    //CommonGrid.EnablePosition(True);
  // END;
end;

procedure RefreshWithSavelyArchive(SaveType :Boolean);
var SaveID : Integer;
begin
   CommonGridArchive.SelectedRows.Clear;

   with CommonGridArchive,DataSource,DataSet do
   begin
      SaveID := Get_SelectedArchiveContID;
       CLOSE;
     OPEN;
      Locate('ID',SaveID,[]);
   end;
end;

function Get_SelectedContNo : String;
begin
  if CommonGrid.DataSource.DataSet.FieldByName('ID').IsNull then
   raise ENoDepositSelected.Create('Heç bir Depozit seçilməyib !');
  Result := CommonGrid.DataSource.DataSet.FieldByName('Contractno').AsString;
end;

function Get_SelectedArchiveContNo : String;
begin
  if CommonGridArchive.DataSource.DataSet.FieldByName('ID').IsNull then
   raise ENoDepositSelected.Create('Heç bir Depozit seçilməyib !');
  Result := CommonGridArchive.DataSource.DataSet.FieldByName('Contractno').AsString;
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
 
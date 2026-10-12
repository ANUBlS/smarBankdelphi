unit CommonDeclsImpl;

interface

uses
  SysUtils, Classes, Controls, DBGridEh, Forms ,Messages ,
   DB,Windows,TemporaryTransactionsFormImpl;


type
  ENoDepositSelected = class(Exception);


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
  procedure RefreshWithSavely(SaveType :Boolean);
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
   raise ENoDepositSelected.Create('Щеч бир Дерозит сечилмяйиб !');
  Result := CommonGrid.DataSource.DataSet.FieldByName('ID').AsInteger;
end;

procedure RefreshWithSavely(SaveType :Boolean);
var SaveID : Integer;
begin
   CommonGrid.SelectedRows.Clear;
   with CommonGrid,DataSource,DataSet do
   begin
      SaveID := Get_SelectedContID;
      Refresh;
      Locate('ID',SaveID,[]);
   end;
end;

function Get_SelectedContNo : String;
begin
  if CommonGrid.DataSource.DataSet.FieldByName('ID').IsNull then
   raise ENoDepositSelected.Create('Щеч бир Дерозит сечилмяйиб !');
  Result := CommonGrid.DataSource.DataSet.FieldByName('Contractno').AsString;
end;

function TrDelayed_Show(AOwner : TComponent;SCaption : String = '') : Boolean;
begin
  with TTransactionsViewForm.Create(AOwner) do
  try
    if  SCaption <> '' then
      Localizer.Caption := SCaption;
    Result := ShowModal = mrOk;
    Update;
  finally
    Release
  end;
end;

end.
 
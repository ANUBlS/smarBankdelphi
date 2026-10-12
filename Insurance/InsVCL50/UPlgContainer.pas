unit UPlgContainer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, OleCtrls,
  SBPlgAx50_TLB, AxLoader, Buttons;

const
   WM_ModalResult = WM_USER+139;

type
  TfmContainer = class(TForm) //, IUIObject, IParamInput
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FOleObject : TOleControl;
  procedure AppMessage(var Msg: TMsg; var Handled: Boolean);
    procedure PutParam(const Name: String; Value: Variant);
    procedure ObjectActivate();
    procedure SetParams(Params : TStringList);
    procedure OleResize();
    procedure SetCaption;
    procedure SetOwner(val : Integer);
    procedure WMModalResult(var Msg : TMessage); message WM_ModalResult;
    procedure bagla();
    { Private declarations }
  public
    procedure OpenObj(ObjGuid : TGUID; Params : TStringList);
    { Public declarations }
  end;


implementation




{$R *.DFM}
procedure TfmContainer.WMModalResult(var Msg : TMessage);
begin
  case Msg.Msg of
    WM_ModalResult :  ModalResult := Msg.wParam;
  end;
end;

procedure TfmContainer.AppMessage(var Msg: TMsg; var Handled: Boolean);
begin
  case Msg.message of
    WM_ModalResult :  ModalResult := Msg.wParam;
  end;
end;

procedure TfmContainer.PutParam(const Name: String; Value: Variant);
var
  ParamInput: IParamInput;
begin
  if IUnknown(TVarData(FOleObject.OleObject).VUnknown).QueryInterface(
    IID_IParamInput, ParamInput) = S_OK
  then
    ParamInput.Params[Name] := Value;
end;

procedure TfmContainer.ObjectActivate();
var
   vObject : IUIObject;
begin
  if IUnknown(TVarData(FOleObject.OleObject).VUnknown).QueryInterface(
    IID_IUIObject, vObject) = S_OK
  then
    vObject.Activate();
end;

procedure TfmContainer.OleResize();
var
   vObject : IUIObject;
begin
  if IUnknown(TVarData(FOleObject.OleObject).VUnknown).QueryInterface(
    IID_IUIObject, vObject) = S_OK
  then begin
    Height := vObject.Get_Height();
    Width  := vObject.Get_Width();
  end;

end;

procedure TfmContainer.SetParams(Params : TStringList);
var i : Integer;
begin
 with Params do
 for i :=0 to Params.Count-1 do
  PutParam( Names[i], Values[Names[i]]);
end;

procedure TfmContainer.bagla();
begin
 close;
end;

procedure TfmContainer.SetCaption;
var
   vObject : ISBPlgAc50BufferForm;
begin
  if IUnknown(TVarData(FOleObject.OleObject).VUnknown).QueryInterface(
    IID_ISBPlgAc50BufferForm, vObject) = S_OK
  then
    Caption := vObject.Get_Caption();


end;

//function  Get_Owner:Integer; safecall;
procedure TfmContainer.SetOwner(val : Integer);
var
   vObject : ISBPlgAc50BufferForm;
begin
  if IUnknown(TVarData(FOleObject.OleObject).VUnknown).QueryInterface(
    IID_ISBPlgAc50BufferForm, vObject) = S_OK
  then
    vObject.Set_Owner(Val);

end;


procedure TfmContainer.OpenObj(ObjGuid : TGUID; Params : TStringList);
begin
  FOleObject := TActiveFormX.CreateObject(Self, ObjGuid, IUnknown);
  SetParams(Params);
  SetOwner(handle);
  ObjectActivate();
  OleResize();
  SetCaption();
  with FOleObject do
  begin
    Parent := Self;
    Align := alClient;
  end;
end;


procedure TfmContainer.FormCreate(Sender: TObject);
begin
  Application.OnMessage := AppMessage;
end;

procedure TfmContainer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FOleObject.Free;
  Action := caFree

end;

end.

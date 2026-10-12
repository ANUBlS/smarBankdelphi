unit NewDepositsFrmWRGroupsImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WordXP, OleServer, StdCtrls, Mask, DBCtrlsEh, DBLookupEh, Buttons,
  ExtCtrls, ImgList, ActnList, Grids, XDBGrids, XFSCtrls;

type
  TNewDepositsFrmWRGroups = class(TForm)
    XFPanel1: TXFPanel;
    XFPanel2: TXFPanel;
    XDBGridContractType: TXDBGrid;
    XFPanel3: TXFPanel;
    XFPanel4: TXFPanel;
    XDBGridAllContract: TXDBGrid;
    XFPanel5: TXFPanel;
    XDBGridSelectedContract: TXDBGrid;
    XFButton1: TXFButton;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActnCloseExecute(Sender: TObject);
    procedure XDBGridAllContractDblClick(Sender: TObject);
    procedure XDBGridSelectedContractDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure XDBGridContractTypeKeyPress(Sender: TObject; var Key: Char);
    procedure XDBGridAllContractKeyPress(Sender: TObject; var Key: Char);
    procedure XDBGridSelectedContractKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure XDBGridSelectedContractKeyPress(Sender: TObject; var Key: Char);
    procedure XFButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    TemplID :Integer;
  end;

var
  NewDepositsFrmWRGroups: TNewDepositsFrmWRGroups;

  procedure exportproc(S:String);export;

implementation

{$R *.DFM}
uses NewDepositsDMWRGroupsImpl,NewCommonDeclsImpl,SBTranslateProc,sboapiDataModuleimpl;

procedure exportproc(S:String);export;
begin
  NewDepositsFrmWRGroups.ShowModal
end;
exports
   exportproc;

procedure TNewDepositsFrmWRGroups.ActnCloseExecute(Sender: TObject);
begin
   Close;
end;

procedure TNewDepositsFrmWRGroups.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False;
end;

procedure TNewDepositsFrmWRGroups.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with NewDepositsDMWRGroups do
   begin
      DMtypes.Close;
      DmWrGroups.Close;
      DmWrTemplates.Close;
   end;
end;

procedure TNewDepositsFrmWRGroups.FormCreate(Sender: TObject);
begin
   NewDepositsDMWRGroups := TNewDepositsDMWRGroups.Create(Self);
   SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TNewDepositsFrmWRGroups.FormDestroy(Sender: TObject);
begin
  NewDepositsDMWRGroups.Free;
end;

procedure TNewDepositsFrmWRGroups.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Ord(Key) = VK_ESCAPE then close
end;

procedure TNewDepositsFrmWRGroups.FormShow(Sender: TObject);
begin
   with NewDepositsDMWRGroups do
   begin
      DMtypes.Open;
      DmWrGroups.Open;
      DmWrTemplates.Open;
   end;
end;
procedure TNewDepositsFrmWRGroups.XDBGridAllContractDblClick(Sender: TObject);
begin
  with NewDepositsDMWRGroups do
  begin
    dm_rpdepository.CallProcedure('DmWrGroupAdd',[ DMtypes.FieldByName('ID').AsInteger
                                                  ,DmWrTemplates.FieldByName('ID').AsInteger
                                                 ]);
    DmWrGroups.Refresh;
  end;

end;

procedure TNewDepositsFrmWRGroups.XDBGridAllContractKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
      XDBGridAllContractDblClick(Sender);
   if key=#27 then
   begin
      Close;
      key:=#0;
   end;
end;

procedure TNewDepositsFrmWRGroups.XDBGridContractTypeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#27 then
  begin
    Close;
    key:=#0;
  end;
end;

procedure TNewDepositsFrmWRGroups.XDBGridSelectedContractDblClick(
  Sender: TObject);
begin
  with NewDepositsDMWRGroups do
  begin
    dm_rpdepository.CallProcedure('DmWrGroupDel',[ DMtypes.FieldByName('ID').AsInteger
                                                  ,DmWrTemplates.FieldByName('ID').AsInteger
                                                 ]);
    DmWrGroups.Refresh;
  end;
end;

procedure TNewDepositsFrmWRGroups.XDBGridSelectedContractKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key=46 then
   begin
      XDBGridSelectedContractDblClick(Sender);
      key:=0;
   end;
end;

procedure TNewDepositsFrmWRGroups.XDBGridSelectedContractKeyPress(
  Sender: TObject; var Key: Char);
begin
  if key=#27 then
   begin
     Close;
     key:=#0;
   end;

end;

procedure TNewDepositsFrmWRGroups.XFButton1Click(Sender: TObject);
begin
  Close;
end;

initialization
   NewDepositsFrmWRGroups := TNewDepositsFrmWRGroups.Create(CommonApplication);
end.

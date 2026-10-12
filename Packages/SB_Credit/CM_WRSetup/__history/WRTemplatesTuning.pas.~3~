unit WRTemplatesTuning;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Grids, DBGrids, DBGridEh, StdCtrls, Mask, DBCtrls, ToolWin,
  ComCtrls, ImgList, ActnList;

type
  TWRTemplateSetup = class(TForm)
    GroupBox1: TGroupBox;
    DBEdit1: TDBEdit;
    ActionList1: TActionList;
    ActnAddTemplate: TAction;
    ActnDelTemplate: TAction;
    ActnRefreshTemplate: TAction;
    ActnUpdatetamplate: TAction;
    ActnClose: TAction;
    DBGridEh1: TDBGridEh;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ImageList1: TImageList;
    procedure ActnAddTemplateExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActnRefreshTemplateExecute(Sender: TObject);
    procedure ActnUpdatetamplateExecute(Sender: TObject);
    procedure ActnDelTemplateExecute(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure ActnCloseExecute(Sender: TObject);
    procedure ActnDelTemplateUpdate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WRTemplateSetup: TWRTemplateSetup;

implementation

{$R *.DFM}

uses
  TemplateAddEditUnt, WRSetupDataModImpl;

procedure TWRTemplateSetup.ActnAddTemplateExecute(Sender: TObject);
resourcestring
  rsTemplateCaption = 'Yeni şablon';
var i:integer;
begin
  with WRSetupDataMod.WRTemplatesDataSet do
       Insert;
     Caption:= rsTemplateCaption;
       i:=TemplAddEditForm.ShowModal;
       if i=mrOK then
       begin
         with WRSetupDataMod.WRTemplatesDataSet do
              Refresh;
       end;
end;

procedure TWRTemplateSetup.FormCreate(Sender: TObject);
begin
  WRSetupDataMod := TWRSetupDataMod.Create(Self);
  TemplAddEditForm := TTemplAddEditForm.Create(Self);
  WRSetupDataMod.WRTemplatesDataSet.Open;
end;

procedure TWRTemplateSetup.FormDestroy(Sender: TObject);
begin

  WRSetupDataMod.WRTemplatesDataSet.CloseAll;
  TemplAddEditForm.Free;
  WRSetupDataMod.Free;

end;

procedure TWRTemplateSetup.ActnRefreshTemplateExecute(Sender: TObject);
begin
   with WRSetupDataMod.WRTemplatesDataSet do
        Refresh;
end;

procedure TWRTemplateSetup.ActnUpdatetamplateExecute(Sender: TObject);
 resourcestring
  rsUpdTemplateCaption='Şablonun redaktəsi';
 begin
    with WRSetupDataMod.WRTemplatesDataSet do
         Edit;
        Caption:=  rsUpdTemplateCaption;
         TemplAddEditForm.ShowModal;
 end;

procedure TWRTemplateSetup.ActnDelTemplateExecute(Sender: TObject);
resourcestring
     TempdeleteMsg='Silinməsinə əminsinizmi?';
begin

   if MessageDlg(
                TempdeleteMsg,
                mtConfirmation,
                [mbYes,
                mbNo],
                0) = mrYes then
    begin
      with WRSetupDataMod.WRTemplatesDataSet do
           Delete;
    end;

end;

procedure TWRTemplateSetup.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var resize: Boolean);
begin
   Resize := False;
end;

procedure TWRTemplateSetup.ActnCloseExecute(Sender: TObject);
begin
   Close;
end;

procedure TWRTemplateSetup.ActnDelTemplateUpdate(Sender: TObject);
begin
   with WRSetupDataMod.WRTemplatesDataSet do
       (Sender as TAction).Enabled := Active and (RecordCount > 0)
end;

procedure TWRTemplateSetup.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Ord(Key)=VK_ESCAPE then close;
end;

end.

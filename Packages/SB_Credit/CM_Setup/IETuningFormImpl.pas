unit IETuningFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Grids, DBGrids, ExtCtrls, Db, OracleData, StdCtrls, Menus,
  PluginPopupMenu, ImgList, ComCtrls, ToolWin;

type
  TIETuningForm = class(TForm)
    Panel1: TPanel;
    DGridCategories: TDBGrid;
    Panel3: TPanel;
    DGridLinks: TDBGrid;
    Panel2: TPanel;
    Panel5: TPanel;
    DGridLinkValues: TDBGrid;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ImageList1: TImageList;
    ToolButton5: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  IETuningForm: TIETuningForm;

implementation

{$R *.DFM}

uses
  sboapiDataModuleImpl, CommonDecls, IEAddEditFormImpl,
  IETuningDataModuleImpl, sbsystem;
  
procedure TIETuningForm.FormCreate(Sender: TObject);
begin
  IETuningDataMod := TIETuningDataMod.Create(Self);
  FrmIEAddEdit := TFrmIEAddEdit.Create(Self);
end;

procedure TIETuningForm.FormDestroy(Sender: TObject);
begin
  IETuningDataMod.Free;
  FrmIEAddEdit.Free
end;

procedure TIETuningForm.ToolButton7Click(Sender: TObject);
begin
  Close;
end;

procedure TIETuningForm.ToolButton1Click(Sender: TObject);
resourcestring
  SNLSCaption = 'Yeni.';
begin
  with FrmIEAddEdit , IETuningDataMod.LinkValuesData do
  begin
    Caption := SNLSCaption;
    Insert;
    FieldByName('BranchID').AsInteger := Get_BranchID;
   // FieldByNAme('Acc_no').AsString := IETuningDataMod.IEAccountList.FieldByName('Acc_No').AsString;
    CBBranch.KeyValue := Get_BranchID;
    ShowModal;
  end;
end;

procedure TIETuningForm.ToolButton3Click(Sender: TObject);
resourcestring
  SNLSCaption = '׀והאךעÿ.';
begin
  with FrmIEAddEdit , IETuningDataMod.LinkValuesData do
  begin
    Caption := SNLSCaption;
    Edit;
    ShowModal;
  end;
end;

procedure TIETuningForm.ToolButton5Click(Sender: TObject);
resourcestring
  SConfirmDelete = 'ֻÿüג והטל?';
begin
  if MessageDlg(SConfirmDelete,mtConfirmation,[mbYes,mbNo],0)=mrYes then
  with IETuningDataMod.LinkValuesData do
  Delete;
end;

procedure TIETuningForm.ToolButton8Click(Sender: TObject);
begin
  with IETuningDataMod do
  begin
    IEAccountList.Refresh;
    CategoriesData.Refresh;
    LinksData.Refresh;
    LinkValuesData.Refresh;
  end;
end;

initialization
  IETuningForm := TIETuningForm.Create(CommonApplication);

end.

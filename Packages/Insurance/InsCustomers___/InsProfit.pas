unit InsProfit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ImgList, ActnList, StdCtrls, Mask, DBCtrls, ExtCtrls, ToolWin,
  Grids, DBGrids,db, Buttons,SBTranslateProc;

type
  TfmBeneficary = class(TForm)
    ToolBar1: TToolBar;
    ActionList1: TActionList;
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    AInsert: TAction;
    ImageList1: TImageList;
    AEdit: TAction;
    ADelete: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ACommit: TAction;
    ToolButton4: TToolButton;
    ARefresh: TAction;
    ToolButton5: TToolButton;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ToolButton6: TToolButton;
    procedure AInsertExecute(Sender: TObject); 
    procedure AEditExecute(Sender: TObject);
    procedure ADeleteExecute(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure ACommitExecute(Sender: TObject);
    procedure ARefreshExecute(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

    
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmBeneficary: TfmBeneficary;

implementation

uses InsDataModule,sboapidatamoduleimpl;

{$R *.DFM}

procedure TfmBeneficary.AInsertExecute(Sender: TObject);
begin
     with InsDataMod, ODSBeneficiary do
       Insert;
     DBEdit1.SetFocus;  
end;

procedure TfmBeneficary.AEditExecute(Sender: TObject);
begin
    with InsDataMod, ODSBeneficiary do
      Edit;
end;

procedure TfmBeneficary.ADeleteExecute(Sender: TObject);
begin
     if MessageDlg('Информасийа силинсин ?',mtConfirmation,[mbYes,mbNo,mbCancel],0)=mrYes then
     InsDataMod.ODSBeneficiary.Delete;
end;

procedure TfmBeneficary.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then
     begin
        if HiWord(GetKeyState(VK_Shift))<>0 then
           with Sender as TControl do
           SelectNext(ActiveControl,False, True)
        else
           with Sender as TControl do
           SelectNext(ActiveControl,True, True);
        key:=#0;
     end;
end;

procedure TfmBeneficary.ACommitExecute(Sender: TObject);
begin
   with InsDataMod, ODSBeneficiary do
    if State in [dsInsert,dsEdit] then  begin
      Post;
      RefreshRecord;
    end;
end;

procedure TfmBeneficary.ARefreshExecute(Sender: TObject);
begin
   with InsDataMod, ODSBeneficiary do
    Refresh;
end;

procedure TfmBeneficary.BitBtn2Click(Sender: TObject);
begin
  with InsDataMod, ODSBeneficiary do
    Close
end;

procedure TfmBeneficary.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
  with InsDataMod, ODSBeneficiary do
       Open;
end;

procedure TfmBeneficary.BitBtn1Click(Sender: TObject);
begin
   with InsDataMod, ODSBeneficiary do
    if State in [dsInsert,dsEdit] then
      Post;
end;

end.



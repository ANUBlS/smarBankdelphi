unit FrmSetingBudgetImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrlsEh, ExtCtrls, Grids, DBGridEh,
  DBCtrls, DBGridEhGrouping, GridsEh;

type
  TBudgetSetingFr = class(TForm)
    GroupBox1: TGroupBox;
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    DBEditEh1: TDBEditEh;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button2: TButton;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    Label5: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BudgetSetingFr: TBudgetSetingFr;

implementation
 uses Dmbudgetimpl,sboapiDataModuleImpl,SBTranslateProc ;
{$R *.DFM}

procedure TBudgetSetingFr.Button2Click(Sender: TObject);
begin
close
end;

procedure TBudgetSetingFr.FormShow(Sender: TObject);
begin
ComboBox1.ItemIndex:=DMBudget.AddArt.FieldByName('status').asinteger
end;

procedure TBudgetSetingFr.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if ord(key) = VK_ESCAPE then close
end;

procedure TBudgetSetingFr.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
 resize := false
end;

procedure TBudgetSetingFr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
DMBudget.ItmDataSet.refresh ;
DMBudget.ArtDataSet.refresh ;
end;

procedure TBudgetSetingFr.FormCreate(Sender: TObject);
begin
  with DMBudget do
  begin
     ArtDatset.open;
     // ArtDatset.Edit;
     SYSDAT.open;
      ArtDatset.FieldbyName('begindat').asDateTime:= DMBudget.SYSDAT.FieldbyName('begindat').asDateTime;
      ArtDatset.FieldbyName('enddat').asDateTime:= DMBudget.SYSDAT.FieldbyName('enddat').asDateTime;
      //  ArtDatset.Post;
  end;
  SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);

  end;

end.

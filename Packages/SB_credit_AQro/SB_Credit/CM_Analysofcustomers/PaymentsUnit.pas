unit PaymentsUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Grids, DBGridEh, ExtCtrls, ComCtrls, StdCtrls, Mask,
  DBCtrls, Menus, CMExcelExport;

type
  TPaymentsForm = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    DBGridEh3: TDBGridEh;
    Panel5: TPanel;
    GroupBox4: TGroupBox;
    DBGridEh4: TDBGridEh;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    DBGridEh1: TDBGridEh;
    GroupBox3: TGroupBox;
    DBGridEh2: TDBGridEh;
    Panel6: TPanel;
    GroupBox5: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Panel7: TPanel;
    GroupBox6: TGroupBox;
    GroupBox10: TGroupBox;
    DBEdit4: TDBEdit;
    GroupBox9: TGroupBox;
    DBEdit3: TDBEdit;
    GroupBox11: TGroupBox;
    DBEdit5: TDBEdit;
    GroupBox12: TGroupBox;
    DBEdit6: TDBEdit;
    ExcelExportPT: TCMExcelExport;
    PopupMenuPay: TPopupMenu;
    N1: TMenuItem;
    PopupMenuTr: TPopupMenu;
    N2: TMenuItem;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PaymentsForm: TPaymentsForm;

implementation
  uses CustAnalysDataModuleImpl;
{$R *.DFM}

procedure TPaymentsForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False;
end;

procedure TPaymentsForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if ord(Key) = VK_ESCAPE then Close;
end;

procedure TPaymentsForm.N1Click(Sender: TObject);
begin
   with CustAnalysDataModule do
   begin
      with ExcelExportPT do
      begin
        Connect;
        ExportDataset(PaymentsDataSet,'Ödəmələr',true);
        Disconnect;
      end;
   end;
end;

procedure TPaymentsForm.N2Click(Sender: TObject);
begin
   with CustAnalysDataModule do
   begin
      with ExcelExportPT do
      begin
        Connect;
        ExportDataset(TrancheDataSet,'Ödəmələr',true);
        Disconnect;
      end;
   end;

end;

end.

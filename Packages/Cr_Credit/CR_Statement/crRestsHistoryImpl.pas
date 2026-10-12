unit crRestsHistoryImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGridEh, NLSLocalizer, CMExcelExport;

type
  TRestForm = class(TForm)
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    DBGridEh1: TDBGridEh;
    EExport: TCMExcelExport;
    SpeedButton2: TSpeedButton;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RestForm: TRestForm;

implementation

uses crStatementDataModule;

{$R *.DFM}

procedure TRestForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;
end;

procedure TRestForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_ESCAPE then
    Close;
end;

procedure TRestForm.SpeedButton2Click(Sender: TObject);
begin
begin
   with EExport do
   begin
      DBGridEh1.DataSource.DataSet.Last;
      Connect;
      ExportDataset(DBGridEh1.DataSource.DataSet,'qaliqlar',True);
      Disconnect;
   end;
end;
end;

end.

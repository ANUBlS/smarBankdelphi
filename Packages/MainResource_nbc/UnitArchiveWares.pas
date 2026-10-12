unit UnitArchiveWares;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  Db, OracleData, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons,
  NLSLocalizer, Mask, DBCtrls;

type
  TArchiveWares = class(TForm)
    Panel1: TPanel;
    DBGridEhArGr: TDBGridEh;
    DBGridArWares: TDBGridEh;
    BitBtnAr: TBitBtn;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnArClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ArchiveWares: TArchiveWares;
  v1_groups_id             :real;

implementation

{$R *.DFM}
uses  sboapiDataModuleImpl,UnitData;

procedure TArchiveWares.FormCreate(Sender: TObject);
begin
DataModWares.ODSGroupsAr.Active:=True;
DataModWares.ODSetArWares.Active:=True;
end;

procedure TArchiveWares.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
DataModWares.ODSGroupsAr.Active:=False;
DataModWares.ODSetArWares.Active:=False;
end;

procedure TArchiveWares.BitBtnArClick(Sender: TObject);
begin
if MessageDlg('5 фаизд€н аз оланлары архив€ эюнд€рм€й€ €минсиз?',
    mtWarning, [mbYes, mbNo],0) = mrYes then
  begin
    DataModWares.SB_MAIN_RESOURCE.CallProcedure('archive_wares',[]);
    MessageDlg('јрхив€ эюнд€рилди.', mtInformation,[mbOk], 0);
  end;
end;

end.

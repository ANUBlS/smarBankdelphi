unit UnitArchiveWares;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons,
   Mask, DBCtrls, ComCtrls;

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
    DTP_B: TDateTimePicker;
    DTP_E: TDateTimePicker;
    Label9: TLabel;
    Label10: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnArClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
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
uses  sboapiDataModuleImpl,UnitData, UnitDat, UnitWaresArSent, SBTranslateProc;

procedure TArchiveWares.FormCreate(Sender: TObject);
begin
DataModWares.ODSGroupsAr.Active:=True;
DataModWares.ODSetArWares.Active:=True;
DataModWares.ODSSumWaresAr.Active:=True;

SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TArchiveWares.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
DataModWares.ODSGroupsAr.Active:=False;
DataModWares.ODSetArWares.Active:=False;
DataModWares.ODSSumWaresAr.Active:=FAlse;
end;

procedure TArchiveWares.BitBtnArClick(Sender: TObject);
begin
if MessageDlg('5 fazidən az olanları arxivə göndərməyə əminsiniz?',
    mtWarning, [mbYes, mbNo],0) = mrYes then
  begin
    DataModWares.SB_MAIN_RESOURCE.CallProcedure('archive_wares',[]);
    MessageDlg('Arxivə göndərildi.', mtInformation,[mbOk], 0);
  end;
end;

procedure TArchiveWares.BitBtn1Click(Sender: TObject);
var
Fi_Date :TDateTime;
La_Date  :TDateTime;
begin
     Fi_Date:=Integer(Trunc(ArchiveWares.DTP_B.DateTime));
     La_Date:=Integer(Trunc(ArchiveWares.DTP_E.DateTime));
 try
 Screen.Cursor := crSQLWait;
   with DataModWares.ODSetArWares do
    begin
     SetVariable('B_DATE',Fi_Date);
     SetVariable('E_DATE',La_Date);
     Refresh;
    end;
   with DataModWares.ODSSumWaresAr do
    begin
     SetVariable('B_DATE',Fi_Date);
     SetVariable('E_DATE',La_Date);
     Refresh;
    end;
  finally
   Screen.Cursor := crDefault;
  end;
end;

procedure TArchiveWares.BitBtn2Click(Sender: TObject);
begin
ArWaresS:=TArWaresS.Create(Self);
ArWaresS.ShowModal;
end;

end.

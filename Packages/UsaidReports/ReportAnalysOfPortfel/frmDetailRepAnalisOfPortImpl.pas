unit frmDetailRepAnalisOfPortImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGridEh, ComCtrls, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, ActnList,
  CMExcelExport, Buttons, DBGridEhGrouping, GridsEh;

type
  TfrmDetailRepAnalisOfPort = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEditEh1: TDBEditEh;
    DBEditEh2: TDBEditEh;
    DBEditEh3: TDBEditEh;
    DTP: TDateTimePicker;
    MainGriddetail: TDBGridEh;
    SearchPanel: TGroupBox;
    Panel4: TPanel;
    StaticText1: TStaticText;
    EditNUMBEROFCREDIT: TEdit;
    Panel7: TPanel;
    StaticText2: TStaticText;
    EditACC_NO: TEdit;
    Panel8: TPanel;
    StaticText3: TStaticText;
    EditCUSTNAME: TEdit;
    Panel10: TPanel;
    StaticText5: TStaticText;
    EditANNUALYINTERESTRATE: TEdit;
    Panel11: TPanel;
    StaticText6: TStaticText;
    EditCREDITLINEAMOUNT: TEdit;
    BitBtnexp: TBitBtn;
    rexpdetails: TCMExcelExport;
    ActionList1: TActionList;
    ActnSearch: TAction;
    procedure BitBtnexpClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDetailRepAnalisOfPort: TfrmDetailRepAnalisOfPort;

implementation

{$R *.DFM}
uses dmReportAnalysOfPortfelImpl,SBTranslateProc,sboapiDataModuleImpl;

procedure TfrmDetailRepAnalisOfPort.BitBtnexpClick(Sender: TObject);
begin
   with rexpdetails do begin
         Connect;
         ExportDataset(MainGriddetail.DataSource.DataSet,'DetailInf',true);
         Disconnect;
   end;
end;

procedure TfrmDetailRepAnalisOfPort.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TfrmDetailRepAnalisOfPort.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
   if ord(key) = VK_ESCAPE then close;
end;

end.

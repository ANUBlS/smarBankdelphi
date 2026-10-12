unit frmDetailTurnOverDepositImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, Grids, DBGridEh,
  CMExcelExport, Buttons, DBGridEhGrouping, GridsEh;

type
  TfrmDetailTurnOverDeposit = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEditEh1: TDBEditEh;
    DBEditEh2: TDBEditEh;
    DBEditEh3: TDBEditEh;
    MainGriddetail: TDBGridEh;
    SearchPanel: TGroupBox;
    Panel7: TPanel;
    StaticText2: TStaticText;
    EditACC_NO: TEdit;
    Panel8: TPanel;
    StaticText3: TStaticText;
    EditCUSTNAME: TEdit;
    Panel10: TPanel;
    StaticText5: TStaticText;
    EditANNUALYINTERESTRATE: TEdit;
    BitBtnexp: TBitBtn;
    rexpdetailsto: TCMExcelExport;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtnexpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDetailTurnOverDeposit: TfrmDetailTurnOverDeposit;

implementation

{$R *.DFM}

uses dmReportOfturnoverDepositImpl,{SBTranslateProc,}sboapiDataModuleImpl;

procedure TfrmDetailTurnOverDeposit.FormCreate(Sender: TObject);
begin
//SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TfrmDetailTurnOverDeposit.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
   if ORD(KEY) = VK_ESCAPE then close;
end;

procedure TfrmDetailTurnOverDeposit.BitBtnexpClick(Sender: TObject);
begin
   with rexpdetailsto do begin
        Connect;
        ExportDataset(MainGriddetail.DataSource.DataSet,'DetailInf',true);
        Disconnect;
   end;
end;

end.

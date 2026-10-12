unit guaranteeImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, nlsDialogs,
  Db, OracleData, Buttons, Grids, DBGrids, Oracle, ExtCtrls, DBLookupEh,
  StdCtrls, Mask, DBCtrlsEh, DBCtrls;

type
  TFrmGuarantee = class(TForm)
    Panel2: TPanel;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    DBGrid1: TDBGrid;
    Label16: TLabel;
    DBEditEh13: TDBEditEh;
    Panel3: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label155: TLabel;
    DBEditEh8: TDBEditEh;
    Label1: TLabel;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    Panel1: TPanel;
    Label154: TLabel;
    CBPledgsorts: TDBLookupComboboxEh;
    Label28: TLabel;
    DBNumberEditEh5: TDBNumberEditEh;
    Label2: TLabel;
    DBEditEh9: TDBEditEh;
    Label3: TLabel;
    DBEditEh10: TDBEditEh;
    Label21: TLabel;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    Label5: TLabel;
    DBEditEh2: TDBEditEh;
    Label4: TLabel;
    DBDateTimeEditEh3: TDBDateTimeEditEh;
    Label6: TLabel;
    DBEditEh3: TDBEditEh;
    Label7: TLabel;
    DBEditEh4: TDBEditEh;
    Label19: TLabel;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    Label116: TLabel;
    DBEdit13: TDBEdit;
    Label152: TLabel;
    DBEdit32: TDBEdit;
    Label117: TLabel;
    DBDateTimeEditEh4: TDBDateTimeEditEh;
    Label118: TLabel;
    DBLookupComboboxEh26: TDBLookupComboboxEh;
    SpeedButton2: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGuarantee: TFrmGuarantee;
 procedure InitPlugin(s:string);export;
implementation
uses   CommonDecls , GirovImpl, GrovDataModuleImpl;

{$R *.DFM}
  procedure InitPlugin(s:string);export;
begin
   FrmGuarantee.ShowModal;
end;
exports
     InitPlugin;
procedure TFrmGuarantee.SpeedButton1Click(Sender: TObject);
begin
  FrmGirov := TFrmGirov.create(Self);
  with GrovDataMod,FrmGirov do
   begin
 if PropDataSet.RecordCount > 0 then
 begin
 AddOtherPAPERNO.RefreshList;
 showmodal  ;
 PropDataSet.Refresh;
 end;
  end
end;

procedure TFrmGuarantee.FormShow(Sender: TObject);
begin
   GrovDataMod.GirovDataSet.close;
   GrovDataMod.GirovDataSet.SetVariable('creditid',Get_SelectedCrdID);
   GrovDataMod.GirovDataSet.open;
end;

procedure TFrmGuarantee.FormCreate(Sender: TObject);
begin
  GrovDataMod := TGrovDataMod.create(Self);
end;

procedure TFrmGuarantee.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(key) = VK_ESCAPE then close
end;



procedure TFrmGuarantee.SpeedButton2Click(Sender: TObject);
begin
close
end;

procedure TFrmGuarantee.SpeedButton5Click(Sender: TObject);
begin
close
end;

procedure TFrmGuarantee.SpeedButton6Click(Sender: TObject);
resourcestring
  SConfirmDelete = 'ֻÿüג והטל?';
begin
if MessageDlg(SConfirmDelete,mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
 GrovDataMod.CRackage.CallProcedure('del_girv',['p_id', GrovDataMod.GirovDataSet.fieldbyname('id').asinteger]);
 GrovDataMod.GirovDataSet.refresh;
 end;
 GrovDataMod.PropDataSet.refresh;
end;

initialization
 FrmGuarantee := TFrmGuarantee.Create(CommonApplication);
end.

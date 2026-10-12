unit Cardsdeleted_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CMExcelExport, ImgList, StdCtrls, DBCtrls, ComCtrls, ToolWin, Grids,
  DBGrids, ExtCtrls;

type
  Tdeletedcard = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    EditCARDNUMBER: TEdit;
    EditRBSNUMBER: TEdit;
    EditFNAME: TEdit;
    EditLNAME: TEdit;
    EditCARDHOLDER: TEdit;
    EditCREDIT_LIM: TEdit;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    isertbtn: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton3: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton7: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton17: TToolButton;
    ToolButton16: TToolButton;
    ToolButton13: TToolButton;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    ToolButton21: TToolButton;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    Panel5: TPanel;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    CheckBox1: TCheckBox;
    Button1: TButton;
    ImageList1: TImageList;
    CMExcelExport1: TCMExcelExport;
    procedure ToolButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  deletedcard: Tdeletedcard;

implementation

{$R *.dfm}


uses SBTranslateProc,sboapiDataModuleImpl,Unit18;



procedure Tdeletedcard.Button1Click(Sender: TObject);
begin
if CheckBox1.Checked then
begin
  with   DataMod_CARDS     do
  begin
   card_deleteds.Close;

   card_deleteds.SetVariable('v_dat',DateTimePicker1.DateTime);
   card_deleteds.SetVariable('v_dat1',DateTimePicker2.DateTime);
   card_deleteds.open;

  end;
end;
end;

procedure Tdeletedcard.CheckBox1Click(Sender: TObject);
begin
IF CheckBox1.Checked then begin
DateTimePicker1.Enabled:=True;
DateTimePicker2.Enabled:=True;
end else begin
DateTimePicker1.Enabled:=False;
DateTimePicker2.Enabled:=False;
end;
end;

procedure Tdeletedcard.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure Tdeletedcard.ToolButton13Click(Sender: TObject);
begin
 if   panel5.Visible=false then
begin
ToolButton13.Down:=True;
Panel5.Visible:=True;
exit;
end
else

if panel5.Visible=true then
begin
ToolButton13.Down:=false;
Panel5.Visible:=false;
end;
end;

procedure Tdeletedcard.ToolButton1Click(Sender: TObject);
begin
with   DataMod_CARDS     do
  begin
   card_deleteds.Close;
   card_deleteds.open;


  end;

end;

procedure Tdeletedcard.ToolButton7Click(Sender: TObject);
begin
//DataMod_CARDS.SB_ACA.CallProcedure('CheckAdvancedObjectAccess', ['card_mexcel']);
  if not CMExcelExport1.Connected then CMExcelExport1.Connect;
  CMExcelExport1.ExportDataset(DataMod_CARDS.card_deleteds,'CARDS_DELETED',true);
  CMExcelExport1.Disconnect;
end;

end.

unit FrmCalculationimpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, ComCtrls, ImgList, ToolWin, StdCtrls, Mask,
  DBCtrls;

type
  TFrmCalculation = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    GroupBox1: TGroupBox;
    DateTimePicker1: TDateTimePicker;
    EditCONTRACT_NAME: TEdit;
    Label4: TLabel;
    Label3: TLabel;
    EditMUSTERI: TEdit;
    Label2: TLabel;
    EditAMMOUNT: TEdit;
    Label1: TLabel;
    EditCONTR_TYPE: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCalculation: TFrmCalculation;

implementation

{$R *.dfm}

uses CommanParametrs,sboapiDataModuleImpl,DmCalculationimpl, Add_Investmentimpl;
  procedure InitPlugin(s:string);export;
begin

   if s='' then
   begin
   FrmCalculation.ShowModal;
   end;

end;
exports
     InitPlugin;

procedure TFrmCalculation.FormCreate(Sender: TObject);
begin
 Add_Investment := TAdd_Investment.Create(Self);
 DmCalculation := TDmCalculation.Create(Self);
end;

procedure TFrmCalculation.FormKeyPress(Sender: TObject; var Key: Char);
begin
if ord(key)=vk_escape then  close;
end;

procedure TFrmCalculation.ToolButton11Click(Sender: TObject);
begin
Close
end;

procedure TFrmCalculation.ToolButton1Click(Sender: TObject);
begin
//Add_Investment.ShowModal;
end;

procedure TFrmCalculation.ToolButton7Click(Sender: TObject);
begin
close;
end;

initialization
 FrmCalculation :=TFrmCalculation.Create(Application);

end.

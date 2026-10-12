unit Filialinfoimpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, DBGridEhGrouping, GridsEh;

type
  TFrmFilial = class(TForm)
    GroupBox1: TGroupBox;
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFilial: TFrmFilial;

implementation
uses WRSetupDataModImpl,SBTranslateProc,sboapiDataModuleImpl;
{$R *.DFM}

procedure TFrmFilial.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize:=false;
end;

procedure TFrmFilial.FormCreate(Sender: TObject);
begin
 SBTranslateProc.TranslateAllCompForms(Self, sboapiDataModule.OrPack_SL);
end;

procedure TFrmFilial.BitBtn2Click(Sender: TObject);
begin
close
end;

procedure TFrmFilial.BitBtn1Click(Sender: TObject);
begin
WRSetupDataMod.FilialDataSet.post;
end;

end.

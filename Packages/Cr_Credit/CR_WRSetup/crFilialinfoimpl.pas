unit crFilialinfoimpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFilial: TFrmFilial;

implementation
uses crWRSetupDataModImpl;
{$R *.DFM}

procedure TFrmFilial.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize:=false;
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

unit FrmCredArchUnitImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NLSLocalizer, StdCtrls, Buttons, ComCtrls, Grids, DBGridEh;

type
  TFrmCreditArch = class(TForm)
    NLSLCredArch: TNLSLocalizer;
    PgCArch: TPageControl;
    BitBtn1: TBitBtn;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCreditArch: TFrmCreditArch;

  procedure InitPlugin(S:String);export;

implementation

{$R *.DFM}
uses CredArchDatModUnitImpl,CommonDecls;

procedure InitPlugin(S:String);export;
begin
   FrmCreditArch.ShowModal;
end;

exports
 InitPlugin;

procedure TFrmCreditArch.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key) = VK_ESCAPE Then close
end;

procedure TFrmCreditArch.BitBtn1Click(Sender: TObject);
begin
  close
end;

procedure TFrmCreditArch.FormShow(Sender: TObject);
begin
   PgCArch.ActivePageIndex := 0;
   with CredArchDatMod,DatSetCreditArchView do
   begin
     if Active then CloseAll;
     SetVariable('CrdID',Get_SelectedCrdID);
     Open;
   end;


end;

 procedure TFrmCreditArch.FormCreate(Sender: TObject);
begin
   CredArchDatMod := TCredArchDatMod.Create(Self)
end;

procedure TFrmCreditArch.FormDestroy(Sender: TObject);
begin
  CredArchDatMod.Free
end;

initialization
   FrmCreditArch := TFrmCreditArch.Create(CommonApplication)
end.

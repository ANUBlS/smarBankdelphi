unit frmTelAddressImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGridEh, StdCtrls, Buttons, DBGridEhGrouping, GridsEh;

type
  TfrmTelAddress = class(TForm)
    BitBtn1: TBitBtn;
    DBGridEh1: TDBGridEh;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTelAddress: TfrmTelAddress;

implementation

{$R *.DFM}
uses dmRepByCreditPayImpl,SBTranslateProc,sboapiDataModuleImpl;

procedure TfrmTelAddress.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := false;
end;

procedure TfrmTelAddress.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TfrmTelAddress.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Ord(Key) = VK_ESCAPE then Close
end;

end.

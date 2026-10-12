unit CreditPropertiesUnitImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, ComCtrls, Grids, DBGridEh, DBGridEhGrouping, GridsEh;

type
  TFrmCreditProperties = class(TForm)
    PCCreditProperties: TPageControl;
    BitBtn1: TBitBtn;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    TabSheet3: TTabSheet;
    DBGridEh3: TDBGridEh;
    TabSheet4: TTabSheet;
    DBGridEh4: TDBGridEh;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCreditProperties: TFrmCreditProperties;

implementation

{$R *.DFM}
uses sboapiDataModuleImpl,DatModAexUnitImpl,SBTranslateProc;

procedure TFrmCreditProperties.FormCreate(Sender: TObject);
begin

 SBTranslateProc.TranslateAllCompForms(Self, sboapiDataModule.OrPack_SL);
end;

procedure TFrmCreditProperties.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Ord(Key) = VK_ESCAPE Then close
end;

procedure TFrmCreditProperties.FormShow(Sender: TObject);
begin
PCCreditProperties.ActivePageIndex := 0;
end;

procedure TFrmCreditProperties.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False
end;

end.

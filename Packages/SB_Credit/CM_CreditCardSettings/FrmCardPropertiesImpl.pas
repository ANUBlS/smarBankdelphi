unit FrmCardPropertiesImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, Grids, DBGridEh, StdCtrls, Mask, DBCtrlsEh,
  ExtCtrls, DBCtrls, Buttons, CMHintBox, DBLookupEh;

type
  TFrmCardProperties = class(TForm)
    GroupBox1: TGroupBox;
    DBEditEh1: TDBEditEh;
    GroupBox2: TGroupBox;
    DBGridEh1: TDBGridEh;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    HBCardsProps: TCMHintBox;
    GroupBox3: TGroupBox;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCardProperties: TFrmCardProperties;

implementation

uses DMCardSettings;

{$R *.DFM}

procedure TFrmCardProperties.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False;
end;

procedure TFrmCardProperties.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Ord(Key) = VK_ESCAPE then close
end;

procedure TFrmCardProperties.BitBtn1Click(Sender: TObject);
begin
    with DMCardSeting do
    begin
         if cardsortsDESCRIPTION.IsNull then
         begin
           HBCardsProps.ShowMessage('јды сащ€си бошдур');
           Abort;
         end;
       cardsorts.Post;
       Close
    end;

end;

end.

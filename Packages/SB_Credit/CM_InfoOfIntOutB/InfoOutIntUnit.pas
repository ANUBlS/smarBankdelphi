unit InfoOutIntUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NLSLocalizer, ActnList, ImgList, Grids, DBGridEh, ExtCtrls, Buttons,
  StdCtrls,DB;

type
  TInfoOutIntMainForm = class(TForm)
    NLSLocalizer1: TNLSLocalizer;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Editsearch: TEdit;
    DBGridEh: TDBGridEh;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGridEhDblClick(Sender: TObject);
    procedure DBGridEhKeyPress(Sender: TObject; var Key: Char);
    procedure EditsearchChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InfoOutIntMainForm: TInfoOutIntMainForm;
  procedure InitPlugin(S:string); export;

implementation

{$R *.DFM}
 uses CommonDecls,InfoOutIntImpl,IntPaynentUnit;

procedure InitPlugin(S:string); export;
begin
   with InfOutIntDatMod do
   begin
      IntPlaceOutBDatSet.Open;
   end;
  InfoOutIntMainForm.ShowModal;
end;

exports
  InitPlugin;

procedure TInfoOutIntMainForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;
end;

procedure TInfoOutIntMainForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if ord(Key) = VK_ESCAPE then Close;
end;

procedure TInfoOutIntMainForm.SpeedButton2Click(Sender: TObject);
begin
Close;
end;

procedure TInfoOutIntMainForm.FormCreate(Sender: TObject);
begin
   InfOutIntDatMod := TInfOutIntDatMod.Create(Self);
   PaymentForm := TPaymentForm.Create(Self);
end;

procedure TInfoOutIntMainForm.FormDestroy(Sender: TObject);
begin
   InfOutIntDatMod.Free;
   PaymentForm.Free;
end;

procedure TInfoOutIntMainForm.SpeedButton1Click(Sender: TObject);
begin
   PaymentForm.ShowModal;
end;

procedure TInfoOutIntMainForm.DBGridEhDblClick(Sender: TObject);
begin
   PaymentForm.ShowModal;
end;

procedure TInfoOutIntMainForm.DBGridEhKeyPress(Sender: TObject;
  var Key: Char);
begin
   if ord(key) = VK_RETURN then  PaymentForm.ShowModal;
end;

procedure TInfoOutIntMainForm.EditsearchChange(Sender: TObject);
begin
  with InfOutIntDatMod.IntPlaceOutBDatSet do
    Locate('NUM',(Sender as TEdit).Text,[loCaseInsensitive, loPartialKey])
end;

initialization
    InfoOutIntMainForm := TInfoOutIntMainForm.Create(CommonApplication);

end.

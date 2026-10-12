unit UnitSD;
               
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  NLSLocalizer, ComCtrls, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, Buttons,
  CMExcelExport;

type
  TFormSD = class(TForm)
    Localizer: TNLSLocalizer;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel1: TPanel;
    ExcelExport: TCMExcelExport;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSD: TFormSD;

implementation

uses CommonDecls,DatModSDImpl,UnitProgress;

{$R *.DFM}


procedure InitPlugin(s:string);export;
begin
 FormSD.ShowModal;
end;

exports
 InitPlugin;

procedure TFormSD.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_ESCAPE then
    ModalResult := mrCancel
end;

procedure TFormSD.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;
end;

procedure TFormSD.SpeedButton1Click(Sender: TObject);
//var RCount :Integer;
begin

   with DatModSD do
   begin
     CM_SD1.CallProcedure('SD_Create',[0,1,'30-may-2005','29-jun-2005']);
     with ExcelExport do
     begin
       Connect;
       ExportDataset(Rests,'Qaliq',true);
       Disconnect;
     end;
   end;

end;

procedure TFormSD.FormCreate(Sender: TObject);
begin
   DatModSD := TDatModSD.Create(self);
   DatModSD.Rests.Open;
   FormProgress := TFormProgress.Create(self);
end;

procedure TFormSD.FormDestroy(Sender: TObject);
begin
   DatModSD.Rests.CloseAll;
   DatModSD.Free;
   FormProgress.Free;
end;

procedure TFormSD.SpeedButton2Click(Sender: TObject);
begin
   Close;
end;

initialization
FormSD := TFormSD.Create(CommonApplication);
end.

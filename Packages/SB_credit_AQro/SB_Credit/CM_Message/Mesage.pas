unit Mesage;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, jpeg, ExtCtrls, Db, OracleData, CMExcelExport;

type
  TFrmMessage = class(TForm)
    Setup_: TImage;
    Setup: TImage;
    Setup_1: TImage;
    Setup1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Setup_Click(Sender: TObject);
    procedure SetupMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Setup1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SetupClick(Sender: TObject);
    procedure Setup_1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
   
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMessage: TFrmMessage;
procedure InitPlugin(s:string);export;
implementation

uses CommonDecls , FrmMsgImpl;
{$R *.DFM}

procedure InitPlugin(s:string);export;
begin
   FrmMessage.ShowModal;
end;
exports
     InitPlugin;

procedure TFrmMessage.FormCreate(Sender: TObject);
var
region: HRgn;
begin

  { koselerden 25 pixel keser }
 //region:=CreateRoundRectRgn(1, 1, 300, 120, 25, 25);
 // SetWindowRgn(handle, region, true);

end;

procedure TFrmMessage.Button1Click(Sender: TObject);
begin
close
end;

procedure TFrmMessage.Setup_Click(Sender: TObject);
begin
close
end;

procedure TFrmMessage.SetupMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 Setup.Visible:=false;
 Setup_.Visible:=true;
end;

procedure TFrmMessage.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   Setup_.Visible:=false;
   Setup.Visible:=true;
    Setup1.Visible:=true;
    Setup_1.Visible:=false;
end;

procedure TFrmMessage.Setup1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 Setup1.Visible:=false;
 Setup_1.Visible:=true;
end;

procedure TFrmMessage.SetupClick(Sender: TObject);
begin
close
end;


procedure TFrmMessage.Setup_1Click(Sender: TObject);
begin
 FrmMsg := TFrmMsg.create(Self);
 FrmMsg.ShowModal;
 close;
 { OracleDataSet1.Open;
  OracleDataSet2.Open;
   with ExcelExport do
   begin
      Connect;
      ExportDataset(OracleDataSet2,'sistem tarixinden kicik',true);
      ExportDataset(OracleDataSet1,'iki aydan az qalmish',true);
      Disconnect;
   end;
   close; }
end;

procedure TFrmMessage.Timer1Timer(Sender: TObject);
begin
{Timer1.Enabled:= true;
Timer2.Enabled:= false; }
if Label1.Visible=true then
begin
 Label1.Visible:=false  ;
 Label2.Visible:=false  end else
 begin
  Label1.Visible:=true;
   Label2.Visible:=true ;
   end;
end;

procedure TFrmMessage.FormKeyPress(Sender: TObject; var Key: Char);
begin
if (ord(key))=13 then
close
end;

initialization
   FrmMessage := TFrmMessage.Create(CommonApplication);

end.

unit FormIntervalLmpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XFSCtrls, ExtCtrls, ComCtrls;

type
  TFormInterval = class(TForm)
    XFPanel1: TXFPanel;
    XFPanel2: TXFPanel;
    XFGroupBox1: TXFGroupBox;
    XFLabel1: TXFLabel;
    XFLabel2: TXFLabel;
    XFButton1: TXFButton;
    XFButton2: TXFButton;
    Begin_Dat: TDateTimePicker;
    End_dat: TDateTimePicker;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure XFButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormInterval: TFormInterval;

implementation

uses UnitDataModPCustService,SBTranslateProc, sboapiDataModuleImpl;
{$R *.dfm}

procedure TFormInterval.FormCreate(Sender: TObject);
begin
DataModPCustService.memorial_date.Open;
  Begin_dat.DateTime := DataModPCustService.ODS_SYSDATE.fieldbyname
    ('tek_dat').asdatetime;
  End_dat.DateTime := DataModPCustService.ODS_SYSDATE.fieldbyname
    ('tek_dat').asdatetime;
   SBTranslateProc.TranslateAllCompForms(Self, sboapiDataModule.OrPack_SL);
end;

procedure TFormInterval.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key) = 27 then
    Close;
end;

procedure TFormInterval.FormShow(Sender: TObject);
begin
ActiveControl := Begin_dat;
end;

procedure TFormInterval.XFButton1Click(Sender: TObject);
var
  S_date: Tdatetime;
  E_date: Tdatetime;
begin
  S_date := Trunc(Begin_dat.DateTime);
  E_date := Trunc(End_Dat.DateTime);
  DataModPCustService.OPackage.CallProcedure('ins_date', [S_date, E_date]);
  DataModPCustService.memorial_date.refresh;

end;

end.

unit DateIntervalUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Spin;

type
  TFrmDateInterval = class(TForm)
    SEDateTrack: TSpinEdit;
    DateTrack: TTrackBar;
    BtnOk: TButton;
    BtnCancel: TButton;
    procedure SEDateTrackChange(Sender: TObject);
    procedure DateTrackChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DateTrackKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDateInterval: TFrmDateInterval;

implementation

uses UntReferencesDataMod,SBTranslateProc,sboapiDataModuleimpl;

{$R *.DFM}

procedure TFrmDateInterval.SEDateTrackChange(Sender: TObject);
begin
  DateTrack.Position := SEDateTrack.Value;
end;

procedure TFrmDateInterval.DateTrackChange(Sender: TObject);
begin
  SEDateTrack.Value := DateTrack.Position;
end;

procedure TFrmDateInterval.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TFrmDateInterval.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    BtnCancel.Click
end;

procedure TFrmDateInterval.DateTrackKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    BtnOk.Click
end;

end.

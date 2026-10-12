unit CourtInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls;

type
  TFormCourtInfo = class(TForm)
    DBMemo1: TDBMemo;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCourtInfo: TFormCourtInfo;

implementation

uses UnitDataModuleCourt;

{$R *.dfm}

procedure TFormCourtInfo.BitBtn1Click(Sender: TObject);
begin
  if DBMemo1.Text='' then
  begin
    ShowMessage('Məlumat sahəsi boşdur!');
    exit;
  end;

  DataModuleCourt.ODSInfo.post;
  DataModuleCourt.ODSInfo.refresh;
  close;

end;

procedure TFormCourtInfo.BitBtn2Click(Sender: TObject);
begin
  close
end;

end.

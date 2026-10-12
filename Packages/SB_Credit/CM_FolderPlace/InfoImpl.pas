unit InfoImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons;

type
  TFrmInfo = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBMemo1: TDBMemo;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmInfo: TFrmInfo;

implementation

{$R *.dfm}
uses FlReCalculationDataModuleImpl;


procedure TFrmInfo.BitBtn1Click(Sender: TObject);
begin
if DBMemo1.Text='' then
begin
ShowMessage('Məlumat sahəsi boşdur!');
exit;
end;

PRDataModule.OracleDataSet4.post;
PRDataModule.OracleDataSet4.refresh;
close;
end;

procedure TFrmInfo.BitBtn2Click(Sender: TObject);
begin

close;
end;

procedure TFrmInfo.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize:=false
end;

procedure TFrmInfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
PRDataModule.OracleDataSet4.close;
PRDataModule.OracleDataSet4.open;
end;

end.

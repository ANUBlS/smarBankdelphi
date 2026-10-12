unit COPYCLASS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, DBViewComboBox;

type
  TCLSCOPY = class(TForm)
    Button1: TButton;
    Button2: TButton;
    clsnew: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    clsold: TDBViewComboBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CLSCOPY: TCLSCOPY;

implementation

uses AdministrationDataModule;

{$R *.DFM}

procedure TCLSCOPY.Button1Click(Sender: TObject);
begin
close;
end;

procedure TCLSCOPY.Button2Click(Sender: TObject);
begin

if (clsold.text='') or (clsnew.text='') then ShowMessage('Köhnə və yeni sinfi yazın') else
begin
if MessageDlg('Sinfin kopyasi yaradilsin?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin
 AdministrationData.pcADM.CallProcedure('copyclass',[clsold.text,clsnew.text]);
 AdministrationData.Classesdata.close;
 AdministrationData.Classesdata.Open;


end
else exit;

end;

end;

end.

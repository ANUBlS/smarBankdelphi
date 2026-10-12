unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TntStdCtrls;

type
  TForm1 = class(TForm)
    TntEdit1: TTntEdit;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    eDIT1: TTntEdit;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button2Click(Sender: TObject);
begin
  Memo1.Lines.SaveToFile('C:\Unicode.txt')
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  S: String;
  WS : WideString;
begin
  S := Edit1.Text;
  WS := TntEdit1.Text;
  Memo1.Lines.Add(IntToStr(ORD(ws[1]))+' - '+IntToStr(ORD(S[1])));
  Edit1.Text :='';
  TntEdit1.Text :='';

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Memo1.Lines.LoadFromFile('C:\Unicode.txt')
end;

end.

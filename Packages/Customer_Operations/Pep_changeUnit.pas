unit Pep_changeUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, IdHTTP, IdSSLOpenSSL,IdURI,
  Dialogs, StdCtrls, ExtCtrls;

type
  TPep_change = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Memo1: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Pep_change: TPep_change;

implementation
uses customers_operation_impl;

{$R *.dfm}

procedure TPep_change.Button1Click(Sender: TObject);
var
  Http: TIdHTTP;
  ResponseText,URL: string;
  name,last_name :string;
begin
   {Http := TIdHTTP.Create(nil);
  try
    try

    name:=P_DataModule.convertpack.CallstringFunction('CONVERT_INT',[ edit1.Text]);
        last_name:=P_DataModule.convertpack.CallstringFunction('CONVERT_INT',[ edit2.Text]) ;
        URL := 'http://localhost:5000/api/match?' +
               'name=' + name +
               '&surname=' +last_name;

        ResponseText := Http.Get(URL);


        Memo1.Lines.Add('Response: ' + ResponseText);


        if Memo1.Lines.Count>2 then
  begin
    ShowCustomMessage;
   end;


    except
      on E: Exception do
        ShowMessage('Xəta: ' + E.Message);
    end;
  finally
    Http.Free;
  end;
       }
end;

procedure TPep_change.Button2Click(Sender: TObject);
begin
pep_chek:=-1;
Pep_change.close;
end;

end.

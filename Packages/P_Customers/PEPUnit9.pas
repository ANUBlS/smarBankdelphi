unit PEPUnit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,  IdHTTP, IdSSLOpenSSL,IdURI,
  Dialogs, StdCtrls, ExtCtrls,phy_cust_Unit;


type
  TPep_change = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
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

uses P_Datamod_Unit, P_CO_Cust;

{$R *.dfm}

procedure ShowCustomMessage;
var
  F: TForm;
  L: TLabel;
begin
  F := TForm.Create(nil);
  try
    F.Caption := 'Xəbərdarlıq';
    F.Width := 500;
    F.Height := 80;
    F.Position := poScreenCenter;
    F.BorderStyle := bsDialog;

    L := TLabel.Create(F);
    L.Parent := F;
    L.Caption := 'Diqqət! Aidiyyatı şöbəyə müraciət edin!';
    L.Font.Size := 14;         // Böyük şrift
    L.Font.Color := clRed;     // Qırmızı rəng
    L.Font.Style := [fsBold];  // Qalın şrift
    L.AutoSize := True;
    L.Left := 40;
    L.Top := 20;

    F.ShowModal;
  finally
    F.Free;
  end;
end;



procedure TPep_change.Button1Click(Sender: TObject);
var
  Http: TIdHTTP;
  ResponseText,URL: string;
  name,last_name :string;
begin
 Http := TIdHTTP.Create(nil);
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


end;

procedure TPep_change.Button2Click(Sender: TObject);
begin
pep_chek:=-1;
Pep_change.close;
end;

end.

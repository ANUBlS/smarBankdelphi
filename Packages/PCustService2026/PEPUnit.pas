unit PEPUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,  IdHTTP, IdSSLOpenSSL,IdURI,
  Dialogs, StdCtrls, ExtCtrls,IOUtils,ShlObj,SHDocVw,ShellAPI, OleCtrls, DB,
  OracleData;

type
  TPep_change = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    OracleDataSet1: TOracleDataSet;
    OracleDataSet1TAX_REGCODE: TWideStringField;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Pep_change: TPep_change;

implementation

uses UnitDataModPCustService,PCustServiceFormImpl1,Printers,sboapiDataModuleImpl;

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
  ResponseText,URL,URL1: string;
  name,last_name :string;
begin
 Http := TIdHTTP.Create(nil);
  try
    try

    name:=DataModPCustService.convertpack.CallstringFunction('CONVERT_INT',[ edit1.Text]);
    last_name:=DataModPCustService.convertpack.CallstringFunction('CONVERT_INT',[ edit2.Text]) ;
       // URL :=   'http://172.20.210.18:5000/api/match?'+
           URL := OracleDataSet1TAX_REGCODE.AsString+
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
  edit1.Clear;
  edit2.Clear;

end;

procedure TPep_change.Button2Click(Sender: TObject);
begin
  if edit1.Text<>'' then
   PCustServiceForm.EditFirstName.text:=edit1.Text;
  if edit2.Text<>'' then
   PCustServiceForm.EditLastName.text:=edit2.Text;

edit1.Clear;
edit2.Clear;
memo1.Clear;
Pep_change.Close;

end;


procedure TPep_change.FormClose(Sender: TObject; var Action: TCloseAction);
begin
edit1.Clear;
edit2.Clear;
memo1.Clear;
end;

procedure TPep_change.FormCreate(Sender: TObject);
begin
OracleDataSet1.Open;
end;

end.

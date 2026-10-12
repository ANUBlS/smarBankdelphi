unit UnitPrintWb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, OleCtrls, SHDocVw, ComCtrls,MSHTML, Buttons;

type
  TPrinting = class(TForm)
    WebBrowser1: TWebBrowser;
    Panel1: TPanel;
    ButtonPrint: TButton;
    Button1: TButton;
    prt: TRichEdit;
    procedure ButtonPrintClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Printing: TPrinting;

implementation

{$R *.dfm}

procedure TPrinting.BitBtn1Click(Sender: TObject);
const
  HTMLContent: string =
    '<!DOCTYPE html>' +
    '<html>' +
    '<head>' +
    '    <title>Delphi WebBrowser Example</title>' +
    '    <script>' +
    '        function changeText() {' +
    '            document.getElementById("message").innerText = "Hello from JavaScript!";' +
    '        }' +
    '    </script>' +
    '</head>' +
    '<body>' +
    '    <h1 id="message">Welcome</h1>' +
    '    <button onclick="changeText()">Click Me</button>' +
    '</body>' +
    '</html>';
var
  Doc: IHTMLDocument2;
begin
 {
  WebBrowser1.Navigate('about:blank');
  while WebBrowser1.ReadyState <> READYSTATE_COMPLETE do
    Application.ProcessMessages;

  // Access the document object
  Doc := WebBrowser1.Document as IHTMLDocument2;

  // Write the HTML content into the WebBrowser
  if Assigned(Doc) then
  begin
    Doc.open('text/html', '_self', '', '');
    Doc.write(HTMLContent);
    Doc.close;
  end;
       }
end;

procedure TPrinting.Button1Click(Sender: TObject);
begin
close;
end;

procedure TPrinting.ButtonPrintClick(Sender: TObject);
var vaIn, vaOut: OleVariant;
begin
  WebBrowser1.ControlInterface.ExecWB(OLECMDID_PRINT, OLECMDEXECOPT_PROMPTUSER,    vaIn, vaOut)
end;

procedure TPrinting.FormActivate(Sender: TObject);

var Doc: Variant;
begin
      if NOT Assigned(webBrowser1.Document) then
    webBrowser1.Navigate('about:blank');


  Doc :=WebBrowser1.Document as IHTMLDocument2;;
  Doc.Clear;
  Doc.open('text/html', '_self', '', '');
  Doc.charset := 'UTF-8';
  Doc.Write(prt.Text);
  Doc.Close;
end;

procedure TPrinting.FormCreate(Sender: TObject);
 var Doc: OleVariant;
begin
 { // Ensure the WebBrowser component is initialized
  if not Assigned(WebBrowser1.Document) then
    WebBrowser1.Navigate('about:blank');

  // Wait for the browser to be ready
  while WebBrowser1.ReadyState <> READYSTATE_COMPLETE do
    Application.ProcessMessages;

  // Access the document
  Doc := WebBrowser1.Document as IHTMLDocument2;

  // Clear the existing content
  Doc.open('text/html', '_self', EmptyParam, EmptyParam);

  // Write the new HTML content
  Doc.write(VarArrayOf([prt.Text]));

  // Close the document to finalize changes
  Doc.close; }
end;

end.

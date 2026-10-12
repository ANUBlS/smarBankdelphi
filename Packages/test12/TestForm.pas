unit TestForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormAdi = class(TForm)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAdi: TFormAdi;
 //deysen:string;
implementation

{$R *.dfm}
  procedure InitPlugin(s:string);export;
begin
  // deysen:=custid;
   FormAdi.ShowModal;
end;
exports
     InitPlugin;
end.

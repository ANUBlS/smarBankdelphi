unit Add_Investmentimpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, CurrencyEdit, Mask, DBCtrls, ExtCtrls;

type
  TAdd_Investment = class(TForm)
    Panel1: TPanel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Add_Investment: TAdd_Investment;

implementation

{$R *.dfm}
uses CommanParametrs,sboapiDataModuleImpl,DmCalculationimpl,FrmCalculationimpl;

procedure TAdd_Investment.FormKeyPress(Sender: TObject; var Key: Char);
begin
if ord(key)=vk_escape then  close;
end;

end.

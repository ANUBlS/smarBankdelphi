unit NewFormCreditImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, XFSCtrls, Grids, XDBGrids, ExtCtrls;

type
  TFormCredit = class(TForm)
    XFPanel1: TXFPanel;
    XDBGrid1: TXDBGrid;
    XFPanel2: TXFPanel;
    XFBitBtn1: TXFBitBtn;
    procedure FormShow(Sender: TObject);
    procedure XFBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCredit: TFormCredit;

implementation

{$R *.dfm}
uses   sboapiDataModuleImpl,NewDepositsContractImpl, NewFormDepositContractImpl,NewContractCommonDecls;

procedure TFormCredit.FormShow(Sender: TObject);
begin
  With NewDataModDepositsContract do begin
                                       CreditContractno.Close;
                                       CreditContractno.SetVariable('contractid',DepositPorpsSID.AsInteger);
                                       CreditContractno.Open;
                                      end;

end;

procedure TFormCredit.XFBitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.

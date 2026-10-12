unit paymentsett;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids;

type
  TPaymentset = class(TForm)
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Paymentset: TPaymentset;

implementation

uses Unit18;

{$R *.dfm}

procedure TPaymentset.FormShow(Sender: TObject);
begin
DataMod_CARDS.Card_vidop.Open;


end;

end.

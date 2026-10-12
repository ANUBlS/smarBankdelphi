unit QRepIncExpUnit;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TQRepIncExp = class(TQuickRep)
    QRBand1: TQRBand;
    CompName: TQRLabel;
  private

  public

  end;

var
  QRepIncExp: TQRepIncExp;

implementation

uses IncExpensesImpl;
{$R *.DFM}

end.

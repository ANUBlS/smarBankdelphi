unit QuickRepImpl;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, QRExport;

type
  TQuickReport2 = class(TQuickRep)
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
  private

  public

  end;

var
  QuickReport2: TQuickReport2;

implementation

{$R *.DFM}

end.

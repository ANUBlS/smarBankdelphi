unit UnitRep;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TQRep = class(TQuickRep)
    QRSubDetail: TQRSubDetail;
  private

  public

  end;

var
  QRep: TQRep;

implementation

{$R *.DFM}

end.

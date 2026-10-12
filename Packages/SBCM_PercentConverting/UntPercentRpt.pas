unit UntPercentRpt;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TPercentRpt = class(TQuickRep)
  private

  public

  end;

var
  PercentRpt: TPercentRpt;

implementation

uses
   PercentConvertingDataModule;

{$R *.DFM}

end.

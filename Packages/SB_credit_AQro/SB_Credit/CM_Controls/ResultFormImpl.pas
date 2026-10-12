unit ResultFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NLSLocalizer, StdCtrls, Buttons, ExtCtrls, DBCtrls;

type
  TFormResult = class(TForm)
    NLSLocalizer1: TNLSLocalizer;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    CDBMemo: TDBMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormResult: TFormResult;

implementation

{$R *.DFM}
uses ControlDatModImpl;

end.

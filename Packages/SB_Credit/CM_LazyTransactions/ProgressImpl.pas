unit ProgressImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls;

type
  TTransactionProgForm = class(TForm)
    ProgressTr: TProgressBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TransactionProgForm: TTransactionProgForm;

implementation

{$R *.DFM}

end.

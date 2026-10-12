unit RepUpdateForm_unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, SearchEdit;

type
  TFrmUpdate = class(TForm)
    SearchEdit1: TSearchEdit;
    SearchEdit2: TSearchEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUpdate: TFrmUpdate;

implementation

{$R *.DFM}

end.

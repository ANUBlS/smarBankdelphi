unit CreditStateViewImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NLSLocalizer, ExtCtrls, Grids, DBGridEh;

type
  TfrmStateViewer = class(TForm)
    NLSLocalizer1: TNLSLocalizer;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStateViewer: TfrmStateViewer;

implementation

uses AEDataModuleImpl;



{$R *.DFM}

end.

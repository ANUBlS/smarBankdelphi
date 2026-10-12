unit TransacationManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, XFSCtrls, ExtCtrls, Grids, XDBGrids, ComCtrls,
  ToolWin;

type
  TFormTransacationManager = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    XFPanel1: TXFPanel;
    XFPanel2: TXFPanel;
    XDBGrid1: TXDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTransacationManager: TFormTransacationManager;
  procedure InitPlugin(s:string);export;
implementation
uses   CommonDecls ;
{$R *.dfm}
 procedure InitPlugin(s:string);export;
begin
   FormTransacationManager.ShowModal;
end;
exports
     InitPlugin;

initialization
 FormTransacationManager := FormTransacationManager.Create(CommonApplication);

end.

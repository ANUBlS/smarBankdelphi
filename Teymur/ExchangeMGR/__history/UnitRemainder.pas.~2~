unit UnitRemainder;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGridEh;

type
  TFormRemainder = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    DBGridEh1: TDBGridEh;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRemainder: TFormRemainder;

implementation
    uses UnitDateExch,sboapiDataModuleImpl, SBTranslateProc;
{$R *.DFM}

procedure TFormRemainder.FormCreate(Sender: TObject);
begin
 SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

end.

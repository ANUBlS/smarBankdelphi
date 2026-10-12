unit MISProgressFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  TMISProgressForm = class(TForm)
    ProgressShower: TProgressBar;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MISProgressForm: TMISProgressForm;

implementation
       uses sboapiDataModuleImpl, SBTranslateProc;
{$R *.DFM}

procedure TMISProgressForm.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

end.

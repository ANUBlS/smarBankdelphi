unit MainUnitImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NLSLocalizer;

type
  TMainForm = class(TForm)
    Localizer: TNLSLocalizer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses DataModuleImpl, CommonDecls, SystemState;

{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  ActvDataMod := TActvDataMod.Create(Self);
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  ActvDataMod.Free
end;

initialization
  MainForm := TMainForm.Create(CommonApplication);
   
end.

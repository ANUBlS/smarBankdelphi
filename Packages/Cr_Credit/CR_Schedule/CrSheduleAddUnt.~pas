unit SheduleAddUnt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NLSLocalizer, StdCtrls, Mask, DBCtrlsEh;

type
  TAddEditForm = class(TForm)
    Localizer: TNLSLocalizer;
    StaticText1: TStaticText;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    StaticText2: TStaticText;
    DBEditEh1: TDBEditEh;
    StaticText3: TStaticText;
    DBEditEh2: TDBEditEh;
    Button1: TButton;
    Button2: TButton;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CheckOperation : Boolean;
  public
    { Public declarations }
  end;

var
  AddEditForm: TAddEditForm;

implementation

uses ScheduleDataModuleImpl, ScheduleMainFormImpl;

{$R *.DFM}

procedure TAddEditForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;
end;

procedure TAddEditForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_ESCAPE then
  Close; 
end;

procedure TAddEditForm.Button2Click(Sender: TObject);
begin
  CheckOperation := False;
end;

procedure TAddEditForm.Button1Click(Sender: TObject);
begin
  CheckOperation := True
end;

procedure TAddEditForm.FormShow(Sender: TObject);
begin
   CheckOperation := False
end;

procedure TAddEditForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if not CheckOperation then
   with ScheduleDataModule,ScheduleData do
        CancelUpdates;
end;

end.

unit ModulePropsForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, HintBox;

type
  TModulePropsForm = class(TForm)
    GroupBox1: TGroupBox;
    NameEdit: TEdit;
    DescriptionEdit: TEdit;
    Label1: TLabel;
    DescriptionLabel: TLabel;
    OkButton: TButton;
    CancelButton: TButton;
    ErrorHintBox: THintBox;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FModuleName: String;
    FDescription: String;
    FCommited: Boolean;
    procedure SetModuleName(const Value: String);
    procedure SetDescription(const Value: String);
  public
    { Public declarations }
    property ModuleName: String read FModuleName write SetModuleName;
    property Description: String read FDescription write SetDescription;
    function View: Boolean;
  end;

var
  ModulePropsForm: TModulePropsForm;

implementation

{$R *.DFM}

procedure TModulePropsForm.OkButtonClick(Sender: TObject);
begin
  if NameEdit.Text = '' then
  begin
    ErrorHintBox.Control := NameEdit;
    ErrorHintBox.ShowMessage('Модулун адыны дахил един');
  end
  else
  if DescriptionEdit.Text = '' then
  begin
    ErrorHintBox.Control := DescriptionEdit;
    ErrorHintBox.ShowMessage('Модулун тясвири дахил един');
  end
  else
  begin
    // action here

    FModuleName := NameEdit.Text;
    FDescription := DescriptionEdit.Text;

    FCommited := True;

    close;
  end;
end;

procedure TModulePropsForm.SetModuleName(const Value: String);
begin
  NameEdit.Text := Value;
  FModuleName := Value;
end;

procedure TModulePropsForm.SetDescription(const Value: String);
begin
  DescriptionEdit.Text := Value;
  FDescription := Value;
end;

function TModulePropsForm.View: Boolean;
begin
  FCommited := False;
  ShowModal;
  Result := FCommited;
end;

procedure TModulePropsForm.CancelButtonClick(Sender: TObject);
begin
  FCommited := False;
  Close;
end;

procedure TModulePropsForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_ESCAPE then
    Close;
end;

end.

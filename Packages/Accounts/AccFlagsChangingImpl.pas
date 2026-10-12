unit AccFlagsChangingImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckLst;

type
  TAccFlagsForm = class(TForm)
    CLBAccFlags: TCheckListBox;
    ApplyButton: TButton;
    procedure CLBAccFlagsClickCheck(Sender: TObject);
    procedure ApplyButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    Result : String;
    FModified : Boolean;    
    { Public declarations }
  end;

var
  AccFlagsForm: TAccFlagsForm;

implementation

{$R *.DFM}

procedure TAccFlagsForm.CLBAccFlagsClickCheck(Sender: TObject);
begin
  FModified := True;
end;

procedure TAccFlagsForm.ApplyButtonClick(Sender: TObject);
function BuildAccFlags : string;
var
  I : Integer;
  S : String;
begin
  Result := '';
  with CLBAccFlags do
  for I := 0  to  Items.Count - 1 do
  begin
    if Checked[I] then
    begin
    S := Items[I];
    if Result = '' then
      Result := Result + S[1] else
      Result := Result + ',' + S[1];
    end;
  end;
end;
begin
  Result := BuildAccFlags;
  ModalResult := mrOK;
end;

procedure TAccFlagsForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  ModalResult := mrCancel; 
end;

end.

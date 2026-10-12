unit MLDialogs;

interface

uses Dialogs;

type
  TMLData = record
    FontName: ShortString;
  end;

procedure Ml_Initialize(const AMLData: TMLData);
procedure ShowMessage(const Message: String);
function MessageDlg(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint): Word;

implementation

const
  DefaultFont = 'MS Sans Serif';

var
  MLData: TMLData = (
    FontName: DefaultFont
  );

procedure Ml_Initialize(const AMLData: TMLData);
begin
  MLData := AMLData;
end;

procedure ShowMessage(const Message: String);
begin
  MessageDlg(Message, mtCustom, [mbOk], 0);
end;

function MessageDlg(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint): Word;
begin
  Result := 0;
end;

end.

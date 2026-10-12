unit cFileListComboBox;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFileListComboBox = class(TComboBox)
  private
    FDirectory: TFileName;
    FFilter: String;
    procedure SetDirectory(Value: TFileName);
    procedure SetFilter(Value: String);
  protected
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent);override;
    procedure FillList;
    procedure ClearList;
  published
    property Directory: TFileName read FDirectory write SetDirectory;
    property Filter: String read FFilter write SetFilter;
  end;

procedure Register;

implementation

procedure TFileListComboBox.SetDirectory;
begin
  FDirectory:= Value;
end;

procedure TFileListComboBox.SetFilter;
begin
  FFilter:= Value;
end;

procedure TFileListComboBox.FillList;
var
  Srch: TSearchRec;
begin
  ClearList;
  FindFirst(FDirectory+'\'+FFilter, faAnyFile, Srch);
  repeat
    Items.Add(UpperCase(Srch.Name));
  until FindNext(Srch)>0;
end;

procedure TFileListComboBox.ClearList;
begin
  Items.Clear;
end;

constructor TFileListComboBox.Create;
begin
  inherited;
  FDirectory := 'C:';
  FFilter := '*.*';
end;


procedure Register;
begin
  RegisterComponents('CreditsMgr', [TFileListComboBox]);
end;

end.

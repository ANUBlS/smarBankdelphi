unit OpenIniFileFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ActnList;

type
  TOpenIniFileForm = class(TForm)
    IniFileTypeRGB: TRadioGroup;
    OkButton: TButton;
    CancelButton: TButton;
    ActionList1: TActionList;
    Commit: TAction;
    Cancel: TAction;
    OpenLocalDlg: TOpenDialog;
    procedure CommitUpdate(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure CommitExecute(Sender: TObject);
    procedure CancelExecute(Sender: TObject);
  private
    { Private declarations }
    FFileName: String;
    FCommited: Boolean;
    FIniSourceType: String;
  public
    { Public declarations }
    property FileName: String read FFileName;
    property Commited: Boolean read FCommited;
    property IniSourceType: String read FIniSourceType;
    function Execute: Boolean;
  end;

var
  OpenIniFileForm: TOpenIniFileForm;

implementation

uses StoredFileDialogFormImpl;

{$R *.DFM}

procedure TOpenIniFileForm.CommitUpdate(Sender: TObject);
begin
  with Sender as TAction do
    Enabled := IniFileTypeRGB.ItemIndex <> -1;
end;

procedure TOpenIniFileForm.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

function TOpenIniFileForm.Execute: Boolean;
begin
  ShowModal;
  if Commited then
    case IniFileTypeRGB.ItemIndex of
      0:
      begin
        FIniSourceType := 'winini';
        with OpenLocalDlg do
        begin
          Result := Execute;
          Self.FFileName := FileName; 
        end;
      end;
      1:
      begin
        FIniSourceType := 'ora';
        with TStoredFileDialogForm.Create(Self) do
        try
          ShowModal;
          Result := Commited;
          if Result then
            Self.FFileName := FileName;
        finally
          Release;
        end;
      end;
      else
        Result := False;
    end
  else
    Result := False;
end;

procedure TOpenIniFileForm.CommitExecute(Sender: TObject);
begin
  FCommited := True;
  Close;
end;

procedure TOpenIniFileForm.CancelExecute(Sender: TObject);
begin
  Close;
end;

end.

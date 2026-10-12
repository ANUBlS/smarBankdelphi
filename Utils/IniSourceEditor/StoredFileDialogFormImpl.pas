unit StoredFileDialogFormImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids;

type
  TStoredFileDialogForm = class(TForm)
    Panel1: TPanel;
    CommitButton: TButton;
    CancelButton: TButton;
    FileNameEdit: TEdit;
    Label1: TLabel;
    procedure CommitButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FFileName: String;
    FCommited: Boolean;
  public
    { Public declarations }
    property FileName: String read FFileName;
    property Commited: Boolean read FCommited;
  end;

var
  StoredFileDialogForm: TStoredFileDialogForm;

implementation

{$R *.DFM}

procedure TStoredFileDialogForm.CommitButtonClick(Sender: TObject);
begin
  FFileName := FileNameEdit.Text;
  FCommited := True;
  Close;
end;

procedure TStoredFileDialogForm.FormCreate(Sender: TObject);
begin
  FCommited := False;
end;

end.

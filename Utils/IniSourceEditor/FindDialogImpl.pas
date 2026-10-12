unit FindDialogImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ActnList;

type
  TFindDialog = class(TForm)
    SearchTextEdit: TEdit;
    GroupBox1: TGroupBox;
    CaseSensitiveCB: TCheckBox;
    WholeWordsCB: TCheckBox;
    GroupBox2: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    ActionList1: TActionList;
    ScopeGlobal: TAction;
    ScopeSelected: TAction;
    OptionsCaseSensitive: TAction;
    OptionsWholeWords: TAction;
    GroupBox3: TGroupBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    DirectionForward: TAction;
    DirectionBackward: TAction;
    GroupBox4: TGroupBox;
    OriginFromCursor: TAction;
    OriginEntireScope: TAction;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    Label1: TLabel;
    OkButton: TButton;
    CancelButton: TButton;
    CommitAction: TAction;
    CancelAction: TAction;
    procedure DirectionForwardExecute(Sender: TObject);
    procedure OriginFromCursorExecute(Sender: TObject);
    procedure ScopeGlobalExecute(Sender: TObject);
  private
    { Private declarations }
    procedure CheckSelected(const Cbs: array of TAction; Cb: TAction);
  public
    { Public declarations }
  end;

var
  FindDialog: TFindDialog;

implementation

{$R *.DFM}

procedure TFindDialog.CheckSelected(const Cbs: array of TAction; Cb: TAction);
var
  Index: Integer;
begin
  for Index := Low(Cbs) to High(Cbs) do
    Cbs[Index].Checked := False;
  Cb.Checked := True;
end;

procedure TFindDialog.DirectionForwardExecute(Sender: TObject);
begin
  CheckSelected([DirectionForward, DirectionBackward], Sender as TAction);
end;

procedure TFindDialog.OriginFromCursorExecute(Sender: TObject);
begin
  CheckSelected([OriginFromCursor, OriginEntireScope], Sender as TAction);
end;

procedure TFindDialog.ScopeGlobalExecute(Sender: TObject);
begin
  CheckSelected([ScopeGlobal, ScopeSelected], Sender as TAction);
end;

end.

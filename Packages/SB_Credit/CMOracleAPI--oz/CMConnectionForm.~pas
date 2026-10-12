unit CMConnectionForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, NLSLocalizer, CMHintBox, Mask, DBCtrlsEh, Buttons;

type
  TConnectionForm = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    LblUserName: TLabel;
    NLSLocalizer1: TNLSLocalizer;
    CMHintBox1: TCMHintBox;
    LblPassword: TLabel;
    LblDatabases: TLabel;
    EdUserName: TEdit;
    EdPassword: TEdit;
    CmBDatabase: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
  public
  end;

var
  ConnectionForm: TConnectionForm;

implementation

{$R *.DFM}

procedure TConnectionForm.BitBtn1Click(Sender: TObject);
begin
   ModalResult := MrOk;
end;

procedure TConnectionForm.BitBtn2Click(Sender: TObject);
begin
  close;
end;

end.

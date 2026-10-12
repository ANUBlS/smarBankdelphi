unit uLogonImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TfrmLogon = class(TForm)
    Panel1: TPanel;
    oCUser: TComboBox;
    oCPassword: TEdit;
    oCDBList: TComboBox;
    lbDatabase: TLabel;
    lbPassword: TLabel;
    lbUsername: TLabel;
    oCSavePassword: TCheckBox;
    oCSaveUser: TCheckBox;
    btnOK: TButton;
    btnCancel: TButton;
    btnClear: TSpeedButton;
    imgICE: TImage;
    procedure btnOKClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure imgICEMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogon: TfrmLogon;

implementation

{$R *.DFM}

procedure TfrmLogon.btnOKClick(Sender: TObject);
begin
  if (oCUser.ItemIndex=-1) and (oCUser.Items.IndexOf(oCUser.Text)<0) then ocUser.Items.Add(oCUser.Text);
  if (oCDBList.ItemIndex=-1) and (oCDBList.Items.IndexOf(oCDBList.Text)<0) then oCDBList.Items.Add(oCDBList.Text);
end;

procedure TfrmLogon.btnClearClick(Sender: TObject);
begin
  oCUser.Clear;
end;

procedure TfrmLogon.imgICEMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (ssCtrl in Shift) and (Button=mbMiddle) then ShowMessage('Agil Kerimov ©');
end;

end.
